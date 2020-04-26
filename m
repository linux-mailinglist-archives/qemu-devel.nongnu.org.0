Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E741B90E2
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Apr 2020 16:35:11 +0200 (CEST)
Received: from localhost ([::1]:60554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSiNB-0007RF-PI
	for lists+qemu-devel@lfdr.de; Sun, 26 Apr 2020 10:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <teachk@foxmail.com>) id 1jSiM5-0006aR-1i
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 10:34:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <teachk@foxmail.com>) id 1jSiM2-00053X-HJ
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 10:34:00 -0400
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205]:52526
 helo=qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <teachk@foxmail.com>)
 id 1jSiLz-0004Wf-O0
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 10:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1587911627; bh=jvIG8j//AbEeqMWpFi5xJu/UZ8C/QeSTeZTr2Onp2nA=;
 h=From:To:Cc:Subject:Date;
 b=LQ7c7xfMH5jl8IkcL0k62TPs1Q7wqtRVHYcJDIIFZeMe4mORV4+OVH/mti79jlhM7
 lOrvPYze4HjvwkK7C7lCSFI5jCGCGDKZAzbK6NDxVFJhxPJszI5ZwVJiNJH6ln9MQt
 iSuh0yLyfh4PvNl8keoB44kI7gPU/txLRYzMbqlg=
Received: from localhost.localdomain ([123.185.180.85])
 by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
 id 820A4664; Sun, 26 Apr 2020 22:32:32 +0800
X-QQ-mid: xmsmtpt1587911552tqus51fs6
X-QQ-XMAILINFO: MRtgQJ5r0UjaRway8WzWfKMoY4HLJYIto90evLlR7jg5NV+aiWj/hx/UndnMox
 pd9dZVfneArug+EDF5iRggh1XMSlSIaoRJ7nwFpmTE2vDQlJtO3MSJgK26zfFhbT248DbXRgVgQS
 lyEBqETdyfparn6nK6knRsdN40qeEVi/JT2V7PaQjvpPvktZVqffEDmymmbX/GyqnsxMl4+K2JZJ
 z2toF3vh1gUqLxCtS+Y4iE+mpVT6cb8honm28U/+Oakvbas8sdjcQvtjT5rLuG/Ctxvs8QLmLxmK
 d1chPN6TW+p32GEQwglRjgBotsTr4SLWYBE+oFb0HxO+UWzrDdmIB7Fn+ievnAMn0EEoVv2zg4CU
 HYq0G4+pLSyNIcXtdnQJO07DhY9VMGNs2JCZ9Wz2pp4NGAJrqt+8+MB+RtZ+/wTuHaxmo2eC47oi
 gbc6vkRvG2u91eZAhLOfIiFNGdR5HwMMtpvBSOoUHhBthpoUHLYA5db31gya6hnI4A2Wc1c2C5dc
 Lhxl3RTsIvV46FsP5Bggi1nSddjBk9XpnZbTDWZx3T0YgZtTt41LH+4Omy/hev9rFiydnDz1R+0J
 trPIoOybgmJMzkwUxXRCMpDtqHh5tPo1zGlabFajPEYLasRoGNEwGZGIAfxwREoGtWXDPF1cuP5j
 +/vw==
From: teachk <teachk@foxmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Convert DPRINTF() to trace event
Date: Sun, 26 Apr 2020 22:32:17 +0800
Message-Id: <20200426143217.1962-1-teachk@foxmail.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=203.205.221.205; envelope-from=teachk@foxmail.com;
 helo=qq.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 10:33:48
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Received-From: 203.205.221.205
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arei.gonglei@huawei.com, Halloween <halloweenwx@163.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Halloween <halloweenwx@163.com>=0D

Signed-off-by: Halloween <halloweenwx@163.com>=0D
---=0D
 hw/virtio/trace-events            | 12 ++++++++++++=0D
 hw/virtio/virtio-crypto.c         | 29 ++++++++++++++++-------------=0D
 include/hw/virtio/virtio-crypto.h | 11 -----------=0D
 3 files changed, 28 insertions(+), 24 deletions(-)=0D
=0D
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events=0D
index e83500bee9..f7c20f211a 100644=0D
--- a/hw/virtio/trace-events=0D
+++ b/hw/virtio/trace-events=0D
@@ -73,3 +73,15 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domai=
n=3D%d"=0D
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"=0D
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_=
t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"=0D
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoin=
t, uint64_t addr) "FAULT reason=3D%d flags=3D%d endpoint=3D%d address =3D0x=
%"PRIx64=0D
+=0D
+# virtio-crypto.c=0D
+virtio_crypto_cipher_session_helper_cipher_alg_and_direction(uint32_t ciph=
er_alg, uint8_t direction) "cipher_alg=3D%" PRIu32 ", info->direction=3D%" =
PRIu32=0D
+virtio_crypto_cipher_session_helper_keylen(uint32_t keylen) "keylen=3D%" P=
RIu32=0D
+virtio_crypto_create_sym_session_auth_keylen(uint32_t auth_keylen) "auth_k=
eylen=3D%" PRIu32=0D
+virtio_crypto_create_sym_session_session_id(int64_t session_id) "create se=
ssion_id=3D%" PRIu64 " successfully"=0D
+virtio_crypto_sym_op_helper_src_len(uint32_t src_len) "src_len=3D%" PRIu32=
=0D
+virtio_crypto_sym_op_helper_dst_len(uint32_t dst_len) "dst_len=3D%" PRIu32=
=0D
+virtio_crypto_sym_op_helper_hash_result_len(uint32_t hash_result_len) "has=
h_result_len=3D%" PRIu32=0D
+virtio_crypto_handle_close_session(uint64_t session_id) "close session id =
%" PRIu64=0D
+virtio_crypto_sym_op_helper_iv_len(uint32_t iv_len) "iv_len %" PRIu32=0D
+virtio_crypto_sym_op_helper_aad_len(uint32_t aad_len) "aad_len %" PRIu32=0D
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c=0D
index 4c65114de5..f816db2fca 100644=0D
--- a/hw/virtio/virtio-crypto.c=0D
+++ b/hw/virtio/virtio-crypto.c=0D
@@ -25,6 +25,8 @@=0D
 #include "standard-headers/linux/virtio_ids.h"=0D
 #include "sysemu/cryptodev-vhost.h"=0D
 =0D
+#include "trace.h"=0D
+=0D
 #define VIRTIO_CRYPTO_VM_VERSION 1=0D
 =0D
 /*=0D
@@ -49,8 +51,8 @@ virtio_crypto_cipher_session_helper(VirtIODevice *vdev,=0D
     info->cipher_alg =3D ldl_le_p(&cipher_para->algo);=0D
     info->key_len =3D ldl_le_p(&cipher_para->keylen);=0D
     info->direction =3D ldl_le_p(&cipher_para->op);=0D
-    DPRINTF("cipher_alg=3D%" PRIu32 ", info->direction=3D%" PRIu32 "\n",=0D
-             info->cipher_alg, info->direction);=0D
+    trace_virtio_crypto_cipher_session_helper_cipher_alg_and_direction(\=0D
+    info->cipher_alg, info->direction);=0D
 =0D
     if (info->key_len > vcrypto->conf.max_cipher_key_len) {=0D
         error_report("virtio-crypto length of cipher key is too big: %u",=
=0D
@@ -60,7 +62,7 @@ virtio_crypto_cipher_session_helper(VirtIODevice *vdev,=0D
     /* Get cipher key */=0D
     if (info->key_len > 0) {=0D
         size_t s;=0D
-        DPRINTF("keylen=3D%" PRIu32 "\n", info->key_len);=0D
+        trace_virtio_crypto_cipher_session_helper_keylen(info->key_len);=0D
 =0D
         info->cipher_key =3D g_malloc(info->key_len);=0D
         s =3D iov_to_buf(*iov, num, 0, info->cipher_key, info->key_len);=0D
@@ -130,7 +132,9 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,=
=0D
             }=0D
             /* get auth key */=0D
             if (info.auth_key_len > 0) {=0D
-                DPRINTF("auth_keylen=3D%" PRIu32 "\n", info.auth_key_len);=
=0D
+                trace_virtio_crypto_create_sym_session_auth_keylen(\=0D
+                info.auth_key_len);=0D
+=0D
                 info.auth_key =3D g_malloc(info.auth_key_len);=0D
                 s =3D iov_to_buf(iov, out_num, 0, info.auth_key,=0D
                                info.auth_key_len);=0D
@@ -165,9 +169,7 @@ virtio_crypto_create_sym_session(VirtIOCrypto *vcrypto,=
=0D
                                      vcrypto->cryptodev,=0D
                                      &info, queue_index, &local_err);=0D
     if (session_id >=3D 0) {=0D
-        DPRINTF("create session_id=3D%" PRIu64 " successfully\n",=0D
-                session_id);=0D
-=0D
+        trace_virtio_crypto_create_sym_session_session_id(session_id);=0D
         ret =3D session_id;=0D
     } else {=0D
         if (local_err) {=0D
@@ -193,7 +195,7 @@ virtio_crypto_handle_close_session(VirtIOCrypto *vcrypt=
o,=0D
     Error *local_err =3D NULL;=0D
 =0D
     session_id =3D ldq_le_p(&close_sess_req->session_id);=0D
-    DPRINTF("close session, id=3D%" PRIu64 "\n", session_id);=0D
+    trace_virtio_crypto_handle_close_session(session_id);=0D
 =0D
     ret =3D cryptodev_backend_sym_close_session(=0D
               vcrypto->cryptodev, session_id, queue_id, &local_err);=0D
@@ -474,7 +476,8 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,=0D
     op_info->len_to_cipher =3D len_to_cipher;=0D
     /* Handle the initilization vector */=0D
     if (op_info->iv_len > 0) {=0D
-        DPRINTF("iv_len=3D%" PRIu32 "\n", op_info->iv_len);=0D
+        trace_virtio_crypto_sym_op_helper_iv_len(op_info->iv_len);=0D
+=0D
         op_info->iv =3D op_info->data + curr_size;=0D
 =0D
         s =3D iov_to_buf(iov, out_num, 0, op_info->iv, op_info->iv_len);=0D
@@ -488,7 +491,7 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,=0D
 =0D
     /* Handle additional authentication data if exists */=0D
     if (op_info->aad_len > 0) {=0D
-        DPRINTF("aad_len=3D%" PRIu32 "\n", op_info->aad_len);=0D
+        trace_virtio_crypto_sym_op_helper_aad_len(op_info->aad_len);=0D
         op_info->aad_data =3D op_info->data + curr_size;=0D
 =0D
         s =3D iov_to_buf(iov, out_num, 0, op_info->aad_data, op_info->aad_=
len);=0D
@@ -503,7 +506,7 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,=0D
 =0D
     /* Handle the source data */=0D
     if (op_info->src_len > 0) {=0D
-        DPRINTF("src_len=3D%" PRIu32 "\n", op_info->src_len);=0D
+        trace_virtio_crypto_sym_op_helper_src_len(op_info->src_len);=0D
         op_info->src =3D op_info->data + curr_size;=0D
 =0D
         s =3D iov_to_buf(iov, out_num, 0, op_info->src, op_info->src_len);=
=0D
@@ -520,11 +523,11 @@ virtio_crypto_sym_op_helper(VirtIODevice *vdev,=0D
     op_info->dst =3D op_info->data + curr_size;=0D
     curr_size +=3D op_info->dst_len;=0D
 =0D
-    DPRINTF("dst_len=3D%" PRIu32 "\n", op_info->dst_len);=0D
+    trace_virtio_crypto_sym_op_helper_dst_len(op_info->dst_len);=0D
 =0D
     /* Handle the hash digest result */=0D
     if (hash_result_len > 0) {=0D
-        DPRINTF("hash_result_len=3D%" PRIu32 "\n", hash_result_len);=0D
+        trace_virtio_crypto_sym_op_helper_hash_result_len(hash_result_len)=
;=0D
         op_info->digest_result =3D op_info->data + curr_size;=0D
     }=0D
 =0D
diff --git a/include/hw/virtio/virtio-crypto.h b/include/hw/virtio/virtio-c=
rypto.h=0D
index ffe2391ece..f59f91f11e 100644=0D
--- a/include/hw/virtio/virtio-crypto.h=0D
+++ b/include/hw/virtio/virtio-crypto.h=0D
@@ -19,17 +19,6 @@=0D
 #include "sysemu/iothread.h"=0D
 #include "sysemu/cryptodev.h"=0D
 =0D
-=0D
-#define DEBUG_VIRTIO_CRYPTO 0=0D
-=0D
-#define DPRINTF(fmt, ...) \=0D
-do { \=0D
-    if (DEBUG_VIRTIO_CRYPTO) { \=0D
-        fprintf(stderr, "virtio_crypto: " fmt, ##__VA_ARGS__); \=0D
-    } \=0D
-} while (0)=0D
-=0D
-=0D
 #define TYPE_VIRTIO_CRYPTO "virtio-crypto-device"=0D
 #define VIRTIO_CRYPTO(obj) \=0D
         OBJECT_CHECK(VirtIOCrypto, (obj), TYPE_VIRTIO_CRYPTO)=0D
--=0D
2.17.1=0D
=0D

