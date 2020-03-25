Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607FF1923F5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 10:24:08 +0100 (CET)
Received: from localhost ([::1]:60876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH2Gd-0004ml-FZ
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 05:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Ep-0003NC-A4
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 05:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Eo-0007ve-Cn
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 05:22:15 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58820 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jH2Eo-0007nh-1R; Wed, 25 Mar 2020 05:22:14 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CCE4039DC149207BF30C;
 Wed, 25 Mar 2020 17:22:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 17:22:00 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 3/3] crypto: Redundant type conversion for AES_KEY pointer
Date: Wed, 25 Mar 2020 17:21:37 +0800
Message-ID: <20200325092137.24020-4-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
References: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 zhang.zhanghailiang@huawei.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix: eaec903c5b8

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
---
 crypto/cipher-builtin.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/crypto/cipher-builtin.c b/crypto/cipher-builtin.c
index bf8413e71a..99d6280a16 100644
--- a/crypto/cipher-builtin.c
+++ b/crypto/cipher-builtin.c
@@ -133,8 +133,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const void=
 *ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx =3D ctx;
=20
-    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
-                                   src, dst, length);
+    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc, src, dst, length);
 }
=20
=20
@@ -145,8 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const void=
 *ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx =3D ctx;
=20
-    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
-                                   src, dst, length);
+    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec, src, dst, length);
 }
=20
=20
--=20
2.23.0



