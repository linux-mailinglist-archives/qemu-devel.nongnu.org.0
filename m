Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2952C6AFBED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKn-0000KI-AF; Tue, 07 Mar 2023 20:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKk-0000A8-O9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKi-0001Uh-VK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DUUrDnDnLyU3QbG090wNnF7ycpTepVpTSdNdHaWNHo=;
 b=PldGVjPxUeXW1xkEJzY6B4SMFAzePs3mbUCsJCMyXyWxhuRNv8lREXomDhcZgj8mcU9eu1
 90SKhToATuXEhy3jeSEToBk8vGc+ygoSb4CQ1fr+X9oJCH88YcUsYXOFdc2SAENzGjkXGu
 014H9YpVn6sYVYU661QlcInFw9L2ldU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-OCfwVGsrPFq-j6-6LCBSqg-1; Tue, 07 Mar 2023 20:11:06 -0500
X-MC-Unique: OCfwVGsrPFq-j6-6LCBSqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so125861wmr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237865;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7DUUrDnDnLyU3QbG090wNnF7ycpTepVpTSdNdHaWNHo=;
 b=wAFDLXW6ll4dvjWg+SGLPpnClDfLipUpCmRM5V7tVdCg+OawvrdcdWYH5hqOBw/ZJw
 WG/t2WBL5sU4XADlWpKwUa2stJ+sxJ3/frXDs68/dEt0TYPPp76EZiq8tzP5BCI5HhOi
 EzJBMVQroGXYOb5TT7M1TPE1WKf7Q9LbuXX2xHDu8/hoZ7S1F+5bNWErWqbgV9IJp+jn
 SMjZWaYyhgUalsX1hCWCV4ptLiz+0DCaf07A/y2SLau7dd1HVLcIcr1rkz6VnZql2Bub
 REXFu9KGuhJ/CNVojM6T+jRhpUbpgsVc1vAiWFzjMLKrY2wN2Sp8QAmkveX27mmGN7zT
 dm+Q==
X-Gm-Message-State: AO0yUKVHM73N1R5XHTPLJaMM4qe1xdv0Az+cooVOcJDikXv9/Lq277yJ
 mHGzto+TjXM1zm8O0Hmh1ccJ1QUgxzJ2XWXrGfNdel76+Tnm9JYhLTmxVJmLwFlBgwqkFzygBqb
 w+P2156mYa9odNysI2Mb5i9Zwfuk61y8Z28E2WuUF3Sp3GvRpHscB/MnVFN5hnwdMbJMo
X-Received: by 2002:a05:600c:190b:b0:3ea:e7f6:f8f9 with SMTP id
 j11-20020a05600c190b00b003eae7f6f8f9mr14429346wmq.19.1678237865055; 
 Tue, 07 Mar 2023 17:11:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+IC+fYSrMceBWtMdujm0qpFq7klVr2fkdwtlm2cP2+LKvaxZYn8SJHaCAS/+1iUxbH3NXzbA==
X-Received: by 2002:a05:600c:190b:b0:3ea:e7f6:f8f9 with SMTP id
 j11-20020a05600c190b00b003eae7f6f8f9mr14429327wmq.19.1678237864785; 
 Tue, 07 Mar 2023 17:11:04 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b003d9aa76dc6asm17961794wmb.0.2023.03.07.17.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:03 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 04/73] cryptodev: Introduce server type in QAPI
Message-ID: <bc304a6442e9abc3a7b56bb0b268dedb70ad3448.1678237635.git.mst@redhat.com>
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

Introduce cryptodev service type in cryptodev.json, then apply this
to related codes. Now we can remove VIRTIO_CRYPTO_SERVICE_xxx
dependence from QEMU cryptodev.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-5-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/cryptodev.json             | 11 +++++++++++
 backends/cryptodev-builtin.c    |  8 ++++----
 backends/cryptodev-lkcf.c       |  2 +-
 backends/cryptodev-vhost-user.c |  6 +++---
 hw/virtio/virtio-crypto.c       | 27 +++++++++++++++++++++++++--
 5 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index ebb6852035..8732a30524 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -18,6 +18,17 @@
   'prefix': 'QCRYPTODEV_BACKEND_ALG',
   'data': ['sym', 'asym']}
 
+##
+# @QCryptodevBackendServiceType:
+#
+# The supported service types of a crypto device.
+#
+# Since: 8.0
+##
+{ 'enum': 'QCryptodevBackendServiceType',
+  'prefix': 'QCRYPTODEV_BACKEND_SERVICE',
+  'data': ['cipher', 'hash', 'mac', 'aead', 'akcipher']}
+
 ##
 # @QCryptodevBackendType:
 #
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index e70dcd5dad..c0fbb650d7 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -79,10 +79,10 @@ static void cryptodev_builtin_init(
     backend->conf.peers.ccs[0] = cc;
 
     backend->conf.crypto_services =
-                         1u << VIRTIO_CRYPTO_SERVICE_CIPHER |
-                         1u << VIRTIO_CRYPTO_SERVICE_HASH |
-                         1u << VIRTIO_CRYPTO_SERVICE_MAC |
-                         1u << VIRTIO_CRYPTO_SERVICE_AKCIPHER;
+                         1u << QCRYPTODEV_BACKEND_SERVICE_CIPHER |
+                         1u << QCRYPTODEV_BACKEND_SERVICE_HASH |
+                         1u << QCRYPTODEV_BACKEND_SERVICE_MAC |
+                         1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER;
     backend->conf.cipher_algo_l = 1u << VIRTIO_CRYPTO_CIPHER_AES_CBC;
     backend->conf.hash_algo = 1u << VIRTIO_CRYPTO_HASH_SHA1;
     backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 53a932b58d..edec99f104 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -230,7 +230,7 @@ static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
     backend->conf.peers.ccs[0] = cc;
 
     backend->conf.crypto_services =
-        1u << VIRTIO_CRYPTO_SERVICE_AKCIPHER;
+        1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER;
     backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
     lkcf->running = true;
 
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index 580bd1abb0..b1d9eb735f 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -221,9 +221,9 @@ static void cryptodev_vhost_user_init(
                      cryptodev_vhost_user_event, NULL, s, NULL, true);
 
     backend->conf.crypto_services =
-                         1u << VIRTIO_CRYPTO_SERVICE_CIPHER |
-                         1u << VIRTIO_CRYPTO_SERVICE_HASH |
-                         1u << VIRTIO_CRYPTO_SERVICE_MAC;
+                         1u << QCRYPTODEV_BACKEND_SERVICE_CIPHER |
+                         1u << QCRYPTODEV_BACKEND_SERVICE_HASH |
+                         1u << QCRYPTODEV_BACKEND_SERVICE_MAC;
     backend->conf.cipher_algo_l = 1u << VIRTIO_CRYPTO_CIPHER_AES_CBC;
     backend->conf.hash_algo = 1u << VIRTIO_CRYPTO_HASH_SHA1;
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 0d1be0ada9..e4f0de4d1c 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -997,12 +997,35 @@ static void virtio_crypto_reset(VirtIODevice *vdev)
     }
 }
 
+static uint32_t virtio_crypto_init_services(uint32_t qservices)
+{
+    uint32_t vservices = 0;
+
+    if (qservices & (1 << QCRYPTODEV_BACKEND_SERVICE_CIPHER)) {
+        vservices |= (1 << VIRTIO_CRYPTO_SERVICE_CIPHER);
+    }
+    if (qservices & (1 << QCRYPTODEV_BACKEND_SERVICE_HASH)) {
+        vservices |= (1 << VIRTIO_CRYPTO_SERVICE_HASH);
+    }
+    if (qservices & (1 << QCRYPTODEV_BACKEND_SERVICE_MAC)) {
+        vservices |= (1 << VIRTIO_CRYPTO_SERVICE_MAC);
+    }
+    if (qservices & (1 << QCRYPTODEV_BACKEND_SERVICE_AEAD)) {
+        vservices |= (1 << VIRTIO_CRYPTO_SERVICE_AEAD);
+    }
+    if (qservices & (1 << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER)) {
+        vservices |= (1 << VIRTIO_CRYPTO_SERVICE_AKCIPHER);
+    }
+
+    return vservices;
+}
+
 static void virtio_crypto_init_config(VirtIODevice *vdev)
 {
     VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
 
-    vcrypto->conf.crypto_services =
-                     vcrypto->conf.cryptodev->conf.crypto_services;
+    vcrypto->conf.crypto_services = virtio_crypto_init_services(
+                     vcrypto->conf.cryptodev->conf.crypto_services);
     vcrypto->conf.cipher_algo_l =
                      vcrypto->conf.cryptodev->conf.cipher_algo_l;
     vcrypto->conf.cipher_algo_h =
-- 
MST


