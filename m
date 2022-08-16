Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8AF596172
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:51:11 +0200 (CEST)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0ic-0005xh-LG
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TF-0005IK-0R; Tue, 16 Aug 2022 13:35:17 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TD-0002bD-3K; Tue, 16 Aug 2022 13:35:16 -0400
Received: by mail-vs1-xe29.google.com with SMTP id d126so10824823vsd.13;
 Tue, 16 Aug 2022 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uU1CRQa9jDFJdCOQTtbovlFtXsejUldJ9OAQTD9CwIA=;
 b=PJfyFlHF2joFMQoDjoSBGhjtRhM1dONJ/jRKkIuF6bbgWKqeCavgKk+rBjj6BE6caD
 Bd+sgye3X0edPhVz+yywQIz/H6NNgNvsCDPEzUkcJmAHb5l24kno7Uy/g0r/PU+0f2Wd
 uzTlO21bXClARwFwZXmpkArj6MIA8DTmzY05ZKxOjpL4JzVxnNXXoAx7jzLAfoqFmQm/
 7hxzS1BzAwNWM5qupvStUiKHpUlQR4mhCpXfVls/1DwUurmRtFvoItYo2Uk44VQjf9X4
 FroGHD2WtMNyeEOD8RGTUSD+nKKklElYk2Xdw/LA9VkfXgWbwbBkeAhhV8Ftj0NL2XUZ
 Q+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uU1CRQa9jDFJdCOQTtbovlFtXsejUldJ9OAQTD9CwIA=;
 b=c0e3LYVcfSVOA8OjJgU1baiFU7mqcvsq3uoqNCPWSrx5wCmbMK8MDtnmjqJM+bA5OO
 BzEjb9+3q1oSONiucdK25ftxL1RxDYmnyI0X7RTzdyfodRcQ/q0HmnUgrUNzD6eOQlUZ
 5GavShWifAuchVTJjaNzPGjPOTmjgy72+yd1Cy7Y10Wy9vDtYueyEnARm3JN6TStzwm+
 S4ESje9/PwP3qgTvfizBEnKz7SoE4bAqwSLF6YOk45+92NvO4xP3Xaft4Awy+Wxyf+87
 8CbDH/f2QKxp9KcBy6ryi2zMtySbK/6TF19r5oVxCFWhecUQFxLsYeZRO+avHaE6x0Sw
 uu7Q==
X-Gm-Message-State: ACgBeo3AyeiCWfow0bdjQcwNxFOkYHbnsMe4KOmYcThujA2nOw3rhayS
 fRO4ve22Q9xHxeEQtfFcxU6RdH8Ftp+5vQ==
X-Google-Smtp-Source: AA6agR648rj0wXRPW5Uspa75jxj8bep1uH4ZyU7GERIKYzky28QBreafg/9zxcZAEwrnf4m4r8fWTA==
X-Received: by 2002:a67:ca98:0:b0:386:2789:bf91 with SMTP id
 a24-20020a67ca98000000b003862789bf91mr9453004vsl.46.1660671313632; 
 Tue, 16 Aug 2022 10:35:13 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 v3 15/20] qmp/hmp,
 device_tree.c: introduce 'info fdt' command
Date: Tue, 16 Aug 2022 14:34:23 -0300
Message-Id: <20220816173428.157304-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reading the FDT requires that the user saves the fdt_blob and then use
'dtc' to read the contents. Saving the file and using 'dtc' is a strong
use case when we need to compare two FDTs, but it's a lot of steps if
you want to do quick check on a certain node or property.

'info fdt' retrieves FDT nodes (and properties, later on) and print it
to the user. This can be used to check the FDT on running machines
without having to save the blob and use 'dtc'.

The implementation is based on the premise that the machine thas a FDT
created using libfdt and pointed by 'machine->fdt'. As long as this
pre-requisite is met the machine should be able to support it.

For now we're going to add the required QMP/HMP boilerplate and the
capability of printing the name of the properties of a given node. Next
patches will extend 'info fdt' to be able to print nodes recursively,
and then individual properties.

This command will always be executed in-band (i.e. holding BQL),
avoiding potential race conditions with machines that might change the
FDT during runtime (e.g. PowerPC 'pseries' machine).

'info fdt' is not something that we expect to be used aside from debugging,
so we're implementing it in QMP as 'x-query-fdt'.

This is an example of 'info fdt' fetching the '/chosen' node of the
pSeries machine:

(qemu) info fdt /chosen
chosen {
    ibm,architecture-vec-5;
    rng-seed;
    ibm,arch-vec-5-platform-support;
    linux,pci-probe-only;
    stdout-path;
    linux,stdout-path;
    qemu,graphic-depth;
    qemu,graphic-height;
    qemu,graphic-width;
}

And the same node for the aarch64 'virt' machine:

(qemu) info fdt /chosen
chosen {
    stdout-path;
    rng-seed;
    kaslr-seed;
}

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands-info.hx         | 13 ++++++++++
 include/monitor/hmp.h        |  1 +
 include/sysemu/device_tree.h |  4 +++
 monitor/hmp-cmds.c           | 13 ++++++++++
 monitor/qmp-cmds.c           | 12 +++++++++
 qapi/machine.json            | 19 +++++++++++++++
 softmmu/device_tree.c        | 47 ++++++++++++++++++++++++++++++++++++
 7 files changed, 109 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 188d9ece3b..743b48865d 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -921,3 +921,16 @@ SRST
   ``stats``
     Show runtime-collected statistics
 ERST
+
+    {
+        .name       = "fdt",
+        .args_type  = "nodepath:s",
+        .params     = "nodepath",
+        .help       = "show firmware device tree node given its path",
+        .cmd        = hmp_info_fdt,
+    },
+
+SRST
+  ``info fdt``
+    Show a firmware device tree node given its path. Requires libfdt.
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index d7f324da59..c0883dd1e3 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
+void hmp_info_fdt(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index bf7684e4ed..057d13e397 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -14,6 +14,8 @@
 #ifndef DEVICE_TREE_H
 #define DEVICE_TREE_H
 
+#include "qapi/qapi-types-common.h"
+
 void *create_device_tree(int *sizep);
 void *load_device_tree(const char *filename_path, int *sizep);
 #ifdef CONFIG_LINUX
@@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
 
 void qemu_fdt_dumpdtb(void *fdt, int size);
 void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
+HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
+                                          Error **errp);
 
 /**
  * qemu_fdt_setprop_sized_cells_from_array:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d23ec85f9d..accde90380 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
         error_report_err(local_err);
     }
 }
+
+void hmp_info_fdt(Monitor *mon, const QDict *qdict)
+{
+    const char *nodepath = qdict_get_str(qdict, "nodepath");
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
+
+    if (hmp_handle_error(mon, err)) {
+        return;
+    }
+
+    monitor_printf(mon, "%s", info->human_readable_text);
+}
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 8415aca08c..db2c6aa7da 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **errp)
 {
     return qemu_fdt_qmp_dumpdtb(filename, errp);
 }
+
+HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
+{
+    return qemu_fdt_qmp_query_fdt(nodepath, errp);
+}
 #else
 void qmp_dumpdtb(const char *filename, Error **errp)
 {
     error_setg(errp, "dumpdtb requires libfdt");
 }
+
+HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
+{
+    error_setg(errp, "this command requires libfdt");
+
+    return NULL;
+}
 #endif
diff --git a/qapi/machine.json b/qapi/machine.json
index aeb013f3dd..96cff541ca 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1681,3 +1681,22 @@
 ##
 { 'command': 'dumpdtb',
   'data': { 'filename': 'str' } }
+
+##
+# @x-query-fdt:
+#
+# Query for FDT element (node or property). Requires 'libfdt'.
+#
+# @nodepath: the path of the FDT node to be retrieved
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: FDT node
+#
+# Since: 7.2
+##
+{ 'command': 'x-query-fdt',
+  'data': { 'nodepath': 'str' },
+  'returns': 'HumanReadableText',
+  'features': [ 'unstable' ]  }
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index cd487ddd4d..3fb07b537f 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -18,6 +18,7 @@
 #endif
 
 #include "qapi/error.h"
+#include "qapi/type-helpers.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qemu/bswap.h"
@@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
 
     error_setg(errp, "Error when saving machine FDT to file %s", filename);
 }
+
+static void fdt_format_node(GString *buf, int node, int depth)
+{
+    const struct fdt_property *prop = NULL;
+    const char *propname = NULL;
+    void *fdt = current_machine->fdt;
+    int padding = depth * 4;
+    int property = 0;
+    int prop_size;
+
+    g_string_append_printf(buf, "%*s%s {\n", padding, "",
+                           fdt_get_name(fdt, node, NULL));
+
+    padding += 4;
+
+    fdt_for_each_property_offset(property, fdt, node) {
+        prop = fdt_get_property_by_offset(fdt, property, &prop_size);
+        propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+
+        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+    }
+
+    padding -= 4;
+    g_string_append_printf(buf, "%*s}\n", padding, "");
+}
+
+HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    int node;
+
+    if (!current_machine->fdt) {
+        error_setg(errp, "Unable to find the machine FDT");
+        return NULL;
+    }
+
+    node = fdt_path_offset(current_machine->fdt, nodepath);
+    if (node < 0) {
+        error_setg(errp, "node '%s' not found in FDT", nodepath);
+        return NULL;
+    }
+
+    fdt_format_node(buf, node, 0);
+
+    return human_readable_text_from_str(buf);
+}
-- 
2.37.2


