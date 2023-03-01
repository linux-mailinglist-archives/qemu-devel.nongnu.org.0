Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560DB6A6B47
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBM-0004aD-Kt; Wed, 01 Mar 2023 05:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBC-0004YQ-ED
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:27 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKB9-0006GF-GD
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:25 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u5so10155958plq.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=kR+pZ75AmHA9s79rpGuNP9vEDn18BeoJwJYAGz57cJPU7pcCavZFhdk/qDri1jgH6g
 ffFhPOEagotUxVVzGvqG7dCkeUQbsiiG9T8zXF/M69yVmYDrkehwGijb4XMvvHZ3TeBq
 dcrXUCmeuou9CGBHgWU6ZgStLqWJOCUvT+8rxbrbgSr1TYxHUGeheF17XsvMcbNDHimY
 ojParGB5AVjQXtdjMUxwXikacw+DZlnCr4fVn8K4/kmaXHnNRx92p2Ecn0Bflev07in9
 3kCnTmSisJDsmqMHqlm8WB8+emBGTC3YccUTgdCVsXMImq13SH7KJz97KWrkrysKaUvh
 HN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=NC4U9TfMEGG8Y/CyMwD8s8k+xeYGOaV/7QMOGalOUM25OZVPcdICbNSJSyzAvTvZux
 KY5hmhiw6ZVdvlJaFFwkYFqHNNtGiksUCLS4BDfF/0459EKerhOfU6WfdArFLHA12BYq
 pcrQeu+EnNVZxgKO2aCie5jr8Z+vevUziQVCh3qdWnM9dSyyl87ojX99qsnBqwF+wICW
 esS908p9r/05ouhgIwXNvxD1fbqQwBr5iBxzcpSDzUxlkBLaJHrLOgGT+F1Ehmb9vs5O
 ddR/zVxE1OhlpjT1efnvKjuNrMy24DT/1jLxphxayaijfeFeLGNa65SCI0edM6SPgHXF
 Im0g==
X-Gm-Message-State: AO0yUKXnnCobuofemfmhuqKKMv846Y5QQTxZEz6h6bqPzihMNYdiKedW
 /1t0d2MeGEmZsPMnYuhodzqpZw==
X-Google-Smtp-Source: AK7set9ioR5rQDa0O5ehNjIHwfZMtIUs4ixuU2J0GtCQvZbvHpBjRZ1IeLUuuoMWEKJizR2ebCE1DA==
X-Received: by 2002:a17:90b:4ac5:b0:234:2c9b:e01d with SMTP id
 mh5-20020a17090b4ac500b002342c9be01dmr6901733pjb.30.1677668361999; 
 Wed, 01 Mar 2023 02:59:21 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:21 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 06/12] cryptodev-builtin: Detect akcipher capability
Date: Wed,  1 Mar 2023 18:58:41 +0800
Message-Id: <20230301105847.253084-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62d.google.com
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


