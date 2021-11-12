Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487B944E3B5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:18:01 +0100 (CET)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlSh6-0005T4-8d
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe3-00021K-3r
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:51 -0500
Received: from [2a00:1450:4864:20::22e] (port=40477
 helo=mail-lj1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe0-0000pg-U2
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:50 -0500
Received: by mail-lj1-x22e.google.com with SMTP id u22so10518514lju.7
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 01:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDigqMREZ6cxzC0W1knHKDGniod1WoHeEKIA7AsPTsI=;
 b=QQCAuscrIHZ4P9i75Mic+9yZajjfwbj+UtrBUBe33yJciEqL/YfaKdszLa9KEmerP9
 WoxJRMTyu9SGuZZNRwCE5qSlthc18tgACR0WpJlsg3Fb2GiDiiMtBKCdxiVHmSZSADv0
 SB/YmPujTpnNgeIl4MYNFrZfioMKFM//gZ5G1JeCUSfcvaH4N1Ke1wIWTpzuU7KDlX3F
 vRhBHcX117ZDl2kUIzaAUAvux9PyfmEyGgb5gtIx1MM0lgSB+Znz8nXno5TxHqTt9kca
 SH5Iy6h8Dg6NSVBjcw2A7inePBzGLqC8Gbu3yRm8EG8LXDvTUDjo6/wZXhxYs9WPXJyY
 G3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fDigqMREZ6cxzC0W1knHKDGniod1WoHeEKIA7AsPTsI=;
 b=FSt/CYVbGjkHdWgp8yVS1OYM+vaiWLS70lEjWpzyRCfGkX0NvpL79Yse/SBQVIOTQm
 G0T9NtYXVBza3RIpcOuFgUtg1JB/tkscjMWQ1fnfgXbZ76aeap0B6DHMXGZ1Fnw97dPE
 TcebYV118eaxSOFKmXrfhq6+9QHP82IPxa0YTdHg4Fkpkv9czJUX9AxefqZ6NYwbay6K
 B+7Pk60Kx1be8hTdmY1xa7HKK9bsbH0wurnlMJpgmxadPZmDlnLRVubQUnOzBH9RsgcQ
 4HrY6x5nWiM1Y2yBAsp8K3iEyfgk2CJuqcxXvKG1Yql7Lf15cM7q5fA6175P4ZkLRLou
 vRDA==
X-Gm-Message-State: AOAM531o+ba/1mu410tMdpQjtQcUYpQ8v7MAnp1WbnLgmhOdF4Ma69/P
 JJDrApO8Lr7F0BHg6QmV2yGG2BswBpFF8w==
X-Google-Smtp-Source: ABdhPJzp1u5bSArxhhopv/FAZTwMZVs7x+nC9JR7ysEtXs5qyGpjLzdxxy1yWYSYquJEylQp6bVNDw==
X-Received: by 2002:a2e:a54e:: with SMTP id e14mr14111605ljn.136.1636708487238; 
 Fri, 12 Nov 2021 01:14:47 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2d:d7c7:95ac:c963:ac2e:68f])
 by smtp.gmail.com with ESMTPSA id j11sm570134ljc.9.2021.11.12.01.14.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Nov 2021 01:14:46 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] net/vmnet: implement host mode (vmnet-host)
Date: Fri, 12 Nov 2021 12:14:12 +0300
Message-Id: <20211112091414.34223-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-host.c | 99 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 4a5ef99dc7..f7dbd3f9bf 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,103 @@
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
+    VmnetCommonState *cs = DO_UPCAST(VmnetCommonState, nc, nc);
+    VmnetHostState *hs = DO_UPCAST(VmnetHostState, cs, cs);
+
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_HOST_MODE
+    );
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
+
+    if (options->has_dhcpstart ||
+        options->has_dhcpend ||
+        options->has_subnet_mask) {
+
+        if (options->has_dhcpstart &&
+            options->has_dhcpend &&
+            options->has_subnet_mask) {
+
+            if (options->has_net_uuid) {
+                error_setg(errp,
+                           "DHCP disabled for this interface "
+                           "because 'net-uuid' is provided");
+            }
+
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_start_address_key,
+                                      options->dhcpstart);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_end_address_key,
+                                      options->dhcpend);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_subnet_mask_key,
+                                      options->subnet_mask);
+        } else {
+            error_setg(
+                errp,
+                "'dhcpstart', 'dhcpend', 'subnet_mask' "
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


