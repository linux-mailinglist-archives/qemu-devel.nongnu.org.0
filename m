Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B51B14F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 20:43:45 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQbOS-0008Gd-WA
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 14:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI9-0001Dj-09
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:13 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI3-00046L-JD
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:12 -0400
Received: from relay.sw.ru ([185.231.240.75]:39798)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHr-0003NH-Vk; Mon, 20 Apr 2020 14:36:56 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHj-0001xO-3b; Mon, 20 Apr 2020 21:36:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] stream: exclude a link to filter from freezing
Date: Mon, 20 Apr 2020 21:36:41 +0300
Message-Id: <1587407806-109784-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 14:36:51
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A node above the base can be the filter of the concurrent job. In that
case, the filter cannot be removed being a part of the frozen chain.
Exclude the link to filter node from freezing and provide the safety
check for a concurrent job.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/stream.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index bd4a351..d8b4bbe 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -244,7 +244,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
          above_base = bdrv_filtered_bs(above_base))
     {}
 
-    if (bdrv_freeze_chain(bs, above_base, errp) < 0) {
+    if (bdrv_freeze_chain(bs, bottom_cow_node, errp) < 0) {
         return;
     }
 
@@ -257,6 +257,15 @@ void stream_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
+    /*
+     * Check for an overlapping block-commit job that is not allowed.
+     */
+    if (bdrv_freeze_chain(bottom_cow_node, above_base, errp) < 0) {
+        goto fail;
+    } else {
+        bdrv_unfreeze_chain(bottom_cow_node, above_base);
+    }
+
     /* Prevent concurrent jobs trying to modify the graph structure here, we
      * already have our own plans. Also don't allow resize as the image size is
      * queried only at the job start and then cached. */
@@ -276,7 +285,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
      * bdrv_reopen_set_read_only() due to parallel block jobs running.
      */
     base = bdrv_filtered_bs(above_base);
-    for (iter = bdrv_filtered_bs(bs); iter && iter != base;
+    for (iter = bdrv_filtered_bs(bs);
+         iter && iter != base && iter->drv && !iter->drv->is_filter;
          iter = bdrv_filtered_bs(iter))
     {
         block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
@@ -298,5 +308,5 @@ fail:
     if (bs_read_only) {
         bdrv_reopen_set_read_only(bs, true, NULL);
     }
-    bdrv_unfreeze_chain(bs, above_base);
+    bdrv_unfreeze_chain(bs, bottom_cow_node);
 }
-- 
1.8.3.1


