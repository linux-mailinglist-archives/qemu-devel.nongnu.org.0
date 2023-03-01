Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D16A6B4B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:02:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBT-0004dI-4W; Wed, 01 Mar 2023 05:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBN-0004aZ-DF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:40 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBL-0006IW-Fl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:37 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso1040323pjv.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywSGliLNPGHpeZX0N0pYcXxxjI1k9+p9JqBgJ67Mzqw=;
 b=OFVEL6J66VSWFjIJOLoYGelt3KrpHq6rUJ1kEWbFlznQ486GsIPAUCWq6CQ63kWE0x
 uterDaivI4txIYifqtfdnati8W7UBKmkfr/kIDsNeTXpi7TBDNWvhuJgMMFwrPnpThJp
 Mbr7lIgc6siMFFW2T/NKgEb76CPkflWy2HDh03GO8P30r5+l1/yXZ3nkwuJglOWMSGQ8
 WoosEjiwnEEd6nLxdFglxSTtasGfD1HQCQpVdaehclQDACQQTWr8gRTDCW3H4PsbpAsB
 VugNitMpnr/7vEILQdGxUsKovpfwgk2o6tjBHliW6WCGXQiPSz0uVHWgTmXsPP27aS9P
 baNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywSGliLNPGHpeZX0N0pYcXxxjI1k9+p9JqBgJ67Mzqw=;
 b=dmFDxyPGhIF2gFL0dhKkHxaorXLdkpn0SHV7dgEM5Wezk/yOzmBSSigLYeeC+TZgRS
 0ud8ARcZaNgqdraMssNrsNTYax6aiAGNgaYY6c1uem5Gex7wk35/bwQvnnMsJjsQ5liy
 HUYVWVH5QopCC1UjBBS0uFtSU29Ri7G1rVrvhBnoIrPupkGDvTTgIeRSEVHrDVKb70ug
 RYl8+9FlZq1ovP8YzdHKJ/9m83HvIBWV1irbLEg/SIqSJP9hR0G6RtiOc1W3Ii0WCey0
 hiexfJjfZQIPts/gr/ddd/AtuVxvqmD44y8TCPYIsepR+Vn0RTKUIciRBV0XU13U/q5W
 rsqw==
X-Gm-Message-State: AO0yUKVRloaGhC5JFsun/8qbK7Gw62x4tetvJhAYKexqS8SIUEaZO9a+
 RBG3MtEjrqpdJfYzOTYmr7txKg==
X-Google-Smtp-Source: AK7set9gj59bEREsfu5zjkcsJmQFFKvOO/6MhnjV85IQYK2k0FEu4PY8W6sR47Ixl6O9iKubqt0+2A==
X-Received: by 2002:a17:90b:3505:b0:233:bc5a:92fc with SMTP id
 ls5-20020a17090b350500b00233bc5a92fcmr6864117pjb.16.1677668368176; 
 Wed, 01 Mar 2023 02:59:28 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:27 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 08/12] cryptodev: Use CryptoDevBackendOpInfo for operation
Date: Wed,  1 Mar 2023 18:58:43 +0800
Message-Id: <20230301105847.253084-9-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1035.google.com
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

Move queue_index, CryptoDevCompletionFunc and opaque into struct
CryptoDevBackendOpInfo, then cryptodev_backend_crypto_operation()
needs an argument CryptoDevBackendOpInfo *op_info only. And remove
VirtIOCryptoReq from cryptodev. It's also possible to hide
VirtIOCryptoReq into virtio-crypto.c in the next step. (In theory,
VirtIOCryptoReq is a private structure used by virtio-crypto only)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c |  9 +++------
 backends/cryptodev-lkcf.c    |  9 +++------
 backends/cryptodev.c         | 18 +++++-------------
 hw/virtio/virtio-crypto.c    |  7 ++++---
 include/sysemu/cryptodev.h   | 26 ++++++++++----------------
 5 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index c45b5906c5..39d0455280 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -539,10 +539,7 @@ static int cryptodev_builtin_asym_operation(
 
 static int cryptodev_builtin_operation(
                  CryptoDevBackend *backend,
-                 CryptoDevBackendOpInfo *op_info,
-                 uint32_t queue_index,
-                 CryptoDevCompletionFunc cb,
-                 void *opaque)
+                 CryptoDevBackendOpInfo *op_info)
 {
     CryptoDevBackendBuiltin *builtin =
                       CRYPTODEV_BACKEND_BUILTIN(backend);
@@ -574,8 +571,8 @@ static int cryptodev_builtin_operation(
     if (local_error) {
         error_report_err(local_error);
     }
-    if (cb) {
-        cb(opaque, status);
+    if (op_info->cb) {
+        op_info->cb(op_info->opaque, status);
     }
     return 0;
 }
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index edec99f104..45aba1ff67 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -469,10 +469,7 @@ static void *cryptodev_lkcf_worker(void *arg)
 
 static int cryptodev_lkcf_operation(
     CryptoDevBackend *backend,
-    CryptoDevBackendOpInfo *op_info,
-    uint32_t queue_index,
-    CryptoDevCompletionFunc cb,
-    void *opaque)
+    CryptoDevBackendOpInfo *op_info)
 {
     CryptoDevBackendLKCF *lkcf =
         CRYPTODEV_BACKEND_LKCF(backend);
@@ -495,8 +492,8 @@ static int cryptodev_lkcf_operation(
 
     task = g_new0(CryptoDevLKCFTask, 1);
     task->op_info = op_info;
-    task->cb = cb;
-    task->opaque = opaque;
+    task->cb = op_info->cb;
+    task->opaque = op_info->opaque;
     task->sess = sess;
     task->lkcf = lkcf;
     task->status = -VIRTIO_CRYPTO_ERR;
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 3a45d19823..ba7b0bc770 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -143,29 +143,22 @@ int cryptodev_backend_close_session(
 
 static int cryptodev_backend_operation(
                  CryptoDevBackend *backend,
-                 CryptoDevBackendOpInfo *op_info,
-                 uint32_t queue_index,
-                 CryptoDevCompletionFunc cb,
-                 void *opaque)
+                 CryptoDevBackendOpInfo *op_info)
 {
     CryptoDevBackendClass *bc =
                       CRYPTODEV_BACKEND_GET_CLASS(backend);
 
     if (bc->do_op) {
-        return bc->do_op(backend, op_info, queue_index, cb, opaque);
+        return bc->do_op(backend, op_info);
     }
     return -VIRTIO_CRYPTO_NOTSUPP;
 }
 
 int cryptodev_backend_crypto_operation(
                  CryptoDevBackend *backend,
-                 void *opaque1,
-                 uint32_t queue_index,
-                 CryptoDevCompletionFunc cb, void *opaque2)
+                 CryptoDevBackendOpInfo *op_info)
 {
-    VirtIOCryptoReq *req = opaque1;
-    CryptoDevBackendOpInfo *op_info = &req->op_info;
-    QCryptodevBackendAlgType algtype = req->flags;
+    QCryptodevBackendAlgType algtype = op_info->algtype;
 
     if ((algtype != QCRYPTODEV_BACKEND_ALG_SYM)
         && (algtype != QCRYPTODEV_BACKEND_ALG_ASYM)) {
@@ -173,8 +166,7 @@ int cryptodev_backend_crypto_operation(
         return -VIRTIO_CRYPTO_NOTSUPP;
     }
 
-    return cryptodev_backend_operation(backend, op_info, queue_index,
-                                       cb, opaque2);
+    return cryptodev_backend_operation(backend, op_info);
 }
 
 static void
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index e4f0de4d1c..802e1b9659 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -871,6 +871,9 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     opcode = ldl_le_p(&req.header.opcode);
     op_info->session_id = ldq_le_p(&req.header.session_id);
     op_info->op_code = opcode;
+    op_info->queue_index = queue_index;
+    op_info->cb = virtio_crypto_req_complete;
+    op_info->opaque = request;
 
     switch (opcode) {
     case VIRTIO_CRYPTO_CIPHER_ENCRYPT:
@@ -898,9 +901,7 @@ check_result:
             virtio_crypto_req_complete(request, -VIRTIO_CRYPTO_NOTSUPP);
         } else {
             ret = cryptodev_backend_crypto_operation(vcrypto->cryptodev,
-                                    request, queue_index,
-                                    virtio_crypto_req_complete,
-                                    request);
+                                    op_info);
             if (ret < 0) {
                 virtio_crypto_req_complete(request, ret);
             }
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 16f01dd48a..048a627035 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -174,9 +174,14 @@ typedef struct CryptoDevBackendAsymOpInfo {
     uint8_t *dst;
 } CryptoDevBackendAsymOpInfo;
 
+typedef void (*CryptoDevCompletionFunc) (void *opaque, int ret);
+
 typedef struct CryptoDevBackendOpInfo {
     QCryptodevBackendAlgType algtype;
     uint32_t op_code;
+    uint32_t queue_index;
+    CryptoDevCompletionFunc cb;
+    void *opaque; /* argument for cb */
     uint64_t session_id;
     union {
         CryptoDevBackendSymOpInfo *sym_op_info;
@@ -184,7 +189,6 @@ typedef struct CryptoDevBackendOpInfo {
     } u;
 } CryptoDevBackendOpInfo;
 
-typedef void (*CryptoDevCompletionFunc) (void *opaque, int ret);
 struct CryptoDevBackendClass {
     ObjectClass parent_class;
 
@@ -204,10 +208,7 @@ struct CryptoDevBackendClass {
                          void *opaque);
 
     int (*do_op)(CryptoDevBackend *backend,
-                 CryptoDevBackendOpInfo *op_info,
-                 uint32_t queue_index,
-                 CryptoDevCompletionFunc cb,
-                 void *opaque);
+                 CryptoDevBackendOpInfo *op_info);
 };
 
 struct CryptoDevBackendClient {
@@ -335,24 +336,17 @@ int cryptodev_backend_close_session(
 /**
  * cryptodev_backend_crypto_operation:
  * @backend: the cryptodev backend object
- * @opaque1: pointer to a VirtIOCryptoReq object
- * @queue_index: queue index of cryptodev backend client
- * @errp: pointer to a NULL-initialized error object
- * @cb: callbacks when operation is completed
- * @opaque2: parameter passed to cb
+ * @op_info: pointer to a CryptoDevBackendOpInfo object
  *
- * Do crypto operation, such as encryption and
- * decryption
+ * Do crypto operation, such as encryption, decryption, signature and
+ * verification
  *
  * Returns: 0 for success and cb will be called when creation is completed,
  * negative value for error, and cb will not be called.
  */
 int cryptodev_backend_crypto_operation(
                  CryptoDevBackend *backend,
-                 void *opaque1,
-                 uint32_t queue_index,
-                 CryptoDevCompletionFunc cb,
-                 void *opaque2);
+                 CryptoDevBackendOpInfo *op_info);
 
 /**
  * cryptodev_backend_set_used:
-- 
2.34.1


