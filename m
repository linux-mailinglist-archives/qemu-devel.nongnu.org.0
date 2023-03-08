Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6136AFBCE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:11:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKc-0007wP-Fb; Tue, 07 Mar 2023 20:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKa-0007w3-Oh
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKY-0001Tu-Ll
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McBtSOGEBTJvsblVq2tLEPlzp+2+oHjiJJpbaZ1J1gc=;
 b=QARiOaS+JBgS9WL4xhWyLxyaS5udh0DSufG+JUElefyIRaJAnruns5tu2CMOESt4Cx3ta4
 N1XUDErawdmQyhnbMMoIu8Yh198gtjA2qZhxMB/sNGVBV5CMbfEVoTI/TS7E/rgqSEV2oX
 mX52L1IMWvFK6KHzzzIjDzNtsie7FDw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-ZDQD6XP2NkSWlowl8fgffQ-1; Tue, 07 Mar 2023 20:10:56 -0500
X-MC-Unique: ZDQD6XP2NkSWlowl8fgffQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so113772wms.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237854;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=McBtSOGEBTJvsblVq2tLEPlzp+2+oHjiJJpbaZ1J1gc=;
 b=yu5qlTcst+3YRKSSDtALrkYA1N+qgCY3/SUtCdQ5nliSxTqq/+n83TQk+FvSyVeh0y
 p/Wnw7bB8qyKjCygRmK6gLcQSm6zVN7c/hXke/YHJClPSVtFCL8IQ44Mp3Sm7pujhgRM
 yv8NGQo/owW8ITXEUrSiPDJtvJQ7gABc71KhY4yEwwHN7iKp983fm5eCkyxBbz7H4xXH
 ZAc1NFW3/zriQ4nzKHpmFizn21owDtolIiGbcXdWHJfjtW3TJtaLli9K5wLPixqlN1IX
 ZRZOmSukgc2JS001MUm31r/BskOSH9KBxRztKJ00w+jGdt0IgjcBu9i63lRclQ7MT3Vj
 ck+A==
X-Gm-Message-State: AO0yUKVLhIYx+EpD+gz/IAwmAonLKZ5agrDW++by41VB7SYmAWqzDgI1
 u6BC1UefxCMBeybBJmP7MgUO00Yyo3TuMzhrishSAbUsVU9IVf1qH9U3hjj49Tjg7ZPcaI62tYV
 UaREjN+4P2AAesKnMgRWMTx/MSkL+3mhEqMz2iY3qVOMObZPTrkYygN4OKSrjEfelSYnM
X-Received: by 2002:a5d:624a:0:b0:2c8:42b5:8022 with SMTP id
 m10-20020a5d624a000000b002c842b58022mr8288236wrv.59.1678237854319; 
 Tue, 07 Mar 2023 17:10:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8UtbTy9SVhu0dz4ps+FopnDKgWKrkS6ZWJgj9tr3J3ZX6xAkLyF68+uV4ZMxpWkuZKeVXeBA==
X-Received: by 2002:a5d:624a:0:b0:2c8:42b5:8022 with SMTP id
 m10-20020a5d624a000000b002c842b58022mr8288217wrv.59.1678237853973; 
 Tue, 07 Mar 2023 17:10:53 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d4445000000b002c70a0e2cd0sm13666743wrr.101.2023.03.07.17.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:10:53 -0800 (PST)
Date: Tue, 7 Mar 2023 20:10:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PULL 01/73] cryptodev: Introduce cryptodev.json
Message-ID: <14c9fd1673ac8c6855a93c882870da8403b5a5d6.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: zhenwei pi <pizhenwei@bytedance.com>

Introduce QCryptodevBackendType in cryptodev.json, also apply this to
related codes. Then we can drop 'enum CryptoDevBackendOptionsType'.

Note that `CRYPTODEV_BACKEND_TYPE_NONE` is *NOT* used by anywhere, so
drop it(no 'none' enum in QCryptodevBackendType).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-2-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/cryptodev.json             | 20 ++++++++++++++++++++
 qapi/qapi-schema.json           |  1 +
 include/sysemu/cryptodev.h      | 11 ++---------
 backends/cryptodev-builtin.c    |  2 +-
 backends/cryptodev-lkcf.c       |  2 +-
 backends/cryptodev-vhost-user.c |  4 ++--
 backends/cryptodev-vhost.c      |  4 ++--
 MAINTAINERS                     |  1 +
 qapi/meson.build                |  1 +
 9 files changed, 31 insertions(+), 15 deletions(-)
 create mode 100644 qapi/cryptodev.json

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
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index f000b90744..1e923945db 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -95,3 +95,4 @@
 { 'include': 'pci.json' }
 { 'include': 'stats.json' }
 { 'include': 'virtio.json' }
+{ 'include': 'cryptodev.json' }
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 5340de0515..cbb05de8eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2879,6 +2879,7 @@ M: Gonglei <arei.gonglei@huawei.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
+F: qapi/cryptodev.json
 
 Python library
 M: John Snow <jsnow@redhat.com>
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
-- 
MST


