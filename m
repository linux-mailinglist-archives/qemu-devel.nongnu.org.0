Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF848625412
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:49:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNpD-0006cM-AU; Fri, 11 Nov 2022 01:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNp3-0006ZA-3J
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:29 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNp1-0008Ek-47
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:28 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so3983563pji.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oegg7BK5065V6mlSTrWcn4r0kskoFmAwsjwPQknjsec=;
 b=U1yoA2d0EzDgiwjxxPjzrGnbhWky7/1N4ZykB2TFok1rVRfMo/61kQHZ3Aw2E7gqyl
 hK90jdybDE7RD9EQvP1BswXF4vIi2Js5FCNjwq1haoCB7pGf5Ke2ezxjgNkzkbi1/MxZ
 zrY+XZd2zxwHcMp1NUKFapju1veVH2jucY80zFaz5dmV+fNPSvvH2CcLi9orma1rbiDo
 wP37iQQa01Y2uD0d2au11mT/oI814gNnd6PSFkbiQZr7nC1PmWzKUNMOyuNNMvOdYyTE
 JMUz9aYODzy2i23nui06jA1BIhfiGzPq2s/R69M58DO0ZtbmGRNJq4z1SjGBaDzC/oB7
 HR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oegg7BK5065V6mlSTrWcn4r0kskoFmAwsjwPQknjsec=;
 b=TMW4Uzob+37DSlnw+v5VTalcUIVMJgESJVQNeiwAJ3amdUimnAXAnLS2MiT+HqwkMd
 t6Mrh0n8Vg6N9GKm6A1aSpizjlGa0++rBV3KSEbxAKY427dbCmIUJ5XIyozzSWOK0j7F
 0Ses45qc6q+yFL+wRZo9J5nJxkTk3Oo25Wu0UVKOL4kyKaD6ProGkovfr4OeiDN+/eJx
 VWvCisPXA5eI5SiNe0Qr3ao7H+hdpEIGJRQ9gWvM5miLVJlQE/4nCrzwU/7MW3iXNAH4
 Sej3NebdKzFotIWfvhE45hZxu2/McAakLAlu6Yr+pT4BC0l6puwt9dD0Hi3DRdiDLKT1
 b+Uw==
X-Gm-Message-State: ANoB5pmKMGvb0SASVACAvtIG9UOzHK09IBYrv0unyf0YVByxiOPHxpjo
 sUIl4s+xGiwoAovh9/eyVBCogg==
X-Google-Smtp-Source: AA0mqf455cWZJCAzw5cdkGfIRqhuKZKbSe8TGtbLnRCG39zT9hQgww2ugE0ylqr5IMRg8BGf3Q0a1Q==
X-Received: by 2002:a17:902:db01:b0:186:6d69:6e01 with SMTP id
 m1-20020a170902db0100b001866d696e01mr1135444plx.160.1668149246354; 
 Thu, 10 Nov 2022 22:47:26 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:25 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 6/8] cryptodev: Support statistics
Date: Fri, 11 Nov 2022 14:45:51 +0800
Message-Id: <20221111064553.246932-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce cryptodev statistics in QAPI, and record OPS/Bandwidth for
each crypto device.

Example of this feature:
virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
{
  "return": [
    {
      "service": [
        "akcipher",
        "mac",
        "hash",
        "cipher"
      ],
      "asym-stat": {
        "encrypt-ops": 0,
        "verify-bytes": 0,
        "sign-ops": 0,
        "verify-ops": 0,
        "sign-bytes": 0,
        "decrypt-bytes": 0,
        "decrypt-ops": 0,
        "encrypt-bytes": 0
      },
      "sym-stat": {
        "encrypt-ops": 40,
        "decrypt-bytes": 5376,
        "decrypt-ops": 40,
        "encrypt-bytes": 5376
      },
      "id": "cryptodev1",
      "client": [
        {
          "queue": 0,
          "type": "builtin",
          "info": "cryptodev-builtin0"
        }
      ]
    },
    {
      "service": [
        "akcipher"
      ],
      "asym-stat": {
        "encrypt-ops": 54,
        "verify-bytes": 8704,
        "sign-ops": 17,
        "verify-ops": 34,
        "sign-bytes": 340,
        "decrypt-bytes": 9215,
        "decrypt-ops": 36,
        "encrypt-bytes": 13294
      },
      "id": "cryptodev0",
      "client": [
        {
          "queue": 0,
          "type": "lkcf",
          "info": "cryptodev-lkcf0"
        }
      ]
    }
  ],
  "id": "libvirt-424"
}

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c |  8 ++++-
 backends/cryptodev-lkcf.c    |  1 +
 backends/cryptodev.c         | 37 +++++++++++++++++++++--
 include/sysemu/cryptodev.h   | 30 +++++++++++++++++++
 qapi/cryptodev.json          | 58 +++++++++++++++++++++++++++++++++++-
 5 files changed, 130 insertions(+), 4 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 4987abb7d6..a548c66e39 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -95,6 +95,9 @@ static void cryptodev_builtin_init(
     backend->conf.max_cipher_key_len = CRYPTODEV_BUITLIN_MAX_CIPHER_KEY_LEN;
     backend->conf.max_auth_key_len = CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN;
 
+    backend->sym_stat = g_new0(QCryptodevBackendSymStat, 1);
+    backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
+
     cryptodev_backend_set_ready(backend, true);
 }
 
@@ -433,6 +436,7 @@ static int cryptodev_builtin_close_session(
 }
 
 static int cryptodev_builtin_sym_operation(
+                 CryptoDevBackend *backend,
                  CryptoDevBackendBuiltinSession *sess,
                  CryptoDevBackendSymOpInfo *op_info, Error **errp)
 {
@@ -458,12 +462,14 @@ static int cryptodev_builtin_sym_operation(
         if (ret < 0) {
             return -VIRTIO_CRYPTO_ERR;
         }
+        QCryptodevSymStatIncEncrypt(backend, op_info->src_len);
     } else {
         ret = qcrypto_cipher_decrypt(sess->cipher, op_info->src,
                                      op_info->dst, op_info->src_len, errp);
         if (ret < 0) {
             return -VIRTIO_CRYPTO_ERR;
         }
+        QCryptodevSymStatIncDecrypt(backend, op_info->src_len);
     }
 
     return VIRTIO_CRYPTO_OK;
@@ -551,7 +557,7 @@ static int cryptodev_builtin_operation(
     sess = builtin->sessions[op_info->session_id];
     if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
         sym_op_info = op_info->u.sym_op_info;
-        status = cryptodev_builtin_sym_operation(sess, sym_op_info,
+        status = cryptodev_builtin_sym_operation(backend, sess, sym_op_info,
                                                  &local_error);
     } else if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
         asym_op_info = op_info->u.asym_op_info;
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 31ec712849..609a39bb7e 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -233,6 +233,7 @@ static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
         1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER;
     backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
     lkcf->running = true;
+    backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
 
     QSIMPLEQ_INIT(&lkcf->requests);
     QSIMPLEQ_INIT(&lkcf->responses);
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index bf2f3234c9..b93b1d25f2 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -48,6 +48,18 @@ static int qmp_query_cryptodev_foreach(Object *obj, void *data)
     info->id = g_strdup(object_get_canonical_path_component(obj));
 
     backend = CRYPTODEV_BACKEND(obj);
+    if (backend->sym_stat) {
+        info->has_sym_stat = true;
+        info->sym_stat = g_memdup2(backend->sym_stat,
+                                sizeof(QCryptodevBackendSymStat));
+    }
+
+    if (backend->asym_stat) {
+        info->has_asym_stat = true;
+        info->asym_stat = g_memdup2(backend->asym_stat,
+                                sizeof(QCryptodevBackendAsymStat));
+    }
+
     services = backend->conf.crypto_services;
     for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
         if (services & (1 << i)) {
@@ -111,6 +123,9 @@ void cryptodev_backend_cleanup(
     if (bc->cleanup) {
         bc->cleanup(backend, errp);
     }
+
+    g_free(backend->sym_stat);
+    g_free(backend->asym_stat);
 }
 
 int cryptodev_backend_create_session(
@@ -171,8 +186,26 @@ int cryptodev_backend_crypto_operation(
     CryptoDevBackendOpInfo *op_info = &req->op_info;
     enum QCryptodevBackendAlgType algtype = req->flags;
 
-    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
-        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
+    /* symmetric statistics need to be recorded in driver */
+    if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
+        CryptoDevBackendAsymOpInfo *asym_op_info = op_info->u.asym_op_info;
+        switch (op_info->op_code) {
+        case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
+            QCryptodevAsymStatIncEncrypt(backend, asym_op_info->src_len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
+            QCryptodevAsymStatIncDecrypt(backend, asym_op_info->src_len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_SIGN:
+            QCryptodevAsymStatIncSign(backend, asym_op_info->src_len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
+            QCryptodevAsymStatIncVerify(backend, asym_op_info->src_len);
+            break;
+        default:
+            return -VIRTIO_CRYPTO_NOTSUPP;
+        }
+    } else if (algtype != QCRYPTODEV_BACKEND_ALG_SYM) {
         error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
         return -VIRTIO_CRYPTO_NOTSUPP;
     }
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index f68a4baf13..c154c52039 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -252,8 +252,38 @@ struct CryptoDevBackend {
     /* Tag the cryptodev backend is used by virtio-crypto or not */
     bool is_used;
     CryptoDevBackendConf conf;
+    QCryptodevBackendSymStat *sym_stat;
+    QCryptodevBackendAsymStat *asym_stat;
 };
 
+#define QCryptodevSymStatInc(be, op, bytes) do { \
+   be->sym_stat->op##_bytes += (bytes); \
+   be->sym_stat->op##_ops += 1; \
+} while (/*CONSTCOND*/0)
+
+#define QCryptodevSymStatIncEncrypt(be, bytes) \
+            QCryptodevSymStatInc(be, encrypt, bytes)
+
+#define QCryptodevSymStatIncDecrypt(be, bytes) \
+            QCryptodevSymStatInc(be, decrypt, bytes)
+
+#define QCryptodevAsymStatInc(be, op, bytes) do { \
+    be->asym_stat->op##_bytes += (bytes); \
+    be->asym_stat->op##_ops += 1; \
+} while (/*CONSTCOND*/0)
+
+#define QCryptodevAsymStatIncEncrypt(be, bytes) \
+            QCryptodevAsymStatInc(be, encrypt, bytes)
+
+#define QCryptodevAsymStatIncDecrypt(be, bytes) \
+            QCryptodevAsymStatInc(be, decrypt, bytes)
+
+#define QCryptodevAsymStatIncSign(be, bytes) \
+            QCryptodevAsymStatInc(be, sign, bytes)
+
+#define QCryptodevAsymStatIncVerify(be, bytes) \
+            QCryptodevAsymStatInc(be, verify, bytes)
+
 /**
  * cryptodev_backend_new_client:
  *
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index 4cc4f4f0ed..f01f2d017a 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -60,6 +60,60 @@
             'type': 'QCryptodevBackendType',
             '*info': 'str' } }
 
+##
+# @QCryptodevBackendSymStat:
+#
+# The statistics of symmetric operation.
+#
+# @encrypt-ops: the operations of symmetric encryption
+#
+# @decrypt-ops: the operations of symmetric decryption
+#
+# @encrypt-bytes: the bytes of symmetric encryption
+#
+# @decrypt-bytes: the bytes of symmetric decryption
+#
+# Since: 8.0
+##
+{ 'struct': 'QCryptodevBackendSymStat',
+  'data': { 'encrypt-ops': 'int',
+            'decrypt-ops': 'int',
+            'encrypt-bytes': 'int',
+            'decrypt-bytes': 'int' } }
+
+##
+# @QCryptodevBackendAsymStat:
+#
+# The statistics of asymmetric operation.
+#
+# @encrypt-ops: the operations of asymmetric encryption
+#
+# @decrypt-ops: the operations of asymmetric decryption
+#
+# @sign-ops: the operations of asymmetric signature
+#
+# @verify-ops: the operations of asymmetric verification
+#
+# @encrypt-bytes: the bytes of asymmetric encryption
+#
+# @decrypt-bytes: the bytes of asymmetric decryption
+#
+# @sign-bytes: the bytes of asymmetric signature
+#
+# @verify-bytes: the bytes of asymmetric verification
+#
+# Since: 8.0
+##
+{ 'struct': 'QCryptodevBackendAsymStat',
+  'data': { 'encrypt-ops': 'int',
+            'decrypt-ops': 'int',
+            'sign-ops': 'int',
+            'verify-ops': 'int',
+            'encrypt-bytes': 'int',
+            'decrypt-bytes': 'int',
+            'sign-bytes': 'int',
+            'verify-bytes': 'int' } }
+
 ##
 # @CryptodevInfo:
 #
@@ -74,7 +128,9 @@
 { 'struct': 'CryptodevInfo',
   'data': { 'id': 'str',
             'service': ['QCryptodevBackendServiceType'],
-            'client': ['CryptodevBackendClient'] } }
+            'client': ['CryptodevBackendClient'],
+            '*sym-stat': 'QCryptodevBackendSymStat',
+            '*asym-stat': 'QCryptodevBackendAsymStat' } }
 
 ##
 # @query-cryptodev:
-- 
2.20.1


