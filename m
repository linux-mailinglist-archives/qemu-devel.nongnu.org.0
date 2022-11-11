Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E1625427
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNpA-0006as-NV; Fri, 11 Nov 2022 01:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNoo-0006Up-KC
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:18 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNok-0008Di-OU
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:13 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l6so3714106pjj.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upOk1cGisgMNYeCZpXZKpnoG2v3kRWP3UR8ECMzDAoM=;
 b=w6ul19p/lyL1NaIR/HKmUw5YkVI+dZfLDSxo7j9NQBerDPMSW0QkYkBHXo/gF9ON5z
 9yo3WC/4HicWMOIU0oZpLqjjL7SWsFaZQG4Y+po3LkmNht2q9ex8rDUVZDrio6UPSkDg
 kqEH6nJPjyBYc71nbnZJj81Uh7bIP97e/QQqRFTqFe1wyBlZ1wcYjWKW4vJT4A9dIPzv
 Gq0ZxQ6PB4WqvF1jIic+aolgLkvCWpVDT9Y1yVddawRH2K7uqGkaKa6Q62TbeLrW9tfI
 cA0MXe/A56dHIiDmRsbRJEouMqXqk+hceP4Er4dYC36iAfIf3A2PEsEJcL6Id5k+zzsN
 66zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upOk1cGisgMNYeCZpXZKpnoG2v3kRWP3UR8ECMzDAoM=;
 b=kDEvcx76pBNSf2z+Z8t8kYaW2Lh7vrqjU5jM2J/fOLXQuFF677cX4ecMhwaDtjE98V
 tOdwP6vvg6S+EkufDT6D7cRumBvzoMJRFQPcr3o1VFvujShu76zdiqnE3KOp34IW8Ksn
 D432DCgtqLEG0hs3drYvMNwb8gm2n131ZCshJ8pRsyDFHNkjKQHgNveh034RnjbVSq6A
 NTBtxom0TH7oolYHoIONfGtdtb0yW3Wf8jCN1/vC7tq5bLFdMzzq8wbm0uW/t69+hcUT
 K4PbxHYGB0llCiKd2P6uZlzoAIqvMGaQesrDv08KYnELwrqmC/A7vRmSjp9zPL1GOulg
 rAyQ==
X-Gm-Message-State: ANoB5pmV+FW7RIg0jyz3LLYcbW9GConUusltAbRcWBpnkb61G/lNNgJ8
 RSz1H+YCxey7mG1j7mWR/QNNog==
X-Google-Smtp-Source: AA0mqf40f8JCcLTx3gJ7pJvwqCJhhXR5NxcgYDaC/ZaMQmv3bHt+dfXImNmnwllmcUsgFWK+dUTCzw==
X-Received: by 2002:a17:903:41d0:b0:188:5e78:be0 with SMTP id
 u16-20020a17090341d000b001885e780be0mr1313747ple.18.1668149229103; 
 Thu, 10 Nov 2022 22:47:09 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:08 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 1/8] cryptodev: Introduce cryptodev.json
Date: Fri, 11 Nov 2022 14:45:46 +0800
Message-Id: <20221111064553.246932-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
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

Introduce QCryptodevBackendType in cryptodev.json, also apply this to
related codes. Then we can drop 'enum CryptoDevBackendOptionsType'.

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
index caba73ec41..3f698cb0e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2830,6 +2830,7 @@ M: Gonglei <arei.gonglei@huawei.com>
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
index bc13e466b4..0715014552 100644
--- a/backends/cryptodev-vhost.c
+++ b/backends/cryptodev-vhost.c
@@ -128,7 +128,7 @@ cryptodev_get_vhost(CryptoDevBackendClient *cc,
 
     switch (cc->type) {
 #if defined(CONFIG_VHOST_USER) && defined(CONFIG_LINUX)
-    case CRYPTODEV_BACKEND_TYPE_VHOST_USER:
+    case QCRYPTODEV_BACKEND_TYPE_VHOST_USER:
         vhost_crypto = cryptodev_vhost_user_get_vhost(cc, b, queue);
         break;
 #endif
@@ -196,7 +196,7 @@ int cryptodev_vhost_start(VirtIODevice *dev, int total_queues)
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
index 9a36c15c04..b5069f34f8 100644
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
2.20.1


