Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B491B3AB629
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:39:33 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttB6-0007Xx-Qk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5b-0004EO-2K
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:57 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5U-0001Ng-8a
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:49 -0400
Received: by mail-lj1-x234.google.com with SMTP id d2so9303908ljj.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mQO9Jtuj60CqwGL2PeMxqW7qhxlXNo242GuzLYoT+MU=;
 b=UlZxlsLDsNhbB17rz2rXv1FvQnenhg3Pq2Z4bVvmcd0OUFmeOgoi7nH1imFpNcgiL2
 MPl6Fmmo3IBo4+8Io4O6qRnnfwo1JcQqPH/ysLUszn7CDB5He5VPxY9r7s854+4eDWfL
 13e2+hanXkN8Oh3JH+jL4+v5y8jsSaMDBwJ4ZSZ30TuHyD6nWw1sD4pncKGVuhj/oSIG
 8olrmBi2A1w66Ntw7/4UTzpMkG3uFPUeiXeJaxIvN6wCbjzmjZR1h9H+37cz1wPTekBl
 pQA7RljKEi/TPcTpWsem5tomnyjeBwSOuIStzZfSLA8o5khxXgVbk7+V/vIfzvwnLo3L
 xC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQO9Jtuj60CqwGL2PeMxqW7qhxlXNo242GuzLYoT+MU=;
 b=ObDuMYh/NbErY08qHdXsGvZwMc9B5UsPST1GC0vLhFB5Ikr0E3iScLsxz3VVsU00/N
 G70eEw4ijHTcKy8vGNIh6yS2QdMWMnDZrj9Jw7WsWgF08qIayyT9XjLF4k0VZHdT4u9V
 8AE1KK9erLl85GZZdvIZ0Ou7Jd8cQOGv+csiZamQO0L/UBZL/00373MctGdayYbVNFsr
 fsxoZTvwJs6YbacrEEFXZepTI5/PEwJdYec0332lgW87/nvFgynpnJpkozLy9WD4kB82
 qrNRbuSSEj4vwvnu1iOYY0/mAtNlunv/4m0oipgd52MeI1RSmfdQJ+SJV1XyoQEDr3e+
 PzLA==
X-Gm-Message-State: AOAM530q+hcFJ+Ke1kcWai8FEqoC5c3OUcZO01tt9LJgl7GzxIuTdaPC
 G4KXMLpl7CImvAPJ6vyohFG9xl/+m0VGsviJ
X-Google-Smtp-Source: ABdhPJxGinud23z7cTsxp5olEjf0RM6NYl3THUZQbnAfcbtH5IYS0jdIdLETaM15OsCC1ajDrC9CEw==
X-Received: by 2002:a2e:9945:: with SMTP id r5mr4977761ljj.324.1623940418573; 
 Thu, 17 Jun 2021 07:33:38 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:38 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] net/vmnet: implement bridged mode (vmnet-bridged)
Date: Thu, 17 Jun 2021 17:32:45 +0300
Message-Id: <20210617143246.55336-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/meson.build     |   2 +-
 net/vmnet-bridged.c |  25 ---------
 net/vmnet-bridged.m | 123 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+), 26 deletions(-)
 delete mode 100644 net/vmnet-bridged.c
 create mode 100644 net/vmnet-bridged.m

diff --git a/net/meson.build b/net/meson.build
index 1df498ad99..495419e964 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -40,7 +40,7 @@ softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
 
 vmnet_files = files(
   'vmnet-common.m',
-  'vmnet-bridged.c',
+  'vmnet-bridged.m',
   'vmnet-host.c',
   'vmnet-shared.c'
 )
diff --git a/net/vmnet-bridged.c b/net/vmnet-bridged.c
deleted file mode 100644
index 9226c42353..0000000000
--- a/net/vmnet-bridged.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * vmnet-bridged.c
- *
- * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
-
-#include <vmnet/vmnet.h>
-
-int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
-                           NetClientState *peer, Error **errp)
-{
-  error_setg(errp, "vmnet-bridged is not implemented yet");
-  return -1;
-}
diff --git a/net/vmnet-bridged.m b/net/vmnet-bridged.m
new file mode 100644
index 0000000000..61a96ce11a
--- /dev/null
+++ b/net/vmnet-bridged.m
@@ -0,0 +1,123 @@
+/*
+ * vmnet-bridged.c
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+typedef struct VmnetBridgedState {
+  VmnetCommonState common;
+
+} VmnetBridgedState;
+
+static NetClientInfo net_vmnet_bridged_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_BRIDGED,
+    .size = sizeof(VmnetBridgedState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp);
+
+static bool validate_ifname(const char *ifname);
+
+static const char *get_valid_ifnames(void);
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                           NetClientState *peer, Error **errp)
+{
+    NetClientState *nc;
+    xpc_object_t if_desc;
+
+    nc = qemu_new_net_client(&net_vmnet_bridged_info,
+                             peer, "vmnet-bridged", name);
+    if_desc = create_if_desc(netdev, errp);
+    if (!if_desc) {
+        error_setg(errp,
+                   "unsupported ifname, should be one of: %s",
+                   get_valid_ifnames());
+        return -1;
+    }
+
+    return vmnet_if_create(nc, if_desc, errp, NULL);
+}
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetBridgedOptions *options;
+    xpc_object_t if_desc;
+
+    if_desc = xpc_dictionary_create(NULL, NULL, 0);
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_BRIDGED_MODE
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_allocate_mac_address_key,
+        false
+    );
+
+    options = &(netdev->u.vmnet_bridged);
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
-- 
2.23.0


