Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5926A65C2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZF-0007ar-AY; Tue, 28 Feb 2023 21:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZC-0007Zv-3d
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:42 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZ9-0001bp-SO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:41 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso10537633pjs.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfbjQB/uupsbnVkLnKgXK2FfdvkN34GzFDspqyb2GhQ=;
 b=TQ32YeQqlpU2SWIdN54pZOPXYyq3HccNCuZQDJ1KcrAThiR2sJFLqXjOBPQp26Lqrc
 pUkAUMKar1UgyNKIeFKLS8D6Yc7OM8HVMlz8GVzWXmnTP3nMYNFqLJ4jzsGZoCUjcaGT
 RLidqstNoNp6O/E5arOa2/2AkIAbniq8AOtAwYE7bMGifsqP77xCyBLReH8FBY8wRxwf
 mG0WgXMAOf7QggpbtuZKQR3YYBJ0/ZcsLACuVoSKkRpVgo4u4EEsen5oiAVSmW8YZY6a
 hrqGisQw0IObQ4keq6NCydVGHBmS7W0IziQANcnhZiHwTtIeBsMWgcrTJbllZYDFrVOa
 Lrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfbjQB/uupsbnVkLnKgXK2FfdvkN34GzFDspqyb2GhQ=;
 b=JCDONNj9ceucfopJjk2sZ0c8bT8HkuepSnT9whVA8D7D4kDLdb2+yA6MpT/cx29DMf
 9SbXteiWLc2uiPYtJgpQlJs4ZhpLXCKQsDS5YclXTLvvwrLzkn/6CEx+9zuZxD+rXBy2
 6MQHEjiBdCSz2qbu1AfQmnsEZneaUS6faG7jekzaNw9+MI/BidkPiLedtu5L7vN5URDJ
 OBDJ5gE13s1W//jd3S3Nfr8/sKdfo6j1JsjzHtwZ9ISSIwG/fxwwnzO9i1Oo6s8P1A8n
 8TgPud5GZuA6zb7BlU/6T+imvMgRD45cvwnn64dLqsnWqXxUXvrLkifftdsWDRJQiVKB
 I3UA==
X-Gm-Message-State: AO0yUKWiRN4RZ0zmKEJI5aGgQsxST6X/OLoP0F6A520UEo2AsPdaafzu
 GtjbJwKAff1YbZAr+rgsFhnoeA==
X-Google-Smtp-Source: AK7set9rXSA2n2kAlK4YFIgncecUvOXMzrn8gt2c5qw0X4VshUU6snYxCy+M6SjftzLvCSXkMHoUlw==
X-Received: by 2002:a17:903:1c4:b0:19c:bcae:b45a with SMTP id
 e4-20020a17090301c400b0019cbcaeb45amr6642615plh.65.1677639098435; 
 Tue, 28 Feb 2023 18:51:38 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:37 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 02/12] cryptodev: Remove 'name' & 'model' fields
Date: Wed,  1 Mar 2023 10:51:14 +0800
Message-Id: <20230301025124.3605557-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1036.google.com
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


