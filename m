Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0648DD3F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:54:48 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84JD-00032s-A3
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:54:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oQ-00080R-PX
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:00 -0500
Received: from [2a00:1450:4864:20::136] (port=41799
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oP-0000rX-8D
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:22:58 -0500
Received: by mail-lf1-x136.google.com with SMTP id x7so21978707lfu.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/SJDuhuDHwghUaAnWQsCDE0pCWnQKV9wsVKdnvDP3E=;
 b=b+Cb/gEsyMZ9Ly8zjYBv80u/raOZJrPSlvK5Z+7h8qW0cB/8/X+RSJd68vS6g7HXlA
 A5yypxVXRTjiY26uEoqQ42Ud9jiDiogF012Z7Q+npi7E2JcNSkuM3FpP4semkY4n74m5
 Ox69CgyE6V61WD3CqTubJxKZ5VPGwrhM0xWlJNi1utu0BwTdiIKa5oGId+fOT2YxkgZI
 UkUGYmm1TJj3jXioUWzSmtq2geBMqjJbbrBNkaaJkd+RAHJcB5jypwLvvfbvkiRF3jHt
 o8z93O/eD4wJA6wFV8f90meuz9RV0KklcFRUBYYigX3pi5r9brBWMUdSEzUET6E2Tz9N
 3fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/SJDuhuDHwghUaAnWQsCDE0pCWnQKV9wsVKdnvDP3E=;
 b=BiUP7Rg3SmHmWKaD3JTr0KHa85AGLeNRmHmW/tGQr31FEVCrd6ISPUvHD45ieR5WsU
 n3XNGcR7J/4MUgsBTkP1q2nPqDoQ2rB1W6AkkYQMq+E3KplrG/q05UZ78Q3shNzGoGtS
 bOfH5fvbvH0Mc8DAN7TYRHHJT+o5SUj9rGdt5jnoTCTNvgJiRHQMn0agHZ9bnG7i/hj3
 NXUcVqnsbKwBMS7DUCZYlo7BHYvRU9dTF7I+a+qk8nX70gV2om8/RHyKIwORVWoApwH3
 WLTEqxfa4CQ+75Tz+0urqM66jIn4ozSoVP3140wRI58BncdIYTGU4gaw+bQYdjcKFz0v
 6VEA==
X-Gm-Message-State: AOAM532Gser3Yn0C+iyYwvkKf51WUMpZd9paxtxSTeXgU9YNJTeQSM+i
 X5QjdHe9Y+Wtmel1O3uwuc8ytkBmfXU7LGgx
X-Google-Smtp-Source: ABdhPJyxGNsMAwxHDSJnTmXAQkGpuWkpaghpOkRsz7I2zu7EPUQCCFeZX6qBKFVhpvaGhZeRxZumNw==
X-Received: by 2002:a05:6512:1153:: with SMTP id
 m19mr3884802lfg.456.1642094575409; 
 Thu, 13 Jan 2022 09:22:55 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id h17sm323410ljk.41.2022.01.13.09.22.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:22:54 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Thu, 13 Jan 2022 20:22:16 +0300
Message-Id: <20220113172219.66372-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 alex.bennee@linaro.org, jasowang@redhat.com, phillip.ennen@gmail.com,
 armbru@redhat.com, dirty@apple.com, f4bug@amsat.org, roman@roolebo.dev,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-host.c | 110 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 104 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 4a5ef99dc7..501b677cb6 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,114 @@
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
+  VmnetCommonState cs;
+  QemuUUID network_uuid;
+} VmnetHostState;
+
+static xpc_object_t create_if_desc(const Netdev *netdev,
+                                   NetClientState *nc,
+                                   Error **errp)
+{
+    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
+
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_HOST_MODE
+    );
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+
+    VmnetCommonState *cs = DO_UPCAST(VmnetCommonState, nc, nc);
+    VmnetHostState *hs = DO_UPCAST(VmnetHostState, cs, cs);
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+
+    if (options->has_net_uuid) {
+        if (qemu_uuid_parse(options->net_uuid, &hs->network_uuid) < 0) {
+            error_setg(errp, "Invalid UUID provided in 'net-uuid'");
+        }
+
+        xpc_dictionary_set_uuid(
+            if_desc,
+            vmnet_network_identifier_key,
+            hs->network_uuid.data
+        );
+    }
+#else
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-host.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+    }
+
+    if (options->has_net_uuid) {
+        error_setg(errp,
+                   "vmnet-host.net-uuid feature is "
+                   "unavailable: outdated vmnet.framework API");
+    }
+#endif
+
+    if (options->has_start_address ||
+        options->has_end_address ||
+        options->has_subnet_mask) {
+
+        if (options->has_start_address &&
+            options->has_end_address &&
+            options->has_subnet_mask) {
+
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_start_address_key,
+                                      options->start_address);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_end_address_key,
+                                      options->end_address);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_subnet_mask_key,
+                                      options->subnet_mask);
+        } else {
+            error_setg(
+                errp,
+                "'start-address', 'end-address', 'subnet-mask' "
+                "should be provided together"
+            );
+        }
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
+    NetClientState *nc;
+    xpc_object_t if_desc;
+
+    nc = qemu_new_net_client(&net_vmnet_host_info,
+                             peer, "vmnet-host", name);
+    if_desc = create_if_desc(netdev, nc, errp);
+    return vmnet_if_create(nc, if_desc, errp, NULL);
 }
-- 
2.23.0


