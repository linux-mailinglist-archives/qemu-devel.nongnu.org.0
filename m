Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6626AFC21
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKi-0008M7-Ge; Tue, 07 Mar 2023 20:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKg-0008CA-Ez
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKe-0001UN-7f
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+n2903OEBoDs4//94l8pk5jICPgWucbjyFt83qTfpN8=;
 b=c9NrXHo4VS0C1AL3vfObe6T3i5SPyAzHR3E77Ipo2fzkDnVo9s9DFK7Su5JEw3tztHWVid
 rVF3J67qQlWCvn3Pyjs7OOIQEoDR0uUTBukcF5npiLY9m17jL3crgKzQLX9pSCIuN604Y3
 TmqBd+U5DR1tuLgk+KLlR9eO4HK0wdQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-MeR0kYfbMFm9_i3s-N5WBw-1; Tue, 07 Mar 2023 20:11:02 -0500
X-MC-Unique: MeR0kYfbMFm9_i3s-N5WBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so194407wms.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237861;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+n2903OEBoDs4//94l8pk5jICPgWucbjyFt83qTfpN8=;
 b=yUkZOR6XUs170YyuBKJ7GH1H4bXl0kcwmpLytH6mUrXfgw33QILpuBQeo6WPAkAoI+
 4ngkpzG8eJ/AwA0GBtN3lMJA4PXiJyCoyJ7YRBApVVJsfSffDlgyGxrMMjWWUUDaS+Uu
 4EWXNNufT4Sn+BXnUDhaXHZU4qFL5SOv+XGispEV40uWERfeoGccX/3PPvdsfL2OmHGI
 HB1m1RGhqaerbDv5rWDOvDa0jGHxC9gqbaAJcgSKHBVUvlBeQTzu+h2TSPAczEhSN35Y
 I+dPBI+XAvhzNwDRZcA4yZVnV+liCyhC3rs64N8pNv+pWoQ1daI+hICc47DtzxqnoRoE
 3rmQ==
X-Gm-Message-State: AO0yUKW3tIdkpPDsje/EJ9F1SXhwM93gWpsg/O/IciruXi15daEy9sqB
 vhlpu+BOHJlvsWtGlZss+Ks77X4yYmbm90Z6DqhVqrhz276TjUwj7wblZj6u9xf3haShcAUdF/e
 JReA1HBHzeb5oqCAUFRKyJCayvKRYjE+dCE82DP1zcr3wHbS+E7b21tCgZMwjHMmMh5T5
X-Received: by 2002:adf:fc52:0:b0:2c5:4a22:937c with SMTP id
 e18-20020adffc52000000b002c54a22937cmr13439911wrs.27.1678237861245; 
 Tue, 07 Mar 2023 17:11:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+wYpLtyvkYUn4LhzTb3nOrhA5BYHiQzGTG50WIvtMASomztirHSCkV6YXy+w/Zm/IOC0NZFQ==
X-Received: by 2002:adf:fc52:0:b0:2c5:4a22:937c with SMTP id
 e18-20020adffc52000000b002c54a22937cmr13439894wrs.27.1678237860890; 
 Tue, 07 Mar 2023 17:11:00 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm14011325wrr.58.2023.03.07.17.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:00 -0800 (PST)
Date: Tue, 7 Mar 2023 20:10:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 03/73] cryptodev: Introduce cryptodev alg type in QAPI
Message-ID: <999c789f0018151906484c25faff495b89b549dc.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Message-Id: <20230301105847.253084-4-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/cryptodev.json          | 14 ++++++++++++++
 include/sysemu/cryptodev.h   |  8 +-------
 backends/cryptodev-builtin.c |  6 +++---
 backends/cryptodev-lkcf.c    |  4 ++--
 backends/cryptodev.c         |  6 +++---
 hw/virtio/virtio-crypto.c    | 14 +++++++-------
 6 files changed, 30 insertions(+), 22 deletions(-)

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
-- 
MST


