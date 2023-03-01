Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633FB6A65CF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZj-00082T-AQ; Tue, 28 Feb 2023 21:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZZ-0007vs-4z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:05 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZX-0001lm-7B
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:04 -0500
Received: by mail-pj1-x102a.google.com with SMTP id x34so11945909pjj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yevz87RZmt+inxiebXb+NEQnBTenjq4dQ5kejtSes+I=;
 b=PS6RQSp835f9hfJLe2FY4Ndt4wh9Wg6uJypqod6iBUpmqDPJFhvDE4k55Op8zOJ64l
 mSPOjjlWgQCOk6yg7mBCw69XOnmqAEy1dv3e4RexQupLR2+oa8c7u/2Ilpnpq7GwumKx
 c41dGWZTvExhUM/bDsNVp5UaS9Op5QTwffsaRx2hc44CBJPtipfDpkkFhLVp0u+iL7Xe
 qGoB9Y0Nfu5gbu4FQxbdGkso9hakdzt6nnxwvzjaYUdRxfbZ7Hb6UTHS22jhPrm98J0f
 vYdBHj2fUqDbT2CBbgqp2iAM0D6zECWf8FIMw4ebppnMdZMPNQg9WyQuNZuByFX0qhtC
 Mmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yevz87RZmt+inxiebXb+NEQnBTenjq4dQ5kejtSes+I=;
 b=1IEJWdXr+lP6XfOKuU9iGogkWB2vTBWkfP01EvMpycnocoS9rJbReAo4cGvcXNyQ0S
 c7mIUZbUZl0hLHfrYcaGIz5BSWkj0YChJ6rdDyHHfnDik4bBIQ5vjgGc5pW/n5wtBnGp
 PxbiHLeQBg7qHTX660gEkoOYxtCpdJFePgJ0k6BxQU0lTcaE9c1mODI7dyxUX8mxgPOV
 WMeeIOTdWTTSrFf89QFfQdaHL1OJHT+gbmlh08msaow0OF6FHcxcX9cyaACo/HLxOrUj
 tB88BlYVwM4lNhqEAvUa7qCCGA67Z5cVj3vwJG2dpemCQkDDD3J1aS8+lDny2KYMfl9G
 I5Jg==
X-Gm-Message-State: AO0yUKUeNKqMiEPHge4DpxhJJPavpydARf5R2PRPdRp41631dK4ZbTLh
 F+V1jtsFIZerdc1tweOdGBPRng==
X-Google-Smtp-Source: AK7set8r9yBBr1P9C1qvmFTdUYG2SkDG4DVE+HJ492iWsRj5YbLJd3+Z6DG0F1f6v8K12C66CFaLXg==
X-Received: by 2002:a17:903:42c4:b0:19c:f84b:58bf with SMTP id
 jy4-20020a17090342c400b0019cf84b58bfmr4159938plb.48.1677639121802; 
 Tue, 28 Feb 2023 18:52:01 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:52:00 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 09/12] cryptodev: Account statistics
Date: Wed,  1 Mar 2023 10:51:21 +0800
Message-Id: <20230301025124.3605557-10-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Account OPS/BPS for crypto device, this will be used for 'query-stats'
QEMU monitor command and QoS in the next step.

Note that a crypto device may support symmetric mode, asymmetric mode,
both symmetric and asymmetric mode. So we use two structure to
describe the statistics of a crypto device.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c       | 68 +++++++++++++++++++++++++++++++++++---
 include/sysemu/cryptodev.h | 31 +++++++++++++++++
 qapi/cryptodev.json        | 54 ++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+), 5 deletions(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index ba7b0bc770..cc824e9665 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -107,6 +107,9 @@ void cryptodev_backend_cleanup(
     if (bc->cleanup) {
         bc->cleanup(backend, errp);
     }
+
+    g_free(backend->sym_stat);
+    g_free(backend->asym_stat);
 }
 
 int cryptodev_backend_create_session(
@@ -154,16 +157,61 @@ static int cryptodev_backend_operation(
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
                  CryptoDevBackendOpInfo *op_info)
 {
-    QCryptodevBackendAlgType algtype = op_info->algtype;
+    int ret;
 
-    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
-        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
-        error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
-        return -VIRTIO_CRYPTO_NOTSUPP;
+    ret = cryptodev_backend_account(backend, op_info);
+    if (ret < 0) {
+        return ret;
     }
 
     return cryptodev_backend_operation(backend, op_info);
@@ -202,10 +250,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
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
index 048a627035..15e8c04dcf 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -253,8 +253,39 @@ struct CryptoDevBackend {
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
+
 /**
  * cryptodev_backend_new_client:
  *
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index f33f96a692..54d7f9cb58 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -87,3 +87,57 @@
 # Since: 8.0
 ##
 { 'command': 'query-cryptodev', 'returns': ['QCryptodevInfo']}
+
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
-- 
2.34.1


