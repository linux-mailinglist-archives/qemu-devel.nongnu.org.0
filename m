Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDFC67323B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP8t-0006HO-79; Thu, 19 Jan 2023 02:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8U-0006BT-TO
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:58 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8S-0002HE-CV
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:57 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g23so1472881plq.12
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZSuifELk3Va4o8yDu4MXRSk8LKQ9sH66poU+fCNP+U=;
 b=Fi/qvwlvdEr2URqOwaesocDhpYvQN5m0FpgwaSY78RDfxXLsIwc3PVcHtWc7ZxcieG
 UnG4TWEnsfXu/wSluFGDDpKvLZLQjV9SLidSSLNPXnxxPTV1Nl03NdOp+DBIG1qBYFyd
 aaRWdmOCL3B6CH3tlN9mKvRH3sGE9hRCqUmpUVdWOrvZ0eFsVJU17T6IEzl11iUFmBla
 5E+GETBsnCH4u1SpSqTMxxcBCGJ21H8o907yK+GNyxbMRA+Y9KBXOtlLv/m4lS3I2kaE
 zhXdi9lU6765+z+EMcqMO6DCNCybzl0wQO5V5asyF1WXDO61xCPHQ3to2rBgaF4iJI7H
 ufvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZSuifELk3Va4o8yDu4MXRSk8LKQ9sH66poU+fCNP+U=;
 b=agxhNkVJSKwHtq0/oWPihoLzYstmJ3esFNiBoyVxNmK80zRqCjkYdom59mZb9wwGkX
 2Izbg3EH4I4EqiwZZEwRV83a05ESqGW4l0LBPaxZsZbEQ14OG0iWAHR03Gfy55Btz01f
 2Oahr53s/s+fhxMdHfzFDAJpSj9bm/fHRxnOC5E62uWdzmF7Q2NRKJy0BCtCEEIS7BHE
 vUz7JQ83J5UpRwns0QgzHK4AfwzmPKdXWszZlze2PMck1krzkBhmnlTn479pnB+GtITU
 WYyAHyknZOhLOA4C6p+H82il8X1C11JEBCxY46wcsvNIpJX4NLQ2bT66dUi17Ns63pKy
 ISRw==
X-Gm-Message-State: AFqh2kqNbAqPix40etLbEA1Q6CA4qwq+VlUWKdo9Q0qns3vhZFp48zSA
 JH5RuljayKt06Vlr2qQaQ2IGDQ==
X-Google-Smtp-Source: AMrXdXuAUEfAWCFroa9s2VTHXzV4kSLkdJdI9UJRJUMnMEY4ddyb5cNwiEsGWnyy43oZqnClX9Zgow==
X-Received: by 2002:a17:903:3285:b0:194:5e49:d941 with SMTP id
 jh5-20020a170903328500b001945e49d941mr10349945plb.47.1674112494785; 
 Wed, 18 Jan 2023 23:14:54 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:14:54 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 09/12] cryptodev: Account statistics
Date: Thu, 19 Jan 2023 15:14:16 +0800
Message-Id: <20230119071419.3585771-10-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62a.google.com
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
index b15b1a24f5..9c8ba6f29f 100644
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
index 6c6509cd3f..dbd8fa71f9 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -87,3 +87,57 @@
 # Since: 8.0
 ##
 { 'command': 'query-cryptodev', 'returns': ['CryptodevInfo']}
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


