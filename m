Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E310D1DF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 08:37:47 +0100 (CET)
Received: from localhost ([::1]:55580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaaqX-0008SB-Qt
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 02:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iaafM-0002fJ-Nl
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 02:26:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iaafI-0003GF-JX
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 02:26:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2203 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iaafA-0002CG-Lc; Fri, 29 Nov 2019 02:26:01 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BE8314124DCD790455EC;
 Fri, 29 Nov 2019 15:25:46 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 29 Nov 2019 15:25:40 +0800
From: <pannengyuan@huawei.com>
To: <eblake@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <sgarzare@redhat.com>
Subject: [PATCH V3 1/2] block/nbd: extract the common cleanup code
Date: Fri, 29 Nov 2019 15:25:25 +0800
Message-ID: <1575012326-51324-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: liyiting@huawei.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 PanNengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PanNengyuan <pannengyuan@huawei.com>

The BDRVNBDState cleanup code is common in two places, add
nbd_free_bdrvstate_prop() function to do these cleanups (suggested by
Stefano Garzarella).

Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 block/nbd.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1239761..5805979 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -94,6 +94,8 @@ typedef struct BDRVNBDState {
 
 static int nbd_client_connect(BlockDriverState *bs, Error **errp);
 
+static void nbd_free_bdrvstate_prop(BDRVNBDState *s);
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
@@ -1486,6 +1488,15 @@ static int nbd_client_connect(BlockDriverState *bs, Error **errp)
     }
 }
 
+static void nbd_free_bdrvstate_prop(BDRVNBDState *s)
+{
+    object_unref(OBJECT(s->tlscreds));
+    qapi_free_SocketAddress(s->saddr);
+    g_free(s->export);
+    g_free(s->tlscredsid);
+    g_free(s->x_dirty_bitmap);
+}
+
 /*
  * Parse nbd_open options
  */
@@ -1855,10 +1866,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
 
  error:
     if (ret < 0) {
-        object_unref(OBJECT(s->tlscreds));
-        qapi_free_SocketAddress(s->saddr);
-        g_free(s->export);
-        g_free(s->tlscredsid);
+        nbd_free_bdrvstate_prop(s);
     }
     qemu_opts_del(opts);
     return ret;
@@ -1937,12 +1945,7 @@ static void nbd_close(BlockDriverState *bs)
     BDRVNBDState *s = bs->opaque;
 
     nbd_client_close(bs);
-
-    object_unref(OBJECT(s->tlscreds));
-    qapi_free_SocketAddress(s->saddr);
-    g_free(s->export);
-    g_free(s->tlscredsid);
-    g_free(s->x_dirty_bitmap);
+    nbd_free_bdrvstate_prop(s);
 }
 
 static int64_t nbd_getlength(BlockDriverState *bs)
-- 
2.7.2.windows.1



