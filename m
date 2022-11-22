Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E2633E66
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:05:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtO-0008T9-GN; Tue, 22 Nov 2022 09:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtC-0008Ra-Hm
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:42 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtA-00062P-Lp
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:42 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 q96-20020a17090a1b6900b00218b8f9035cso5237227pjq.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5b3RVuXlvvZql99mll6PolNwr4wkN22sgLcd1hY141Y=;
 b=KG+ksbaSOxujlk8Dpe1wlVFOhjhvYhYQqOvHtllIIS5oZzTIwY7+FEje32F/560f8t
 6msKSd0jzKLZw7CXsybFEFhCY0it+BnXCo2JU500oU2B4/G8CzP8gTDWiacGMafvwE05
 VdD1G10NhC+dC8xxWLCzUxTT0+H30QroUCu3GoI6VET9ztT3Y6XFFAWQGf8TNoR162FJ
 O7KNdhkGOe5Zdgrf3q1EIC+3EPPjPpd2GTxiMBudxqb+FZ7zaUMX7rOaAfkxRLTzoJsZ
 4IGDDX4hUp2SV834fqYE9Vd0skIbwRO7p85euGjj6MXy0f1qVndZJsVqHNtSbZUn22v6
 y3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5b3RVuXlvvZql99mll6PolNwr4wkN22sgLcd1hY141Y=;
 b=c8vRYZ6eRz2TLbAJufSCuokd7vRwqZkbZ4pe3YfCIVpo6XDfeTSr/eV3lKUB03bvOt
 5WjiMurLkmFj4qvEqURJk6GjtE7rxuWapYryoskGAz0/7QNE7dkkE5tpZLkdB2UgP7K4
 5VDxUeTAP6rF6CNfn4ZZ/NurHbSL5FNuo5g9vTPsIWVJe/shkW0mQl53sZ8r2lr5DwR4
 xokNVL7Y0stPu55O0+fgb6XIj4RnTM+MjgcHezqdIaenaWKOMZ6muslleeySXt03KHMN
 m9rtmpugP2d/QCzwxUWXFkXmS6J/6BafLsz3TQiQZqfPeOMSWWVQHU0ORW3ObZKGfzwd
 njiw==
X-Gm-Message-State: ANoB5pm6n4AXBVvp1mWPvTPQogr24ujeBbHpLwCC7ZVZ6Zqfxu7/95OY
 /KBF7EknL3YS9S4NBqQ0ETT0Bg==
X-Google-Smtp-Source: AA0mqf54se8k2C0f+ZbekaT1nKFZ2Uf2gM5veD+QU7xKYm9mr+3GFUenNao7SUdxdcvH/8ncb9DUuw==
X-Received: by 2002:a17:902:b40b:b0:188:75bb:36d4 with SMTP id
 x11-20020a170902b40b00b0018875bb36d4mr4796836plr.55.1669125879194; 
 Tue, 22 Nov 2022 06:04:39 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:38 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 03/11] cryptodev: Introduce cryptodev alg type in QAPI
Date: Tue, 22 Nov 2022 22:07:48 +0800
Message-Id: <20221122140756.686982-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102c.google.com
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


