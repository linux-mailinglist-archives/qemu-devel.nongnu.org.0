Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E507F48DA3C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:58:12 +0100 (CET)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81YJ-0005Tx-EQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n7yok-0006pE-RX
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:02:59 -0500
Received: from [2607:f8b0:4864:20::f36] (port=45985
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n7yoh-0006As-44
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 07:02:57 -0500
Received: by mail-qv1-xf36.google.com with SMTP id 15so6304013qvp.12
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 04:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cltHoKovWAaw2o+jBjnNyo83LuXjlr4IX9eikMJ8vMk=;
 b=WYgEH6poLfTO/bJooR4x0MYPzfEdI6ryViojIkxcY8U8Lxrj4d/NaMSejV7uuNxzjo
 IXtuu5GDHnk90ZTp1ttbSLWFYLzQy/E0GL3SeQdbLZuQIOOPst0Qm3ybo4apDxvQiP3e
 PCJ1rOEHftZm2sy/vpkZUNyWzyL6AH7GDHArToLitfn5cJ88dOTSifGQw28Cmw2Oh4Pg
 Wd+L+/byDRIueiKD51QhJEgj6SFORDrFoSYtOMiJLNmuAAUCNrfqll6zmWGw2aOhGGZY
 wkFtGdVquXFYWkyZ2CLsogS+c4mZbF/WOo3CmjUJC29M4f4c23r84MLLZLN88ytYd9zy
 MASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cltHoKovWAaw2o+jBjnNyo83LuXjlr4IX9eikMJ8vMk=;
 b=OT4i4piSA6wJ2QYtxIJco1AEsl8dFA6YlzbZQiJN5oxfkSgByAtiNas/+AlxJS5WK5
 ZInND4HaivaH1tfYcFbOVqkl9f7ey8e6hRSv4fOO8PtGmEWSVfotCNr3Va4XqTAos/nW
 w7wxVrJ0sXVh3yEhf/EXTqM0NSreQs+TSd32rBO+shavqlB/sDEpDZm7oK+apYBbxrrB
 hCYixeYBHpKdTWfKRy0gT/ajAavxxU0zNyq+s5SprOCgtj51uYlGaHZBzqOMOkoC3U1/
 /sZqtaq1ibN4zOqs+gSjaK/Z1lB5AKpWJZkVaXOL/0qWrLbTG1Cu0m+sVwIKr4QUHAjU
 FHOw==
X-Gm-Message-State: AOAM532kn2uj79rq1JHn4aqwp7Dgf3bVvN8RQq2/Qc5iFxOFTcoln+nH
 0uClHyzCM7sI//3fJqu4fe3fGww6UWNIgA==
X-Google-Smtp-Source: ABdhPJz4wUzkIpcVsYmB5ygNsd2h9yRdEpF9Ju4wR86H8MvhMChlqXokgOlCWQyU6fp1RihPakIwPA==
X-Received: by 2002:a17:902:bc86:b0:149:8dd5:a382 with SMTP id
 bb6-20020a170902bc8600b001498dd5a382mr4088144plb.52.1642075031396; 
 Thu, 13 Jan 2022 03:57:11 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.242])
 by smtp.gmail.com with ESMTPSA id f9sm2387572pjh.18.2022.01.13.03.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 03:57:11 -0800 (PST)
From: Ruien Zhang <zhangruien@bytedance.com>
To: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com, berrange@redhat.com
Subject: [PATCH 1/2] printer: Introduce printer subsystem
Date: Thu, 13 Jan 2022 19:56:58 +0800
Message-Id: <20220113115659.72788-2-zhangruien@bytedance.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220113115659.72788-1-zhangruien@bytedance.com>
References: <20220113115659.72788-1-zhangruien@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=zhangruien@bytedance.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 09:54:20 -0500
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
Cc: qemu-devel@nongnu.org, zhangruien <zhangruien@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhangruien <zhangruien@bytedance.com>

This patch describes the skeleton of QEMU printer subsystem with a
dummy builtin driver.

Signed-off-by: zhangruien <zhangruien@bytedance.com>
---
 MAINTAINERS               |   7 ++
 include/printer/printer.h |  42 ++++++++++
 meson.build               |  12 ++-
 meson_options.txt         |   3 +
 printer/builtin.c         |  61 +++++++++++++++
 printer/meson.build       |  14 ++++
 printer/printer.c         | 191 ++++++++++++++++++++++++++++++++++++++++++++++
 printer/trace-events      |   5 ++
 printer/trace.h           |   1 +
 qapi/meson.build          |   1 +
 qapi/printer.json         |  47 ++++++++++++
 qapi/qapi-schema.json     |   1 +
 qemu-options.hx           |   8 ++
 softmmu/vl.c              |   4 +
 14 files changed, 396 insertions(+), 1 deletion(-)
 create mode 100644 include/printer/printer.h
 create mode 100644 printer/builtin.c
 create mode 100644 printer/meson.build
 create mode 100644 printer/printer.c
 create mode 100644 printer/trace-events
 create mode 100644 printer/trace.h
 create mode 100644 qapi/printer.json

diff --git a/MAINTAINERS b/MAINTAINERS
index c98a61caee..689f20d740 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3086,6 +3086,13 @@ F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
 
+Printer Subsystem
+M: Ruien Zhang <zhangruien@bytedance.com>
+S: Maintained
+F: include/printer
+F: printer
+F: qapi/printer.json
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
diff --git a/include/printer/printer.h b/include/printer/printer.h
new file mode 100644
index 0000000000..c8afbc64c8
--- /dev/null
+++ b/include/printer/printer.h
@@ -0,0 +1,42 @@
+/*
+ * QEMU Printer subsystem header
+ *
+ * Copyright (c) 2022 ByteDance, Inc.
+ *
+ * Author:
+ *   Ruien Zhang <zhangruien@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_PRINTER_H
+#define QEMU_PRINTER_H
+
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "qapi/qapi-types-printer.h"
+
+#define TYPE_PRINTERDEV "printerdev"
+
+struct QEMUPrinter {
+    Object  *parent_obj;
+
+    char *model;
+    Printerdev *dev;
+
+    QLIST_ENTRY(QEMUPrinter) list;
+};
+
+OBJECT_DECLARE_TYPE(QEMUPrinter, QEMUPrinterClass, PRINTERDEV)
+
+struct QEMUPrinterClass {
+    ObjectClass parent_class;
+};
+
+void qemu_printer_new_from_opts(const char *opt);
+void qemu_printer_del(QEMUPrinter *printer);
+const char *qemu_printer_id(QEMUPrinter *printer);
+QEMUPrinter *qemu_printer_by_id(const char *id);
+
+#endif /* QEMU_PRINTER_H */
diff --git a/meson.build b/meson.build
index c1b1db1e28..b3db26190d 100644
--- a/meson.build
+++ b/meson.build
@@ -2397,6 +2397,7 @@ genh += hxdep
 authz_ss = ss.source_set()
 blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
+printer_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 common_user_ss = ss.source_set()
@@ -2455,6 +2456,7 @@ if have_system
     'audio',
     'backends',
     'backends/tpm',
+    'printer',
     'chardev',
     'ebpf',
     'hw/9pfs',
@@ -2574,6 +2576,7 @@ endif
 
 subdir('audio')
 subdir('io')
+subdir('printer')
 subdir('chardev')
 subdir('fsdev')
 subdir('dump')
@@ -2843,6 +2846,13 @@ libqmp = static_library('qmp', qmp_ss.sources() + genh,
 
 qmp = declare_dependency(link_whole: [libqmp])
 
+printer_ss = printer_ss.apply(config_host, strict: false)
+libprinter = static_library('printer', printer_ss.sources() + genh,
+                            name_suffix: 'fa',
+                            build_by_default: false)
+
+printer = declare_dependency(link_whole: libprinter)
+
 libchardev = static_library('chardev', chardev_ss.sources() + genh,
                             name_suffix: 'fa',
                             dependencies: [gnutls],
@@ -2869,7 +2879,7 @@ foreach m : block_mods + softmmu_mods
                 install_dir: qemu_moddir)
 endforeach
 
-softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
+softmmu_ss.add(authz, blockdev, printer, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
 
 common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..5b3b502798 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -208,3 +208,6 @@ option('fdt', type: 'combo', value: 'auto',
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
+
+option('printer', type: 'feature', value: 'auto',
+       description: 'Printer subsystem support')
diff --git a/printer/builtin.c b/printer/builtin.c
new file mode 100644
index 0000000000..bc33a1d363
--- /dev/null
+++ b/printer/builtin.c
@@ -0,0 +1,61 @@
+/*
+ * QEMU Builtin printer backend
+ *
+ * Copyright (c) 2022 ByteDance, Inc.
+ *
+ * Author:
+ *   Ruien Zhang <zhangruien@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qapi-visit-printer.h"
+#include "printer/printer.h"
+#include "trace.h"
+
+#define TYPE_PRINTER_BUILTIN TYPE_PRINTERDEV"-builtin"
+
+typedef struct PrinterBuiltin {
+    QEMUPrinter parent;
+
+    void *opaque; /* used by driver itself */
+} PrinterBuiltin;
+
+DECLARE_INSTANCE_CHECKER(PrinterBuiltin, PRINTER_BUILTIN_DEV,
+                         TYPE_PRINTER_BUILTIN)
+
+static void printer_builtin_init(Object *obj)
+{
+}
+
+static void printer_builtin_finalize(Object *obj)
+{
+}
+
+static void printer_builtin_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static const TypeInfo printer_builtin_type_info = {
+    .name = TYPE_PRINTER_BUILTIN,
+    .parent = TYPE_PRINTERDEV,
+    .instance_size = sizeof(PrinterBuiltin),
+    .instance_init = printer_builtin_init,
+    .instance_finalize = printer_builtin_finalize,
+    .class_init = printer_builtin_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&printer_builtin_type_info);
+}
+
+type_init(register_types);
diff --git a/printer/meson.build b/printer/meson.build
new file mode 100644
index 0000000000..9814de2a57
--- /dev/null
+++ b/printer/meson.build
@@ -0,0 +1,14 @@
+printer_ss.add([files(
+  'printer.c',
+)])
+
+printer_modules = {}
+foreach m : [
+  ['builtin', files('builtin.c')],
+]
+  module_ss = ss.source_set()
+  module_ss.add(m[1])
+  printer_modules += {m[0] : module_ss}
+endforeach
+
+modules += {'printer': printer_modules}
diff --git a/printer/printer.c b/printer/printer.c
new file mode 100644
index 0000000000..2d3f57a6e1
--- /dev/null
+++ b/printer/printer.c
@@ -0,0 +1,191 @@
+/*
+ * QEMU Printer subsystem
+ *
+ * Copyright (c) 2022 ByteDance, Inc.
+ *
+ * Author:
+ *   Ruien Zhang <zhangruien@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/help_option.h"
+#include "qemu/iov.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/qemu-print.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-printer.h"
+#include "printer/printer.h"
+#include "trace.h"
+
+static QLIST_HEAD(, QEMUPrinter) qemu_printers;
+
+const char *qemu_printer_id(QEMUPrinter *printer)
+{
+    if (printer->dev && printer->dev->id) {
+        return printer->dev->id;
+    }
+
+    return "";
+}
+
+QEMUPrinter *qemu_printer_by_id(const char *id)
+{
+    QEMUPrinter *printer;
+
+    if (!id) {
+        return NULL;
+    }
+
+    QLIST_FOREACH(printer, &qemu_printers, list) {
+        if (!strcmp(qemu_printer_id(printer), id)) {
+            return printer;
+        }
+    }
+
+    return NULL;
+}
+
+static const QEMUPrinterClass *printer_get_class(const char *typename,
+                                               Error **errp)
+{
+    ObjectClass *oc;
+
+    oc = module_object_class_by_name(typename);
+
+    if (!object_class_dynamic_cast(oc, TYPE_PRINTERDEV)) {
+        error_setg(errp, "%s: missing %s implementation",
+                   TYPE_PRINTERDEV, typename);
+        return NULL;
+    }
+
+    if (object_class_is_abstract(oc)) {
+        error_setg(errp, "%s: %s is abstract type", TYPE_PRINTERDEV, typename);
+        return NULL;
+    }
+
+    return PRINTERDEV_CLASS(oc);
+}
+
+static QEMUPrinter *qemu_printer_new(Printerdev *dev, Error **errp)
+{
+    Object *obj;
+    QEMUPrinter *printer = NULL;
+    g_autofree char *typename = NULL;
+    const char *driver = PrinterdevDriver_str(dev->driver);
+
+    typename = g_strdup_printf("%s-%s", TYPE_PRINTERDEV, driver);
+    if (!printer_get_class(typename, errp)) {
+        return NULL;
+    }
+
+    obj = object_new(typename);
+    if (!obj) {
+        return NULL;
+    }
+
+    printer = PRINTERDEV(obj);
+    printer->dev = dev;
+
+    QLIST_INSERT_HEAD(&qemu_printers, printer, list);
+    trace_qemu_printer_new(qemu_printer_id(printer), typename);
+
+    return printer;
+}
+
+typedef struct PrinterdevClassFE {
+    void (*fn)(const char *name, void *opaque);
+    void *opaque;
+} PrinterdevClassFE;
+
+static void printerdev_class_foreach(ObjectClass *klass, void *opaque)
+{
+    PrinterdevClassFE *fe = opaque;
+
+    assert(g_str_has_prefix(object_class_get_name(klass), TYPE_PRINTERDEV"-"));
+    fe->fn(object_class_get_name(klass) + 11, fe->opaque);
+}
+
+static void printerdev_name_foreach(void (*fn)(const char *name, void *opaque),
+                                   void *opaque)
+{
+    PrinterdevClassFE fe = { .fn = fn, .opaque = opaque };
+
+    object_class_foreach(printerdev_class_foreach, TYPE_PRINTERDEV, false, &fe);
+}
+
+static void help_string_append(const char *name, void *opaque)
+{
+    GString *str = opaque;
+
+    g_string_append_printf(str, "\n  %s", name);
+}
+
+void qemu_printer_new_from_opts(const char *opt)
+{
+    Printerdev *dev;
+
+    if (opt && is_help_option(opt)) {
+        GString *str = g_string_new("");
+
+        printerdev_name_foreach(help_string_append, str);
+
+        qemu_printf("Available printerdev backend types: %s\n", str->str);
+        g_string_free(str, true);
+        return;
+    }
+
+    Visitor *v = qobject_input_visitor_new_str(opt, "driver", &error_fatal);
+    visit_type_Printerdev(v, NULL, &dev, &error_fatal);
+    visit_free(v);
+
+    if (qemu_printer_by_id(dev->id)) {
+        error_setg(&error_fatal, "%s: id %s already existed",
+                   TYPE_PRINTERDEV, dev->id);
+    }
+
+    if (!qemu_printer_new(dev, &error_fatal)) {
+        qapi_free_Printerdev(dev);
+    }
+}
+
+void qemu_printer_del(QEMUPrinter *printer)
+{
+    trace_qemu_printer_del(qemu_printer_id(printer));
+
+    QLIST_REMOVE(printer, list);
+    qapi_free_Printerdev(printer->dev);
+    object_unref(printer);
+}
+
+
+static void printer_init(Object *obj)
+{
+}
+
+static void printer_finalize(Object *obj)
+{
+}
+
+static const TypeInfo printer_type_info = {
+    .name = TYPE_PRINTERDEV,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(QEMUPrinter),
+    .instance_init = printer_init,
+    .instance_finalize = printer_finalize,
+    .abstract = true,
+    .class_size = sizeof(QEMUPrinterClass),
+};
+
+static void register_types(void)
+{
+    type_register_static(&printer_type_info);
+}
+
+type_init(register_types);
diff --git a/printer/trace-events b/printer/trace-events
new file mode 100644
index 0000000000..e453bbe691
--- /dev/null
+++ b/printer/trace-events
@@ -0,0 +1,5 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# printer.c
+qemu_printer_new(const char *dev, char *typename) "%s: new printer with type %s"
+qemu_printer_del(const char *dev) "%s: delete printer"
diff --git a/printer/trace.h b/printer/trace.h
new file mode 100644
index 0000000000..9717d37ac7
--- /dev/null
+++ b/printer/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-printer.h"
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..f85af6b7d6 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -59,6 +59,7 @@ if have_system
     'rdma',
     'rocker',
     'tpm',
+    'printer',
   ]
 endif
 if have_system or have_tools
diff --git a/qapi/printer.json b/qapi/printer.json
new file mode 100644
index 0000000000..9c2ecfe874
--- /dev/null
+++ b/qapi/printer.json
@@ -0,0 +1,47 @@
+# -*- mode: python -*-
+#
+# Copyright (C) 2022 Ruien Zhang <zhangruien@bytedance.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+
+##
+# = Printer
+##
+
+##
+# @PrinterBuiltinOptions:
+#
+# Options of the builtin printer.
+#
+# Since: 6.3
+##
+{ 'struct': 'PrinterBuiltinOptions',
+  'data': {} }
+
+##
+# @PrinterdevDriver:
+#
+# An enumeration of possible printer backend drivers.
+#
+# Since: 6.3
+##
+{ 'enum': 'PrinterdevDriver',
+  'data': [ 'builtin' ] }
+
+##
+# @Printerdev:
+#
+# Captures the configuration of a printer device.
+#
+# @id: identifier for monitor commands.
+#
+# Since: 6.3
+##
+{ 'union': 'Printerdev',
+  'base': {
+    'id': 'str',
+    'driver': 'PrinterdevDriver'},
+  'discriminator': 'driver',
+  'data': {
+    'builtin': 'PrinterBuiltinOptions' } }
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e..114b6a80cb 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'printer.json' }
diff --git a/qemu-options.hx b/qemu-options.hx
index ec90505d84..448a456f86 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3564,6 +3564,14 @@ The available backends are:
     traffic identified by a name (preferably a fqdn).
 ERST
 
+DEFHEADING(Printer device options:)
+
+DEF("printerdev", HAS_ARG, QEMU_OPTION_printerdev,
+    "-printerdev help\n"
+    "-printerdev builtin,id=id\n"
+    , QEMU_ARCH_ALL
+)
+
 DEFHEADING()
 
 #ifdef CONFIG_TPM
diff --git a/softmmu/vl.c b/softmmu/vl.c
index a8cad43691..67b3c48fa1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -94,6 +94,7 @@
 #ifdef CONFIG_VIRTFS
 #include "fsdev/qemu-fsdev.h"
 #endif
+#include "printer/printer.h"
 #include "sysemu/qtest.h"
 
 #include "disas/disas.h"
@@ -3247,6 +3248,9 @@ void qemu_init(int argc, char **argv, char **envp)
                              qemu_opt_get(opts, "mount_tag"), &error_abort);
                 break;
             }
+            case QEMU_OPTION_printerdev:
+                qemu_printer_new_from_opts(optarg);
+                break;
             case QEMU_OPTION_serial:
                 add_device_config(DEV_SERIAL, optarg);
                 default_serial = 0;
-- 
2.11.0


