Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2AF67F47C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcLA-0000RK-Cd; Fri, 27 Jan 2023 22:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcL8-0000Qp-B2
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:18 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcL6-0003p5-FI
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:18 -0500
Received: by mail-pl1-x635.google.com with SMTP id d3so6803786plr.10
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23n8jkyycpw055p3C4gV+2Ds+xJ4j1KBu5BFBnOnAJo=;
 b=ROXNOqCyrhK2Iy/T9NNU0oEppShivCs10ts89Ihm0g49W7w/QTmLXi4mkDV07Dr4I1
 JZedWQKla/uskNYLukfaDMcKhzPK+HrDD1MmySCsQr4SELpjw3FxDCX1Hr4MFmweMVtg
 fMAP2Bj1LedXmuvjPSCSWVyDkmDjHH98eJaa3OZq13kJCOMteeXgECdU4cKd9tCmivpm
 EJLTU4lG2Qs7p/RCP73LgDw2HmhfVTdWh0W+UiKlPZ720C3Z7Zrs6Lk8jcHVzdRmJyn3
 Nr5qUlWx6J7DhxJQXvZlBCdv/LTgjxEa9N4lDGV0Q6Np4K/Xscp2PEb5hJJ99dCCjJj3
 P3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23n8jkyycpw055p3C4gV+2Ds+xJ4j1KBu5BFBnOnAJo=;
 b=YQjk5afxuzu9FFBEFjB/0uaRAyqUrqoFPCr3cGhTezrYqVV/vz2R3HUGeff32+iMur
 TQGUEnMs8aREbJowqHw5meNkznGYcPKRsjXCQJzp2YhJnxr7no9+k11o0vrpydiUI9jy
 ApyRvUIz8GYOcuSUvLje+jzrNFj8zs6bTgg+Rc1zocaF/jdvhw1QoJorR45UuiDmmy9h
 G/xuwE3ha8rdmkPMn33sxWTEwJMd+AgMR6E/WBjoUyLR4jPrS1Nqrfurch/gWkWl9K11
 +N3Ar1cSmoR5xLFloUn4oAPRr9WlXJP7kL2AisFtvZ64lgje2ZBlDQnWSDqRkl/X/5xi
 xo2Q==
X-Gm-Message-State: AO0yUKWlTYGLRCMfiCckGwoG//G1FAiRA4GHLnzlwyQQ1aQjdk3Bg+O0
 sraSw9qXNrHVBmvY0ttbRiwvzjosLA/zcxTg
X-Google-Smtp-Source: AK7set8c6Mxm9RVIUzFyWerLuCMY0yupe5aaadx97R8BowsauNc/71JAx77jSap/5xF8BJQpf2LiFA==
X-Received: by 2002:a17:902:d508:b0:194:d7df:cfad with SMTP id
 b8-20020a170902d50800b00194d7dfcfadmr938727plg.18.1674878235019; 
 Fri, 27 Jan 2023 19:57:15 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:14 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 09/12] cryptodev: Account statistics
Date: Sat, 28 Jan 2023 11:56:30 +0800
Message-Id: <20230128035633.2548315-10-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x635.google.com
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
index 940078ace0..5f0e8915c2 100644
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


