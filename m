Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF435633E81
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:08:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtm-0008Vo-Fh; Tue, 22 Nov 2022 09:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtT-0008UG-Km
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:03 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtR-00064E-Sx
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:59 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso13843881pjt.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVeROiFzRvm73KuR37epkqeC5/pERblDH+LuVEv9GPU=;
 b=ctf7rxnqBUja/es1adM7Bxlco3UIGEBaBwjgAqy/Zms2p2HsYOrAlnMen9+4D9o2B5
 Grql04WH/XPRxLWk0xHZQy5trjGNpTAw2nK3rvlvc+fa7Ed6YY0BGYHLmBZTynJuFLae
 YNix7CS0xiBkL0fSazC9kq5JucBx3L3jJ5ZZfpQg9do2vl11pD7ZO+w2WeOGAzqcTdn+
 f638/7Dpv40pcx/LyU/WBsTGSCIIMUtitteH91gsmEBoPNiGwtUqcD9WYGQRWFH+CdlB
 wv4puJgLK7wZQ2WZ6kHUCQeOxw0qalXdu5cBarpqAE+RMi9jSyDGJ/3MD6dr23R8YxCm
 HyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVeROiFzRvm73KuR37epkqeC5/pERblDH+LuVEv9GPU=;
 b=FEQbe06ViGZZCktF2asOaj8Dp/Z7Hk1kFQ8Gj1YkovrEJGzr0Y0sDpsomFRqgkXv2r
 ZCnhbRRt8+M36OC/WGx7gJCH4Oo+haE2Hw3L1Tyjysi5LJ7/mjYczd/GxvKZxpXDDCus
 uSDkpkchhkTon47+loGTqbMETjTu4XmQjzOJ5BYHCOBBqazbcr4yRpjVcgxUWcVGwcx6
 XvpwYMKXj6ayw2XACQZTPg889AXC0Qlc/QNXKu67DD39vLzeY+wMdd3S/nLzcIOokB8Q
 g/N5GiLRyIiZtzs/x17f9UcYG/z48n5UC9szsHhgBCCqCOmmiatkjSOMrewAMucrqyjK
 xBjA==
X-Gm-Message-State: ANoB5plD0G9Eu9KN0IgAQ6jEElVDcVs3AAg7m8N7vydpeK3WSULP0ufF
 AYF0oY++vj9wDF88xuW/oIB95q7XoRDHhl8O
X-Google-Smtp-Source: AA0mqf6KfKma4PZnZozWcEw4gZrV8gSNI2zRblIO3vD5kmHt5GumwerFlp9Gw/nvs/2JgOz9FB9Kdw==
X-Received: by 2002:a17:902:b286:b0:17f:8514:cf33 with SMTP id
 u6-20020a170902b28600b0017f8514cf33mr4589840plr.101.1669125896599; 
 Tue, 22 Nov 2022 06:04:56 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:56 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 07/11] cryptodev-builtin: Detect akcipher capability
Date: Tue, 22 Nov 2022 22:07:52 +0800
Message-Id: <20221122140756.686982-8-pizhenwei@bytedance.com>
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

Rather than exposing akcipher service/RSA algorithm to virtio crypto
device unconditionally, detect akcipher capability from akcipher
crypto framework. This avoids unsuccessful requests.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 4987abb7d6..94a02aeaf1 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -59,6 +59,19 @@ struct CryptoDevBackendBuiltin {
     CryptoDevBackendBuiltinSession *sessions[MAX_NUM_SESSIONS];
 };
 
+static void cryptodev_builtin_init_akcipher(CryptoDevBackend *backend)
+{
+    QCryptoAkCipherOptions opts;
+
+    opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+    opts.u.rsa.padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+    if (qcrypto_akcipher_supports(&opts)) {
+        backend->conf.crypto_services |=
+                     (1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER);
+        backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
+    }
+}
+
 static void cryptodev_builtin_init(
              CryptoDevBackend *backend, Error **errp)
 {
@@ -81,11 +94,9 @@ static void cryptodev_builtin_init(
     backend->conf.crypto_services =
                          1u << QCRYPTODEV_BACKEND_SERVICE_CIPHER |
                          1u << QCRYPTODEV_BACKEND_SERVICE_HASH |
-                         1u << QCRYPTODEV_BACKEND_SERVICE_MAC |
-                         1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER;
+                         1u << QCRYPTODEV_BACKEND_SERVICE_MAC;
     backend->conf.cipher_algo_l = 1u << VIRTIO_CRYPTO_CIPHER_AES_CBC;
     backend->conf.hash_algo = 1u << VIRTIO_CRYPTO_HASH_SHA1;
-    backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
     /*
      * Set the Maximum length of crypto request.
      * Why this value? Just avoid to overflow when
@@ -94,6 +105,7 @@ static void cryptodev_builtin_init(
     backend->conf.max_size = LONG_MAX - sizeof(CryptoDevBackendOpInfo);
     backend->conf.max_cipher_key_len = CRYPTODEV_BUITLIN_MAX_CIPHER_KEY_LEN;
     backend->conf.max_auth_key_len = CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN;
+    cryptodev_builtin_init_akcipher(backend);
 
     cryptodev_backend_set_ready(backend, true);
 }
-- 
2.20.1


