Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F5248B93D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 22:17:30 +0100 (CET)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7OWH-0000fh-4E
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 16:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTj-00064C-M4
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:51 -0500
Received: from [2a00:1450:4864:20::12f] (port=41548
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTi-00031Y-2E
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:51 -0500
Received: by mail-lf1-x12f.google.com with SMTP id x7so1091028lfu.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 13:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtMW004Au7CrDB93vS6nalJFyRXcqbDatoHFcN9NphY=;
 b=fcCjBzg9ZU47r308aq56jX7eJ/JUZ7GWhN5sLlqkMyHhJl/PaRGj4Ct542lCsaVvqC
 scnsjRjYJ2iPcA8CYmLOuyAtiT6Hwsl+O2gomsn2QVVVX/WAvZyiqdqPPRMxQ48YfFFG
 sTXMSakawu4FgtL44zyqHl1K84vV/A70qNJKyXtrX/UmE2i3g3YTyIvYmf2awMPwbxzO
 zQknYgtrXCF+lAt2Ycb1hV6dDkjueO4+mux6F4leXnn90+NFnUso3ojIh9BqTGvuiYR5
 75ZkO1oV/v0+JjUzKOADM8yedt57TgMN85pWWLiOULWzRY2gQRjObouIAaUbNzHXz2zG
 6dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtMW004Au7CrDB93vS6nalJFyRXcqbDatoHFcN9NphY=;
 b=H67mkUEhoTdbhHcNxNM9Xb9N2OJIbv6nuSbRXgAiWLcX+wNpv8Nt6dDg65WRLAoDYO
 NujoPWFJku5YsINyaM//9yz/RzwCZBLPXMVSm7RAx0HX73PNwsV/SR88bM7TEZnw8nF4
 s6CNNhbvpRKH0NksZiypCXJBkC1xplBcF6tVl37B9VNoSP8wdmcIvRVX1jdm7i1rX8H5
 3WXp/5Jxtv8X1odkeCNQ3PmllZORzjxeAv6FOR3iU/83yPpSM9RLLOd1Y3/G7nTr1uFl
 7PqIyWGBKmXrHuN3cKZoadN/Bma28gK3lHPrBA/LP+p5YXmxz3N2saiJJadVMK+CsBr9
 t3Bg==
X-Gm-Message-State: AOAM531nFzyT6qRCgtjNl9L1mpKFqj9HyS+vzhq3DKnmwl8EzFUYBWwT
 xmaKuq8HQhOaeXbsZanBY3tCne+w7nMz5g==
X-Google-Smtp-Source: ABdhPJxSpygk6lYw7e07AbaxIySEa5DziJDBCpbSgW2S3wqNqdv6gTFO5oA0/poZLTPyvOoRGzDWwg==
X-Received: by 2002:a19:8c4b:: with SMTP id i11mr4695706lfj.81.1641935687778; 
 Tue, 11 Jan 2022 13:14:47 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:6a8d:c51:3b28:285b:bcad])
 by smtp.gmail.com with ESMTPSA id u5sm1422045lja.36.2022.01.11.13.14.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jan 2022 13:14:47 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Wed, 12 Jan 2022 00:14:19 +0300
Message-Id: <20220111211422.21789-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12f.google.com
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-host.c | 93 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-host.c b/net/vmnet-host.c
index 4a5ef99dc7..9c2e760ed1 100644
--- a/net/vmnet-host.c
+++ b/net/vmnet-host.c
@@ -9,16 +9,97 @@
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
+                "'start-address', 'end-address', 'subnet_mask' "
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


