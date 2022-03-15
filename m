Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD5A4D9860
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:07:48 +0100 (CET)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU45j-0001ey-Sr
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:07:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nU40x-0007Yo-3Z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:02:51 -0400
Received: from [2a00:1450:4864:20::12e] (port=39935
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nU40u-000171-U2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:02:50 -0400
Received: by mail-lf1-x12e.google.com with SMTP id w7so32011066lfd.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOm1kJMGnWnY15aZD15OclZ1jPIc+wWhUU8JyHe2FsE=;
 b=HWwHm5Y+19Fn48fTmB44gVVKsxSelpQ+uFUk0FsZoCm+jAj9iiGR9g73f/NM1Uyxri
 8uG3YibZh1nz8Yh5Pp8P0jxaLLMIZMUc1jYjwb34ZB7wPEqQbSsGCrzuzn9o/usvuB3H
 0o5jA6Ev30iwYBssaaa6NWh38gzADvIACF3BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOm1kJMGnWnY15aZD15OclZ1jPIc+wWhUU8JyHe2FsE=;
 b=2QdFoJD+euQ5kIKy0qEdGnAh0IeN340GUTYD/By2Q8FWwifwMhog7FdsZ3AzXmdyUF
 CPTv8K8Y+A9S8eJ9bNPjhRiR3Kp3YTJHHmvcsmNIPGh71+B+mPm/QLmpIebLeiqT0ucV
 she3jFGFSeTAL8zod9fn4+ULhp1UOIHuF4Cx8Gzqtl0gdihrJVrzz0T8G5hSvrdB4gfi
 ZFUocgXkZ3VW3ku2y1n2KMyI05FENa7qCXvFkGk391P+t+/OUQGGKjsgVUCAJhMf2/MY
 e3baHXfI1kyXT2erLjfLPcJT1Fub11wQm1dFTDfbXOgK4GZvjenJqrDrR+7joJaGLPdp
 vMTg==
X-Gm-Message-State: AOAM530IQGIm1gBBuHIulRaXn1/ZV/BjU+tK7T0siyEEMOpxpmWQjlxX
 z9URAcTJtspU+upOUmFisRxg1l2Mu9MqzcdA
X-Google-Smtp-Source: ABdhPJyyYaqIi6BGzyrcy4SPHBwjtZfk8IczYHpYZ99S71IuQhuD9Ldppo1YX3UtipXCVq2w9PtvLg==
X-Received: by 2002:a05:6512:525:b0:448:89d5:2e40 with SMTP id
 o5-20020a056512052500b0044889d52e40mr8182916lfc.249.1647338566973; 
 Tue, 15 Mar 2022 03:02:46 -0700 (PDT)
Received: from UNIT-808.lan ([188.187.49.32]) by smtp.gmail.com with ESMTPSA id
 y23-20020a2e95d7000000b00247e4e386aasm4339993ljh.121.2022.03.15.03.02.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 03:02:46 -0700 (PDT)
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
Subject: [PATCH v17 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Tue, 15 Mar 2022 13:02:36 +0300
Message-Id: <20220315100239.2914-5-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315100239.2914-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lf1-x12e.google.com
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
 net/vmnet-host.c | 113 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 107 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 32dc437037..0395458d8d 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,117 @@
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
+    QemuUUID network_uuid;
+    if (options->has_net_uuid) {
+        qemu_uuid_parse(options->net_uuid, &network_uuid);
+        xpc_dictionary_set_uuid(if_desc,
+                                vmnet_network_identifier_key,
+                                network_uuid.data);
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
+        return -1;
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev, nc), errp);
 }
-- 
2.34.1.vfs.0.0


