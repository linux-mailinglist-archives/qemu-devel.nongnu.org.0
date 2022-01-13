Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038748DA7E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:09:55 +0100 (CET)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81je-0003jc-BY
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:09:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bg-0002Kx-A5
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:40 -0500
Received: from [2a00:1450:4864:20::136] (port=42693
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bd-0003df-Ie
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:40 -0500
Received: by mail-lf1-x136.google.com with SMTP id e3so17693734lfc.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1SywTA5bEA3SeEdMMJI7GgMwkgxeo13AxqEEF5FKwE=;
 b=NrPqSvLlmVaojvajXJHkpyF+pnGO6FidM0T8ux00lSq5yIuw+oVpAZaFvKQ10EF/2C
 xUy+a4CZP3WJ8DkzFz2coW7ooAHW8dtPTTNdqzoxcaXscDDDjaUog7gGJv3hJJ//9rLW
 yONcTdiL3ai0TfTLKnOOPYtKwG6QmVqL6LdwNzdLMaRzYCpa6GnQ2rkHhtwhaP+fYMSr
 lyhpGrWsawEkKBuW1cd693hG7aoeTH5T9LytLZksCjSP4KKYBqJ6Q8mp4ZdR3AYCFnql
 0a0eNezk1oefGnYgTw2uiRq8EB/PSXsAg8sxPXDDKPVyUDIPAWSp5q7jCOwmPkBTiki1
 4xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1SywTA5bEA3SeEdMMJI7GgMwkgxeo13AxqEEF5FKwE=;
 b=uhDew/RodCF+fa2xe/JsCRf5MZbmtDrLSgXRQG9NJoZ95za4ijPRRu79QJuGsMz1WP
 Ui8Yu+gQSqWee9+Iq3lSQWch29MYu8gctbJ1TvZfvJAY1nM9FYdcb7mMMv9ut6oTCRb8
 rFQ4IXdcVyn+/97ZeWIouCC0NIveEm6IF6iaO30cRVJT9y9tGk3ZbvLV3AHlKHZo01NU
 oDiVt6vdOKsz3QmSNeS7fv//xaAfmWL5M6f123aAMRceK45QrYlQD2sUpH2YKl5sDqN5
 86t4L/M74mA4Wl074eQktO3uL8eXWM2xaVs8cFA/HLUcVbGUjOy1lVhjlNBtj/wrAvaQ
 T7HA==
X-Gm-Message-State: AOAM531CH6KOTsUOiad1Np1ubh7dMycxz/nTlKEl4eRG2unYCrComktj
 MGoNHRHONpMewTdhEyfPomA+0jR+iJb0h9+1
X-Google-Smtp-Source: ABdhPJy7SNx16S1dKBvkpOr98C7HcpcdmhYV0X0NZmobwoWXDfRlxipXtB6LEBy7GDSjZRHjxg8B4Q==
X-Received: by 2002:a05:6512:b06:: with SMTP id
 w6mr3465992lfu.433.1642086094725; 
 Thu, 13 Jan 2022 07:01:34 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id w25sm314278lfl.155.2022.01.13.07.01.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:01:34 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Thu, 13 Jan 2022 18:01:11 +0300
Message-Id: <20220113150113.58437-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
References: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-bridged.m | 105 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 100 insertions(+), 5 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 4e42a90391..f528af036c 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,111 @@
 
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
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+#else
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-bridged.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+    }
+#endif
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
 }
-- 
2.23.0


