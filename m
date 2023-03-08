Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDA6AFBDD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiL0-0000mI-UV; Tue, 07 Mar 2023 20:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKy-0000lp-PF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKw-0001XT-Vh
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X43XlaXTmEJblhkbQ9fpaEKb8qO1YVpXU0xjMSWwZRw=;
 b=cV+723kAOvv8uXf2VwdHdAy0p26E6msVTotWMpaJgiY2EMpCR9s5CSnXFEYcxr9Qyx3Upk
 Vs60vOVvZleRj3+143iMGwLGqnHuCsJEV2q6C5dcMwzSDqrEE0TUUzVzDVgWDOBtTBv3kd
 W7Y9OYLUb65Dh+I0+dENTiMUVBGsFc8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-_pgFmKfsM_O9uKhZ32JoWg-1; Tue, 07 Mar 2023 20:11:18 -0500
X-MC-Unique: _pgFmKfsM_O9uKhZ32JoWg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so18674615edc.20
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237877;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X43XlaXTmEJblhkbQ9fpaEKb8qO1YVpXU0xjMSWwZRw=;
 b=MxiBpn1yWqyRLn5Yf06WWw5LuJxJWZCVteR8Ecr6HMZLs6TjmgHS2mRlVdC25pR42D
 lKYAwxryuSwyzTwih4HQVyuQTs+ORRQnlm/NqvfGR+n6MjJKtXikezpN52fuxQC7aq9O
 xFonN9YNZa+/CTkFsIlFCPTNb8f2+7QtoMAEADigJK3SBh7SC07cYGKXiMDw6+VicTax
 X5fvJmSgF6qMRq0baS2GHyvxpRKh17rtUWZaQC9D8LrDd1zbPZMlaKp++T7Q2J999u0c
 JdRN+TqQNZXFBWxuDd8Q5MOaUGCAvgKRuZJK5tVNAwTUxu3sWC9uBtGJEZ6PJdldFTa2
 8/5Q==
X-Gm-Message-State: AO0yUKVMVHkMD48BgS1PyVNwD9l/uXZQhKcM04X9zvai0XyGKEgzrpxb
 LBv3EHr4tu3SP9FePWAnYbGBGWcESPj7EJENKvMpjk0gIPubRnt3Kg0ituKXQugR8PHf5e/gsxf
 LPqbgyiF+exApEIo+Oni51dEN28ujqX4AbRG08rYXpdNRiITz1mspvVa12MFmwGizyQ5t
X-Received: by 2002:a17:907:7d8e:b0:87b:dac0:b23b with SMTP id
 oz14-20020a1709077d8e00b0087bdac0b23bmr21054995ejc.55.1678237877275; 
 Tue, 07 Mar 2023 17:11:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8x66ZCstlDWe5NAZeew0yDdLBNIym474NeZZhPAUzlgAjSrJL+1/0QPR/GopwEs0w7SoJYvg==
X-Received: by 2002:a17:907:7d8e:b0:87b:dac0:b23b with SMTP id
 oz14-20020a1709077d8e00b0087bdac0b23bmr21054979ejc.55.1678237876901; 
 Tue, 07 Mar 2023 17:11:16 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 o21-20020a170906289500b008ef42f9cf48sm6731733ejd.82.2023.03.07.17.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:16 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PULL 08/73] cryptodev: Use CryptoDevBackendOpInfo for operation
Message-ID: <2cb0692768c2d29333a6ad89fd081c97562bd899.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: zhenwei pi <pizhenwei@bytedance.com>

Move queue_index, CryptoDevCompletionFunc and opaque into struct
CryptoDevBackendOpInfo, then cryptodev_backend_crypto_operation()
needs an argument CryptoDevBackendOpInfo *op_info only. And remove
VirtIOCryptoReq from cryptodev. It's also possible to hide
VirtIOCryptoReq into virtio-crypto.c in the next step. (In theory,
VirtIOCryptoReq is a private structure used by virtio-crypto only)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-9-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/sysemu/cryptodev.h   | 26 ++++++++++----------------
 backends/cryptodev-builtin.c |  9 +++------
 backends/cryptodev-lkcf.c    |  9 +++------
 backends/cryptodev.c         | 18 +++++-------------
 hw/virtio/virtio-crypto.c    |  7 ++++---
 5 files changed, 25 insertions(+), 44 deletions(-)

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
-- 
MST


