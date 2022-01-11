Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F648B945
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 22:21:01 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7OZg-0005HH-5o
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 16:21:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTl-00067j-9Q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:53 -0500
Received: from [2a00:1450:4864:20::136] (port=38421
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTj-00031i-JY
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:52 -0500
Received: by mail-lf1-x136.google.com with SMTP id x6so1147137lfa.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 13:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=GhTEauuZ1Ija6eLG1+5tQvepQ/rmiV5vadnYVAHgMiOjFW6OA1sM7IZCY42ClkZJ3G
 sCUcKB4/AHeIjQeIbhnliReXHHOw9TvIIGUYoAtQelHG4zgAvPrQRIH3IgXjoyXbF00H
 sng00U9nL/3E5QCOo1OOp1V8/bXcIlImOFkJrCKgntf3wUl1/0TEBNH6V0G6R+u0Cm3I
 m9I9VHNmOsT+DxylKzFigQl4Fvzbdrc8Dgy78f25PZ7UQFf3sU4kkFmShUdrqG0AVMlX
 1hguGuFUE1M/eiFhPgcOgDlf5P+gwVhwrmmGQZ6xUgd/DqF5TeWgS5Wj/R4W0f659fhu
 JawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=Ve+w3vCoySLC/WmjSvx3Kj40tkW32DbsfZ8ko+VbFm/E5oyBnsI56z1TxqSU9nC6UP
 ZJ+FMW0p+7cHLkJ+M55Q4F1Ttw0TWZWsY21mjc1DU7GZX8hjbDUzLBwXcDgzaSBhoha4
 eo5yMmwbhq03rfQkBFhPha6O8W9Ln8Tre72X2/Flxc8E3AAJFCAj1wWnnNg0Zj/HVUms
 drvJqAUq4AWW0Pd4uZtB/G3sNBnMEvq59Os8V9KrtqWbnsvgxEDd7XjxUWi1XQ08mRJV
 sKx5yo/p+D4hWiKAWR7J0FEqxfZ3l1SFy8SiMm828NU79FJ0b104J2MjrF+BTNf//pKy
 HZiA==
X-Gm-Message-State: AOAM533wZqkA81LMBxwNyTAGs4F73kr3FQLGnwRSwDO3fu4MW6xbpUpJ
 0JaNnc3vOCMzXKOOkQyjng8W8MyPzaWAlg==
X-Google-Smtp-Source: ABdhPJy4l36rNyFeycmUx4qiosASmKQrsrtaJk+Tm3XnHiB04E3kuvn+0PXH+WjvWMUp0Sb0DjS9Yw==
X-Received: by 2002:a19:dc57:: with SMTP id f23mr4570837lfj.245.1641935688925; 
 Tue, 11 Jan 2022 13:14:48 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:6a8d:c51:3b28:285b:bcad])
 by smtp.gmail.com with ESMTPSA id u5sm1422045lja.36.2022.01.11.13.14.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jan 2022 13:14:48 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Wed, 12 Jan 2022 00:14:20 +0300
Message-Id: <20220111211422.21789-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
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


