Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65A67FC7A
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxtX-0003lJ-6w; Sat, 28 Jan 2023 21:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtV-0003ku-3O
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:13 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtS-00086Y-4J
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:11 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 b24-20020a17090a551800b0022beefa7a23so12296995pji.5
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihnaClmcpFL3v9tNj7fgQemINsh8688QVm+1j1fBK14=;
 b=4a2I2wBtM9m5m2n/uPV0kI1JVfAkCdtiYJwSjYfLn5PtB8oSqG1FZUnVa20TUXEwdQ
 Ww6VzpN8gJtgGt5dtr0D20oimoRZewo9k5cGjbSBMqF4HvNK29soh1vwCKPyM81kcrPU
 dZBxTMQOARLtws52gC5XePSLZSSIGmOtf2j0BRXw9ZU21X9Jq2WFlFqSSR9BUvTgDXzM
 hBmzIhpv29rAMONXZWvePncIUO2cPGQ7sWkA+SEH+YwtT8eMzRsgj9xCHLh5Ok9F+VKm
 gq+e/kH3TvUI2G3BntpdH772trywTJmFEV7LOD9wgL6gsExpcSg3zDQPqMkFNZ6Iswjs
 W2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihnaClmcpFL3v9tNj7fgQemINsh8688QVm+1j1fBK14=;
 b=hx+D2FXcYQk/f3NfCK1fruqU9BvKuF7V99SiuVvpP92fAeatazEpRGE9t8m1rbkM0f
 FIJ5GxL9Rkx8SZjBVDz3nwjmgR6bLKSpFsp14BGkpYflZzCWe8ZD07UPSrJzyh0uYCbI
 ThCrqlSqJdx0YmFd++dWaQNm32ECBWu7iey+9VCuxsG5KlbCM98VRrvtJq99XQlEbkX2
 WrCjeK9xspDhayF38vVKLZSr21RzbMLKXq/MdTTKDJLl0uxf0wa3qrvSVBWnutllM8al
 OuIaF+LVcqjuZ0MQNz/B3HGYI7xQlQCwVzHGX2vJTO0BET7JRb2QHBZ4Tct9kDZLnLuN
 fQtQ==
X-Gm-Message-State: AO0yUKXBbFyAiPpZFe4fgywgQEni2Kj5f9O6UmT6CIuYSQ3fmBf1pzcQ
 fIhrA5vzrUB3QHjKco7+wfpvxQ==
X-Google-Smtp-Source: AK7set/ogTt/KHKo+zhbsjJiVVDJCw9u4aqBNPNC+mkLv4TH1cPdzjd3OD0bcuz9+7Gf2f9Q00C++g==
X-Received: by 2002:a17:902:dacf:b0:196:15bc:e200 with SMTP id
 q15-20020a170902dacf00b0019615bce200mr21398209plx.4.1674961088591; 
 Sat, 28 Jan 2023 18:58:08 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:58:08 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 04/12] cryptodev: Introduce server type in QAPI
Date: Sun, 29 Jan 2023 10:57:39 +0800
Message-Id: <20230129025747.682282-5-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1036.google.com
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

Introduce cryptodev service type in cryptodev.json, then apply this
to related codes. Now we can remove VIRTIO_CRYPTO_SERVICE_xxx
dependence from QEMU cryptodev.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c    |  8 ++++----
 backends/cryptodev-lkcf.c       |  2 +-
 backends/cryptodev-vhost-user.c |  6 +++---
 hw/virtio/virtio-crypto.c       | 27 +++++++++++++++++++++++++--
 qapi/cryptodev.json             | 11 +++++++++++
 5 files changed, 44 insertions(+), 10 deletions(-)

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
-- 
2.34.1


