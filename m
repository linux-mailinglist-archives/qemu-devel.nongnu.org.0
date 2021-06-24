Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE53B2C97
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:41:07 +0200 (CEST)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMnC-0001J8-D8
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlF-000647-Lj
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMl8-0006Qh-KY
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32lYhgKDoWdBOWDJ47yrXyUFVTwoHh26BD9yr4QhNTI=;
 b=gvJbgVlH09abdPniCiNBpxw6MQ0m+xKrCGlJeRowIYILdWl7j7irVav+vVbNzAJu/H0Dyn
 UXQk5prh7bdDDrQIgP7xqu3nSryueIAlQEwVzs2Su4bCUgUN9Z/9hUupxnVsdmpSkTCNE+
 3XPl9Yza1Q83uIrKEzF1h8GjOwcKOr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289--cacTNEXPNOOpr6XgA0Jag-1; Thu, 24 Jun 2021 06:38:56 -0400
X-MC-Unique: -cacTNEXPNOOpr6XgA0Jag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B71FB106B7DB;
 Thu, 24 Jun 2021 10:38:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B3945C1BB;
 Thu, 24 Jun 2021 10:38:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0CF3418007A6; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/34] modules: generate modinfo.c
Date: Thu, 24 Jun 2021 12:38:05 +0200
Message-Id: <20210624103836.2382472-4-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add script to generate C source with a small
database containing the module meta-data.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/modinfo-generate.py | 84 +++++++++++++++++++++++++++++++++++++
 include/qemu/module.h       | 17 ++++++++
 softmmu/vl.c                |  4 ++
 util/module.c               | 11 +++++
 meson.build                 | 13 +++++-
 5 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100755 scripts/modinfo-generate.py

diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
new file mode 100755
index 000000000000..a6d98a6bc4cc
--- /dev/null
+++ b/scripts/modinfo-generate.py
@@ -0,0 +1,84 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+
+import os
+import sys
+
+def print_array(name, values):
+    if len(values) == 0:
+        return
+    list = ", ".join(values)
+    print("    .%s = ((const char*[]){ %s, NULL })," % (name, list))
+
+def parse_line(line):
+    kind = ""
+    data = ""
+    get_kind = False
+    get_data = False
+    for item in line.split():
+        if item == "MODINFO_START":
+            get_kind = True
+            continue
+        if item.startswith("MODINFO_END"):
+            get_data = False
+            continue
+        if get_kind:
+            kind = item
+            get_kind = False
+            get_data = True
+            continue
+        if get_data:
+            data += " " + item
+            continue
+    return (kind, data)
+
+def generate(name, lines):
+    arch = ""
+    objs = []
+    deps = []
+    opts = []
+    for line in lines:
+        if line.find("MODINFO_START") != -1:
+            (kind, data) = parse_line(line)
+            if kind == 'obj':
+                objs.append(data)
+            elif kind == 'dep':
+                deps.append(data)
+            elif kind == 'opts':
+                opts.append(data)
+            elif kind == 'arch':
+                arch = data;
+            else:
+                print("unknown:", kind)
+                exit(1)
+
+    print("    .name = \"%s\"," % name)
+    if arch != "":
+        print("    .arch = %s," % arch)
+    print_array("objs", objs)
+    print_array("deps", deps)
+    print_array("opts", opts)
+    print("},{");
+
+def print_pre():
+    print("/* generated by scripts/modinfo-generate.py */")
+    print("#include \"qemu/osdep.h\"")
+    print("#include \"qemu/module.h\"")
+    print("const QemuModinfo qemu_modinfo[] = {{")
+
+def print_post():
+    print("    /* end of list */")
+    print("}};")
+
+def main(args):
+    print_pre()
+    for modinfo in args:
+        with open(modinfo) as f:
+            lines = f.readlines()
+        print("    /* %s */" % modinfo)
+        (basename, ext) = os.path.splitext(modinfo)
+        generate(basename, lines)
+    print_post()
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 81ef086da023..a98748d501d3 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -98,4 +98,21 @@ void module_load_qom_all(void);
 /* module registers QemuOpts <name> */
 #define module_opts(name) modinfo(opts, name)
 
+/*
+ * module info database
+ *
+ * scripts/modinfo-generate.c will build this using the data collected
+ * by scripts/modinfo-collect.py
+ */
+typedef struct QemuModinfo QemuModinfo;
+struct QemuModinfo {
+    const char *name;
+    const char *arch;
+    const char **objs;
+    const char **deps;
+    const char **opts;
+};
+extern const QemuModinfo qemu_modinfo[];
+void module_init_info(const QemuModinfo *info);
+
 #endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index feb4d201f30f..e001505d79f7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2740,6 +2740,10 @@ void qemu_init(int argc, char **argv, char **envp)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
+#ifdef CONFIG_MODULES
+    module_init_info(qemu_modinfo);
+#endif
+
     qemu_init_subsystems();
 
     /* first pass of option parsing */
diff --git a/util/module.c b/util/module.c
index eee8ff2de136..8d3e8275b9f7 100644
--- a/util/module.c
+++ b/util/module.c
@@ -110,6 +110,17 @@ void module_call_init(module_init_type type)
 }
 
 #ifdef CONFIG_MODULES
+
+static const QemuModinfo module_info_stub[] = { {
+    /* end of list */
+} };
+static const QemuModinfo *module_info = module_info_stub;
+
+void module_init_info(const QemuModinfo *info)
+{
+    module_info = info;
+}
+
 static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
 {
     GModule *g_module;
diff --git a/meson.build b/meson.build
index 30ca06c6c2d4..6ae2b9ab9443 100644
--- a/meson.build
+++ b/meson.build
@@ -2022,6 +2022,7 @@ subdir('tests/qtest/fuzz')
 ########################
 
 modinfo_collect = find_program('scripts/modinfo-collect.py')
+modinfo_generate = find_program('scripts/modinfo-generate.py')
 modinfo_files = []
 
 block_mods = []
@@ -2047,7 +2048,6 @@ foreach d, list : modules
                                        output: d + '-' + m + '.modinfo',
                                        input: module_ss.sources(),
                                        capture: true,
-                                       build_by_default: true, # to be removed when added to a target
                                        command: [modinfo_collect, '@INPUT@'])
       endif
     else
@@ -2060,6 +2060,17 @@ foreach d, list : modules
   endforeach
 endforeach
 
+if enable_modules
+  modinfo_src = custom_target('modinfo.c',
+                              output: 'modinfo.c',
+                              input: modinfo_files,
+                              command: [modinfo_generate, '@INPUT@'],
+                              capture: true)
+  modinfo_lib = static_library('modinfo', modinfo_src)
+  modinfo_dep = declare_dependency(link_whole: modinfo_lib)
+  softmmu_ss.add(modinfo_dep)
+endif
+
 nm = find_program('nm')
 undefsym = find_program('scripts/undefsym.py')
 block_syms = custom_target('block.syms', output: 'block.syms',
-- 
2.31.1


