Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA36625410
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:49:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNp9-0006ZF-7O; Fri, 11 Nov 2022 01:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNoy-0006W8-RB
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:26 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNos-0008EQ-Hn
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:24 -0500
Received: by mail-pf1-x433.google.com with SMTP id z26so4163372pff.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5b3RVuXlvvZql99mll6PolNwr4wkN22sgLcd1hY141Y=;
 b=4bEQxvY/GyZpqN4PbR5RK3896/kp1zGT4rQUixV69ebj4OJVObK6xQKHlz+woXg7q+
 GFhDT28Z9Xkz4bKZD8WIQk7F9oYkHpOaE+5STKxrsEsv1AniPs3yLZXwfOMcbRq/DM0f
 k4dcRDWdmWnZjNUTecsJs3DRLYL+V/fyQYoSjhcxsjALoIih5efe/h4f1lBOrG7bp9Qt
 oByQ4p9Ho9fhSEUpkQRMVXjyA/QDOHAMLG0SFKMsXCrihCiSnIhrpUfYgy+8xo8GgKsa
 /bPQDKzJ02Mj1EuGWK1HnvYXSxxTwfnDaczErNySXhI/+eghCrItFFLlPE1U2MzXv+qk
 58xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5b3RVuXlvvZql99mll6PolNwr4wkN22sgLcd1hY141Y=;
 b=zUGck1XCA1dd8ZcN9NdV1vM2cOFFen3wMR/R+cS9BL6vpIHg29CbmdO2yKhpdeg/I1
 JAMYKsb5mlfuYiq3J3fGvHyawjeT0D4Fss/H99UWItftjDq+qBOORpFSHMuqkJPp/MrG
 YLO1q88JAME1AS9D5vLnsr4JXQJUUhb5Sh/0wlORp5nj+AGsoD0IUgMGuz1Vk8un+qt8
 6JGAsu6H3X6yJclSE6O/7h7xO3ENZErrPjDun++fcrgfQvowxjXOsj/woxgu8ggnPy7q
 mcnuZPVo8bh/jHBpQG9gYj62KRxCmZybdUa2a4CfuZNyWrjMZnlCMBdohjUlWZp+MsLP
 XUQA==
X-Gm-Message-State: ANoB5pluUxjH9NUtcHD99ZyH0AYEDCafBK+BMIT83PxKZcaEwi8uSu5F
 a89p3bWKqViuG3CP2Hb+tU7NMA==
X-Google-Smtp-Source: AA0mqf791CqA6StnJcZDrJK55uxWBYANXXvJj/v/fpiDniXWvDVEg2pJykEL7Ct5m4YifzGaWa3LRg==
X-Received: by 2002:aa7:9839:0:b0:56b:d363:a31b with SMTP id
 q25-20020aa79839000000b0056bd363a31bmr1198312pfl.78.1668149236045; 
 Thu, 10 Nov 2022 22:47:16 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:15 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 3/8] cryptodev: Introduce cryptodev alg type in QAPI
Date: Fri, 11 Nov 2022 14:45:48 +0800
Message-Id: <20221111064553.246932-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x433.google.com
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
index 08895271eb..5fb7b8f43f 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -537,7 +537,7 @@ static int cryptodev_builtin_operation(
     CryptoDevBackendBuiltinSession *sess;
     CryptoDevBackendSymOpInfo *sym_op_info;
     CryptoDevBackendAsymOpInfo *asym_op_info;
-    enum CryptoDevBackendAlgType algtype = op_info->algtype;
+    enum QCryptodevBackendAlgType algtype = op_info->algtype;
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
index de3d1867c5..919bf05b75 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -477,7 +477,7 @@ static int cryptodev_lkcf_operation(
     CryptoDevBackendLKCF *lkcf =
         CRYPTODEV_BACKEND_LKCF(backend);
     CryptoDevBackendLKCFSession *sess;
-    enum CryptoDevBackendAlgType algtype = op_info->algtype;
+    enum QCryptodevBackendAlgType algtype = op_info->algtype;
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
index 81941af816..d3caded920 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -120,10 +120,10 @@ int cryptodev_backend_crypto_operation(
 {
     VirtIOCryptoReq *req = opaque1;
     CryptoDevBackendOpInfo *op_info = &req->op_info;
-    enum CryptoDevBackendAlgType algtype = req->flags;
+    enum QCryptodevBackendAlgType algtype = req->flags;
 
-    if ((algtype != CRYPTODEV_BACKEND_ALG_SYM)
-        && (algtype != CRYPTODEV_BACKEND_ALG_ASYM)) {
+    if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
+        && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
         error_report("Unsupported cryptodev alg type: %" PRIu32 "", algtype);
         return -VIRTIO_CRYPTO_NOTSUPP;
     }
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 97da74e719..e0a7e2cbd8 100644
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
index af152d09db..f68a4baf13 100644
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
+    enum QCryptodevBackendAlgType algtype;
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
2.20.1


