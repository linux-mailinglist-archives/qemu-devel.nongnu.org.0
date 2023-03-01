Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4976A6B3D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBL-0004ZQ-I9; Wed, 01 Mar 2023 05:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBC-0004YS-En
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:27 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKB9-0006Fd-2W
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:25 -0500
Received: by mail-pl1-x62a.google.com with SMTP id n6so12169172plf.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihnaClmcpFL3v9tNj7fgQemINsh8688QVm+1j1fBK14=;
 b=k4FEEygU0PAOs/SFAY8Vf3dW9jHzciWwfi4d3AhGbb7U2dZE3UWsrK+l+1FO4J1tX4
 v64ZMo8TH1KEhcxnc6hKjo1Ornl8Gz08MV9U3eD65CAdSJBoAbBwwVqGbDAYDqbjtsxd
 A/hzi/B8zpeeLu8gVU3SJtJ2qrW7sFDiRTnvnuBAClQLOSA/kZXs1VBWDaVUtyNY5PId
 g7frjRrfIIO4i0c52X47AYfYB7XRl6WE0XZ2E3bJfv63MQuayUr3ji0UCWbnYxXmFP4h
 n1G/OI7XoASl2SiatFcR538cIv2GSXAT0RNDSqBrWI6NbInihxZDp9Z3nYqLLeBvvVXt
 O8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihnaClmcpFL3v9tNj7fgQemINsh8688QVm+1j1fBK14=;
 b=FJktKVxoBsigKDqU9LC2hmcZ6IUqgn73h6EoEY4gzj/TPCj9hKIhI4wfK9kdinZO+N
 qhA11+9pWSueEf2ixvJMtfUUyDe/OPPrnhIoyj/tAQ/jJvA8SRkhSnMa7BazsskvzOPF
 0ABAaJHrW3kxYwl138lAjtbUL7kW+8xeYb19NEHowR0eWL5Y3fz+rgqo7d3MuRgsXnkU
 i1m8YA0PHBdLJadCWFRoCJa2Q7PthNMcA628iyhBWLIKlwBwa8L+jXn7F07RdOUZWDNn
 8sFUHPrwNpY/YjhBoc0m+BBj2auMUzOS8MHmzwSSGYeSqiP8ll88WbfvzqOupmyqk9QF
 9mgg==
X-Gm-Message-State: AO0yUKVshYjOBPOoFKCFHiio/RTbiHtvKsxHSGiX7zfE0EWiQkNg7XWQ
 989wgdCZblT2NYY263vhkVrvcQ==
X-Google-Smtp-Source: AK7set+r8GdyIJj8ecwk6+R+vsCFO11a7PouNVrYIM0wgMEODb/L8h9Z1ey7pKKvVwl30/i6S77+lA==
X-Received: by 2002:a17:90b:4a4b:b0:234:b786:6869 with SMTP id
 lb11-20020a17090b4a4b00b00234b7866869mr6772281pjb.26.1677668355852; 
 Wed, 01 Mar 2023 02:59:15 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:15 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 04/12] cryptodev: Introduce server type in QAPI
Date: Wed,  1 Mar 2023 18:58:39 +0800
Message-Id: <20230301105847.253084-5-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62a.google.com
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


