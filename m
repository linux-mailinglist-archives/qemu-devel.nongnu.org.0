Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1BAE849
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 12:38:34 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7dXd-0006du-3w
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 06:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i7dJK-0000S5-Hs
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i7dJI-0001uf-AG
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:23:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:60072)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i7dJB-0001oM-Ds; Tue, 10 Sep 2019 06:23:38 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i7dJ7-0007it-HE; Tue, 10 Sep 2019 13:23:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 10 Sep 2019 13:23:25 +0300
Message-Id: <20190910102332.20560-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190910102332.20560-1-vsementsov@virtuozzo.com>
References: <20190910102332.20560-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v11 07/14] block: teach bdrv_debug_breakpoint
 skip filters with backing
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Teach bdrv_debug_breakpoint and bdrv_debug_remove_breakpoint skip
filters with backing. This is needed to implement and use in backup job
it's own backup_top filter driver (like mirror already has one), and
without this improvement, breakpoint removal will fail at least in 55
iotest.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 874a29a983..e11dd60402 100644
--- a/block.c
+++ b/block.c
@@ -5165,14 +5165,35 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
     bs->drv->bdrv_debug_event(bs, event);
 }
 
-int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
-                          const char *tag)
+static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
 {
     while (bs && bs->drv && !bs->drv->bdrv_debug_breakpoint) {
-        bs = bs->file ? bs->file->bs : NULL;
+        if (bs->file) {
+            bs = bs->file->bs;
+            continue;
+        }
+
+        if (bs->drv->is_filter && bs->backing) {
+            bs = bs->backing->bs;
+            continue;
+        }
+
+        break;
     }
 
     if (bs && bs->drv && bs->drv->bdrv_debug_breakpoint) {
+        assert(bs->drv->bdrv_debug_remove_breakpoint);
+        return bs;
+    }
+
+    return NULL;
+}
+
+int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
+                          const char *tag)
+{
+    bs = bdrv_find_debug_node(bs);
+    if (bs) {
         return bs->drv->bdrv_debug_breakpoint(bs, event, tag);
     }
 
@@ -5181,11 +5202,8 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
 
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag)
 {
-    while (bs && bs->drv && !bs->drv->bdrv_debug_remove_breakpoint) {
-        bs = bs->file ? bs->file->bs : NULL;
-    }
-
-    if (bs && bs->drv && bs->drv->bdrv_debug_remove_breakpoint) {
+    bs = bdrv_find_debug_node(bs);
+    if (bs) {
         return bs->drv->bdrv_debug_remove_breakpoint(bs, tag);
     }
 
-- 
2.18.0


