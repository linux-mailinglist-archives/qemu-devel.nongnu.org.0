Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1C27AEE0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 15:14:41 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMszI-0001I9-SK
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 09:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kMsoK-0006Ll-DW; Mon, 28 Sep 2020 09:03:20 -0400
Received: from relay.sw.ru ([185.231.240.75]:59260 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kMsoI-0000dk-Kt; Mon, 28 Sep 2020 09:03:20 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kMsni-001tba-Gl; Mon, 28 Sep 2020 16:02:42 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, jsnow@redhat.com, armbru@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v9 7/9] stream: skip filters when writing backing file name to
 QCOW2 header
Date: Mon, 28 Sep 2020 15:59:59 +0300
Message-Id: <1601298001-774096-8-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1601298001-774096-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1601298001-774096-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 09:00:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

Avoid writing a filter JSON-name to QCOW2 image when the backing file
is changed after the block stream job.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/stream.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index e0540ee..b0719e9 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -65,6 +65,7 @@ static int stream_prepare(Job *job)
     BlockDriverState *bs = blk_bs(bjob->blk);
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
+    BlockDriverState *base_metadata = bdrv_skip_filters(base);
     Error *local_err = NULL;
     int ret = 0;
 
@@ -73,10 +74,10 @@ static int stream_prepare(Job *job)
 
     if (bdrv_cow_child(unfiltered_bs)) {
         const char *base_id = NULL, *base_fmt = NULL;
-        if (base) {
-            base_id = s->backing_file_str;
-            if (base->drv) {
-                base_fmt = base->drv->format_name;
+        if (base_metadata) {
+            base_id = base_metadata->filename;
+            if (base_metadata->drv) {
+                base_fmt = base_metadata->drv->format_name;
             }
         }
         bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
-- 
1.8.3.1


