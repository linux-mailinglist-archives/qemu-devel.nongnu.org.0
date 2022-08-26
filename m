Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892245A29A5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaSC-0007LS-J2
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4h-0008GA-RY; Fri, 26 Aug 2022 10:12:44 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4f-000448-6k; Fri, 26 Aug 2022 10:12:43 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11e8b592421so721293fac.0; 
 Fri, 26 Aug 2022 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4vMWFIiY8edz9qwKLIQ1TfpB5gyo8VXp08/rbY8O4KE=;
 b=qIVuYcxm0E1bPHXlsv8hxLj4VNE8wGc1AuCBLK2yPu72o0CrABQ4ZTfu6k7pHlMLMl
 8a43I9PxKfx3ZBs58Ev5p1px1/vwJvp5s7/aX1fwoQa+FhVBlqQrxeRyQwMOeMkGT4Ho
 Ucb1pkHXkWr8im8/gUXpyxNSmrMZqXYP7+pxmDdKBu08mWK4PKaDeRTVaqshOP+WzT+I
 ICsn8lAn2LcWt+atLuVDyFWdJqGuplnKtpW4Aorg213jTN5Ir2v6YImFMMd6uG+6eJA1
 7LLrlELuzWUgDyA+y5ekckPvZXARBVC1+La1j2M/cKXzo7/R/oFL4pHQtcxQnAaE1jqj
 13EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4vMWFIiY8edz9qwKLIQ1TfpB5gyo8VXp08/rbY8O4KE=;
 b=Xqi9D2Eah9sVdCAcq3tpaAEg0JYSDU1gKuDNINVINRJEoQXK420OTlwDa65gJ6Ok+X
 r0ReiKRULOq9JB0U8Mhi9oXMoAtpx2pMoAaVXaTyA6sEpsG1PwkE6EspcweE/gEzbYO+
 8rRkJKLExwSeAt51ygGTp2gnI1WABR3L/Ft/pZmp3hUYCDuG46VY5LSYfgPwhClPSYY8
 uvEKt/c7gS8dUV5WI2nm1VOA4HISkmR+9VhPijn8745myDX/XKaLqaiAc3Twz5IDWFG1
 dgYUaa71/+tCW0BeK8NJc6yzRnISqmQmrxqrbUviQDHc1RsfJD8JPEYMdc7f7jLkEEqT
 vUhg==
X-Gm-Message-State: ACgBeo0MhHO4CZ2apkD3TYI66bOarIcoipxLIoWY1YmqvJ/d7osTUNbU
 vcrxBH6oN7XpVmYu2Lwatp1I3Vk6lYI=
X-Google-Smtp-Source: AA6agR5stmaPlk3Vw6G1EcgWDmlR8Xju4kM3nEHd/e+Z9GKyH3xc9dygW8gh8V7OSa4GgkW8O6No4w==
X-Received: by 2002:a05:6870:f20c:b0:10e:e5e3:dac2 with SMTP id
 t12-20020a056870f20c00b0010ee5e3dac2mr2006895oao.228.1661523159434; 
 Fri, 26 Aug 2022 07:12:39 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH for-7.2 v4 15/21] qmp/hmp,
 device_tree.c: introduce 'info fdt' command
Date: Fri, 26 Aug 2022 11:11:44 -0300
Message-Id: <20220826141150.7201-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
};

And the same node for the aarch64 'virt' machine:

(qemu) info fdt /chosen
chosen {
    stdout-path;
    rng-seed;
    kaslr-seed;
};

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
index 1c7bfd3b9d..93a4103afa 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
         hmp_handle_error(mon, local_err);
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
index cd487ddd4d..6b15f6ace2 100644
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
+    g_string_append_printf(buf, "%*s};\n", padding, "");
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


