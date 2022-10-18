Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724D6024E4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:01:29 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgbP-0001cY-Cr
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6D-0005gY-3V
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg64-0001FN-JE
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMtVftS2fo3OZSvNZd5ws830B1BwQXfiNs87FTXENQU=;
 b=hKVwyoRG4TssSOC6KJPV4/0hN8amDJd/Wdg8iiEfJf17lyXSvhCGRqf1gTD9LyTNBl/DW/
 1VLS1vWIlsMrOI5YQMTG6rZiGZAmlYZ7T1hCmn3eqSo9WZofeIXo6hOnn30w0zEConpbZa
 xCf8wScaPCEwZv6i0osSOCF3LjWaP18=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-i7thtupgNT-iSWfc_ao4Cg-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: i7thtupgNT-iSWfc_ao4Cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C96801C0879F;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0054081B92;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40D4121E668A; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 10/28] qapi crypto: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:31 +0200
Message-Id: <20221018062849.3420573-11-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/crypto.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Daniel P. Berrangé" <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c            | 16 ++++++++--------
 tests/unit/test-crypto-block.c |  6 ------
 scripts/qapi/schema.py         |  1 -
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index f62be6836b..4205bc491e 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -1629,13 +1629,13 @@ qcrypto_block_luks_amend_add_keyslot(QCryptoBlock *block,
     g_autofree char *new_password = NULL;
     g_autofree uint8_t *master_key = NULL;
 
-    char *secret = opts_luks->has_secret ? opts_luks->secret : luks->secret;
+    char *secret = opts_luks->secret ?: luks->secret;
 
-    if (!opts_luks->has_new_secret) {
+    if (!opts_luks->new_secret) {
         error_setg(errp, "'new-secret' is required to activate a keyslot");
         return -1;
     }
-    if (opts_luks->has_old_secret) {
+    if (opts_luks->old_secret) {
         error_setg(errp,
                    "'old-secret' must not be given when activating keyslots");
         return -1;
@@ -1709,7 +1709,7 @@ qcrypto_block_luks_amend_erase_keyslots(QCryptoBlock *block,
     g_autofree uint8_t *tmpkey = NULL;
     g_autofree char *old_password = NULL;
 
-    if (opts_luks->has_new_secret) {
+    if (opts_luks->new_secret) {
         error_setg(errp,
                    "'new-secret' must not be given when erasing keyslots");
         return -1;
@@ -1719,14 +1719,14 @@ qcrypto_block_luks_amend_erase_keyslots(QCryptoBlock *block,
                    "'iter-time' must not be given when erasing keyslots");
         return -1;
     }
-    if (opts_luks->has_secret) {
+    if (opts_luks->secret) {
         error_setg(errp,
                    "'secret' must not be given when erasing keyslots");
         return -1;
     }
 
     /* Load the old password if given */
-    if (opts_luks->has_old_secret) {
+    if (opts_luks->old_secret) {
         old_password = qcrypto_secret_lookup_as_utf8(opts_luks->old_secret,
                                                      errp);
         if (!old_password) {
@@ -1751,7 +1751,7 @@ qcrypto_block_luks_amend_erase_keyslots(QCryptoBlock *block,
             return -1;
         }
 
-        if (opts_luks->has_old_secret) {
+        if (opts_luks->old_secret) {
             int rv = qcrypto_block_luks_load_key(block,
                                                  keyslot,
                                                  old_password,
@@ -1793,7 +1793,7 @@ qcrypto_block_luks_amend_erase_keyslots(QCryptoBlock *block,
         }
 
     /* Erase all keyslots that match the given old password */
-    } else if (opts_luks->has_old_secret) {
+    } else if (opts_luks->old_secret) {
 
         unsigned long slots_to_erase_bitmap = 0;
         size_t i;
diff --git a/tests/unit/test-crypto-block.c b/tests/unit/test-crypto-block.c
index 3417b67be5..6bef471afb 100644
--- a/tests/unit/test-crypto-block.c
+++ b/tests/unit/test-crypto-block.c
@@ -39,7 +39,6 @@
 static QCryptoBlockCreateOptions qcow_create_opts = {
     .format = Q_CRYPTO_BLOCK_FORMAT_QCOW,
     .u.qcow = {
-        .has_key_secret = true,
         .key_secret = (char *)"sec0",
     },
 };
@@ -47,7 +46,6 @@ static QCryptoBlockCreateOptions qcow_create_opts = {
 static QCryptoBlockOpenOptions qcow_open_opts = {
     .format = Q_CRYPTO_BLOCK_FORMAT_QCOW,
     .u.qcow = {
-        .has_key_secret = true,
         .key_secret = (char *)"sec0",
     },
 };
@@ -57,7 +55,6 @@ static QCryptoBlockOpenOptions qcow_open_opts = {
 static QCryptoBlockOpenOptions luks_open_opts = {
     .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
-        .has_key_secret = true,
         .key_secret = (char *)"sec0",
     },
 };
@@ -67,7 +64,6 @@ static QCryptoBlockOpenOptions luks_open_opts = {
 static QCryptoBlockCreateOptions luks_create_opts_default = {
     .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
-        .has_key_secret = true,
         .key_secret = (char *)"sec0",
     },
 };
@@ -77,7 +73,6 @@ static QCryptoBlockCreateOptions luks_create_opts_default = {
 static QCryptoBlockCreateOptions luks_create_opts_aes256_cbc_plain64 = {
     .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
-        .has_key_secret = true,
         .key_secret = (char *)"sec0",
         .has_cipher_alg = true,
         .cipher_alg = QCRYPTO_CIPHER_ALG_AES_256,
@@ -92,7 +87,6 @@ static QCryptoBlockCreateOptions luks_create_opts_aes256_cbc_plain64 = {
 static QCryptoBlockCreateOptions luks_create_opts_aes256_cbc_essiv = {
     .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
-        .has_key_secret = true,
         .key_secret = (char *)"sec0",
         .has_cipher_alg = true,
         .cipher_alg = QCRYPTO_CIPHER_ALG_AES_256,
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 707c671133..21d0b28790 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/crypto.json',
             'qapi/dump.json',
             'qapi/job.json',
             'qapi/machine.json',
-- 
2.37.2


