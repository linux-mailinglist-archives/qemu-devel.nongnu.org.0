Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D946B8BE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:22:10 +0100 (CET)
Received: from localhost ([::1]:42976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXbt-0004Sb-1h
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:22:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYl-0001jm-Dt
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:55 -0500
Received: from [2a00:1450:4864:20::231] (port=36664
 helo=mail-lj1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYj-0007DD-Sr
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:55 -0500
Received: by mail-lj1-x231.google.com with SMTP id i63so26515985lji.3
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtMW004Au7CrDB93vS6nalJFyRXcqbDatoHFcN9NphY=;
 b=VuoHco2tzeF6dNTVX1BgzhZkIIcy/dizkDAeqTrJmqKiu4JqzsqE8vKdeohkJlSbw3
 1/1W5wZGX8LR+//B7piH6lsVh99qbFmiCIpPyilGOsJycPJtZlBudU21+iEejk4+18UI
 yr0g7b33MC+y7hNalwDtWK35M0/O7gs5TV3aMsfhGfiUVY1wWwqeuo/LCmKps9ZCsZy5
 L9qeyRPbG63On6bm2N3RUS1OfBtA64s5724DQ3UP8+kRod9tTVNmZRuwib3Qs1jr7+uv
 XJes/+yhnK9/VY923l9b5grwvv8mlKziJIuIqkD1SuL8ii+jtpq56YQ88h9M4Dtwre6d
 H/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtMW004Au7CrDB93vS6nalJFyRXcqbDatoHFcN9NphY=;
 b=asIstNbCuMpqIuA9DnqhGAFKOUawgtPX7izyoJta2H/5DsLmL/KDOY5ATLhwG/7Clo
 UDcluQe+P9OIPozIUn8pe+3gZmqqdYw1DQJwrI4Tp0KEFctPnLez7ZSWQZuvHVFpdYeI
 cXweEc2sj/ZSHJ9mx+VZrzFvlZ4jifACFbd1SzYWnmVDUzSFiFMLjFrkrdBLQ9RXhOzf
 NF8JI3UF7gvVPJklD/hSxqPsKpBTi9NMKBp0mWYQs2Vo4Mip6fnlgXEEa+XJL+yOY5FF
 2JIeuhmF+lBGF3935GmWXLzLTQI+RY5RwEf86xSI5FpneHG8mrR/xm85NdUdB5ZC7P6h
 1fqQ==
X-Gm-Message-State: AOAM5318V5jn9yZPb6npUVKMw01jnA2scPg7GuK2RRMFr+quCxvAjR9x
 LUrzMA1ioZfXqiUOvlW4Y/WX5zNJUuYqeg==
X-Google-Smtp-Source: ABdhPJwncsktJ03tejW5IhBjz4nT7pHxhGXBbvjQdy0g8yQpGV2XcU8hXIijfNZF+IoyAhxqp54wPQ==
X-Received: by 2002:a05:651c:1127:: with SMTP id
 e7mr42615975ljo.47.1638872332104; 
 Tue, 07 Dec 2021 02:18:52 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:51 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/7] net/vmnet: implement host mode (vmnet-host)
Date: Tue,  7 Dec 2021 13:18:25 +0300
Message-Id: <20211207101828.22033-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::231
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x231.google.com
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


