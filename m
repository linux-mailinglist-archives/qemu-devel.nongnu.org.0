Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8964DC453
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:54:25 +0100 (CET)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnlw-0007cu-7b
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:54:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUnOA-0007aG-2k
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:52 -0400
Received: from [2a00:1450:4864:20::230] (port=38506
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUnO0-0007C9-Fl
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:29:41 -0400
Received: by mail-lj1-x230.google.com with SMTP id s25so6612148lji.5
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szCPv1NoGNHohxBCjPkor32mkqdTjZtEVZo9Krv7Wa8=;
 b=fhf2jRol7Vxlq/eainUtjF2qM5zcEYLTYBK4afx7Mq0xsNW/ztWLQG6WjMR2iFOa6p
 gwAgUPVMfQdag7Rxt/eIOFBB4OdPf2eUMiBXMoYYtV1MG1YBkz5V1G9eG+QYKRge0ZFc
 REnPf0qCZphbnq2d3U25lJafXBpghP4LT4YZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szCPv1NoGNHohxBCjPkor32mkqdTjZtEVZo9Krv7Wa8=;
 b=pD2ngCOI6Nh9qLysrvieJMg8qHbHdKvnVJiU2eme329WtfwIeGD+OGdoT8+SMz1uQx
 ISx+w2RjhRPfgnBZr6sGHa2tkGnjarqyMx4NQue1RsThKe0xVuJlYazrOrj0gZTFAoDS
 abwBz3oYRvHUvlqo+x5L53SWm39qQra9FR/aI6zWaJFD180DOcG59nAi4fCBQZMOG+et
 Bsk8uKY4OBz6nvTVnbOX1/V9doJUCBJXD+5miNLtkmZVgK2/HJ2XJzRSTNUueywCegoi
 sVJH7IMK48/uksskfzmajjYf4mkGySfi6hLwP2ruOPF13Ujrui4XNh2+ZBUGfM/X1JOH
 YzsQ==
X-Gm-Message-State: AOAM531eVMVDBKN0x/KQS+1GYaJ/x7O9kfVt4GKxpf1RxyCvdyMCEf0S
 6mKqBpwtw3RgXyRB19dXrpqucxYf+aPWmHM0
X-Google-Smtp-Source: ABdhPJwAXZZPGt/tFXn/z6kVZGTaQMyXdZhuZrLzavwMkBAeMuq/vJHHxsyCw2z2KfYSc0CKc92tUQ==
X-Received: by 2002:a2e:8708:0:b0:246:12b7:e67d with SMTP id
 m8-20020a2e8708000000b0024612b7e67dmr2429087lji.24.1647512970222; 
 Thu, 17 Mar 2022 03:29:30 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a197115000000b0044895f0608asm413437lfc.37.2022.03.17.03.29.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:29:29 -0700 (PDT)
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
Subject: [PATCH v21 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Thu, 17 Mar 2022 13:28:30 +0300
Message-Id: <20220317102833.20775-5-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220317102833.20775-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220317102833.20775-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x230.google.com
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
 net/vmnet-host.c | 109 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index a461d507c5..e6d01fd65e 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,113 @@
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
+    if (!validate_options(netdev, errp)) {
+        return -1;
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev), errp);
 }
-- 
2.34.1.vfs.0.0


