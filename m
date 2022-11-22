Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042C633E63
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:05:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTt7-0008Qq-GJ; Tue, 22 Nov 2022 09:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTt4-0008QL-CZ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:34 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTt2-00061b-F2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:34 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 v3-20020a17090ac90300b00218441ac0f6so1617735pjt.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upOk1cGisgMNYeCZpXZKpnoG2v3kRWP3UR8ECMzDAoM=;
 b=10w6f4hClSaSMa9V6gwjtQ+wdehIC5Bd3wgdjLFgOZlUuM3OYr0tbJOg9hnlJ0a3c3
 WfWnoPyoguRTSXnvqHQAeSfmdhm/safZLDapnG6BBl1S7qgfc8iJjMc0Dx26NgUetJUR
 tCq/D/GS5a5SDC5plYBHaNtaU4yntJWLvYefRPx4ts6+JFRzKlkDrYCPf7Tv0FudhDhq
 YEyRtP+IV36YSpCO1hk5ZxgsmUExt+Jl+FO7Mep2iP5dgEJTF7N0iTKdPlUJUyEy00v4
 Tbvp1yxDS71o0X/ND7XOSsCVJeX64q0aVV5cklXdpQF+hfTk7euiFV4aw7g1JbsafsTi
 0K3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upOk1cGisgMNYeCZpXZKpnoG2v3kRWP3UR8ECMzDAoM=;
 b=fKqxwAF9g7hELDf7QRteF5X0iidXTNkPca9aXmQRPonh+W4Z5x9vYBkxTNbQLa5zfO
 LrS+HLvFjZn50GkTWUH5sDxKWbBZH7V6FmwtLPjMVzO2RiwU6Xu6BRhJqyrO+yxMaWfD
 mRU8BVDMa7fj0VT6MNcvOonGSf4g6l8ouTVuI0si5GR0Cp0oJNlVNA0+y7i8hTkrHIqC
 mTSINJTRkukglLr2/O4xiP7QJW+1mtebQbtkHNnIa+Yal4ClkVjAQyNGXYkQEQ2L1GMU
 dS5WyrHSDyl34w99EaFYWkgpfFiZJlYkcvjyfRPcwKc6Emf5pQuQttp2pOAWK+2QXIaE
 v7hg==
X-Gm-Message-State: ANoB5pnwIfGe0aOd8AyUUGra7VWxobgf4ENDzymacbyqPk3VBVfPfeEB
 TbSd2q6t9O4w/4jGDfn5emy3tA==
X-Google-Smtp-Source: AA0mqf5jeCiNJAy9tm0jlG7I63ypk9YBeytk3aUEiVfWGQqEVY9RErQYfVIiT6wAx81hCd0CkxYGaA==
X-Received: by 2002:a17:902:c385:b0:186:944a:2560 with SMTP id
 g5-20020a170902c38500b00186944a2560mr4951542plg.84.1669125870795; 
 Tue, 22 Nov 2022 06:04:30 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:30 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 01/11] cryptodev: Introduce cryptodev.json
Date: Tue, 22 Nov 2022 22:07:46 +0800
Message-Id: <20221122140756.686982-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1029.google.com
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


