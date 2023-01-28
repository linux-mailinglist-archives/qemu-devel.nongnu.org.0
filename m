Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C667F47A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcKz-0000PV-Q9; Fri, 27 Jan 2023 22:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKy-0000PN-4u
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:08 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKw-0003o3-JE
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:07 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso9818827pjs.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=R1swDsuva29edCr+Mj9nG14W5GIu1esnwVrRzZw/iM0uEm26/eQ45eT+Sh7ZvGzD0y
 IQ3REXc6XI+NZXUTZinRnxCeRh3VJ1w06qCY97bzqI7kyKY709VzQgD5cSFNqCOtxArj
 HWLAax2NhIUfUtKzdFQ7sPpJq84wqMjrf5NeEXJ8rXLuEuBWJL5itZos5MBEi5TMrCui
 gRmCGSlkne3fwbZpcP5ZwepHPL7jzZXddcbmo6UwvqRub25aJzlBSpNDSK2HnheJ3xA2
 mJk0oq+6Sy8iKJKee+iL5Y6cMrLDo6I5FxcUjZYQcDBpO0jP6K2okX8lO04DvwflgqXt
 uBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=lOYfFIrGoFQgvWuV5EgXoCwnX/u0DDD89h+LwyO5nqUZ+MhsYJycBAYr+bWtwMeBmZ
 tGgt2pjdJxk4nJG4GUykxbtZPC4gZoKfunehoc6dC4gAFwGG7Drwo9127GD/biq3sJ97
 bjw+4p8gni/hlJPxh1SnMexxIJJDRrH5+wx5PC14aVZQB73GLEXph/oXg6sKsKwJTjEN
 fUjJUGbrNlSX17m3o4d6/7cQ3MbBO+LnNN3IrtG/cV1uZWBMJ+CIckoVD8b6ZCdw4wf4
 JwdK5IbEjXFykciwcx8ydsB1+NHvN96TDQ/GI3eqOQW/5f2QneRcPsvcBThcqocC63UU
 ZWjg==
X-Gm-Message-State: AFqh2kplW0M8V6kLv2NbtP0XSvqGH7NvSj8xeH0rXmir2m3ED91ib7c8
 2l4+qM3qSK5u5dB0zT+15EJgwUHpi6MAe+i4
X-Google-Smtp-Source: AMrXdXvskJYmBCiLL4FBTM2mONpZkc7+gGGCfYeTd84QOtN2Vxv07J1FhA23dPIYib+mn4jneCL3AA==
X-Received: by 2002:a17:902:9a81:b0:190:d273:38a9 with SMTP id
 w1-20020a1709029a8100b00190d27338a9mr38874035plp.14.1674878225147; 
 Fri, 27 Jan 2023 19:57:05 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:04 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 06/12] cryptodev-builtin: Detect akcipher capability
Date: Sat, 28 Jan 2023 11:56:27 +0800
Message-Id: <20230128035633.2548315-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1035.google.com
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


