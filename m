Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B9BE7E5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 23:50:11 +0200 (CEST)
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDFAj-0000Y0-A8
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 17:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEyH-00072C-05
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:37:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEyE-00070l-VP
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:37:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iDEy1-0006cR-4s; Wed, 25 Sep 2019 17:36:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 052C23E2AF;
 Wed, 25 Sep 2019 21:36:24 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1067119C5B;
 Wed, 25 Sep 2019 21:36:15 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] qcrypto-luks: extract store key function
Date: Thu, 26 Sep 2019 00:35:24 +0300
Message-Id: <20190925213527.9117-11-mlevitsk@redhat.com>
In-Reply-To: <20190925213527.9117-1-mlevitsk@redhat.com>
References: <20190925213527.9117-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 25 Sep 2019 21:36:24 +0000 (UTC)
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

This function will be used later to store
new keys to the luks metadata

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/block-luks.c | 304 ++++++++++++++++++++++++++------------------
 1 file changed, 181 insertions(+), 123 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index fa799fd21d..6d4e9eb348 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -623,6 +623,176 @@ qcrypto_block_luks_parse_header(QCryptoBlockLUKS *l=
uks, Error **errp)
     return 0;
 }
=20
+/*
+ * Given a key slot,  user password, and the master key,
+ * will store the encrypted master key there, and update the
+ * in-memory header. User must then write the in-memory header
+ *
+ * Returns:
+ *    0 if the keyslot was written successfully
+ *      with the provided password
+ *   -1 if a fatal error occurred while storing the key
+ */
+static int
+qcrypto_block_luks_store_key(QCryptoBlock *block,
+                             unsigned int slot_idx,
+                             const char *password,
+                             uint8_t *masterkey,
+                             uint64_t iter_time,
+                             QCryptoBlockWriteFunc writefunc,
+                             void *opaque,
+                             Error **errp)
+{
+    QCryptoBlockLUKS *luks =3D block->opaque;
+    QCryptoBlockLUKSKeySlot *slot =3D &luks->header.key_slots[slot_idx];
+    g_autofree uint8_t *splitkey =3D NULL;
+    size_t splitkeylen;
+    g_autofree uint8_t *slotkey =3D NULL;
+    g_autoptr(QCryptoCipher) cipher =3D NULL;
+    g_autoptr(QCryptoIVGen) ivgen =3D NULL;
+    Error *local_err =3D NULL;
+    uint64_t iters;
+    int ret =3D -1;
+
+    if (qcrypto_random_bytes(slot->salt,
+                             QCRYPTO_BLOCK_LUKS_SALT_LEN,
+                             errp) < 0) {
+        goto cleanup;
+    }
+
+    splitkeylen =3D luks->header.master_key_len * slot->stripes;
+
+    /*
+     * Determine how many iterations are required to
+     * hash the user password while consuming 1 second of compute
+     * time
+     */
+    iters =3D qcrypto_pbkdf2_count_iters(luks->hash_alg,
+                                       (uint8_t *)password, strlen(passw=
ord),
+                                       slot->salt,
+                                       QCRYPTO_BLOCK_LUKS_SALT_LEN,
+                                       luks->header.master_key_len,
+                                       &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto cleanup;
+    }
+
+    if (iters > (ULLONG_MAX / iter_time)) {
+        error_setg_errno(errp, ERANGE,
+                         "PBKDF iterations %llu too large to scale",
+                         (unsigned long long)iters);
+        goto cleanup;
+    }
+
+    /* iter_time was in millis, but count_iters reported for secs */
+    iters =3D iters * iter_time / 1000;
+
+    if (iters > UINT32_MAX) {
+        error_setg_errno(errp, ERANGE,
+                         "PBKDF iterations %llu larger than %u",
+                         (unsigned long long)iters, UINT32_MAX);
+        goto cleanup;
+    }
+
+    slot->iterations =3D
+        MAX(iters, QCRYPTO_BLOCK_LUKS_MIN_SLOT_KEY_ITERS);
+
+
+    /*
+     * Generate a key that we'll use to encrypt the master
+     * key, from the user's password
+     */
+    slotkey =3D g_new0(uint8_t, luks->header.master_key_len);
+    if (qcrypto_pbkdf2(luks->hash_alg,
+                       (uint8_t *)password, strlen(password),
+                       slot->salt,
+                       QCRYPTO_BLOCK_LUKS_SALT_LEN,
+                       slot->iterations,
+                       slotkey, luks->header.master_key_len,
+                       errp) < 0) {
+        goto cleanup;
+    }
+
+
+    /*
+     * Setup the encryption objects needed to encrypt the
+     * master key material
+     */
+    cipher =3D qcrypto_cipher_new(luks->cipher_alg,
+                                luks->cipher_mode,
+                                slotkey, luks->header.master_key_len,
+                                errp);
+    if (!cipher) {
+        goto cleanup;
+    }
+
+    ivgen =3D qcrypto_ivgen_new(luks->ivgen_alg,
+                              luks->ivgen_cipher_alg,
+                              luks->ivgen_hash_alg,
+                              slotkey, luks->header.master_key_len,
+                              errp);
+    if (!ivgen) {
+        goto cleanup;
+    }
+
+    /*
+     * Before storing the master key, we need to vastly
+     * increase its size, as protection against forensic
+     * disk data recovery
+     */
+    splitkey =3D g_new0(uint8_t, splitkeylen);
+
+    if (qcrypto_afsplit_encode(luks->hash_alg,
+                               luks->header.master_key_len,
+                               slot->stripes,
+                               masterkey,
+                               splitkey,
+                               errp) < 0) {
+        goto cleanup;
+    }
+
+    /*
+     * Now we encrypt the split master key with the key generated
+     * from the user's password, before storing it
+     */
+    if (qcrypto_block_cipher_encrypt_helper(cipher, block->niv, ivgen,
+                                            QCRYPTO_BLOCK_LUKS_SECTOR_SI=
ZE,
+                                            0,
+                                            splitkey,
+                                            splitkeylen,
+                                            errp) < 0) {
+        goto cleanup;
+    }
+
+    /* Write out the slot's master key material. */
+    if (writefunc(block,
+                  slot->key_offset_sector *
+                  QCRYPTO_BLOCK_LUKS_SECTOR_SIZE,
+                  splitkey, splitkeylen,
+                  opaque,
+                  errp) !=3D splitkeylen) {
+        goto cleanup;
+    }
+
+    slot->active =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED;
+
+    if (qcrypto_block_luks_store_header(block,  writefunc, opaque, errp)=
 < 0) {
+        goto cleanup;
+    }
+
+    ret =3D 0;
+
+cleanup:
+    if (slotkey) {
+        memset(slotkey, 0, luks->header.master_key_len);
+    }
+    if (splitkey) {
+        memset(splitkey, 0, splitkeylen);
+    }
+    return ret;
+}
+
 /*
  * Given a key slot, and user password, this will attempt to unlock
  * the master encryption key from the key slot.
@@ -944,12 +1114,8 @@ qcrypto_block_luks_create(QCryptoBlock *block,
     QCryptoBlockCreateOptionsLUKS luks_opts;
     Error *local_err =3D NULL;
     g_autofree uint8_t *masterkey =3D NULL;
-    g_autofree uint8_t *slotkey =3D NULL;
-    g_autofree uint8_t *splitkey =3D NULL;
     size_t splitkeylen =3D 0;
     size_t i;
-    g_autoptr(QCryptoCipher) cipher =3D NULL;
-    g_autoptr(QCryptoIVGen) ivgen =3D NULL;
     g_autofree char *password =3D NULL;
     const char *cipher_alg;
     const char *cipher_mode;
@@ -1172,9 +1338,7 @@ qcrypto_block_luks_create(QCryptoBlock *block,
      * to use the first key slot */
     splitkeylen =3D luks->header.master_key_len * QCRYPTO_BLOCK_LUKS_STR=
IPES;
     for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
-        luks->header.key_slots[i].active =3D i =3D=3D 0 ?
-            QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED :
-            QCRYPTO_BLOCK_LUKS_KEY_SLOT_DISABLED;
+        luks->header.key_slots[i].active =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT=
_DISABLED;
         luks->header.key_slots[i].stripes =3D QCRYPTO_BLOCK_LUKS_STRIPES=
;
=20
         /* This calculation doesn't match that shown in the spec,
@@ -1188,107 +1352,6 @@ qcrypto_block_luks_create(QCryptoBlock *block,
                        QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) * i);
     }
=20
-    if (qcrypto_random_bytes(luks->header.key_slots[0].salt,
-                             QCRYPTO_BLOCK_LUKS_SALT_LEN,
-                             errp) < 0) {
-        goto error;
-    }
-
-    /* Again we determine how many iterations are required to
-     * hash the user password while consuming 1 second of compute
-     * time */
-    iters =3D qcrypto_pbkdf2_count_iters(luks_opts.hash_alg,
-                                       (uint8_t *)password, strlen(passw=
ord),
-                                       luks->header.key_slots[0].salt,
-                                       QCRYPTO_BLOCK_LUKS_SALT_LEN,
-                                       luks->header.master_key_len,
-                                       &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        goto error;
-    }
-
-    if (iters > (ULLONG_MAX / luks_opts.iter_time)) {
-        error_setg_errno(errp, ERANGE,
-                         "PBKDF iterations %llu too large to scale",
-                         (unsigned long long)iters);
-        goto error;
-    }
-
-    /* iter_time was in millis, but count_iters reported for secs */
-    iters =3D iters * luks_opts.iter_time / 1000;
-
-    if (iters > UINT32_MAX) {
-        error_setg_errno(errp, ERANGE,
-                         "PBKDF iterations %llu larger than %u",
-                         (unsigned long long)iters, UINT32_MAX);
-        goto error;
-    }
-
-    luks->header.key_slots[0].iterations =3D
-        MAX(iters, QCRYPTO_BLOCK_LUKS_MIN_SLOT_KEY_ITERS);
-
-
-    /* Generate a key that we'll use to encrypt the master
-     * key, from the user's password
-     */
-    slotkey =3D g_new0(uint8_t, luks->header.master_key_len);
-    if (qcrypto_pbkdf2(luks_opts.hash_alg,
-                       (uint8_t *)password, strlen(password),
-                       luks->header.key_slots[0].salt,
-                       QCRYPTO_BLOCK_LUKS_SALT_LEN,
-                       luks->header.key_slots[0].iterations,
-                       slotkey, luks->header.master_key_len,
-                       errp) < 0) {
-        goto error;
-    }
-
-
-    /* Setup the encryption objects needed to encrypt the
-     * master key material
-     */
-    cipher =3D qcrypto_cipher_new(luks_opts.cipher_alg,
-                                luks_opts.cipher_mode,
-                                slotkey, luks->header.master_key_len,
-                                errp);
-    if (!cipher) {
-        goto error;
-    }
-
-    ivgen =3D qcrypto_ivgen_new(luks_opts.ivgen_alg,
-                              luks->ivgen_cipher_alg,
-                              luks_opts.ivgen_hash_alg,
-                              slotkey, luks->header.master_key_len,
-                              errp);
-    if (!ivgen) {
-        goto error;
-    }
-
-    /* Before storing the master key, we need to vastly
-     * increase its size, as protection against forensic
-     * disk data recovery */
-    splitkey =3D g_new0(uint8_t, splitkeylen);
-
-    if (qcrypto_afsplit_encode(luks_opts.hash_alg,
-                               luks->header.master_key_len,
-                               luks->header.key_slots[0].stripes,
-                               masterkey,
-                               splitkey,
-                               errp) < 0) {
-        goto error;
-    }
-
-    /* Now we encrypt the split master key with the key generated
-     * from the user's password, before storing it */
-    if (qcrypto_block_cipher_encrypt_helper(cipher, block->niv, ivgen,
-                                            QCRYPTO_BLOCK_LUKS_SECTOR_SI=
ZE,
-                                            0,
-                                            splitkey,
-                                            splitkeylen,
-                                            errp) < 0) {
-        goto error;
-    }
-
=20
     /* The total size of the LUKS headers is the partition header + key
      * slot headers, rounded up to the nearest sector, combined with
@@ -1313,23 +1376,21 @@ qcrypto_block_luks_create(QCryptoBlock *block,
         goto error;
     }
=20
-    if (qcrypto_block_luks_store_header(block,  writefunc, opaque, errp)=
 < 0) {
-        goto error;
-    }
=20
-    /* Write out the master key material, starting at the
-     * sector immediately following the partition header. */
-    if (writefunc(block,
-                  luks->header.key_slots[0].key_offset_sector *
-                  QCRYPTO_BLOCK_LUKS_SECTOR_SIZE,
-                  splitkey, splitkeylen,
-                  opaque,
-                  errp) !=3D splitkeylen) {
+    /* populate the slot 0 with the password encrypted master key*/
+    /* This will also store the header */
+    if (qcrypto_block_luks_store_key(block,
+                                     0,
+                                     password,
+                                     masterkey,
+                                     luks_opts.iter_time,
+                                     writefunc,
+                                     opaque,
+                                     errp) < 0) {
         goto error;
     }
=20
     memset(masterkey, 0, luks->header.master_key_len);
-    memset(slotkey, 0, luks->header.master_key_len);
=20
     return 0;
=20
@@ -1337,9 +1398,6 @@ qcrypto_block_luks_create(QCryptoBlock *block,
     if (masterkey) {
         memset(masterkey, 0, luks->header.master_key_len);
     }
-    if (slotkey) {
-        memset(slotkey, 0, luks->header.master_key_len);
-    }
=20
     qcrypto_block_free_cipher(block);
     qcrypto_ivgen_free(block->ivgen);
--=20
2.17.2


