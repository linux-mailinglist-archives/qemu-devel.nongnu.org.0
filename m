Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0BC06E4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:03:24 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDqqB-0007e6-8I
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iDpuz-0005OR-MR
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:04:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iDpuy-0004Kr-FQ
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:04:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42764)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iDpuy-0004Jo-7A
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:04:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4CEBB1056FB8
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:59:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA7E6060D;
 Fri, 27 Sep 2019 09:59:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] qcrypto-luks: pass keyslot index rather that pointer to
 the keyslot
Date: Fri, 27 Sep 2019 10:59:19 +0100
Message-Id: <20190927095926.22230-5-berrange@redhat.com>
In-Reply-To: <20190927095926.22230-1-berrange@redhat.com>
References: <20190927095926.22230-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 27 Sep 2019 09:59:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Another minor refactoring

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/block-luks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 9e59a791a6..b759cc8d19 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -410,7 +410,7 @@ qcrypto_block_luks_essiv_cipher(QCryptoCipherAlgorith=
m cipher,
  */
 static int
 qcrypto_block_luks_load_key(QCryptoBlock *block,
-                            QCryptoBlockLUKSKeySlot *slot,
+                            size_t slot_idx,
                             const char *password,
                             QCryptoCipherAlgorithm cipheralg,
                             QCryptoCipherMode ciphermode,
@@ -424,6 +424,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
                             Error **errp)
 {
     QCryptoBlockLUKS *luks =3D block->opaque;
+    const QCryptoBlockLUKSKeySlot *slot =3D &luks->header.key_slots[slot=
_idx];
     g_autofree uint8_t *splitkey =3D NULL;
     size_t splitkeylen;
     g_autofree uint8_t *possiblekey =3D NULL;
@@ -580,13 +581,12 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
                             void *opaque,
                             Error **errp)
 {
-    QCryptoBlockLUKS *luks =3D block->opaque;
     size_t i;
     int rv;
=20
     for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
         rv =3D qcrypto_block_luks_load_key(block,
-                                         &luks->header.key_slots[i],
+                                         i,
                                          password,
                                          cipheralg,
                                          ciphermode,
--=20
2.21.0


