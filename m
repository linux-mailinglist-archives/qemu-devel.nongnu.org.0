Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A43C15DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:21:58 +0200 (CEST)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vqf-0000KJ-5a
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-000092-Gy
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmn-00089Y-Fv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:00 -0400
Received: by mail-ed1-x531.google.com with SMTP id eb14so9127638edb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9qpX/JZQrvQ0rLcsL6eA3CT23o+gxDH5id2jLKyMJEM=;
 b=vDGYAmtMlmG7ZZcsfGfzA0zln4jUp1oxICtfAlEY2D/izYcwtP6iBc3QIL8f7qc7b0
 YLM3Q0MjoUIpm+HWX2qs0ooym/iHMId5bYPPa6WmJt/iAtoRCMSGG0aKVeUoKj+D0sSN
 Vq4Qr5lhB/FAbi+aB8Cx+a1ZqFV59AuKtUmp1CjMVYDxWYLIi//uCHvZAT2VNSdUCo8M
 xDwtdsCaGATW+yVOC7wWsqZmQLhZHfjRc2+Q+Hym20t2ggqiQJ0tyKGP/OZpR8vZM2cb
 3hX8LeRABatHffE7gpUJWxizFWxc7LFwUi8tRC5XOaVP7PT1k/unE+Q5XNpi6Jfz3d6b
 Yq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9qpX/JZQrvQ0rLcsL6eA3CT23o+gxDH5id2jLKyMJEM=;
 b=RAwDgoklPrcqC2srPp8PC5SOVezCCrUUNtW6/M2GONM9ecqPiCTEVondYAqvsAGYHY
 mVmBFFSM1V0v2y2K1RrfU4M7JH9ArKiF/zoxS14MhZLae/cmpAqOjM/Nxpo4Sitt2fWw
 aeSHL8c7K+ILn08Cwfq9/R3aiqy+LazsUvFRuVUFgaP6omcAlksAUFLdMwFKmHB1ckBG
 ZksLoQVxCM5nqc/RpgImI02rLRNeNcpf/qS3SrdjyCvQ2E5XaiFiiJLjptn+du+Kp/ar
 v1EQaVuS8TGyyS8wikcAjoTSaJCRSFfJvnv6cGin3JMtmBNiyr4mMFJbrvhsa4n2B7OZ
 rGag==
X-Gm-Message-State: AOAM531efl7OJ3I/iKO07pBYd5BqpvfMNbw1GG69NI/vvynJ4kN98WgQ
 WJmQHXeySmzaohOZrwUkreZlMlW3Yw8=
X-Google-Smtp-Source: ABdhPJxoPwGzaD967G5UMjO91qWUPUVaVvp+eXXHXJkZ0fDYv9fMftnuE0tMRlbP1ca0/tDSeAn5AA==
X-Received: by 2002:a50:fe8d:: with SMTP id d13mr39254789edt.14.1625757474881; 
 Thu, 08 Jul 2021 08:17:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/48] modules: generate modinfo.c
Date: Thu,  8 Jul 2021 17:17:07 +0200
Message-Id: <20210708151748.408754-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Add script to generate C source with a small
database containing the module meta-data.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-4-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/module.h       | 17 ++++++++
 meson.build                 | 13 +++++-
 scripts/modinfo-generate.py | 84 +++++++++++++++++++++++++++++++++++++
 softmmu/vl.c                |  4 ++
 util/module.c               | 11 +++++
 5 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100755 scripts/modinfo-generate.py

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 81ef086da0..a98748d501 100644
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
diff --git a/meson.build b/meson.build
index ff580f1f80..7b827f7caa 100644
--- a/meson.build
+++ b/meson.build
@@ -2242,6 +2242,7 @@ subdir('tests/qtest/fuzz')
 ########################
 
 modinfo_collect = find_program('scripts/modinfo-collect.py')
+modinfo_generate = find_program('scripts/modinfo-generate.py')
 modinfo_files = []
 
 block_mods = []
@@ -2267,7 +2268,6 @@ foreach d, list : modules
                                        output: d + '-' + m + '.modinfo',
                                        input: module_ss.sources(),
                                        capture: true,
-                                       build_by_default: true, # to be removed when added to a target
                                        command: [modinfo_collect, '@INPUT@'])
       endif
     else
@@ -2280,6 +2280,17 @@ foreach d, list : modules
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
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
new file mode 100755
index 0000000000..a6d98a6bc4
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
diff --git a/softmmu/vl.c b/softmmu/vl.c
index a50c8575a1..7cef3423a7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2755,6 +2755,10 @@ void qemu_init(int argc, char **argv, char **envp)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
+#ifdef CONFIG_MODULES
+    module_init_info(qemu_modinfo);
+#endif
+
     qemu_init_subsystems();
 
     /* first pass of option parsing */
diff --git a/util/module.c b/util/module.c
index eee8ff2de1..8d3e8275b9 100644
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
-- 
2.31.1



