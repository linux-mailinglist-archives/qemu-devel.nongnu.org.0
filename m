Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B84D8C4E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:24:25 +0100 (CET)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqIq-0001xb-Rs
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:24:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqEy-0002CS-P0
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:25 -0400
Received: from [2a00:1450:4864:20::135] (port=42746
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTqEw-0007YZ-DW
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:20:24 -0400
Received: by mail-lf1-x135.google.com with SMTP id w12so28972417lfr.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bldcpQT+sy+effbJSIiwZFeRHg8UnTp+AnEmVA8W8PU=;
 b=dFOhrluP3tQ5+i1KZDF9vsU5bymUbWN33LB4/KT6stLXjZZxq7buZRD2FBXFoAVpvH
 SQSOD+61o1/lwFyzHbGyP/LmwB+vLfnH505FwMMDqfCi/ePQJfTg/seQc8rPn7jzZCwR
 tgZd12TkdFX2QO3o6mtjrgvCppXHhlEFYKSCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bldcpQT+sy+effbJSIiwZFeRHg8UnTp+AnEmVA8W8PU=;
 b=YmqcMwYKlkTq8DFz8UH8yCDhtCK43rkiZjDXvs2ZBVshbs+9FutRJ7RkntPsCo0wqN
 UQLrufLNGKZ0L4N+BkTKzRlZ3QZ0wrveGpCu2fDSGrJptaCV1whf0QoyWKyrvSoBtnVn
 sRDv7EkGcJjK8nsFi7qaC1IhG8LWrWBZqYqkdNfqdJqiqAZCBjoC+TPjuPoBFBTiiA/E
 zt2xsl3y7Udfiqtyww4s1AuZbFy8BkGv28rYVQppYI3sMDOyy2ykvGzZaj16Zy22EpIO
 UKihrnJOCO452P4Rcca3OQ6Xd6fTKDUhbHdQEgP2BMo2OCYxSGKG/1caa2im9Rpf93nd
 0Trg==
X-Gm-Message-State: AOAM5331nPYsS4MU2y5GyRZOMU3SNvqjVogA/kj1nAsbHZunPMyj/U47
 VRR2bSX5oeX4L546/QKNq3gMnYz8VbJb5JxT
X-Google-Smtp-Source: ABdhPJwKENEBEG9m8fRZ70+P7wYIeDjb5wD0AGlulBBaX10n7SHaHHvo8DdlQgd6xOZzvkRDQeC4kg==
X-Received: by 2002:a19:430a:0:b0:445:b7f5:de35 with SMTP id
 q10-20020a19430a000000b00445b7f5de35mr13957276lfa.41.1647285619407; 
 Mon, 14 Mar 2022 12:20:19 -0700 (PDT)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a196e0f000000b0044827945789sm3414454lfc.155.2022.03.14.12.20.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:20:19 -0700 (PDT)
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
Subject: [PATCH v16 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Mon, 14 Mar 2022 22:15:42 +0300
Message-Id: <20220314191545.81861-5-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x135.google.com
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
index 32dc437037..15a832701a 100644
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
 
+typedef struct VmnetHostState {
+    VmnetCommonState cs;
+    QemuUUID network_uuid;
+} VmnetHostState;
+
+static bool validate_options(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
+    QemuUUID uuid;
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+
+    if (options->has_net_uuid &&
+        qemu_uuid_parse(options->net_uuid, &uuid) < 0) {
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
+static xpc_object_t build_if_desc(const Netdev *netdev,
+                                  NetClientState *nc)
+{
+    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
+    VmnetCommonState *cs = DO_UPCAST(VmnetCommonState, nc, nc);
+    VmnetHostState *hs = DO_UPCAST(VmnetHostState, cs, cs);
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
+    if (options->has_net_uuid) {
+        qemu_uuid_parse(options->net_uuid, &hs->network_uuid);
+        xpc_dictionary_set_uuid(if_desc,
+                                vmnet_network_identifier_key,
+                                hs->network_uuid.data);
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
+    .size = sizeof(VmnetHostState),
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
+        g_assert_not_reached();
+        return -1;
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev, nc), errp);
 }
-- 
2.34.1.vfs.0.0


