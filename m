Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F2667F47D
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcL7-0000QZ-Rg; Fri, 27 Jan 2023 22:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcL5-0000QO-3H
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:15 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcL3-0003op-A3
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:14 -0500
Received: by mail-pl1-x634.google.com with SMTP id v23so6855548plo.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jdzw9QZCIXk+mAQ/QLSP7hBtgxJtl4K9TWjsbz+lY+0=;
 b=WEd/txoIR9Xz0C9fsw/gPp/6RC3n62IrZUiociP7Bfn2smpY8auzsZ+Ep5uA55kWSd
 XTTFL/qRjLKFc++CMhI0+pALsuJ4t1TbN/WoNRHbY76r1TjlGhTA91mW4y4p+8+83Ric
 v61NXnujrlxwO78pfdd/PZUmF3otebKcijGDiTbHOD2/ow625a0ZfnDKpjhiUAh1gE/9
 bEn19CbkSMT68BIaGrLKeps7sDU+LgGPe9B9d5NBAIIWniS4Z2URl48X2/ETaaECXJop
 oZy8dQmXqLfVapzNMNuztuTIaLtMTQ1zLBvIthFFVrGu5pzIE46ORYCpHNBrN10DJAkM
 mdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jdzw9QZCIXk+mAQ/QLSP7hBtgxJtl4K9TWjsbz+lY+0=;
 b=xuhGHq3b74VB3dArBfW3cXZKkYR632S7swADhFnHLsFTk1kMHjltQZ9m7u2D2ypHrc
 WTqB2D0NWGW0VCa2T0M9zlF6AmQSv/SJLSAVK6qYpP/frNmmxMQPByfseniUAj02xvDb
 Mwk76QQ2KPbeIujqcDCdHjUAaBMdtnjVTd6+omNDDu61vQiZ4mfT+uhOJiL8PGUfPhb1
 w3MVe5rxhxFVaPd8PynJyHES6zcRahD7r9edXzFKFplgV2Qz9tfX/bWu4YF4a/Csj/nA
 bOBcDr7NpdTj+7EEj8dKrDk1clC0ZIfGBQM8kKbdPUCIQfViRKsljT359wmSJ3M6mTPh
 Xjhg==
X-Gm-Message-State: AO0yUKW2ZIJGYcIs8/EvE2X0kgkuznoDIwRq5CMESHDM0cCX7Yh/IQhX
 FeLFfD2PcidhaTEWflLYahs3uA==
X-Google-Smtp-Source: AK7set+11m6is+MkLZA85yZMyj6RWLt/haO9+jeyRmy/De1FxDXPMHR6OQdDW9eq/Renonix6Hjliw==
X-Received: by 2002:a17:903:2013:b0:196:37db:b4b7 with SMTP id
 s19-20020a170903201300b0019637dbb4b7mr6550759pla.62.1674878231883; 
 Fri, 27 Jan 2023 19:57:11 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:11 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 08/12] cryptodev: Use CryptoDevBackendOpInfo for operation
Date: Sat, 28 Jan 2023 11:56:29 +0800
Message-Id: <20230128035633.2548315-9-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
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

Move queue_index, CryptoDevCompletionFunc and opaque into struct
CryptoDevBackendOpInfo, then cryptodev_backend_crypto_operation()
needs an argument CryptoDevBackendOpInfo *op_info only. And remove
VirtIOCryptoReq from cryptodev. It's also possible to hide
VirtIOCryptoReq into virtio-crypto.c in the next step. (In theory,
VirtIOCryptoReq is a private structure used by virtio-crypto only)

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
index d51eeb5ee4..b15b1a24f5 100644
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


