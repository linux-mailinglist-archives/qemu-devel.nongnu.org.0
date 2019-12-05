Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3A113A9C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 04:52:32 +0100 (CET)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iciBr-0003Pn-BZ
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 22:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ici5n-0006Qz-ME
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 22:46:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ici5m-0003zg-DP
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 22:46:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2214 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ici5e-0003iG-8A; Wed, 04 Dec 2019 22:46:06 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 66AAEE0F3FCDB6FA77B1;
 Thu,  5 Dec 2019 11:45:56 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Dec 2019 11:45:48 +0800
From: <pannengyuan@huawei.com>
To: <eblake@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH v5 1/2] block/nbd: extract the common cleanup code
Date: Thu, 5 Dec 2019 11:45:27 +0800
Message-ID: <1575517528-44312-2-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
In-Reply-To: <1575517528-44312-1-git-send-email-pannengyuan@huawei.com>
References: <1575517528-44312-1-git-send-email-pannengyuan@huawei.com>
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
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

The BDRVNBDState cleanup code is common in two places, add
nbd_clear_bdrvstate() function to do these cleanups.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
v3:
- new patch, split form 2/2 patch (suggested by Stefano Garzarella)
Changes v4 to v3:
- replace function name from nbd_free_bdrvstate_prop to
  nbd_clear_bdrvstate and set cleared fields to NULL (suggested by Eric
  Blake)
- remove static function prototype. (suggested by Eric Blake)
---
Changes v5 to v4:
- correct the wrong email address
---
 block/nbd.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1239761..8b4a65a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -94,6 +94,19 @@ typedef struct BDRVNBDState {
 
 static int nbd_client_connect(BlockDriverState *bs, Error **errp);
 
+void nbd_clear_bdrvstate(BDRVNBDState *s)
+{
+    object_unref(OBJECT(s->tlscreds));
+    qapi_free_SocketAddress(s->saddr);
+    s->saddr = NULL;
+    g_free(s->export);
+    s->export = NULL;
+    g_free(s->tlscredsid);
+    s->tlscredsid = NULL;
+    g_free(s->x_dirty_bitmap);
+    s->x_dirty_bitmap = NULL;
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
@@ -1855,10 +1868,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
 
  error:
     if (ret < 0) {
-        object_unref(OBJECT(s->tlscreds));
-        qapi_free_SocketAddress(s->saddr);
-        g_free(s->export);
-        g_free(s->tlscredsid);
+        nbd_clear_bdrvstate(s);
     }
     qemu_opts_del(opts);
     return ret;
@@ -1937,12 +1947,7 @@ static void nbd_close(BlockDriverState *bs)
     BDRVNBDState *s = bs->opaque;
 
     nbd_client_close(bs);
-
-    object_unref(OBJECT(s->tlscreds));
-    qapi_free_SocketAddress(s->saddr);
-    g_free(s->export);
-    g_free(s->tlscredsid);
-    g_free(s->x_dirty_bitmap);
+    nbd_clear_bdrvstate(s);
 }
 
 static int64_t nbd_getlength(BlockDriverState *bs)
-- 
2.7.2.windows.1



