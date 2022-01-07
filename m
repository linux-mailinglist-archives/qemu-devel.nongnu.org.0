Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C648756C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:23:34 +0100 (CET)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mPF-0004lu-6W
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMn-0001sa-K8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:01 -0500
Received: from [2a00:1450:4864:20::134] (port=36465
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMl-0001eR-Vo
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:01 -0500
Received: by mail-lf1-x134.google.com with SMTP id j11so13881296lfg.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=b87y0n9Kc/v466YJZBHee9Ukfts5hq1x4ddA0vxwChLHEAlYLD7Mzu/t0AJqXEZuee
 9CCj2ak8sxoBWBK0ANhcVw6UfEi9443kLZ0INlJQcLQMVsx1JKgZF/hgxFodpFXa0W6R
 LdRd1PtycGDHYB9CZyqu7P4FEUzH/b78WiiFI/nopaEJLW/KhdAb0/lz2bDJkvEtS/WQ
 bzGFEhdTD2I7mznJnS03KijU4sPVKrXMxa/S4hT8MEGVlQUUsx3Q+3S7MO/jwod7g05t
 BE/ZnQGOzaMvuqctL7B2qFZUf2te0vYW5dTfhvKF8HtLASJpE4Fq0+Z24bMwHENOnOcp
 /QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlN7d0rtidqdQWLCIgN5N1fcLK+0qLzuCPNMY3+d1oo=;
 b=soSDPRsdsL8m9l1gYTRqADhNbZMg+NB4jEXLW5B7xWGkLFYSwQJHKD7LQqKZRD/4IA
 m9GwIgZpHL6S/80GywAIQ7JBQ/FxptYb6a8fjvAm+bldyX8k0wi2nRJHyNuA6HkG0XjW
 4cWWTQDq4pBAosrFpFyxbcnbKo+ODu/8qHfvPuVZ9MaTOZ9VOuGCTsfxwftOM9KKYyi1
 zho6EkAD4RzcNHPLWRnoR8RHezquCBQxDSwFThGq9+RxfwjQg2Utxs9c98BllJZBCNcz
 +c9z9pDQXc3Ndqs6PAkt1iyRJQwfYB7956TQA71NBREHlxnSvxm3sX7cveBY1hP7cYdU
 8qxQ==
X-Gm-Message-State: AOAM533zgn17NDl4uq4r15HQGTHz6obFnHR5SA/BWeHSjaqgt8EBVwjB
 o75ObBVlAEdsy3oqhA/LA+p79/HBe7g=
X-Google-Smtp-Source: ABdhPJzkvYXuqAw+MFr3ZQwZKCYijnvIgl/2qFtB+pPr7hHLvuWensBNaqQMydtQPdUD1Az4QQMsvQ==
X-Received: by 2002:a05:651c:10c:: with SMTP id
 a12mr20592098ljb.73.1641550858235; 
 Fri, 07 Jan 2022 02:20:58 -0800 (PST)
Received: from localhost.localdomain ([62.140.238.4])
 by smtp.gmail.com with ESMTPSA id p15sm524259lfd.69.2022.01.07.02.20.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:20:57 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 5/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Fri,  7 Jan 2022 13:20:17 +0300
Message-Id: <20220107102019.37013-6-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
References: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x134.google.com
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


