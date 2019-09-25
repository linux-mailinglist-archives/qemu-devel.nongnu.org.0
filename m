Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8CBE7CA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 23:41:24 +0200 (CEST)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDF2J-0000x2-9H
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 17:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEx8-0006N9-4c
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:36:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEx3-0006F0-Kr
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:36:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16441)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iDEwz-00068U-KJ; Wed, 25 Sep 2019 17:35:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE2313175296;
 Wed, 25 Sep 2019 21:35:52 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A47219C5B;
 Wed, 25 Sep 2019 21:35:49 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/13] qcrypto-luks: simplify masterkey and masterkey length
Date: Thu, 26 Sep 2019 00:35:18 +0300
Message-Id: <20190925213527.9117-5-mlevitsk@redhat.com>
In-Reply-To: <20190925213527.9117-1-mlevitsk@redhat.com>
References: <20190925213527.9117-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 25 Sep 2019 21:35:52 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let the caller allocate masterkey
Always use master key len from the header

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/block-luks.c | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 25f8a9f1c4..9e59a791a6 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -419,7 +419,6 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
                             QCryptoCipherAlgorithm ivcipheralg,
                             QCryptoHashAlgorithm ivhash,
                             uint8_t *masterkey,
-                            size_t masterkeylen,
                             QCryptoBlockReadFunc readfunc,
                             void *opaque,
                             Error **errp)
@@ -438,9 +437,9 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
         return 0;
     }
=20
-    splitkeylen =3D masterkeylen * slot->stripes;
+    splitkeylen =3D luks->header.master_key_len * slot->stripes;
     splitkey =3D g_new0(uint8_t, splitkeylen);
-    possiblekey =3D g_new0(uint8_t, masterkeylen);
+    possiblekey =3D g_new0(uint8_t, luks->header.master_key_len);
=20
     /*
      * The user password is used to generate a (possible)
@@ -453,7 +452,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
                        (const uint8_t *)password, strlen(password),
                        slot->salt, QCRYPTO_BLOCK_LUKS_SALT_LEN,
                        slot->iterations,
-                       possiblekey, masterkeylen,
+                       possiblekey, luks->header.master_key_len,
                        errp) < 0) {
         return -1;
     }
@@ -478,7 +477,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
     /* Setup the cipher/ivgen that we'll use to try to decrypt
      * the split master key material */
     cipher =3D qcrypto_cipher_new(cipheralg, ciphermode,
-                                possiblekey, masterkeylen,
+                                possiblekey, luks->header.master_key_len=
,
                                 errp);
     if (!cipher) {
         return -1;
@@ -489,7 +488,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
     ivgen =3D qcrypto_ivgen_new(ivalg,
                               ivcipheralg,
                               ivhash,
-                              possiblekey, masterkeylen,
+                              possiblekey, luks->header.master_key_len,
                               errp);
     if (!ivgen) {
         return -1;
@@ -519,7 +518,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
      * it back together to get the actual master key.
      */
     if (qcrypto_afsplit_decode(hash,
-                               masterkeylen,
+                               luks->header.master_key_len,
                                slot->stripes,
                                splitkey,
                                masterkey,
@@ -537,11 +536,13 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
      * header
      */
     if (qcrypto_pbkdf2(hash,
-                       masterkey, masterkeylen,
+                       masterkey,
+                       luks->header.master_key_len,
                        luks->header.master_key_salt,
                        QCRYPTO_BLOCK_LUKS_SALT_LEN,
                        luks->header.master_key_iterations,
-                       keydigest, G_N_ELEMENTS(keydigest),
+                       keydigest,
+                       G_N_ELEMENTS(keydigest),
                        errp) < 0) {
         return -1;
     }
@@ -574,8 +575,7 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
                             QCryptoIVGenAlgorithm ivalg,
                             QCryptoCipherAlgorithm ivcipheralg,
                             QCryptoHashAlgorithm ivhash,
-                            uint8_t **masterkey,
-                            size_t *masterkeylen,
+                            uint8_t *masterkey,
                             QCryptoBlockReadFunc readfunc,
                             void *opaque,
                             Error **errp)
@@ -584,9 +584,6 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
     size_t i;
     int rv;
=20
-    *masterkey =3D g_new0(uint8_t, luks->header.master_key_len);
-    *masterkeylen =3D luks->header.master_key_len;
-
     for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
         rv =3D qcrypto_block_luks_load_key(block,
                                          &luks->header.key_slots[i],
@@ -597,8 +594,7 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
                                          ivalg,
                                          ivcipheralg,
                                          ivhash,
-                                         *masterkey,
-                                         *masterkeylen,
+                                         masterkey,
                                          readfunc,
                                          opaque,
                                          errp);
@@ -613,9 +609,6 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
     error_setg(errp, "Invalid password, cannot unlock any keyslot");
=20
  error:
-    g_free(*masterkey);
-    *masterkey =3D NULL;
-    *masterkeylen =3D 0;
     return -1;
 }
=20
@@ -636,7 +629,6 @@ qcrypto_block_luks_open(QCryptoBlock *block,
     size_t i;
     ssize_t rv;
     g_autofree uint8_t *masterkey =3D NULL;
-    size_t masterkeylen;
     char *ivgen_name, *ivhash_name;
     QCryptoCipherMode ciphermode;
     QCryptoCipherAlgorithm cipheralg;
@@ -802,6 +794,9 @@ qcrypto_block_luks_open(QCryptoBlock *block,
         /* Try to find which key slot our password is valid for
          * and unlock the master key from that slot.
          */
+
+        masterkey =3D g_new0(uint8_t, luks->header.master_key_len);
+
         if (qcrypto_block_luks_find_key(block,
                                         password,
                                         cipheralg, ciphermode,
@@ -809,7 +804,7 @@ qcrypto_block_luks_open(QCryptoBlock *block,
                                         ivalg,
                                         ivcipheralg,
                                         ivhash,
-                                        &masterkey, &masterkeylen,
+                                        masterkey,
                                         readfunc, opaque,
                                         errp) < 0) {
             ret =3D -EACCES;
@@ -825,7 +820,8 @@ qcrypto_block_luks_open(QCryptoBlock *block,
         block->ivgen =3D qcrypto_ivgen_new(ivalg,
                                          ivcipheralg,
                                          ivhash,
-                                         masterkey, masterkeylen,
+                                         masterkey,
+                                         luks->header.master_key_len,
                                          errp);
         if (!block->ivgen) {
             ret =3D -ENOTSUP;
@@ -833,7 +829,9 @@ qcrypto_block_luks_open(QCryptoBlock *block,
         }
=20
         ret =3D qcrypto_block_init_cipher(block, cipheralg, ciphermode,
-                                        masterkey, masterkeylen, n_threa=
ds,
+                                        masterkey,
+                                        luks->header.master_key_len,
+                                        n_threads,
                                         errp);
         if (ret < 0) {
             ret =3D -ENOTSUP;
--=20
2.17.2


