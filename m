Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB75C6A6B37
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBL-0004ZH-Iy; Wed, 01 Mar 2023 05:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBB-0004YH-IR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:25 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKB3-0006Ca-N0
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:24 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ky4so13580266plb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfbjQB/uupsbnVkLnKgXK2FfdvkN34GzFDspqyb2GhQ=;
 b=DSJDJPj/dmwkj6snKZacr84PzkmUN4m2idh7G/WlbQljWd7gbBEk9ig89yUtxeHJxK
 WBEXH27AMrh65PvNcAJjv/L33LNzpWMy6C6pVOjnTVYlKyoc+O1X5YRcUsbYilCDFgbZ
 J0PZBIUcMR2FwSqauCyvpwfmsAETu275DpZtCbl5jLFDmEtF8VtKUfMrcjL5TA6mrbtf
 OZYlbK0hDDSPXbf7HtwPrdpvUqTqXpsIMMDuoccvzMx2TOCFqZChRldtcFGv+9hXqTrp
 MHPMljFs1OowcCJcwr3nNIgFxjVq42muGUtSa8y4IeNNz2GcdtRkJ9TBBFuDl1Z+lmZC
 OB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfbjQB/uupsbnVkLnKgXK2FfdvkN34GzFDspqyb2GhQ=;
 b=5zBaIDF6cG7TMy8IKpD0+cWiF9MHiN3PisX0T/EdpMaUScwYeg3W/K28zeDNUK1wEp
 AQNOrVOKtWxO2E+YD9F+KC6EPI/TuhJPnNamKLSzu3k9h5K9EkwkKkePV1Y7qf0z8zip
 Yig+ZjVzRvS9gHS4IBRCQavVRuuDJW0TOEC7G1vJGiG4ridvlTpmPW60Ps4lR7f7JIyp
 j39RHzn4SOHQRAsQ8PkDP0RjW8vjhNt9wNqy0uWpyj/Nd/n6zDFoP345MWHjkZN4qK8y
 vMu08DxEKBO/Ez0S0eb6NHywWrxdamD58s/hExabcpI1L9dMBRFER9ghk0gxXa5HG85m
 OjvA==
X-Gm-Message-State: AO0yUKW6NjtMFnvVSMbj/TzUoS9LYOhnhoYnZ+N6NVQDUgmmocJ42f2w
 5egPi/dfsph+eMOw03wKrPxdSw==
X-Google-Smtp-Source: AK7set/MiKxPGi8qDGR+UPuVP+Wl83pWs1LrNsqW322QGojQ7e9LBOyIRwrinQBtcoHPv+yTZMKIWg==
X-Received: by 2002:a17:90b:314d:b0:237:6178:33b1 with SMTP id
 ip13-20020a17090b314d00b00237617833b1mr7094368pjb.19.1677668349608; 
 Wed, 01 Mar 2023 02:59:09 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:09 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 02/12] cryptodev: Remove 'name' & 'model' fields
Date: Wed,  1 Mar 2023 18:58:37 +0800
Message-Id: <20230301105847.253084-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
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

We have already used qapi to generate crypto device types, this allows
to convert type to a string 'model', so the 'model' field is not
needed.

And the 'name' field is not used by any backend driver, drop it.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev-builtin.c    |  3 +--
 backends/cryptodev-lkcf.c       |  2 +-
 backends/cryptodev-vhost-user.c |  3 +--
 backends/cryptodev.c            | 11 +----------
 include/sysemu/cryptodev.h      | 12 +++---------
 5 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 8c7c10847d..08895271eb 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -72,8 +72,7 @@ static void cryptodev_builtin_init(
         return;
     }
 
-    cc = cryptodev_backend_new_client(
-              "cryptodev-builtin", NULL);
+    cc = cryptodev_backend_new_client();
     cc->info_str = g_strdup_printf("cryptodev-builtin0");
     cc->queue_index = 0;
     cc->type = QCRYPTODEV_BACKEND_TYPE_BUILTIN;
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 91e02c0df9..de3d1867c5 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -223,7 +223,7 @@ static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
         return;
     }
 
-    cc = cryptodev_backend_new_client("cryptodev-lkcf", NULL);
+    cc = cryptodev_backend_new_client();
     cc->info_str = g_strdup_printf("cryptodev-lkcf0");
     cc->queue_index = 0;
     cc->type = QCRYPTODEV_BACKEND_TYPE_LKCF;
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index c165a1b1d6..580bd1abb0 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -198,8 +198,7 @@ static void cryptodev_vhost_user_init(
     s->opened = true;
 
     for (i = 0; i < queues; i++) {
-        cc = cryptodev_backend_new_client(
-                  "cryptodev-vhost-user", NULL);
+        cc = cryptodev_backend_new_client();
         cc->info_str = g_strdup_printf("cryptodev-vhost-user%zu to %s ",
                                        i, chr->label);
         cc->queue_index = i;
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 54ee8c81f5..81941af816 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -34,18 +34,11 @@
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
 
-CryptoDevBackendClient *
-cryptodev_backend_new_client(const char *model,
-                                    const char *name)
+CryptoDevBackendClient *cryptodev_backend_new_client(void)
 {
     CryptoDevBackendClient *cc;
 
     cc = g_new0(CryptoDevBackendClient, 1);
-    cc->model = g_strdup(model);
-    if (name) {
-        cc->name = g_strdup(name);
-    }
-
     QTAILQ_INSERT_TAIL(&crypto_clients, cc, next);
 
     return cc;
@@ -55,8 +48,6 @@ void cryptodev_backend_free_client(
                   CryptoDevBackendClient *cc)
 {
     QTAILQ_REMOVE(&crypto_clients, cc, next);
-    g_free(cc->name);
-    g_free(cc->model);
     g_free(cc->info_str);
     g_free(cc);
 }
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 8d2adda974..af152d09db 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -218,8 +218,6 @@ struct CryptoDevBackendClass {
 
 struct CryptoDevBackendClient {
     QCryptodevBackendType type;
-    char *model;
-    char *name;
     char *info_str;
     unsigned int queue_index;
     int vring_enable;
@@ -264,11 +262,8 @@ struct CryptoDevBackend {
 
 /**
  * cryptodev_backend_new_client:
- * @model: the cryptodev backend model
- * @name: the cryptodev backend name, can be NULL
  *
- * Creates a new cryptodev backend client object
- * with the @name in the model @model.
+ * Creates a new cryptodev backend client object.
  *
  * The returned object must be released with
  * cryptodev_backend_free_client() when no
@@ -276,9 +271,8 @@ struct CryptoDevBackend {
  *
  * Returns: a new cryptodev backend client object
  */
-CryptoDevBackendClient *
-cryptodev_backend_new_client(const char *model,
-                                    const char *name);
+CryptoDevBackendClient *cryptodev_backend_new_client(void);
+
 /**
  * cryptodev_backend_free_client:
  * @cc: the cryptodev backend client object
-- 
2.34.1


