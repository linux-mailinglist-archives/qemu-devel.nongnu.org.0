Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E014DCC94
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:36:05 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUu2e-0004Iy-2e
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:36:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvp-0005JP-3A
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:29:01 -0400
Received: from [2a00:1450:4864:20::332] (port=38455
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvn-0005pY-A4
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:29:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so5332000wms.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0CdD7C6TpsG19EAdUyMnd8ks0l2mSTC3DZoTnD40ao=;
 b=JkaHpjQjbNJ6ANwvHXzXbxkbpQwRQnID8NdOxy0O4NbXbyqpcqOZZp4gD2cPoBwvY/
 G6hL/Vr5sHW5vEm14w2IDBzpmx/uGyPurF6ou7eUnAZ79XIj/hVv4deYjzF7W+UwQCzS
 4AmOY0wZmTUXG5WtdaiaFAoMUpJ5Y//gJXe4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0CdD7C6TpsG19EAdUyMnd8ks0l2mSTC3DZoTnD40ao=;
 b=x9bGEqR/+ME4umJnePe/4TAT7zdONIAO4QAhRJHMnlFoEgioRDhRwh8DP0J2dTotG9
 90mr/jvM6hYPkWf2AQl3xXRf0neH3nXegvIFffCzqIX+LyEK/Jp0DhtUPfAe+KwgOobl
 K+n7diY4YYFj50KFT4Yl9rkRH9sqzzRdAdczwO/K/QT7vNUEg+SAaVutmXQ+tIqHOdly
 yCDjUMcmQVI9z5DtA6ty7DaH638SNxVq4yeh5ua9u+pmROsJEVmDvCGj9Gd8s+zOq7UT
 12lZmojYZ0wPhlq1eHE5g3+xcD2OjtZIAnALdjaNqrgeD8HEYVjpQOYIG5ReL6ojq4Gg
 pPpA==
X-Gm-Message-State: AOAM5305yGMId3d2rQKjW3eFrq1By3O4BN8t89Tf+gjcbxYrujFQOylq
 HVYvzK1BcoNvo7/OX9x9vvqYrwf+u77eOsXKR8A=
X-Google-Smtp-Source: ABdhPJzqhQDE4/7YEX1cHrHp+i4Yjqq518PYNXgt7upVxaHsIQ27pmV7/YV2Ct7uhnXF6s70rm8Rpg==
X-Received: by 2002:a1c:7518:0:b0:381:c77:ceec with SMTP id
 o24-20020a1c7518000000b003810c77ceecmr4974554wmc.57.1647538137659; 
 Thu, 17 Mar 2022 10:28:57 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm4890702wmz.43.2022.03.17.10.28.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:28:57 -0700 (PDT)
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
Subject: [PATCH v22 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Thu, 17 Mar 2022 20:28:37 +0300
Message-Id: <20220317172839.28984-6-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wm1-x332.google.com
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
 net/vmnet-bridged.m | 137 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 132 insertions(+), 5 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 91c1a2f2c7..46d2282863 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,143 @@
 
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
+    xpc_object_t if_desc;
+    int result = -1;
+
+    if (!validate_options(netdev, errp)) {
+        return result;
+    }
+
+    if_desc = build_if_desc(netdev);
+    result = vmnet_if_create(nc, if_desc, errp);
+    xpc_release(if_desc);
+    return result;
 }
-- 
2.34.1.vfs.0.0


