Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F7133949
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 03:52:47 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip1Sg-0005WT-Ky
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 21:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ip1Rm-0004uQ-HN
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 21:51:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ip1Rl-0003nw-Hc
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 21:51:50 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:42582 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ip1Rj-0003hH-1Y; Tue, 07 Jan 2020 21:51:47 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 95FEBCD4BD9738D07B1D;
 Wed,  8 Jan 2020 10:51:41 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 10:51:35 +0800
From: <pannengyuan@huawei.com>
To: <eblake@redhat.com>
Subject: [PATCH v2] nbd: fix uninitialized variable warning
Date: Wed, 8 Jan 2020 10:51:32 +0800
Message-ID: <20200108025132.46956-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
/mnt/sdb/qemu/nbd/server.c: In function 'nbd_handle_request':
/mnt/sdb/qemu/nbd/server.c:2313:9: error: 'ret' may be used uninitialized=
 in this function [-Werror=3Dmaybe-uninitialized]
     int ret;

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Changes v2 to v1:
- change 'if(client->export_meta.bitmap)' into 'else' to fix uninitialize=
d warning and clean up pointless code (suggested by Eric Blake)
---
 nbd/server.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 24ebc1a805..87fcd2e7bf 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2384,20 +2384,12 @@ static coroutine_fn int nbd_handle_request(NBDCli=
ent *client,
                                                !client->export_meta.bitm=
ap,
                                                NBD_META_ID_BASE_ALLOCATI=
ON,
                                                errp);
-                if (ret < 0) {
-                    return ret;
-                }
-            }
-
-            if (client->export_meta.bitmap) {
+            } else {              /* client->export_meta.bitmap */
                 ret =3D nbd_co_send_bitmap(client, request->handle,
                                          client->exp->export_bitmap,
                                          request->from, request->len,
                                          dont_fragment,
                                          true, NBD_META_ID_DIRTY_BITMAP,=
 errp);
-                if (ret < 0) {
-                    return ret;
-                }
             }
=20
             return ret;
--=20
2.21.0.windows.1



