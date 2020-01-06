Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B8130BF7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 02:58:11 +0100 (CET)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioHek-0007mu-KN
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 20:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHe0-0007Gd-2R
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 20:57:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHdy-0007PD-Vu
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 20:57:24 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2284 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ioHdw-0007NY-Mr; Sun, 05 Jan 2020 20:57:20 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1C9B904D1D47B245BCD;
 Mon,  6 Jan 2020 09:57:18 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 6 Jan 2020 09:57:10 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH] arm/translate-a64: fix uninitialized variable warning
Date: Mon, 6 Jan 2020 09:57:00 +0800
Message-ID: <20200106015700.52992-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]
    genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
    if (!feature) {

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>=20
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe629..211e3d813f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13564,8 +13564,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
     int rm =3D extract32(insn, 16, 5);
     int rn =3D extract32(insn, 5, 5);
     int rd =3D extract32(insn, 0, 5);
-    bool feature;
-    CryptoThreeOpFn *genfn;
+    bool feature =3D false;
+    CryptoThreeOpFn *genfn =3D NULL;
=20
     if (o =3D=3D 0) {
         switch (opcode) {
--=20
2.21.0.windows.1



