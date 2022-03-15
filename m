Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0124DA3B2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:06:36 +0100 (CET)
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDRD-00013J-I3
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:06:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDKO-00076v-Um
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:59:33 -0400
Received: from [2a00:1450:4864:20::32e] (port=41586
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDKN-0001aP-C7
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:59:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so260780wmf.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZtF1MQAa4iCSXLHpWS5V+NoLnI3TjzjClkDvwrw+iU=;
 b=QIrU4dxYQtO03B/W+f2jPDF+WGZ0k5IyAoqxMtHbjlBe6xaZhxVlqScvE8zg6t4ZQ4
 /GopX9rwirFmArKqlNHAjja+UvkOnW6lnuczGXQx8ZzUZpHAXUy1a86xcYmYlRhfk22J
 Hi9waRqiQivgCqnfDI3KEgYs33MB03Rx/3VqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZtF1MQAa4iCSXLHpWS5V+NoLnI3TjzjClkDvwrw+iU=;
 b=biG3paHtvnkX045erz3nvPlJzkN4f4CnZubFcbrZzB871ZdOSvhiWA3Y8utTlqGr92
 3d0qpFxYlt3QQYeizk1Xx7VfWQT2lxuCmHI/y5eeo7buUL+DPAcYGpad7eWHAX040KSU
 byLDtuk+1t1G6zz9jKsDSsOJBzCrfMVKqcQCk+0luXOEu2OXxsSDfyG9ppa1/90KFl/S
 6WgGe6SrpbsaPynnpGhq7L+UZiGrcMEP/fQ7zuBeC6Hm6T554GWgswLygQ5H6URkDCI5
 tzn5eAiOo7DfmCotuNOHfA9/mHR94f3fntDXUk3q6rp5QqYfsx1IRteX8J+IjB0XCG2/
 EN1w==
X-Gm-Message-State: AOAM533DjcrRXDwG2Dd+kgm0nb3sr48se3xZvufm4yseYvwDF9e6Lxyh
 L8ZFkrEwwH5ld/xRmZJsSYLjERThX3xKRBbS
X-Google-Smtp-Source: ABdhPJwr0vnEjm6NuhxL2qlGwPU7LLt/YVGOb5A7kkE56ayVAXqjpZBXmdBdMVzbOVKHARMf8haLIg==
X-Received: by 2002:a05:600c:4e94:b0:389:e8f5:642f with SMTP id
 f20-20020a05600c4e9400b00389e8f5642fmr4600839wmq.96.1647374369676; 
 Tue, 15 Mar 2022 12:59:29 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm785211wrr.54.2022.03.15.12.59.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 12:59:29 -0700 (PDT)
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
Subject: [PATCH v18 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Tue, 15 Mar 2022 22:59:12 +0300
Message-Id: <20220315195914.12107-6-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315195914.12107-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wm1-x32e.google.com
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
 net/vmnet-bridged.m | 128 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 91c1a2f2c7..5936c87718 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,134 @@
 
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
+static bool get_valid_ifnames(char *output_buf)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block const char *ifname = NULL;
+    __block int str_offset = 0;
+    bool interfaces_available = true;
+
+    if (!xpc_array_get_count(shared_if_list)) {
+        interfaces_available = false;
+        goto done;
+    }
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+            /* build list of strings like "en0 en1 en2 " */
+            ifname = xpc_string_get_string_ptr(value);
+            strcpy(output_buf + str_offset, ifname);
+            strcpy(output_buf + str_offset + strlen(ifname), " ");
+            str_offset += strlen(ifname) + 1;
+            return true;
+        });
+
+done:
+    xpc_release(shared_if_list);
+    return interfaces_available;
+}
+
+
+static bool validate_options(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    char ifnames[1024];
+
+    if (!validate_ifname(options->ifname)) {
+        if (get_valid_ifnames(ifnames)) {
+            error_setg(errp,
+                       "unsupported ifname '%s', expected one of [ %s]",
+                       options->ifname,
+                       ifnames);
+            return false;
+        }
+        error_setg(errp,
+                   "unsupported ifname '%s', no supported "
+                   "interfaces available",
+                   options->ifname);
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


