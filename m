Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3BB9D42A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 18:39:04 +0200 (CEST)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2I1H-0001ld-IM
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 12:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i2Hcp-0000lT-6o
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i2Hcn-00016S-Mc
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:13:46 -0400
Received: from relay.sw.ru ([185.231.240.75]:44756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i2Hch-0000lm-9s; Mon, 26 Aug 2019 12:13:39 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i2HcI-0006QJ-HP; Mon, 26 Aug 2019 19:13:14 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Mon, 26 Aug 2019 19:13:05 +0300
Message-Id: <20190826161312.489398-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190826161312.489398-1-vsementsov@virtuozzo.com>
References: <20190826161312.489398-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v9 06/13] block: teach bdrv_debug_breakpoint
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
---
 block.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 5944124845..1c7c199849 100644
--- a/block.c
+++ b/block.c
@@ -5164,14 +5164,35 @@ void bdrv_debug_event(BlockDriverState *bs, BlkdebugEvent event)
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
 
@@ -5180,11 +5201,8 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
 
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


