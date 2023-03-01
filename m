Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F896A65C3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:52:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZG-0007bc-SR; Tue, 28 Feb 2023 21:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZE-0007b1-Ru
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:44 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZC-0001d3-UC
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:44 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so11711410plf.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMFQWyQMxJuLht08y8UXOs3qr1UwVrlQirzyvap/Nu4=;
 b=a2XlI5SfjW3Ta+CYw+U45UBXQWGaO1EkwQJT+COJfHKw+QjlHjG7QZ/eSWqvz8TQYD
 vXkiHj1b9ukibFivgh9XqZP08hKBTyRcm9hK6zuRHGKr6ywB7cXdPHgHiYFWXxXsWkQV
 GP6GjQvfxK3o5TWxPMydI1S+c+bl8u/z7yuVARfxKRvdLsHaablDfbTHbmAYLCg31ppO
 rZVYODaeyc3itpCPfGvAZ5OGGZ/JxetQmgqYhFS7p1XVWtnTNOmU3OjHLJPMVt+EDjqE
 oIQnUhDCGGEUvE1AOx4b0zQINaEb1C62ijrcm/oIt/q3CvP3KLRE3IIgsh+ls8A2ab9+
 Q3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMFQWyQMxJuLht08y8UXOs3qr1UwVrlQirzyvap/Nu4=;
 b=Rjb4S3hxReaCHfU8T9nSALIIa+Jt+M+82PDJ0Ez1LBr8qc6oqa9v4M6Gc+DBaZSUWL
 r7/Q1Tzck2VV/Og97AnoSS2bpCde8xwivEqU7D0zqhEqNaqhWNY3KAql27ImDkegebdB
 lyrXH6uzEofgD69mNx4ZBSNZbYHlQT0li2svGE6ZiBzwXUKUDQxQ9gJ40V+UvIxCKtvG
 NHDA/4PI3kX9rxbXMxiwMjb/27599XBm70ZOnT+Wa++ITH0bbGZT827qkWPWMoi7tXig
 RL97VZrnUAca85KuPH0KEF/QuSDOSITZk1wSMXUhz6bxYRWEWMOjyPC2+dhI5OqVK0+K
 JxdA==
X-Gm-Message-State: AO0yUKUqsOzxi1SkhsiPQw2X+1q7FahcXGBfyQq06OdmRJatvIpRuskU
 +vm4nTUkHwHcUaN23C6cA0f6XED2vAPHPCO9
X-Google-Smtp-Source: AK7set/OhYsyQJctcsuof966ghM7LAP1Zi2nSfnT3vCTwWfbiynL4SsRSqpWLY2n5/RYo8PZHCCmJA==
X-Received: by 2002:a17:902:c94f:b0:19c:d663:a31b with SMTP id
 i15-20020a170902c94f00b0019cd663a31bmr5452944pla.24.1677639101685; 
 Tue, 28 Feb 2023 18:51:41 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:41 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 03/12] cryptodev: Introduce cryptodev alg type in QAPI
Date: Wed,  1 Mar 2023 10:51:15 +0800
Message-Id: <20230301025124.3605557-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
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


