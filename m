Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A996AFBD1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:11:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiL1-0000mN-7m; Tue, 07 Mar 2023 20:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKz-0000lz-8P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKx-0001XX-JR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkJycY5uty7BvGapmoRs4tZJwgcuAre7/M98IxWSCgQ=;
 b=ErjtJrKGVJQ5A5fXJ2XugPZ5t3aEwR7ufS1TXk6UJbwg/c3PV8PgOvXzRgpLXCiVbqvgay
 zl4cWt2nENdrl9erDnmmCg1TWSD60r/BWjZH817LeMILtr6MIPgZ3AFFq0CU9mJc4Sg3E+
 nBZSsJQri6zcZtS4RXbGDlRvctYvjxU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-JUHllARGNxGrED0gERCMzg-1; Tue, 07 Mar 2023 20:11:22 -0500
X-MC-Unique: JUHllARGNxGrED0gERCMzg-1
Received: by mail-ed1-f72.google.com with SMTP id
 d35-20020a056402402300b004e37aed9832so11978188eda.18
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237880;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dkJycY5uty7BvGapmoRs4tZJwgcuAre7/M98IxWSCgQ=;
 b=qoSdC7U73mkqySogSdpcElTbSWydNI0BAFPX/4Pp2ljLJfy8VCbcPiXLd0moDclwO9
 7qh9pRydCdLtxDB0/yli2fsPi9tzAHfNh8oFPZoMv13khXpqW5p1prjyhsrCwW4aT0oh
 DMomWwww2wleOv5TSGQDxSTMxIVuHJJkT2HRIYUh8ZOdCOf34lHC8he76Ad+rejRI0DN
 3+i49I09hqs0mxHy9PAbrg3SetvuyIXMU3zu54+Bo8zCKptcr9pZu2pxo3oiEIZT2D1z
 lED64989364YulwiLls9O0O3Tjwhc3UEAex2SCoAOQKcvX0ANnBaUkx5XV8NK56EbS45
 S0/w==
X-Gm-Message-State: AO0yUKUQV7S9U1pmLD9OBwjA70Jr13g+vkVCMl1MFTabf9SlS/dP2iai
 YQouGjxppYPDR2Yu6KcmtCOqE78yfXNICv5c6gd6mmddtjGR0mzMPlQepr3ZCC8mpe8vrcnbji9
 wZ5b75uC/kzpl4Jo1+8KxrOj3/1dHG2DPIN5jtEASnaf5Z00mXfgTsjrWSl20cwzZtTjS
X-Received: by 2002:a17:907:9703:b0:8af:514f:1078 with SMTP id
 jg3-20020a170907970300b008af514f1078mr19955525ejc.31.1678237880467; 
 Tue, 07 Mar 2023 17:11:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/FXPN+JSrTjFgRO7OE3DHf+jGpcd4U2ls8QXEggo93tiniHTQ1V++mLvZK1Vj3mbVEgc24pg==
X-Received: by 2002:a17:907:9703:b0:8af:514f:1078 with SMTP id
 jg3-20020a170907970300b008af514f1078mr19955503ejc.31.1678237880155; 
 Tue, 07 Mar 2023 17:11:20 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 o18-20020a170906769200b008dedf1359a0sm6782681ejm.104.2023.03.07.17.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:19 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PULL 09/73] cryptodev: Account statistics
Message-ID: <e7a775fd9fc08550c4525bc331b1cda342b459dd.1678237635.git.mst@redhat.com>
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

Account OPS/BPS for crypto device, this will be used for 'query-stats'
QEMU monitor command and QoS in the next step.

Note that a crypto device may support symmetric mode, asymmetric mode,
both symmetric and asymmetric mode. So we use two structure to
describe the statistics of a crypto device.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-10-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/sysemu/cryptodev.h | 49 +++++++++++++++++++++++++++
 backends/cryptodev.c       | 68 +++++++++++++++++++++++++++++++++++---
 2 files changed, 112 insertions(+), 5 deletions(-)

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
-- 
MST


