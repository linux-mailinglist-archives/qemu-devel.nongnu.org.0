Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49C4C4D26
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:01:55 +0100 (CET)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeug-0005QH-8J
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAa-0007Df-65
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:16 -0500
Received: from [2a00:1450:4864:20::234] (port=33372
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAY-0000SN-IH
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:15 -0500
Received: by mail-lj1-x234.google.com with SMTP id p20so8362982ljo.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v7no45Cg1W0LRKhNzoQg5XczUdm3gvdwwe9l+1jYHe4=;
 b=GoBlbKKvQY6cKzRhzC2TcwFqbIdEgeDd6TlKJ7bwZ00KhfJcTAgNfdybb10s6Ywwuz
 hWLGWgDIKbcK5LsKQ1hu2Tls8h2+UpX+fy4ZkcLD8oKCOwk/Br4xp9bzq1APDQpG4udo
 Rdfx+0nLG0pUsaBk1GTXn0ksP00zvrvv0Yj3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v7no45Cg1W0LRKhNzoQg5XczUdm3gvdwwe9l+1jYHe4=;
 b=4HIC1vvZuKUVYI5OXZ5tyzODU6P0s6PZGvF+K9BvDn5MEbkddQkarsP1qIyYq/oE66
 C46/uJh2R8epu/HZhhpFkpqjwFIM8zfES+E3lroJ+mqqHmSzRnPdH0AjDSNsKWjlp+pf
 bcKjLotORnX/EjweNC7wAkmBWteWueK3mYe+emt69t8kU7PgKOjClzh2R7ijqm/W42IG
 QmZXUgq0hPEmsY+/gZYTM4U1Lq9MQ3awiCRXhADx93VOZekgFlbq2e5Q2ekqbQDys99D
 q1oTZmOOXZ+gSgm5kOTegkgUgCFce0eIuwilTkr04JLV2nh5SELIB6uXhMD2lDP9845P
 j5yw==
X-Gm-Message-State: AOAM533POP2wqFxQXD2V6ohlTCv8uHYP0fRHSPvkPG2YhaYDstHKV7ie
 FxzBNmoP77vRoiOqpUhkFpr8vq1T08COlQ==
X-Google-Smtp-Source: ABdhPJxX82wAs9t3/VtB9LrJP+az4nAa9g3u4WQciy9PgSDt/ByX1iZ1YM1UmL+EDgwHQxdt5oztCA==
X-Received: by 2002:a2e:6e14:0:b0:244:cbbe:c690 with SMTP id
 j20-20020a2e6e14000000b00244cbbec690mr5896314ljc.169.1645809252053; 
 Fri, 25 Feb 2022 09:14:12 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a056512150500b004433c791651sm252024lfb.69.2022.02.25.09.14.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:14:11 -0800 (PST)
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
Subject: [PATCH v15 4/8] net/vmnet: implement host mode (vmnet-host)
Date: Fri, 25 Feb 2022 20:13:58 +0300
Message-Id: <20220225171402.64861-5-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x234.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 12:16:18 -0500
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
 net/vmnet-host.c | 115 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 32dc437037..2a711400e7 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,119 @@
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
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev, nc), errp);
 }
-- 
2.34.1.vfs.0.0


