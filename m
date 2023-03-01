Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A186A6B42
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBQ-0004aF-S8; Wed, 01 Mar 2023 05:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBC-0004YR-Ez
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:27 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKB9-0006Dx-2X
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y2so12948596pjg.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMFQWyQMxJuLht08y8UXOs3qr1UwVrlQirzyvap/Nu4=;
 b=EYRYQUVdPGlH2lh0Py1dPDwM6n0GbKfYryBlDHi7Z8IIJxxjvV9DYwOxDyWBZzATMJ
 iJDqxYkG+Y3ezlQzTudG4ZKLw1ToT0bdF4TKEypbfwmsx68A9jueUT542GH7XljzQ6xg
 Ric3zWsESYMAOwvhNl00uHpTMI1JrZI18Z1RCfQgSNm1mlhEqAxH37QevPAqFNvi/tbV
 vQEKwMjawjSZL9o6GhTCkhcrKbR7domW6U7yOREg7goyPYGaNpi81oMem5sDeDUoMGPQ
 5dj032if2c/ewU+fFiTpTiWt1uldxf76UmzFkPu7zh26DGflH+TnFnAAvIFNX4GoMjSw
 T1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMFQWyQMxJuLht08y8UXOs3qr1UwVrlQirzyvap/Nu4=;
 b=wyP6PpOgONUtlf0L8QwDvAz+9PBf7FuoW8kzgiT9E3mlnHzzf0qImoGxZC9PUSuR7K
 Xtc8vzmC+PRjc5hWCa36PkoAAcBuAoFnaSmG8etNJhd2FNKKwUzWhU9WuItToOTEsnqo
 A+gaEhf/fAoxNtcwKD4iNz6/JFLvx/LiLxGiTkg5fp+RYcqFTRJxNlxsgWV+Ce53tif1
 DfZ7B7Da8M4EZ5kOFHxCTdzn4sgmBqvyjVXN+gH4MfSRfrm+3VK2gW7kRUs0nvZ+kMAM
 ITyRK/xFj5jeEygP3GhDpK4zwHy1D6HE8Im2EP3bfbACRnBzPyOypTBYkah5uLpO5sZK
 +zlQ==
X-Gm-Message-State: AO0yUKXSMEUvDyo2xgGQPIB/AwKKS+d/xvbD2HhnQtWf5eKHCyMilfCu
 P45wmrM04l/3Myt5iGm4JQOIAA==
X-Google-Smtp-Source: AK7set+6FT+PuY/iMbcIIYQ/loS74VOwM1cn7NH4sPZfxRsvEZblP7OCG6J7RUTLCaQlupL1m2WyOA==
X-Received: by 2002:a17:90b:5111:b0:237:ae98:a484 with SMTP id
 sc17-20020a17090b511100b00237ae98a484mr6778270pjb.7.1677668352751; 
 Wed, 01 Mar 2023 02:59:12 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:12 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 03/12] cryptodev: Introduce cryptodev alg type in QAPI
Date: Wed,  1 Mar 2023 18:58:38 +0800
Message-Id: <20230301105847.253084-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
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

Introduce cryptodev alg type in cryptodev.json, then apply this to
related codes, and drop 'enum CryptoDevBackendAlgType'.

There are two options:
1, { 'enum': 'QCryptodevBackendAlgType',
  'prefix': 'CRYPTODEV_BACKEND_ALG',
  'data': ['sym', 'asym']}
Then we can keep 'CRYPTODEV_BACKEND_ALG_SYM' and avoid lots of
changes.
2, changes in this patch(with prefix 'QCRYPTODEV_BACKEND_ALG').

To avoid breaking the rule of QAPI, use 2 here.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c |  6 +++---
 backends/cryptodev-lkcf.c    |  4 ++--
 backends/cryptodev.c         |  6 +++---
 hw/virtio/virtio-crypto.c    | 14 +++++++-------
 include/sysemu/cryptodev.h   |  8 +-------
 qapi/cryptodev.json          | 14 ++++++++++++++
 6 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 08895271eb..e70dcd5dad 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -537,7 +537,7 @@ static int cryptodev_builtin_operation(
     CryptoDevBackendBuiltinSession *sess;
     CryptoDevBackendSymOpInfo *sym_op_info;
     CryptoDevBackendAsymOpInfo *asym_op_info;
-    enum CryptoDevBackendAlgType algtype = op_info->algtype;
+    QCryptodevBackendAlgType algtype = op_info->algtype;
     int status = -VIRTIO_CRYPTO_ERR;
     Error *local_error = NULL;
 
@@ -549,11 +549,11 @@ static int cryptodev_builtin_operation(
     }
 
     sess = builtin->sessions[op_info->session_id];
-    if (algtype == CRYPTODEV_BACKEND_ALG_SYM) {
+    if (algtype == QCRYPTODEV_BACKEND_ALG_SYM) {
         sym_op_info = op_info->u.sym_op_info;
         status = cryptodev_builtin_sym_operation(sess, sym_op_info,
                                                  &local_error);
-    } else if (algtype == CRYPTODEV_BACKEND_ALG_ASYM) {
+    } else if (algtype == QCRYPTODEV_BACKEND_ALG_ASYM) {
         asym_op_info = op_info->u.asym_op_info;
         status = cryptodev_builtin_asym_operation(sess, op_info->op_code,
                                                   asym_op_info, &local_error);
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index de3d1867c5..53a932b58d 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -477,7 +477,7 @@ static int cryptodev_lkcf_operation(
     CryptoDevBackendLKCF *lkcf =
         CRYPTODEV_BACKEND_LKCF(backend);
     CryptoDevBackendLKCFSession *sess;
-    enum CryptoDevBackendAlgType algtype = op_info->algtype;
+    QCryptodevBackendAlgType algtype = op_info->algtype;
     CryptoDevLKCFTask *task;
 
     if (op_info->session_id >= MAX_SESSIONS ||
@@ -488,7 +488,7 @@ static int cryptodev_lkcf_operation(
     }
 
     sess = lkcf->sess[op_info->session_id];
-    if (algtype != CRYPTODEV_BACKEND_ALG_ASYM) {
+    if (algtype != QCRYPTODEV_BACKEND_ALG_ASYM) {
         error_report("algtype not supported: %u", algtype);
         return -VIRTIO_CRYPTO_NOTSUPP;
     }
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 81941af816..c2a053db0e 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -120,10 +120,10 @@ int cryptodev_backend_crypto_operation(
 {
     VirtIOCryptoReq *req = opaque1;
     CryptoDevBackendOpInfo *op_info = &req->op_info;
-    enum CryptoDevBackendAlgType algtype = req->flags;
+    QCryptodevBackendAlgType algtype = req->flags;
 
-    if ((algtype != CRYPTODEV_BACKEND_ALG_SYM)
-        && (algtype != CRYPTODEV_BACKEND_ALG_ASYM)) {
+    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
+        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
         error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
         return -VIRTIO_CRYPTO_NOTSUPP;
     }
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 516425e26a..0d1be0ada9 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -462,7 +462,7 @@ static void virtio_crypto_init_request(VirtIOCrypto *vcrypto, VirtQueue *vq,
     req->in_iov = NULL;
     req->in_num = 0;
     req->in_len = 0;
-    req->flags = CRYPTODEV_BACKEND_ALG__MAX;
+    req->flags = QCRYPTODEV_BACKEND_ALG__MAX;
     memset(&req->op_info, 0x00, sizeof(req->op_info));
 }
 
@@ -472,7 +472,7 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
         return;
     }
 
-    if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
+    if (req->flags == QCRYPTODEV_BACKEND_ALG_SYM) {
         size_t max_len;
         CryptoDevBackendSymOpInfo *op_info = req->op_info.u.sym_op_info;
 
@@ -485,7 +485,7 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
         /* Zeroize and free request data structure */
         memset(op_info, 0, sizeof(*op_info) + max_len);
         g_free(op_info);
-    } else if (req->flags == CRYPTODEV_BACKEND_ALG_ASYM) {
+    } else if (req->flags == QCRYPTODEV_BACKEND_ALG_ASYM) {
         CryptoDevBackendAsymOpInfo *op_info = req->op_info.u.asym_op_info;
         if (op_info) {
             g_free(op_info->src);
@@ -570,10 +570,10 @@ static void virtio_crypto_req_complete(void *opaque, int ret)
     VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
     uint8_t status = -ret;
 
-    if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
+    if (req->flags == QCRYPTODEV_BACKEND_ALG_SYM) {
         virtio_crypto_sym_input_data_helper(vdev, req, status,
                                             req->op_info.u.sym_op_info);
-    } else if (req->flags == CRYPTODEV_BACKEND_ALG_ASYM) {
+    } else if (req->flags == QCRYPTODEV_BACKEND_ALG_ASYM) {
         virtio_crypto_akcipher_input_data_helper(vdev, req, status,
                                              req->op_info.u.asym_op_info);
     }
@@ -875,7 +875,7 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     switch (opcode) {
     case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
     case VIRTIO_CRYPTO_CIPHER_DECRYPT:
-        op_info->algtype = request->flags = CRYPTODEV_BACKEND_ALG_SYM;
+        op_info->algtype = request->flags = QCRYPTODEV_BACKEND_ALG_SYM;
         ret = virtio_crypto_handle_sym_req(vcrypto,
                          &req.u.sym_req, op_info,
                          out_iov, out_num);
@@ -885,7 +885,7 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     case VIRTIO_CRYPTO_AKCIPHER_DECRYPT:
     case VIRTIO_CRYPTO_AKCIPHER_SIGN:
     case VIRTIO_CRYPTO_AKCIPHER_VERIFY:
-        op_info->algtype = request->flags = CRYPTODEV_BACKEND_ALG_ASYM;
+        op_info->algtype = request->flags = QCRYPTODEV_BACKEND_ALG_ASYM;
         ret = virtio_crypto_handle_asym_req(vcrypto,
                          &req.u.akcipher_req, op_info,
                          out_iov, out_num);
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index af152d09db..16f01dd48a 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -49,12 +49,6 @@ typedef struct CryptoDevBackendPeers CryptoDevBackendPeers;
 typedef struct CryptoDevBackendClient
                      CryptoDevBackendClient;
 
-enum CryptoDevBackendAlgType {
-    CRYPTODEV_BACKEND_ALG_SYM,
-    CRYPTODEV_BACKEND_ALG_ASYM,
-    CRYPTODEV_BACKEND_ALG__MAX,
-};
-
 /**
  * CryptoDevBackendSymSessionInfo:
  *
@@ -181,7 +175,7 @@ typedef struct CryptoDevBackendAsymOpInfo {
 } CryptoDevBackendAsymOpInfo;
 
 typedef struct CryptoDevBackendOpInfo {
-    enum CryptoDevBackendAlgType algtype;
+    QCryptodevBackendAlgType algtype;
     uint32_t op_code;
     uint64_t session_id;
     union {
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index b65edbe183..ebb6852035 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -4,6 +4,20 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
+##
+# @QCryptodevBackendAlgType:
+#
+# The supported algorithm types of a crypto device.
+#
+# @sym: symmetric encryption
+# @asym: asymmetric Encryption
+#
+# Since: 8.0
+##
+{ 'enum': 'QCryptodevBackendAlgType',
+  'prefix': 'QCRYPTODEV_BACKEND_ALG',
+  'data': ['sym', 'asym']}
+
 ##
 # @QCryptodevBackendType:
 #
-- 
2.34.1


