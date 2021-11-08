Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A844982D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:27:32 +0100 (CET)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6YV-0001iZ-Qa
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:27:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6Wi-0008Jt-BU
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:25:41 -0500
Received: from [2a00:1450:4864:20::52a] (port=37548
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6Wg-0007ju-BV
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:25:40 -0500
Received: by mail-ed1-x52a.google.com with SMTP id f8so64128117edy.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rm9SqTrwmNF0mI4anZZ84aLF2si3p8EvufEedcpuuIc=;
 b=f+KNuuTQla7ErFXLL0agIO/DYinReBTdlQNcmF+vfDNxL+l8+A+WrufCGEmXGvIGQw
 if3wc8G2Z8GUeNklGgumo+Zj1xtmgHvwPuLH8goszz+TspWwJeHTPTPMLVxfXs4Bdu3E
 AO7VLsx0SHsRYFCt6KuY1JYMKEp+Ow/qBDwCa5F/F/YVjDLT5w52xOL9RGVKhXtdrhqX
 6jAUHAfpmH4Fd0s8HwExj+4r8+ZWjkJEpeVpF2oHXyWXt3bzjAJ3XDyZL2kvwQB67fao
 DSmubvERQYfdKiviyjMkBNRWNCswQLmM0YBEaf/Ktqx2AiWWc5JwT9nXNEBFOdDw7Hcr
 8ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rm9SqTrwmNF0mI4anZZ84aLF2si3p8EvufEedcpuuIc=;
 b=4WCjEnEQW/bR7Z63n3RPEbtt4LThjeOeSowyMaS0kM39avJkW8fyLBXt4H6dQZjeiR
 NqVLeCK6M4OFbieLPJ9V2dHmNnfXMe7ZDeDi0XXXphRfZJ2+Qdad0yxSIcE7kzgImlNq
 W/KNXNqHzoFAwKEBUeVqSzr0GpLmrjifb+6v2mNLFOkZ5Ha8XN2A/pjtGO3d6vrA95xE
 F9I+/TVzhwp4twGqToY2H5J+ke0XXnDUtZqLz5I6tdyGJwZjQKZdq4Tuy/r8a34NcNA2
 kYnikH/ullmtDvXh93yhQ0vNQ0h7p6ikl09RS1VIJzZoUu2MJSECE5z6p6yWyMz/aeTf
 fveg==
X-Gm-Message-State: AOAM532YzFFqEPvZ6LXKgZ/0e5BeGku+BA3TQu01CiiKkmzLv9nVbW/+
 oQ4GxnR5OOO6CdJyuf/eapJL6IcVeIclvg==
X-Google-Smtp-Source: ABdhPJxvA/LAlpYvhBQBsUuyIfO9c1+n29yEeHkl7kOrf2o/w4RNLBevneY1P1r6zUGjUcu3VmAt3g==
X-Received: by 2002:a2e:a483:: with SMTP id h3mr531153lji.106.1636384736322;
 Mon, 08 Nov 2021 07:18:56 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id z13sm1312776lfd.139.2021.11.08.07.18.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:18:55 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] net/vmnet: implement host mode (vmnet-host)
Date: Mon,  8 Nov 2021 18:17:02 +0300
Message-Id: <20211108151704.65611-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ed1-x52a.google.com
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
index 4a5ef99dc7..725675d0eb 100644
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
+        options->has_subnetmask) {
+
+        if (options->has_dhcpstart &&
+            options->has_dhcpend &&
+            options->has_subnetmask) {
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
+                                      options->subnetmask);
+        } else {
+            error_setg(
+                errp,
+                "'dhcpstart', 'dhcpend', 'subnetmask' "
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


