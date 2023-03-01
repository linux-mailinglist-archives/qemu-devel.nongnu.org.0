Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ECF6A65C7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZE-0007aJ-7B; Tue, 28 Feb 2023 21:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZC-0007Zu-3W
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:42 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZ9-0001bC-8h
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:41 -0500
Received: by mail-pl1-x630.google.com with SMTP id p20so11330187plw.13
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGecBk73OrCf22ApQpukoMa8+9NpH2PsLgL3BgKMtMI=;
 b=RH96rGPw+7N6mSjbsgNC/JwCVyHvqq0JrD0S04hJ7j2Veh8/g3B61FcIYqvLOYjwdd
 jazMzRG7UH+ilyqgMpOhbj/X4PgpjTk861MfKEJQ1uodXH/uv/de6rX3eWEot9a00ver
 ODyJS8N+8MXqRhpxy1l2OBgKuaHZAmWWRS71ezjm51ZV6UkX7+4SrrjXzY3YIrz/2mkY
 1cugUhIycjTQrOyczp9YTfFiltA84q4yj8oxZAILkTGDjhRYYX2GjjCUceC1R1TGVcCR
 p7MNWFtgSf5OrYLU09VUJhvoSOWRidz2wAiQgRk3O7EJSNz6QxmDNXrvm60dvao1fpT4
 ROKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGecBk73OrCf22ApQpukoMa8+9NpH2PsLgL3BgKMtMI=;
 b=1PURyIuw6PDFJXfjoYh16ODWwTuTkoJlQ4V5C5Dihho4XC2i0W3+jS1SQy4EMjuW7M
 P/pJZSREzV8Sg7Hz+9z+TCBBMz28fPv0u0B8utrUrFTAsHzW5st11CcqJ9pO1xyF6YrN
 wsvmv6yvCTEt2jKhzBtz8oyDa+DoWNFq//lZG7QtHNh63mLMVF5I38dZI0zlLAH1dOpc
 9/JsIAV+MkM7G15L6vxjJwGYbc9ueRmFpLUBD4YR/bvC2bVqejjT6cD6c50hefuHmJxQ
 iGGvdLuIASVtN6pclT2BVdzLhRR88pHPsoxcF1L8Cc6+OrutmUWaj3EAwNfbddUIUXbK
 VzZA==
X-Gm-Message-State: AO0yUKW1CMIG5XMQIOyCv7GO/pGR2soeWOMfnSrjZGHHzrfXu6MPYC/A
 DNpDnmUCSfYWLY2OLdOUKDg7AA==
X-Google-Smtp-Source: AK7set+SRIzL6qtxoiu/wZx07v6kTsqclkDSyZXArd8UJ7Y8k0wvJU6ZPT7hpm+3qfgVvUACnOdT6A==
X-Received: by 2002:a17:902:dad1:b0:19c:d32a:befc with SMTP id
 q17-20020a170902dad100b0019cd32abefcmr5283094plx.15.1677639095072; 
 Tue, 28 Feb 2023 18:51:35 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:34 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 01/12] cryptodev: Introduce cryptodev.json
Date: Wed,  1 Mar 2023 10:51:13 +0800
Message-Id: <20230301025124.3605557-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x630.google.com
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

Introduce QCryptodevBackendType in cryptodev.json, also apply this to
related codes. Then we can drop 'enum CryptoDevBackendOptionsType'.

Note that `CRYPTODEV_BACKEND_TYPE_NONE` is *NOT* used by anywhere, so
drop it(no 'none' enum in QCryptodevBackendType).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 MAINTAINERS                     |  1 +
 backends/cryptodev-builtin.c    |  2 +-
 backends/cryptodev-lkcf.c       |  2 +-
 backends/cryptodev-vhost-user.c |  4 ++--
 backends/cryptodev-vhost.c      |  4 ++--
 include/sysemu/cryptodev.h      | 11 ++---------
 qapi/cryptodev.json             | 20 ++++++++++++++++++++
 qapi/meson.build                |  1 +
 qapi/qapi-schema.json           |  1 +
 9 files changed, 31 insertions(+), 15 deletions(-)
 create mode 100644 qapi/cryptodev.json

diff --git a/MAINTAINERS b/MAINTAINERS
index e96e9dbfe6..7651cb0ace 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2870,6 +2870,7 @@ M: Gonglei <arei.gonglei@huawei.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
+F: qapi/cryptodev.json
 
 Python library
 M: John Snow <jsnow@redhat.com>
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index cda6ca3b71..8c7c10847d 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -76,7 +76,7 @@ static void cryptodev_builtin_init(
               "cryptodev-builtin", NULL);
     cc->info_str = g_strdup_printf("cryptodev-builtin0");
     cc->queue_index = 0;
-    cc->type = CRYPTODEV_BACKEND_TYPE_BUILTIN;
+    cc->type = QCRYPTODEV_BACKEND_TYPE_BUILTIN;
     backend->conf.peers.ccs[0] = cc;
 
     backend->conf.crypto_services =
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 133bd706a4..91e02c0df9 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -226,7 +226,7 @@ static void cryptodev_lkcf_init(CryptoDevBackend *backend, Error **errp)
     cc = cryptodev_backend_new_client("cryptodev-lkcf", NULL);
     cc->info_str = g_strdup_printf("cryptodev-lkcf0");
     cc->queue_index = 0;
-    cc->type = CRYPTODEV_BACKEND_TYPE_LKCF;
+    cc->type = QCRYPTODEV_BACKEND_TYPE_LKCF;
     backend->conf.peers.ccs[0] = cc;
 
     backend->conf.crypto_services =
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index ab3028e045..c165a1b1d6 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -67,7 +67,7 @@ cryptodev_vhost_user_get_vhost(
 {
     CryptoDevBackendVhostUser *s =
                       CRYPTODEV_BACKEND_VHOST_USER(b);
-    assert(cc->type == CRYPTODEV_BACKEND_TYPE_VHOST_USER);
+    assert(cc->type == QCRYPTODEV_BACKEND_TYPE_VHOST_USER);
     assert(queue < MAX_CRYPTO_QUEUE_NUM);
 
     return s->vhost_crypto[queue];
@@ -203,7 +203,7 @@ static void cryptodev_vhost_user_init(
         cc->info_str = g_strdup_printf("cryptodev-vhost-user%zu to %s ",
                                        i, chr->label);
         cc->queue_index = i;
-        cc->type = CRYPTODEV_BACKEND_TYPE_VHOST_USER;
+        cc->type = QCRYPTODEV_BACKEND_TYPE_VHOST_USER;
 
         backend->conf.peers.ccs[i] = cc;
 
diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
index 74ea0ad63d..93523732f3 100644
--- a/backends/cryptodev-vhost.c
+++ b/backends/cryptodev-vhost.c
@@ -127,7 +127,7 @@ cryptodev_get_vhost(CryptoDevBackendClient *cc,
 
     switch (cc->type) {
 #if defined(CONFIG_VHOST_USER) && defined(CONFIG_LINUX)
-    case CRYPTODEV_BACKEND_TYPE_VHOST_USER:
+    case QCRYPTODEV_BACKEND_TYPE_VHOST_USER:
         vhost_crypto = cryptodev_vhost_user_get_vhost(cc, b, queue);
         break;
 #endif
@@ -195,7 +195,7 @@ int cryptodev_vhost_start(VirtIODevice *dev, int total_queues)
          * because vhost user doesn't interrupt masking/unmasking
          * properly.
          */
-        if (cc->type == CRYPTODEV_BACKEND_TYPE_VHOST_USER) {
+        if (cc->type == QCRYPTODEV_BACKEND_TYPE_VHOST_USER) {
             dev->use_guest_notifier_mask = false;
         }
      }
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index cf9b3f07fe..8d2adda974 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -25,6 +25,7 @@
 
 #include "qemu/queue.h"
 #include "qom/object.h"
+#include "qapi/qapi-types-cryptodev.h"
 
 /**
  * CryptoDevBackend:
@@ -215,16 +216,8 @@ struct CryptoDevBackendClass {
                  void *opaque);
 };
 
-typedef enum CryptoDevBackendOptionsType {
-    CRYPTODEV_BACKEND_TYPE_NONE = 0,
-    CRYPTODEV_BACKEND_TYPE_BUILTIN = 1,
-    CRYPTODEV_BACKEND_TYPE_VHOST_USER = 2,
-    CRYPTODEV_BACKEND_TYPE_LKCF = 3,
-    CRYPTODEV_BACKEND_TYPE__MAX,
-} CryptoDevBackendOptionsType;
-
 struct CryptoDevBackendClient {
-    CryptoDevBackendOptionsType type;
+    QCryptodevBackendType type;
     char *model;
     char *name;
     char *info_str;
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
new file mode 100644
index 0000000000..b65edbe183
--- /dev/null
+++ b/qapi/cryptodev.json
@@ -0,0 +1,20 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+
+##
+# @QCryptodevBackendType:
+#
+# The crypto device backend type
+#
+# @builtin: the QEMU builtin support
+# @vhost-user: vhost-user
+# @lkcf: Linux kernel cryptographic framework
+#
+# Since: 8.0
+##
+{ 'enum': 'QCryptodevBackendType',
+  'prefix': 'QCRYPTODEV_BACKEND_TYPE',
+  'data': ['builtin', 'vhost-user', 'lkcf']}
diff --git a/qapi/meson.build b/qapi/meson.build
index fbdb442fdf..1c37ae7491 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -56,6 +56,7 @@ if have_system
   qapi_all_modules += [
     'acpi',
     'audio',
+    'cryptodev',
     'qdev',
     'pci',
     'rdma',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index f000b90744..1e923945db 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -95,3 +95,4 @@
 { 'include': 'pci.json' }
 { 'include': 'stats.json' }
 { 'include': 'virtio.json' }
+{ 'include': 'cryptodev.json' }
-- 
2.34.1


