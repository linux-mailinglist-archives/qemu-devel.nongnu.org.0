Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF86A6B3E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:00:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBS-0004cX-K6; Wed, 01 Mar 2023 05:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBN-0004aY-7D
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:40 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBL-0006JI-H2
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:36 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bo22so1394394pjb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Td/j6dTzaLln6NnpiNQ+S68Nsrdxuxb2Asl0Whf6/l0=;
 b=a7SjVwXBmwlAT5SaD6NJJynG2D67ZJbLUlMxe43CWvQAzTs4Uz1S2K9/+2wprNVFk3
 E31pWEXkrlSGQUbDXbLxAGqHIB5/3uOC3e0TfYylztkwDP0B6qwtCSFuB9WlNTYgJfOY
 BymvVcg3rNiw5IQtHyjAmRcmZMONGB+gXWjURcOpxVZels8YrPGhGnv3Th+SVcpOkknk
 yngP145D7jFk4NxlCEI4i8CftsUv74Wi9O1iNvsUtPrYYlr+3Gi4fbzhckQpzXCZA7xr
 sM/aNPD8JNnNbgVywf92QdlTfhs3F4463e0Ju3VOFrnbgof1yyR5w+C/v+xYoRwVaPxX
 HosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Td/j6dTzaLln6NnpiNQ+S68Nsrdxuxb2Asl0Whf6/l0=;
 b=zRWegg1GFduuHM9JaYRUpIs5Tc0xtb1l/jedccBEciYh0SdEUjWJ6EgGwxfI41AHUQ
 HgGboGWqwrgHErlm/HU/6cGYSpXPoWdtVmlSUXyUmJmlaiI7Ir0rfTUlGn52Xm6zwtTf
 ODHyXE87/ArkZ9in4iFomNAiqdAWEzG6BND76WrmecMp2Awesa7PSP4SiTixHTG4T+C4
 LHWSyAGVOhf00Bj6TN3amnf3bf6Zj2/NMWCbaD5Sqffc2niZ59ML78t8JJVDc2LP+zTN
 vWX/3g792u8l1ZOZPycikdTt5e636+8UX8ui98P/W6+SC76vP8CsTPV7V8odiw2VGeAB
 ZDSQ==
X-Gm-Message-State: AO0yUKUynIF71DZNRoptCyWzwmC+3dr2Xw8Yen+3mqY8rmQYMG6eZ9RW
 snW4Baf/YKG+EIodBdtEuc33ng==
X-Google-Smtp-Source: AK7set+ohd1PiE436Azb87+Bm3Gqg3gHxvQ5y+D5B47OmYP9FiD1Dgtoj5n0bJ6Vxq2hLBMjDE7O3w==
X-Received: by 2002:a17:90a:1e:b0:22c:afd6:e597 with SMTP id
 30-20020a17090a001e00b0022cafd6e597mr7071601pja.17.1677668371272; 
 Wed, 01 Mar 2023 02:59:31 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:30 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 09/12] cryptodev: Account statistics
Date: Wed,  1 Mar 2023 18:58:44 +0800
Message-Id: <20230301105847.253084-10-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1029.google.com
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
 include/sysemu/cryptodev.h | 49 +++++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 5 deletions(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index ba7b0bc770..5ee7507ca5 100644
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
+            CryptodevAsymStatIncEncrypt(backend, len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
+            CryptodevAsymStatIncDecrypt(backend, len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_SIGN:
+            CryptodevAsymStatIncSign(backend, len);
+            break;
+        case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
+            CryptodevAsymStatIncVerify(backend, len);
+            break;
+        default:
+            return -VIRTIO_CRYPTO_NOTSUPP;
+        }
+    } else if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
+        CryptoDevBackendSymOpInfo *sym_op_info = op_info->u.sym_op_info;
+        len = sym_op_info->src_len;
+        switch (op_info->op_code) {
+        case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
+            CryptodevSymStatIncEncrypt(backend, len);
+            break;
+        case VIRTIO_CRYPTO_CIPHER_DECRYPT:
+            CryptodevSymStatIncDecrypt(backend, len);
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
+        backend->sym_stat = g_new0(CryptodevBackendSymStat, 1);
+    }
+
+    if (services & (1 << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER)) {
+        backend->asym_stat = g_new0(CryptodevBackendAsymStat, 1);
+    }
 }
 
 void cryptodev_backend_set_used(CryptoDevBackend *backend, bool used)
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 048a627035..c0250c4a2c 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -246,6 +246,24 @@ struct CryptoDevBackendConf {
     uint64_t max_size;
 };
 
+typedef struct CryptodevBackendSymStat {
+    int64_t encrypt_ops;
+    int64_t decrypt_ops;
+    int64_t encrypt_bytes;
+    int64_t decrypt_bytes;
+} CryptodevBackendSymStat;
+
+typedef struct CryptodevBackendAsymStat {
+    int64_t encrypt_ops;
+    int64_t decrypt_ops;
+    int64_t sign_ops;
+    int64_t verify_ops;
+    int64_t encrypt_bytes;
+    int64_t decrypt_bytes;
+    int64_t sign_bytes;
+    int64_t verify_bytes;
+} CryptodevBackendAsymStat;
+
 struct CryptoDevBackend {
     Object parent_obj;
 
@@ -253,8 +271,39 @@ struct CryptoDevBackend {
     /* Tag the cryptodev backend is used by virtio-crypto or not */
     bool is_used;
     CryptoDevBackendConf conf;
+    CryptodevBackendSymStat *sym_stat;
+    CryptodevBackendAsymStat *asym_stat;
 };
 
+#define CryptodevSymStatInc(be, op, bytes) do { \
+   be->sym_stat->op##_bytes += (bytes); \
+   be->sym_stat->op##_ops += 1; \
+} while (/*CONSTCOND*/0)
+
+#define CryptodevSymStatIncEncrypt(be, bytes) \
+            CryptodevSymStatInc(be, encrypt, bytes)
+
+#define CryptodevSymStatIncDecrypt(be, bytes) \
+            CryptodevSymStatInc(be, decrypt, bytes)
+
+#define CryptodevAsymStatInc(be, op, bytes) do { \
+    be->asym_stat->op##_bytes += (bytes); \
+    be->asym_stat->op##_ops += 1; \
+} while (/*CONSTCOND*/0)
+
+#define CryptodevAsymStatIncEncrypt(be, bytes) \
+            CryptodevAsymStatInc(be, encrypt, bytes)
+
+#define CryptodevAsymStatIncDecrypt(be, bytes) \
+            CryptodevAsymStatInc(be, decrypt, bytes)
+
+#define CryptodevAsymStatIncSign(be, bytes) \
+            CryptodevAsymStatInc(be, sign, bytes)
+
+#define CryptodevAsymStatIncVerify(be, bytes) \
+            CryptodevAsymStatInc(be, verify, bytes)
+
+
 /**
  * cryptodev_backend_new_client:
  *
-- 
2.34.1


