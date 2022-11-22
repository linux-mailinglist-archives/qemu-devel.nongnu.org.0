Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9398A633E86
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtt-0000EP-Ud; Tue, 22 Nov 2022 09:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtW-0008UW-51
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:03 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtU-00064Q-2V
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:01 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x66so5842654pfx.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nk2S/0t4kPRq2X2uMrWAJJPsOZ3LfTygDOI9mP3SmW4=;
 b=p5kKRPrJUBRfABTiZpd5REEhjWcNcxtuyI7BcIZwp1gyZAPAaCFqyXl1Ib51rK4t9F
 ANPwA9mNgwqHm6UILYyAs9oERQyBUsKOwY5zWJmhIVwzxeNYDmUT3g2T75buQ/r/IL1N
 6Giur5j46xhT6fsi6DQ3QS61YShgOqUvaq92CsGFQa5NgjNpyUzLyFD7iaq5yJTL3mY3
 N/oS1LM8R6G31c3Oc3c5NdkPaaqj5NzjQCS62qpQ1OTk0gxlnVdIBVGmnopDTuMKNMCD
 SCNLxD9lNsyrkOOtw9jSxkJmyK/UYxppBoWXybooerJb0F4zruGGppUyJli72nBA519d
 x4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nk2S/0t4kPRq2X2uMrWAJJPsOZ3LfTygDOI9mP3SmW4=;
 b=hp4iXVVHtxUI8OKgrVUaT7eOyQwt0qwNQC7TCc/dUMD76V73J+g06DX9d2snBTkPJY
 a85BBSqKEAmHN5ewcWnIR2k3g9GAKAxouBdzBKPSejCW69CMTL0uPyqNeL49QK7XkcBK
 sJvbHFNTtalk9mfA5Q1SC2BQmsMUsvkeB4N6i2VXEeqJatqWymtBo/IOCLA5BoyeNWhN
 Zn3c4Rmdb39Ke1rfKV7qml+mkM3XJFn/SI8p49dJYQKHbUXNLTYo+T06jUEPtJXoU3qb
 GBmQ60dVloUTQ04h548IbGIK8UAZ+rtxHj2AoxZphQq3S+PkaAJ5y0ufBCng49NuYCqz
 s/8g==
X-Gm-Message-State: ANoB5pkhLALXA9Foga9DU/zoNpViGAl4PMqxmriIIdBcn7dOH5oq7rSP
 ep6dSt8BJb8k0M5P0ioeNRk8OA==
X-Google-Smtp-Source: AA0mqf5w2iXdFTgEjzjODe5bqUx/AeEKmsYWHohzNg+C2U4rvkJozZMlWQCLcI0yFfKh059acS6WNA==
X-Received: by 2002:a63:4f47:0:b0:461:a261:eb50 with SMTP id
 p7-20020a634f47000000b00461a261eb50mr12289880pgl.311.1669125892327; 
 Tue, 22 Nov 2022 06:04:52 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:51 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 06/11] cryptodev: Support statistics
Date: Tue, 22 Nov 2022 22:07:51 +0800
Message-Id: <20221122140756.686982-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42e.google.com
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
 backends/cryptodev.c       | 81 +++++++++++++++++++++++++++++++++++---
 include/sysemu/cryptodev.h | 30 ++++++++++++++
 qapi/cryptodev.json        | 58 ++++++++++++++++++++++++++-
 3 files changed, 162 insertions(+), 7 deletions(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index bf2f3234c9..d623bf3bff 100644
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
@@ -161,6 +176,52 @@ static int cryptodev_backend_operation(
     return -VIRTIO_CRYPTO_NOTSUPP;
 }
 
+static int cryptodev_backend_account(CryptoDevBackend *backend,
+                 CryptoDevBackendOpInfo *op_info)
+{
+    enum QCryptodevBackendAlgType algtype = op_info->algtype;
+    int len;
+
+    if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
+        CryptoDevBackendAsymOpInfo *asym_op_info = op_info->u.asym_op_info;
+        len = asym_op_info->src_len;
+        switch (op_info->op_code) {
+        case VIRTIO_CRYPTO_AKCIPHER_ENCRYPT:
+            QCryptodevAsymStatIncEncrypt(backend, len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
+            QCryptodevAsymStatIncDecrypt(backend, len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_SIGN:
+            QCryptodevAsymStatIncSign(backend, len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
+            QCryptodevAsymStatIncVerify(backend, len);
+            break;
+        default:
+            return -VIRTIO_CRYPTO_NOTSUPP;
+        }
+    } else if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
+        CryptoDevBackendSymOpInfo *sym_op_info = op_info->u.sym_op_info;
+        len = sym_op_info->src_len;
+        switch (op_info->op_code) {
+        case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
+            QCryptodevSymStatIncEncrypt(backend, len);
+            break;
+        case VIRTIO_CRYPTO_CIPHER_DECRYPT:
+            QCryptodevSymStatIncDecrypt(backend, len);
+            break;
+        default:
+            return -VIRTIO_CRYPTO_NOTSUPP;
+        }
+    } else {
+        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
+        return -VIRTIO_CRYPTO_NOTSUPP;
+    }
+
+    return len;
+}
+
 int cryptodev_backend_crypto_operation(
                  CryptoDevBackend *backend,
                  void *opaque1,
@@ -169,14 +230,12 @@ int cryptodev_backend_crypto_operation(
 {
     VirtIOCryptoReq *req = opaque1;
     CryptoDevBackendOpInfo *op_info = &req->op_info;
-    enum QCryptodevBackendAlgType algtype = req->flags;
+    int ret;
 
-    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
-        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
-        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
-        return -VIRTIO_CRYPTO_NOTSUPP;
+    ret = cryptodev_backend_account(backend, op_info);
+    if (ret < 0) {
+        return ret;
     }
-
     return cryptodev_backend_operation(backend, op_info, queue_index,
                                        cb, opaque2);
 }
@@ -214,10 +273,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
 {
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
     CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
+    uint32_t services;
 
     if (bc->init) {
         bc->init(backend, errp);
     }
+
+    services = backend->conf.crypto_services;
+    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_CIPHER)) {
+        backend->sym_stat = g_new0(QCryptodevBackendSymStat, 1);
+    }
+
+    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER)) {
+        backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
+    }
 }
 
 void cryptodev_backend_set_used(CryptoDevBackend *backend, bool used)
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


