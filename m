Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D862540F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:49:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNpC-0006bz-G1; Fri, 11 Nov 2022 01:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNpA-0006bG-A1
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:36 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNp8-0008Hw-Nq
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:36 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v17so3555180plo.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2Pju8ej4HqpDpyXMdvM9rPS2/OxpZbKPNF6rcjhplM=;
 b=QKOTzlkb85CmuxquvzSVVv/w/JnsMWNtZ5YX93d5ERKjt0AAIWwzFzdpvRXb+BnrLR
 ikLao7ambBtJrG9zsbx6C3Sz4+TUPVmR25l1RBp8IMDQzFMGs9G23Q9czf1Kh9W6Y1y5
 7tfK699+xB3W9CBSsmVLQ6HT/lklz73PFx9HA0RNJGwHa243fCfvD7hc3S6T0cvVRjUo
 A8UYqSbSIxhDzwH58tz5r151yJmTfr975lCdMiATaRJOVWrMlFZDw5zRc/mXzdO8CSTr
 xfcYdP0A6EgpSl7Ophvh05jxHs+D6AfLN4u63/sBVIaAyeUBT/FgdVtYwyllWSvVTudq
 4Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2Pju8ej4HqpDpyXMdvM9rPS2/OxpZbKPNF6rcjhplM=;
 b=pzAz4tWDDISpEE4lh/1pXqJChFDDr6oZOUjO2Odp9WBbxLM2h+FhCJE4laH8EwGSym
 f592chB+7feSPBnNerUqxd7onbrsmtbkroFWNleri3nsdBz1dcoECAo0Idjix2AsxB3F
 TgXwj+tB4u3iVGQCZegalAcKcfAeLv0oQuHbAq7Pojddh0Llv0sp+vsw/ZRw7Y4nTJEW
 yMNjtwAOHMse6F+QdQ/U3ne7ULeCYhiwAlX4a/J/+6opjFREpQiRqddDOjDRJFVBGJ7L
 oUMljj0/cq2kiQgiBlB9olT8wIgNiI/feqKXZSHsPWpVK193WHRZKGhCGEs8hn0br3qk
 7C5A==
X-Gm-Message-State: ANoB5pmkID3BVSCVPNOo7J0Sv/UbshCkO81XbItZJQR+7hajsM2wXknw
 xVQr+RiNGKl7bNl8f9glBQO6+w==
X-Google-Smtp-Source: AA0mqf4+aKHxgzk4IWqAF1etpHrCWr60fv9xAIETKRktFLXwF8BaGMtKlx2Ocyq2NkwE6qnwxrEy9w==
X-Received: by 2002:a17:90b:4ccf:b0:212:dc2f:b987 with SMTP id
 nd15-20020a17090b4ccf00b00212dc2fb987mr410557pjb.173.1668149249833; 
 Thu, 10 Nov 2022 22:47:29 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:29 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 7/8] cryptodev-builtin: Detect akcipher capability
Date: Fri, 11 Nov 2022 14:45:52 +0800
Message-Id: <20221111064553.246932-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62d.google.com
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
 backends/cryptodev-builtin.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index a548c66e39..9e94d2bfcc 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -59,6 +59,25 @@ struct CryptoDevBackendBuiltin {
     CryptoDevBackendBuiltinSession *sessions[MAX_NUM_SESSIONS];
 };
 
+static void cryptodev_builtin_init_akcipher(CryptoDevBackend *backend)
+{
+    QCryptoAkCipherOptions opts;
+    bool supported = false;
+
+    opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+    opts.u.rsa.padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+    if (qcrypto_akcipher_supports(&opts)) {
+        backend->conf.crypto_services |=
+                     (1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER);
+        backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
+        supported = true;
+    }
+
+    if (supported) {
+        backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
+    }
+}
+
 static void cryptodev_builtin_init(
              CryptoDevBackend *backend, Error **errp)
 {
@@ -81,11 +100,9 @@ static void cryptodev_builtin_init(
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
@@ -96,7 +113,7 @@ static void cryptodev_builtin_init(
     backend->conf.max_auth_key_len = CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN;
 
     backend->sym_stat = g_new0(QCryptodevBackendSymStat, 1);
-    backend->asym_stat = g_new0(QCryptodevBackendAsymStat, 1);
+    cryptodev_builtin_init_akcipher(backend);
 
     cryptodev_backend_set_ready(backend, true);
 }
-- 
2.20.1


