Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8254E8C1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:46:51 +0200 (CEST)
Received: from localhost ([::1]:38370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1tZx-0000jq-Uo
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1o1tYF-0008Cb-SS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:45:04 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:38478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1o1tYE-0005vE-1n
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:45:03 -0400
Received: by mail-pf1-f177.google.com with SMTP id e11so2110894pfj.5
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 10:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RW52G6P5qKTqp7EJWCPC9a59NS+1zzzbWdeTEa2LiOc=;
 b=lpbHQ7wmxZoDRkgiL+3or5I0R1SG8tNyoMkI4ekIL1NmuUdNJ83AW0Y9Gb/xyLDbSM
 9GkeLAzZGRFzNLLt9ZEgBDwSHQDXzkhcWf2lk327y7+OFrIrX/00eSdpZIzV9FQAYnuV
 3ZW2qEg+zDwVZCs14p9ZB3i1gD3jpC5jB13+GE9l+UETLdyn/mvlCmcUJjPCcu58/ugD
 4IiU3mNUhcxfQlmA3tfIO2ohZ/Rmx/GRHKA/q2QZoHvc3vgbhlMn/hEueu39/S3zL07+
 KFQQ8QFtJW5q9ivcAkr9etb76lOiMZNQKBIp9XGTaeD733X6+SzN7A9jpRrTTvlwHSwR
 Z35g==
X-Gm-Message-State: AJIora90ucdnStt6eWCgBxBFAX4gpsJ0p6C4dm9ZPWBbpbJmJI7Sog5l
 eu8i0ekqlyp8VqSUs5jtSlCnqzxc/Dg=
X-Google-Smtp-Source: AGRyM1sw6pUApsMUEKtPIJXM159JlwdFv841qx07gN6YhErTd0Te5okoBVWaC9tVud9LGKKAC1hWVw==
X-Received: by 2002:a63:5424:0:b0:405:230e:3d9f with SMTP id
 i36-20020a635424000000b00405230e3d9fmr5273645pgb.271.1655401499953; 
 Thu, 16 Jun 2022 10:44:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c0a:168e:b09a:ace7:6d4b:3e2f])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a637b15000000b003fc32f8e030sm2062837pgc.79.2022.06.16.10.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 10:44:59 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] net/vmnet: use availability check at runtime
Date: Thu, 16 Jun 2022 10:44:57 -0700
Message-Id: <20220616174457.40639-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.177; envelope-from=osy86dev@gmail.com;
 helo=mail-pf1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MAC_OS_X_VERSION_MIN_REQUIRED is set at compile time so this means that when
we target an older macOS version, it disables the newer features. With a
runtime check, we can selectively disable newer API features.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 net/vmnet-host.c    | 70 +++++++++++++++++++++------------------------
 net/vmnet-shared.c  | 32 ++++++++++-----------
 net/vmnet-bridged.m | 29 ++++++++++---------
 net/vmnet-common.m  |  2 +-
 4 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 05f8d78864..400b670a96 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -22,31 +22,29 @@ static bool validate_options(const Netdev *netdev, Error **errp)
 {
     const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
 
-#if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
-
-    QemuUUID net_uuid;
-    if (options->has_net_uuid &&
-        qemu_uuid_parse(options->net_uuid, &net_uuid) < 0) {
-        error_setg(errp, "Invalid UUID provided in 'net-uuid'");
-        return false;
-    }
-#else
-    if (options->has_isolated) {
-        error_setg(errp,
-                   "vmnet-host.isolated feature is "
-                   "unavailable: outdated vmnet.framework API");
-        return false;
+    if (__builtin_available(macOS 11, *)) {
+        QemuUUID net_uuid;
+        if (options->has_net_uuid &&
+            qemu_uuid_parse(options->net_uuid, &net_uuid) < 0) {
+            error_setg(errp, "Invalid UUID provided in 'net-uuid'");
+            return false;
+        }
+    } else {
+        if (options->has_isolated) {
+            error_setg(errp,
+                       "vmnet-host.isolated feature is "
+                       "unavailable: outdated vmnet.framework API");
+            return false;
+        }
+
+        if (options->has_net_uuid) {
+            error_setg(errp,
+                       "vmnet-host.net-uuid feature is "
+                       "unavailable: outdated vmnet.framework API");
+            return false;
+        }
     }
 
-    if (options->has_net_uuid) {
-        error_setg(errp,
-                   "vmnet-host.net-uuid feature is "
-                   "unavailable: outdated vmnet.framework API");
-        return false;
-    }
-#endif
-
     if ((options->has_start_address ||
          options->has_end_address ||
          options->has_subnet_mask) &&
@@ -71,21 +69,19 @@ static xpc_object_t build_if_desc(const Netdev *netdev)
                               vmnet_operation_mode_key,
                               VMNET_HOST_MODE);
 
-#if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
-
-    xpc_dictionary_set_bool(if_desc,
-                            vmnet_enable_isolation_key,
-                            options->isolated);
-
-    QemuUUID net_uuid;
-    if (options->has_net_uuid) {
-        qemu_uuid_parse(options->net_uuid, &net_uuid);
-        xpc_dictionary_set_uuid(if_desc,
-                                vmnet_network_identifier_key,
-                                net_uuid.data);
+    if (__builtin_available(macOS 11, *)) {
+        xpc_dictionary_set_bool(if_desc,
+                                vmnet_enable_isolation_key,
+                                options->isolated);
+
+        QemuUUID net_uuid;
+        if (options->has_net_uuid) {
+            qemu_uuid_parse(options->net_uuid, &net_uuid);
+            xpc_dictionary_set_uuid(if_desc,
+                                    vmnet_network_identifier_key,
+                                    net_uuid.data);
+        }
     }
-#endif
 
     if (options->has_start_address) {
         xpc_dictionary_set_string(if_desc,
diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
index 18cadc72bd..319bcac002 100644
--- a/net/vmnet-shared.c
+++ b/net/vmnet-shared.c
@@ -21,15 +21,16 @@ static bool validate_options(const Netdev *netdev, Error **errp)
 {
     const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
 
-#if !defined(MAC_OS_VERSION_11_0) || \
-    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
-    if (options->has_isolated) {
-        error_setg(errp,
-                   "vmnet-shared.isolated feature is "
-                   "unavailable: outdated vmnet.framework API");
-        return false;
+    if (__builtin_available(macOS 11, *)) {
+        /* clang requires this to be in the true branch */
+    } else {
+        if (options->has_isolated) {
+            error_setg(errp,
+                       "vmnet-shared.isolated feature is "
+                       "unavailable: outdated vmnet.framework API");
+            return false;
+        }
     }
-#endif
 
     if ((options->has_start_address ||
          options->has_end_address ||
@@ -76,14 +77,13 @@ static xpc_object_t build_if_desc(const Netdev *netdev)
                                   options->subnet_mask);
     }
 
-#if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
-    xpc_dictionary_set_bool(
-        if_desc,
-        vmnet_enable_isolation_key,
-        options->isolated
-    );
-#endif
+    if (__builtin_available(macOS 11, *)) {
+        xpc_dictionary_set_bool(
+            if_desc,
+            vmnet_enable_isolation_key,
+            options->isolated
+        );
+    }
 
     return if_desc;
 }
diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 46d2282863..239d4e64c8 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -88,15 +88,16 @@ static bool validate_options(const Netdev *netdev, Error **errp)
         return false;
     }
 
-#if !defined(MAC_OS_VERSION_11_0) || \
-    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
-    if (options->has_isolated) {
-        error_setg(errp,
-                   "vmnet-bridged.isolated feature is "
-                   "unavailable: outdated vmnet.framework API");
-        return false;
+    if (__builtin_available(macOS 11, *)) {
+        // clang requires a true branch
+    } else {
+        if (options->has_isolated) {
+            error_setg(errp,
+                       "vmnet-bridged.isolated feature is "
+                       "unavailable: outdated vmnet.framework API");
+            return false;
+        }
     }
-#endif
     return true;
 }
 
@@ -115,12 +116,12 @@ static xpc_object_t build_if_desc(const Netdev *netdev)
                               vmnet_shared_interface_name_key,
                               options->ifname);
 
-#if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
-    xpc_dictionary_set_bool(if_desc,
-                            vmnet_enable_isolation_key,
-                            options->isolated);
-#endif
+    if (__builtin_available(macOS 11, *)) {
+        xpc_dictionary_set_bool(if_desc,
+                                vmnet_enable_isolation_key,
+                                options->isolated);
+    }
+
     return if_desc;
 }
 
diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index 2cb60b9ddd..ed376483b9 100644
--- a/net/vmnet-common.m
+++ b/net/vmnet-common.m
@@ -47,7 +47,7 @@
     case VMNET_TOO_MANY_PACKETS:
         return "packet count exceeds limit";
 #if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
     case VMNET_SHARING_SERVICE_BUSY:
         return "conflict, sharing service is in use";
 #endif
-- 
2.28.0


