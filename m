Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C74DCC8A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:33:44 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUu0N-0008Db-9Z
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:33:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvn-0005EU-J6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:28:59 -0400
Received: from [2a00:1450:4864:20::42e] (port=38718
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvl-0005pG-MM
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:28:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t11so8349206wrm.5
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N7jxl9IJabQb5RHI342NB+w46lkSKPcHwI1FMg6qPKY=;
 b=SAYW2HMkfVM6ClvbXdkQYipJybsMxb4euXzwcrh7Xc/ru183nbYGxxHMT3UzQv2Kwy
 SUoooyVsPHzNE19k0pwX7nZ62FtIYd9IPDo4380lhHdiT8/PJdZESr27mi+DrWpQ1b7d
 ggk49QZn4ewHnu6X+PNn1kucGtj9gBxP+QZmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N7jxl9IJabQb5RHI342NB+w46lkSKPcHwI1FMg6qPKY=;
 b=PUtYI6r+sRLt9i2IwBlrhUGLpOUA+C5FTvLms5eMPK2EmuDiXQKzB3n5Y+keN2zhc3
 F4VzZ0oCnCGdcvG9IFZ0Pqb4HBE8lz0uWa4hBIpMKRAZygUxXFvjdji3KSxRcruNyrRq
 Emnzs792HhqR9tkAf5VkMikbjcYNWYSYf6MOlkRVLb9+42mO3yPLlAOvvgOzaKtGf6Yh
 hdfrkLux+L8QTs2+9K9uEtTy6VG4dNJXM22ye99Do3gJnNCsIH1QfWdr71wPp3DsipXy
 /92GKYAvwsiv5A9uAz02tmO1IU5wO/cMj5tZRnRnU4rE2jJynX9KP8wCK2vfgkwpBjAM
 UXcQ==
X-Gm-Message-State: AOAM531LOOEPzPdBlwlhHQZTu91w1yHomYWGHlf5y3VMVB9vc7zMoNaj
 qKWDr0pbEEKzoBOOwBdsYRipgbxqN9Xeni7PrlU=
X-Google-Smtp-Source: ABdhPJxBXgh3tNerl9A9LRai6KUA1Ksqs0/j35g9YZ2lGIQKX1FGJQIi0h0/qvgZI650C9F+GxkQNA==
X-Received: by 2002:a5d:64e6:0:b0:203:731b:c2d0 with SMTP id
 g6-20020a5d64e6000000b00203731bc2d0mr5108559wri.607.1647538135636; 
 Thu, 17 Mar 2022 10:28:55 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm4890702wmz.43.2022.03.17.10.28.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:28:55 -0700 (PDT)
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
Subject: [PATCH v22 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Thu, 17 Mar 2022 20:28:36 +0300
Message-Id: <20220317172839.28984-5-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x42e.google.com
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
 net/vmnet-host.c | 116 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index a461d507c5..05f8d78864 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,120 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/uuid.h"
 #include "qapi/qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "clients.h"
+#include "vmnet_int.h"
 
 #include <vmnet/vmnet.h>
 
+
+static bool validate_options(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+
+    QemuUUID net_uuid;
+    if (options->has_net_uuid &&
+        qemu_uuid_parse(options->net_uuid, &net_uuid) < 0) {
+        error_setg(errp, "Invalid UUID provided in 'net-uuid'");
+        return false;
+    }
+#else
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-host.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+        return false;
+    }
+
+    if (options->has_net_uuid) {
+        error_setg(errp,
+                   "vmnet-host.net-uuid feature is "
+                   "unavailable: outdated vmnet.framework API");
+        return false;
+    }
+#endif
+
+    if ((options->has_start_address ||
+         options->has_end_address ||
+         options->has_subnet_mask) &&
+        !(options->has_start_address &&
+          options->has_end_address &&
+          options->has_subnet_mask)) {
+        error_setg(errp,
+                   "'start-address', 'end-address', 'subnet-mask' "
+                   "should be provided together");
+        return false;
+    }
+
+    return true;
+}
+
+static xpc_object_t build_if_desc(const Netdev *netdev)
+{
+    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(if_desc,
+                              vmnet_operation_mode_key,
+                              VMNET_HOST_MODE);
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+
+    xpc_dictionary_set_bool(if_desc,
+                            vmnet_enable_isolation_key,
+                            options->isolated);
+
+    QemuUUID net_uuid;
+    if (options->has_net_uuid) {
+        qemu_uuid_parse(options->net_uuid, &net_uuid);
+        xpc_dictionary_set_uuid(if_desc,
+                                vmnet_network_identifier_key,
+                                net_uuid.data);
+    }
+#endif
+
+    if (options->has_start_address) {
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_start_address_key,
+                                  options->start_address);
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_end_address_key,
+                                  options->end_address);
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_subnet_mask_key,
+                                  options->subnet_mask);
+    }
+
+    return if_desc;
+}
+
+static NetClientInfo net_vmnet_host_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_HOST,
+    .size = sizeof(VmnetState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
 int net_init_vmnet_host(const Netdev *netdev, const char *name,
-                        NetClientState *peer, Error **errp) {
-  error_setg(errp, "vmnet-host is not implemented yet");
-  return -1;
+                        NetClientState *peer, Error **errp)
+{
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_host_info,
+                                             peer, "vmnet-host", name);
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


