Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C267FC84
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxtd-0003mn-TF; Sat, 28 Jan 2023 21:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtb-0003mN-9F
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:19 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtZ-000879-OX
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:19 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso11626411pjs.4
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=yRqKF+cPLoJ9eGXHwa7i/EcGRG2Tdd0PF29JhlquWEg52jv8B7KNY0Hl5Rq3uVPq0O
 xPD0zdFJm+xQ3qa3ezWpyyIu61KQ8Rzr4muMgUYOORTYONXTUPcYzgAnoPtVN3tyo9KM
 EJZ9BOUwI3oMBqJVKD3xffDTcncyZr7VyUSDiDay9rd885Psw9ynsM90ZTa9VFHMavDQ
 QJvYB7VMWU0ER+IzztOJtNdwvlNA6d34IIBUudEUcgn4dSrWBm6i6exwem7oPZb3s7ym
 YNC5f4Wqd+2d6U68LkSURTVAN9NV+VC190hzYS45DVdNwSzypQQDS1Ore6DAyCipAbHl
 I8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apL1WJYFS+wRnFE1AVrV2YJrrdnc+DLo0evEaR25zXg=;
 b=Z1crTDvrToynbMh2KlzBmkIKeWzjclyqiLe7aeHxdhQZOP6u3ZZszcxIgjds0U5UbP
 QzVD8yxWkFtdkuCNMFo/tq/XzxJ+GOcBRy6oRQtqnGUg25r8JQkQ/pvLNOG81bQgEz0q
 Xw4XmTajc/7b6bceNkMqLGJmUVnrU4P47tru/FU8JOF9/4abXo0pwdlIOrIvrbIy+QCo
 8xNz2FLFRAVGvAnKcEMcsy4VvONMds4qNzVRz5PpKpTVlDq2UrxmGVJYjhwM/9gmgEIY
 3Qe2sOSkzY/BdN1aIZ3ZntxeD4Z3wvtl1uJuaAuS9XwSf9+/qu0fKEWZRm8wBZ2VYRw4
 uJuA==
X-Gm-Message-State: AO0yUKUkugThHULfUuUNQI4VriQ2JJLzUgLEWVtoGKg3JquccKniHUrg
 lMJIvJCFH9JPJXLhz3fByHfrzg==
X-Google-Smtp-Source: AK7set9mkNZ/EuQ7EOR1++ObQtxC1DwJSG5ZIh23mtixoMGhYxiMwhlHG0ootFhq4/FcpBTzxt3jgw==
X-Received: by 2002:a17:903:22cf:b0:196:1f80:106d with SMTP id
 y15-20020a17090322cf00b001961f80106dmr18495128plg.9.1674961096528; 
 Sat, 28 Jan 2023 18:58:16 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:58:15 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 06/12] cryptodev-builtin: Detect akcipher capability
Date: Sun, 29 Jan 2023 10:57:41 +0800
Message-Id: <20230129025747.682282-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102e.google.com
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


