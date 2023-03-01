Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8216A65CB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZV-0007ko-1n; Tue, 28 Feb 2023 21:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZO-0007fG-NL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:55 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZN-0001i1-4f
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:54 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so11561813pja.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=Kpe8LKMkr7a/72dm8WtgxXk9hJckHktFFz/LSwFlRa/F08XanOuEOxn+RO4dAq3dQF
 kFZSqQbeihLfy0x26bIIl2AEDa/gugY133xtmDioxPoRI6DPsvgSLXmw921tgZyyVCiD
 Y9HqMhOuypmfBSrVCoJldkEuVAedFCKfskX2HmGugUlHdcXz2ASu7F7oyKERkUSpUYdM
 4ic4+QSdtgRCxAiohi8n0FKVSGHNDF/V+CdLOi+hZN8/f+yWiuqLrU7VIN0rP13ykKnY
 +gUlkqqZKubq8QDvBxS/Q1jOb0qZmmTJmev2Svi5At4ZkgF17gVH2011BTaEq7khf7JR
 9gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=rkUTYemD/ka6vDTi+0Mpcz9r4wdJoHkBnFoUBMEj0GIeOvS0KjRWZlBJGAFEGXc9Ah
 dr7r7AtJK9nVzxcAxmEVwNlx3SrY1CGEhQwz0zhAEnOh7brXLtH8zxSTxNrdUi/jlW7W
 q+SRJZH2jcges/IwqxMinPiLj0TdjkgbxhHhd3VWJFOEbt+Wo3ArTtuXIic8FQcycnLF
 rMk8/SLPFz9o8QUy9VE4YthHLcjloc6mGn41W+r8fJUJ/3VOEWjCVOgwwX0VKJOrvmA9
 GbPDGLXdlvL53BRGBVPYFnCQ22nsjiIQMJIB4bzkpoTlqFamSG1uOiL/JySa3ZBL/B0r
 5mKA==
X-Gm-Message-State: AO0yUKX4FmQihgXBqSqaa4VSxZaAt3M7HsFjlL1OUFbFX4SoYeH1443v
 f1U0v8BGoxHj+frykqhRQJZ5CA==
X-Google-Smtp-Source: AK7set8FzHHs37NfCiEvRKqVCIMwYWU26W1gA4wRDubZxGglk8B8nVVIUX2QBxjg2+Xp3YChgSc8kQ==
X-Received: by 2002:a17:902:e5d2:b0:19c:ff5d:1fd2 with SMTP id
 u18-20020a170902e5d200b0019cff5d1fd2mr6014361plf.8.1677639111473; 
 Tue, 28 Feb 2023 18:51:51 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:51 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 06/12] cryptodev-builtin: Detect akcipher capability
Date: Wed,  1 Mar 2023 10:51:18 +0800
Message-Id: <20230301025124.3605557-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
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

Rather than exposing akcipher service/RSA algorithm to virtio crypto
device unconditionally, detect akcipher capability from akcipher
crypto framework. This avoids unsuccessful requests.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index c0fbb650d7..c45b5906c5 100644
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
2.34.1


