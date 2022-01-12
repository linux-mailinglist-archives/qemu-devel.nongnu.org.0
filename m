Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386F48C4F8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:39:13 +0100 (CET)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dqK-0006No-D4
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:39:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce5-0006lN-SU
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:29 -0500
Received: from [2a00:1450:4864:20::12d] (port=33594
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce3-0003iL-LA
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:28 -0500
Received: by mail-lf1-x12d.google.com with SMTP id k21so7657248lfu.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5euT6MzAM4gq/qEUxNRuw37wTeqioc/QkXGGACyr2o=;
 b=k6/TuNhZ1HdZk7Rs77aeS5fISFIX1cCkEjAAAEN9033DXqooCeL/XqiSVaeJK+M5WD
 PaLzOXO0xqOyJQ+XuEhNa7c858xBBBf+kWzd2fbdErGq8oBLo4VbiyYgwFWwsKpxGE7i
 boZcD+Px1eulIH2gtAfL7P/BHX4145E6e8gszgtCY99tBcl13nj7/VXRRPY5TUoxyZAO
 YVpTDnmfLtj4CXw0PU7G/b8rtLC11BGzxkbF3BTBkFP6quDm1yzT0ZHX5T1DJsHZmuG7
 wdTaom1ShLc5sUlyRme2DnT1Lnl/mC/cUvHx+43W/GtXFd34v/EMT797rqWLhulqjqWB
 Y4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5euT6MzAM4gq/qEUxNRuw37wTeqioc/QkXGGACyr2o=;
 b=ExAdTz0DBowgwxdlQwlumO1frEFwKzK3koY0fjWfoy7tl0gSyWv+JK4dBXLulMobDM
 Y8SeWvEskHYcV5al21EAGdsT+5kogE2eST83cnHZ2oSHtGurvCTvm1krNB+bvzuOKTis
 tZo+9nSnF+ISQ12egDfW/F+ZMKzWyp/lTarTjdXw4GE9f3SwrCSwOjXFpHZ/nXMw6jKa
 i8nV59cmx7YhX/P8XxNnZUjK7KeLXJcaUEIyMk/TvgfNzEHoFK+OylXfoZSvBsZbcB4t
 MMe1t6Xz9/whW01H2eNlVsBSre27Rv2/TUgWqVSs72SPvCQB/cur36+TMy5q9YfZYLXj
 NMDQ==
X-Gm-Message-State: AOAM533vKqImygNtn6PqSuK1LpPtrejDHNLGz8aF3Fq3DDXUzvMEplXP
 1XEtTF6ZYlrXFbbVEiaICUx/Ry0Ajr0qYn0N
X-Google-Smtp-Source: ABdhPJx4WqU5UYQrd77LyodPQi9CZs0QjlzUKqBFcvS/uxfVdKEk3UvROmv4aNLzNW2hZ4P0hwxJ+A==
X-Received: by 2002:a2e:a499:: with SMTP id h25mr6203016lji.301.1641990145684; 
 Wed, 12 Jan 2022 04:22:25 -0800 (PST)
Received: from localhost.localdomain ([77.234.205.2])
 by smtp.gmail.com with ESMTPSA id u7sm1623035lfs.218.2022.01.12.04.22.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:22:24 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Wed, 12 Jan 2022 15:21:48 +0300
Message-Id: <20220112122150.37049-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12d.google.com
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
 net/vmnet-bridged.m | 100 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 6 deletions(-)

diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
index 4e42a90391..19a68a6a1c 100644
--- a/net/vmnet-bridged.m
+++ b/net/vmnet-bridged.m
@@ -10,16 +10,104 @@
 
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
+#ifdef CONFIG_VMNET_11_0_API
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+#endif /* CONFIG_VMNET_11_0_API */
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


