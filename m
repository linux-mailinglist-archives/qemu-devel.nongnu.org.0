Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03A46B8BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:22:13 +0100 (CET)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXbw-0004gu-FZ
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:22:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYm-0001n1-DK
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:56 -0500
Received: from [2a00:1450:4864:20::12b] (port=41947
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYk-0007DO-M3
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:56 -0500
Received: by mail-lf1-x12b.google.com with SMTP id z21so10306972lfu.8
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=CCQY8xItuTMpi2f9rrJPmRWskr72qJQ0ZgJsNu5CdwOPiXBNEExzsq1WjotyYcGpFU
 rgOBdoYE3thpbqJdBUqSet0rmmbiP4uujLNVCFU5CETjwUZFuA7ei1uE7/JvfwI9dlNd
 1dSzfbHO6UlNcpfbnTzhM3uYgE5Ra24WOe14oEqjBwb1TUHu2uCIR1uYuLDzBqMc5m5m
 VrgnTDXeUbsE2ZC918MiCWA7/UW+1hpDQpTDCLYE+JvE3GrUsnd/EYiVf4+ZWh/QHHVw
 OfIMoWdO1MTSIp4EU7QWP1aMACC7JNCeSkzxMJSfABojbh4GcEoGrBE5MGUqQST/yGdH
 9KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=qsDycVRCryXX8qh7Co/BmFnwCsGtdE2MR4uczpmxNmcqku09SS5d4UGlrwNzUT4ouZ
 Ky8mLdTKJyB4yfTnatMKgRYSlGd7ZIAXxSh8c7o0y3C0nWipmEnYTywHwirXJP826wY+
 az/CdnGRP7WB43RBTEQsW7NIGeJCrnEaCydpfVeiz7utlbPSR8s5DOFr+78L55xGIk9P
 yoPhrKu87VSP+4N3fo8BPzVdG1a9Gz0ZVJFzbOSkG1arMhoIW4PwdQ+S3SLWKPHqhysl
 X6tkYFHp/0zr0zKuWJsbdOO09WPxm12z3dAnWM75CK/lIDFpgPv1n2IIUHwkXl76JANT
 mpcQ==
X-Gm-Message-State: AOAM532EIhWchz5edm0R+aNtSzqGp5vBlxpxMfz/aDXY4bWS3qo/N89B
 oesGgtJcYNMiQlh76u6pa/0tjJeFk18H/Q==
X-Google-Smtp-Source: ABdhPJzOIHO91ndHSf2f2MpH237ErnAYICBeRh3g5qn+g9ukzlTtpp+4F1rkPQve/NePbn/kD3scCw==
X-Received: by 2002:a05:6512:1510:: with SMTP id
 bq16mr38481174lfb.628.1638872332848; 
 Tue, 07 Dec 2021 02:18:52 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:52 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Tue,  7 Dec 2021 13:18:26 +0300
Message-Id: <20211207101828.22033-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12b.google.com
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
 net/vmnet-bridged.m | 98 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 92 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 4e42a90391..3c9da9dc8b 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,102 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "clients.h"
+#include "vmnet_int.h"
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetBridgedState {
+  VmnetCommonState cs;
+} VmnetBridgedState;
+
+static bool validate_ifname(const char *ifname)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block bool match = false;
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+          if (strcmp(xpc_string_get_string_ptr(value), ifname) == 0) {
+              match = true;
+              return false;
+          }
+          return true;
+        });
+
+    return match;
+}
+
+static const char *get_valid_ifnames(void)
+{
+    xpc_object_t shared_if_list = vmnet_copy_shared_interface_list();
+    __block char *if_list = NULL;
+
+    xpc_array_apply(
+        shared_if_list,
+        ^bool(size_t index, xpc_object_t value) {
+          if_list = g_strconcat(xpc_string_get_string_ptr(value),
+                                " ",
+                                if_list,
+                                NULL);
+          return true;
+        });
+
+    if (if_list) {
+        return if_list;
+    }
+    return "[no interfaces]";
+}
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options = &(netdev->u.vmnet_bridged);
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_BRIDGED_MODE
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+
+    if (validate_ifname(options->ifname)) {
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_shared_interface_name_key,
+                                  options->ifname);
+    } else {
+        return NULL;
+    }
+    return if_desc;
+}
+
+static NetClientInfo net_vmnet_bridged_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
+    .size = sizeof(VmnetBridgedState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
 int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
                            NetClientState *peer, Error **errp)
 {
-  error_setg(errp, "vmnet-bridged is not implemented yet");
-  return -1;
-}
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_bridged_info,
+                                             peer, "vmnet-bridged", name);
+    xpc_object_t if_desc = create_if_desc(netdev, errp);;
+
+    if (!if_desc) {
+        error_setg(errp,
+                   "unsupported ifname, should be one of: %s",
+                   get_valid_ifnames());
+        return -1;
+    }
+
+    return vmnet_if_create(nc, if_desc, errp, NULL);
+}
\ No newline at end of file
-- 
2.23.0


