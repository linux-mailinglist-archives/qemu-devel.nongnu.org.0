Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81A64C6E3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:12:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OiC-0007iw-Dx; Wed, 14 Dec 2022 05:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohv-0007dg-T3
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0001A6-40
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXrWg7KpN3EnwaKQArqYqNYriosS+/I5wYI4RAVRT+M=;
 b=JveelAawLQDMQXHG/rl9KTiCPG18KQpVrSAe6Gzs3Ub9EEOAkuZVGiehG9S/W24UiwnSVx
 YSxTDTmktBX84k8Bk/0+qkeytqxwCFDfXe8vOcJ73as/bHW26k7qc56V8TPLnDL6BQAqqa
 Bfw69mM7ANO5DZL4nyVyU3ilFGPUUj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-a1RoPLwhPpeRL6zkXoSXdQ-1; Wed, 14 Dec 2022 05:09:30 -0500
X-MC-Unique: a1RoPLwhPpeRL6zkXoSXdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0B71181E3EF
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 10:09:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A494492C14;
 Wed, 14 Dec 2022 10:09:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 09/23] util/qemu-config: Fix "query-command-line-options" to
 provide the right values
Date: Wed, 14 Dec 2022 11:08:57 +0100
Message-Id: <20221214100911.165291-10-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The "query-command-line-options" command uses a hand-crafted list
of options that should be returned for the "machine" parameter.
This is pretty much out of sync with reality, for example settings
like "kvm_shadow_mem" or "accel" are not parameters for the machine
anymore. Also, there is no distinction between the targets here, so
e.g. the s390x-specific values like "loadparm" in this list also
show up with the other targets like x86_64.

Let's fix this now by geting rid of the hand-crafted list and by
querying the properties of the machine classes instead to assemble
the list.

Fixes: 0a7cf217d8 ("fix regression of qmp_query_command_line_options")
Message-Id: <20221111141323.246267-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/qemu-config.c | 168 +++++++++++++++++++++------------------------
 1 file changed, 77 insertions(+), 91 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 433488aa56..cf47e8a3d0 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -8,6 +8,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
+#include "hw/boards.h"
 
 static QemuOptsList *vm_config_groups[48];
 static QemuOptsList *drive_config_groups[5];
@@ -149,97 +150,82 @@ static CommandLineParameterInfoList *get_drive_infolist(void)
     return head;
 }
 
-/* restore machine options that are now machine's properties */
-static QemuOptsList machine_opts = {
-    .merge_lists = true,
-    .head = QTAILQ_HEAD_INITIALIZER(machine_opts.head),
-    .desc = {
-        {
-            .name = "type",
-            .type = QEMU_OPT_STRING,
-            .help = "emulated machine"
-        },{
-            .name = "accel",
-            .type = QEMU_OPT_STRING,
-            .help = "accelerator list",
-        },{
-            .name = "kernel_irqchip",
-            .type = QEMU_OPT_BOOL,
-            .help = "use KVM in-kernel irqchip",
-        },{
-            .name = "kvm_shadow_mem",
-            .type = QEMU_OPT_SIZE,
-            .help = "KVM shadow MMU size",
-        },{
-            .name = "kernel",
-            .type = QEMU_OPT_STRING,
-            .help = "Linux kernel image file",
-        },{
-            .name = "initrd",
-            .type = QEMU_OPT_STRING,
-            .help = "Linux initial ramdisk file",
-        },{
-            .name = "append",
-            .type = QEMU_OPT_STRING,
-            .help = "Linux kernel command line",
-        },{
-            .name = "dtb",
-            .type = QEMU_OPT_STRING,
-            .help = "Linux kernel device tree file",
-        },{
-            .name = "dumpdtb",
-            .type = QEMU_OPT_STRING,
-            .help = "Dump current dtb to a file and quit",
-        },{
-            .name = "phandle_start",
-            .type = QEMU_OPT_NUMBER,
-            .help = "The first phandle ID we may generate dynamically",
-        },{
-            .name = "dt_compatible",
-            .type = QEMU_OPT_STRING,
-            .help = "Overrides the \"compatible\" property of the dt root node",
-        },{
-            .name = "dump-guest-core",
-            .type = QEMU_OPT_BOOL,
-            .help = "Include guest memory in  a core dump",
-        },{
-            .name = "mem-merge",
-            .type = QEMU_OPT_BOOL,
-            .help = "enable/disable memory merge support",
-        },{
-            .name = "usb",
-            .type = QEMU_OPT_BOOL,
-            .help = "Set on/off to enable/disable usb",
-        },{
-            .name = "firmware",
-            .type = QEMU_OPT_STRING,
-            .help = "firmware image",
-        },{
-            .name = "iommu",
-            .type = QEMU_OPT_BOOL,
-            .help = "Set on/off to enable/disable Intel IOMMU (VT-d)",
-        },{
-            .name = "suppress-vmdesc",
-            .type = QEMU_OPT_BOOL,
-            .help = "Set on to disable self-describing migration",
-        },{
-            .name = "aes-key-wrap",
-            .type = QEMU_OPT_BOOL,
-            .help = "enable/disable AES key wrapping using the CPACF wrapping key",
-        },{
-            .name = "dea-key-wrap",
-            .type = QEMU_OPT_BOOL,
-            .help = "enable/disable DEA key wrapping using the CPACF wrapping key",
-        },{
-            .name = "loadparm",
-            .type = QEMU_OPT_STRING,
-            .help = "Up to 8 chars in set of [A-Za-z0-9. ](lower case chars"
-                    " converted to upper case) to pass to machine"
-                    " loader, boot manager, and guest kernel",
-        },
-        { /* End of list */ }
+static CommandLineParameterInfo *objprop_to_cmdline_prop(ObjectProperty *prop)
+{
+    CommandLineParameterInfo *info;
+
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strdup(prop->name);
+
+    if (g_str_equal(prop->type, "bool") || g_str_equal(prop->type, "OnOffAuto")) {
+        info->type = COMMAND_LINE_PARAMETER_TYPE_BOOLEAN;
+    } else if (g_str_equal(prop->type, "int")) {
+        info->type = COMMAND_LINE_PARAMETER_TYPE_NUMBER;
+    } else if (g_str_equal(prop->type, "size")) {
+        info->type = COMMAND_LINE_PARAMETER_TYPE_SIZE;
+    } else {
+        info->type = COMMAND_LINE_PARAMETER_TYPE_STRING;
     }
-};
+
+    if (prop->description) {
+        info->has_help = true;
+        info->help = g_strdup(prop->description);
+    }
+
+    return info;
+}
+
+static CommandLineParameterInfoList *query_all_machine_properties(void)
+{
+    CommandLineParameterInfoList *params = NULL, *clpiter;
+    CommandLineParameterInfo *info;
+    GSList *machines, *curr_mach;
+    ObjectPropertyIterator op_iter;
+    ObjectProperty *prop;
+    bool is_new;
+
+    machines = object_class_get_list(TYPE_MACHINE, false);
+    assert(machines);
+
+    /* Loop over all machine classes */
+    for (curr_mach = machines; curr_mach; curr_mach = curr_mach->next) {
+        object_class_property_iter_init(&op_iter, curr_mach->data);
+        /* ... and over the properties of each machine: */
+        while ((prop = object_property_iter_next(&op_iter))) {
+            if (!prop->set) {
+                continue;
+            }
+            /*
+             * Check whether the property has already been put into the list
+             * (via another machine class)
+             */
+            is_new = true;
+            for (clpiter = params; clpiter != NULL; clpiter = clpiter->next) {
+                if (g_str_equal(clpiter->value->name, prop->name)) {
+                    is_new = false;
+                    break;
+                }
+            }
+            /* If it hasn't been added before, add it now to the list */
+            if (is_new) {
+                info = objprop_to_cmdline_prop(prop);
+                QAPI_LIST_PREPEND(params, info);
+            }
+        }
+    }
+
+    g_slist_free(machines);
+
+    /* Add entry for the "type" parameter */
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strdup("type");
+    info->type = COMMAND_LINE_PARAMETER_TYPE_STRING;
+    info->has_help = true;
+    info->help = g_strdup("machine type");
+    QAPI_LIST_PREPEND(params, info);
+
+    return params;
+}
 
 CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
                                                           const char *option,
@@ -266,7 +252,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
     if (!has_option || !strcmp(option, "machine")) {
         info = g_malloc0(sizeof(*info));
         info->option = g_strdup("machine");
-        info->parameters = query_option_descs(machine_opts.desc);
+        info->parameters = query_all_machine_properties();
         QAPI_LIST_PREPEND(conf_list, info);
     }
 
-- 
2.31.1


