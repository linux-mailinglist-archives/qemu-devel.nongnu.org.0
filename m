Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0689C673236
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:15:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP8G-00062v-Q3; Thu, 19 Jan 2023 02:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8B-00061Q-Vn
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:39 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8A-0002FT-A9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:39 -0500
Received: by mail-pl1-x62c.google.com with SMTP id 20so1523540plo.3
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfbjQB/uupsbnVkLnKgXK2FfdvkN34GzFDspqyb2GhQ=;
 b=hSQOwSkthTrh+s5cEsiG3q2Pp/kiTAYKVq4idbm+wG4liKTzNDa7nT0ve15nzTvCNy
 EJr4k9Zh+gjkYtR9Q3JWVDMerB1rrDT41Nh74xH5XTeUo8QK5q0SKpalzWcj2fHL5Lu3
 CQdS0m01qXCRHb3ef40iK4sL3Wp6pawxC0ypHVAycT2M8jZsJquUvByT4iqtrWmF8pXM
 c/ZkBE/P1osS+vyjA/s75fbcRwHlYMvLv8R8IcmzRT4wmZcDVfeI6y7gGW7em5FJtM7d
 2av+mhh1luQXyZUpr7UTOEFUJmi8WvjcHozrB0CtjidJRySoueOaOQcei+QvFTFCvGi8
 0lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfbjQB/uupsbnVkLnKgXK2FfdvkN34GzFDspqyb2GhQ=;
 b=CMYM00XCLGIyUs/nCrohl/1A9tyeN5vg+j3YQgSpAW+OKmjNFr9qk08wg20G4PC4YL
 XAT+i/+fo4JVrRpV2/M5yyjreZ6DcICTWD/2m5xfrSUbXC+ofIiQN2MRzRUxwkimnOUv
 v9HjUzPPSmzIoAExSP6AWAgJSDevBJs4+18JjbytA631qWVo+NEVoHBRAleyA89AL14r
 1cZIG1QfI1ekieax9HGMWR4NBWjSaX9uComUnJIUzNQV6EdLy7ISCslbh9UNBxCZ5eUi
 CO1FD7YLuRnehzNwshVSjVW3GOoCiWpovZWJQXVO5WOba8cN7gh6FFMdKdmyzYXPrzbY
 G9kw==
X-Gm-Message-State: AFqh2kpy2eEg7Ontp17ZWDVx0E2FLx0Y2lJWU7Gt0gUCVP28ubrnlcru
 LIpeI4MlCDTTBjR7/NyZL/3wxQ==
X-Google-Smtp-Source: AMrXdXszpXMW3kQMdX/30aRaIvpHSu3LVNQh9bKP3ZngM2jGOMpVY+gD3i1tjl/88RUlsUZ1yc6VKA==
X-Received: by 2002:a17:902:d411:b0:192:f12a:42de with SMTP id
 b17-20020a170902d41100b00192f12a42demr8919266ple.42.1674112472904; 
 Wed, 18 Jan 2023 23:14:32 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:14:32 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 02/12] cryptodev: Remove 'name' & 'model' fields
Date: Thu, 19 Jan 2023 15:14:09 +0800
Message-Id: <20230119071419.3585771-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
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


