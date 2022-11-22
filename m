Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D2633E61
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:05:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtC-0008RY-Tz; Tue, 22 Nov 2022 09:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTt9-0008R9-Uf
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:39 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTt7-000624-12
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:39 -0500
Received: by mail-pl1-x629.google.com with SMTP id w4so4935507plp.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CdbmP/FiE6kgxBu7MfFEjij+I+GqUpVV/I8WAQPEbM=;
 b=Kv6dcGYNbp3nFT+LYvs+cVTQ5qEjqfWw2giibv0oIRIemfdkTBvmpNZzZqE2vhV2Q1
 pR8dTb7mmP/448P29xlc7TeZi6LRXoAqPANBUEpViLAjP4b8jbc+YivuYFeaN9zVrdCT
 A48ko1ujQYT4FG+3eKJRafcyOqAODIWyGTycXqRgUMfn/1Qd3mVzTtGCkd4AQoK/UJqL
 gtPqUzL3zaYn+NeDs7jDOIm8ZidPdDs2c7pc5o/RH7BaRiWv8wOMHZh0Ht5sisKk2iPs
 v00I6oVwKRPFyrWzrG8eawCx8MZWtRg1aVYP3w1d1vxeNEaNO6hFEoJ6pRR6tMKaP38T
 P/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CdbmP/FiE6kgxBu7MfFEjij+I+GqUpVV/I8WAQPEbM=;
 b=7htloH6BU+Infnc7BYo5WaKSwi0XwAoYkfbLBBt995M/wW/BcvfC2OA+LGOyMhilKU
 FTORYVejmSlCtJXJD7Mkd9lL85F7gXs4+7eyhdNlR63hZs382nwoPyeW2AxZF1RdZytQ
 vxX9llmodfyKkdd8c2q7eEz0pOMNutYGV3Ws6hc0fi/IFKI6VTQXddiAoYzqvREohtv2
 mLqElde5VCWsEO+FYeDFNFV3UdLqmevgo6YhwO+2DzwS2L/1cH7KtV3H694PcwUQ82rm
 8xeuAD6f0ws/6F/VtDmT80rM6u4KsHZhtLqzeXRU9AFO/lXOWAWBhKsHWjaHlitgnso9
 YTCQ==
X-Gm-Message-State: ANoB5pmCclshM9kCD0vdPEHBzsS5iRRcNW3eMtikirEOeMAA3LINJGEN
 ANZiJ731Ex7XKpStyr3qW+lVrw==
X-Google-Smtp-Source: AA0mqf7i5xlhPE6HgLBsJNhJCc4emM9wsqYAlelwsSxJQCpa305Vg2W9wgQ4tjlXBjfV8h2o65w0Nw==
X-Received: by 2002:a17:902:e94e:b0:186:5613:becf with SMTP id
 b14-20020a170902e94e00b001865613becfmr4171792pll.46.1669125875011; 
 Tue, 22 Nov 2022 06:04:35 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:34 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 02/11] cryptodev: Remove 'name' & 'model' fields
Date: Tue, 22 Nov 2022 22:07:47 +0800
Message-Id: <20221122140756.686982-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x629.google.com
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
2.20.1


