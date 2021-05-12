Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7C37B743
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:58:14 +0200 (CEST)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjkz-0007Jf-OA
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lgjjb-0006QR-G6; Wed, 12 May 2021 03:56:48 -0400
Received: from mga06.intel.com ([134.134.136.31]:10029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lgjjY-0000o7-4y; Wed, 12 May 2021 03:56:46 -0400
IronPort-SDR: gHfXWQ6K5toM3zoQIAMUQ/LM+hIur96c21hn2V+chq3Kq4vIc58bkE16OA8e9nH7Xuy7Jbbnwj
 v9Ymik+VS8Uw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="260896502"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="260896502"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 00:56:37 -0700
IronPort-SDR: GAu5cFX586Z6un9oIR5Y/8apmA66pah3ixsFJcP+adTM0yDjHH2Uhxg4E/k2Mazeqs2mq+Fp7c
 eYINWM8Fc/Jw==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="622210758"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 00:56:34 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-dev <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Subject: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Date: Wed, 12 May 2021 15:49:57 +0800
Message-Id: <20210512074957.763711-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhang Chen <chen.zhang@intel.com>, Minghao Yuan <meeho@qq.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the issue from this patch:
[PATCH] block: Flush all children in generic code
From 883833e29cb800b4d92b5d4736252f4004885191

Quorum driver do not have the primary child.
It will caused guest block flush issue when use quorum and NBD.
The vm guest flushes failed，and then guest filesystem is shutdown.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reported-by: Minghao Yuan <meeho@qq.com>
---
 block/io.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/block/io.c b/block/io.c
index 35b6c56efc..4dc1873cb9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2849,6 +2849,13 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
     BdrvChild *child;
     int current_gen;
     int ret = 0;
+    bool no_primary_child = false;
+
+    /* Quorum drivers do not have the primary child. */
+    if (!primary_child) {
+        primary_child = bs->file;
+        no_primary_child = true;
+    }
 
     bdrv_inc_in_flight(bs);
 
@@ -2886,12 +2893,12 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
 
     /* But don't actually force it to the disk with cache=unsafe */
     if (bs->open_flags & BDRV_O_NO_FLUSH) {
-        goto flush_children;
+        goto flush_data;
     }
 
     /* Check if we really need to flush anything */
     if (bs->flushed_gen == current_gen) {
-        goto flush_children;
+        goto flush_data;
     }
 
     BLKDBG_EVENT(primary_child, BLKDBG_FLUSH_TO_DISK);
@@ -2938,13 +2945,19 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
     /* Now flush the underlying protocol.  It will also have BDRV_O_NO_FLUSH
      * in the case of cache=unsafe, so there are no useless flushes.
      */
-flush_children:
-    ret = 0;
-    QLIST_FOREACH(child, &bs->children, next) {
-        if (child->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
-            int this_child_ret = bdrv_co_flush(child->bs);
-            if (!ret) {
-                ret = this_child_ret;
+flush_data:
+    if (no_primary_child) {
+        /* Flush parent */
+        ret = bs->file ? bdrv_co_flush(bs->file->bs) : 0;
+    } else {
+        /* Flush childrens */
+        ret = 0;
+        QLIST_FOREACH(child, &bs->children, next) {
+            if (child->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
+                int this_child_ret = bdrv_co_flush(child->bs);
+                if (!ret) {
+                    ret = this_child_ret;
+                }
             }
         }
     }
-- 
2.25.1


