Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D284DC45A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:56:58 +0100 (CET)
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnoQ-0002AF-42
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:56:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUnOA-0007aJ-Jw
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:53 -0400
Received: from [2a00:1450:4864:20::229] (port=37508
 helo=mail-lj1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUnO0-0007CM-FU
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:43 -0400
Received: by mail-lj1-x229.google.com with SMTP id r22so6626985ljd.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFQF/s0PHcJKQu5NMQl2S+TebRUYeZokmleaW/O43uQ=;
 b=JJgtVLlHwkmbWNQzO+D1EjOEeJarTd+/9DrASQoK4wypjhE9zINBXBg2CouNLZHeJ/
 KwBkc6I46hpP4J6/sYmK+W6w40vqmfSkoP1RE2tk/5AlUeQXoYft363mTeFi9UKognXc
 3iBIUZLOI4xcDu9V1joDhUti+OLmr4gPCOwz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFQF/s0PHcJKQu5NMQl2S+TebRUYeZokmleaW/O43uQ=;
 b=Rnr776XAGJB1WwiM3DKnPgLYophc0IJWY/Fem8VoTdBMFt36I55kdsKVxW47isgWpr
 L0OOTL0H91jVrJR5Ze0SHorT2z16t7i3q9qhY8pZ4a8+rFj2e5UVb1xwr8kofhDegRRv
 Z8E4IkD3LpxUMyYgSS8+hNqAc8eIXRYe1VZcT3yVTGJ05sn1y3S2jQV7FKAyMjNKxLd8
 vVHJhMc5pNUqEbAXm7QYFhAS1AHN+hLTjL+nYMgnzzbekjviYuFOsF+KQ8Vu9VNya19y
 IrZXiWVG+uEEmFjKbudCE2pexSXTnpAvJ8MK4mtOTwhGYwfNBI02rrbXwyO1P+5XC81l
 ztAA==
X-Gm-Message-State: AOAM530ej80MglIQAm8dnMYJGf5CBrYNUMzUcjBEvanVT8vpLqkskbcM
 rscjXOq2j039Vsh8qOslAPBsNy6CckEt4afl
X-Google-Smtp-Source: ABdhPJw3RF6zqJXaUJ0CwaBCACLD3XCPeCLToWmoRU1+IMiSy/98PQ8Wut7SBMGqnrc1b/Y6N2TnRQ==
X-Received: by 2002:a2e:b754:0:b0:247:eb1b:9370 with SMTP id
 k20-20020a2eb754000000b00247eb1b9370mr2495911ljo.302.1647512971924; 
 Thu, 17 Mar 2022 03:29:31 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a197115000000b0044895f0608asm413437lfc.37.2022.03.17.03.29.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:29:31 -0700 (PDT)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v21 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Thu, 17 Mar 2022 13:28:31 +0300
Message-Id: <20220317102833.20775-6-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220317102833.20775-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220317102833.20775-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::229
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 net/vmnet-bridged.m | 130 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 5 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 91c1a2f2c7..6970c7d17b 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,136 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "clients.h"
+#include "vmnet_int.h"
 
 #include <vmnet/vmnet.h>
 
+
+static bool validate_ifname(const char *ifname)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    bool match = false;
+    if (!xpc_array_get_count(shared_if_list)) {
+        goto done;
+    }
+
+    match = !xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+            return strcmp(xpc_string_get_string_ptr(value), ifname) != 0;
+        });
+
+done:
+    xpc_release(shared_if_list);
+    return match;
+}
+
+
+static char* get_valid_ifnames()
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block char *if_list = NULL;
+    __block char *if_list_prev = NULL;
+
+    if (!xpc_array_get_count(shared_if_list)) {
+        goto done;
+    }
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+            /* build list of strings like "en0 en1 en2 " */
+            if_list = g_strconcat(xpc_string_get_string_ptr(value),
+                                  " ",
+                                  if_list_prev,
+                                  NULL);
+            g_free(if_list_prev);
+            if_list_prev = if_list;
+            return true;
+        });
+
+done:
+    xpc_release(shared_if_list);
+    return if_list;
+}
+
+
+static bool validate_options(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    char* if_list;
+
+    if (!validate_ifname(options->ifname)) {
+        if_list = get_valid_ifnames();
+        if (if_list) {
+            error_setg(errp,
+                       "unsupported ifname '%s', expected one of [ %s]",
+                       options->ifname,
+                       if_list);
+            g_free(if_list);
+        } else {
+            error_setg(errp,
+                       "unsupported ifname '%s', no supported "
+                       "interfaces available",
+                       options->ifname);
+        }
+        return false;
+    }
+
+#if !defined(MAC_OS_VERSION_11_0) || \
+    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-bridged.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+        return false;
+    }
+#endif
+    return true;
+}
+
+
+static xpc_object_t build_if_desc(const Netdev *netdev)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(if_desc,
+                              vmnet_operation_mode_key,
+                              VMNET_BRIDGED_MODE
+    );
+
+    xpc_dictionary_set_string(if_desc,
+                              vmnet_shared_interface_name_key,
+                              options->ifname);
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    xpc_dictionary_set_bool(if_desc,
+                            vmnet_enable_isolation_key,
+                            options->isolated);
+#endif
+    return if_desc;
+}
+
+
+static NetClientInfo net_vmnet_bridged_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
+    .size = sizeof(VmnetState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
+
 int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
                            NetClientState *peer, Error **errp)
 {
-  error_setg(errp, "vmnet-bridged is not implemented yet");
-  return -1;
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_bridged_info,
+                                             peer, "vmnet-bridged", name);
+    if (!validate_options(netdev, errp)) {
+        return -1;
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev), errp);
 }
-- 
2.34.1.vfs.0.0


