Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A540EEC5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 03:33:50 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR2lC-0003v4-2r
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 21:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mR2gp-0008UF-B7
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 21:29:19 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mR2gn-00028q-I0
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 21:29:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B71420254;
 Fri, 17 Sep 2021 01:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631842156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIDmPLiCUGSEbOY6P1kZf8ttCJM80BMchcTHMSif23c=;
 b=bbbx9h9sagg/C9Ge+XogzTr5MWUoOBPsnMHKHG3AY6XroFcusMoPVBigEOS3aXs5xPXLMu
 UpafQ3zwsc2TD+SSxvYrzgmw7AJnPI0sX1ivSq141Qe0YeueEGkNGIKAqdCZLetqI2ABm9
 izK9H63IZspGKOITw0mAboqmNKYO4t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631842156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIDmPLiCUGSEbOY6P1kZf8ttCJM80BMchcTHMSif23c=;
 b=bRJ8rIPenl4LJpIMQjZXh3vfKuQhoHZTFjAKAQXovezmg+DRLkAbUJhVJJbYG9Y/Hw81te
 R7nY4hMJDBXFoqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9D6213DEF;
 Fri, 17 Sep 2021 01:29:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EPCYKmrvQ2GsFgAAMHmgww
 (envelope-from <jziviani@suse.de>); Fri, 17 Sep 2021 01:29:14 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] modules: use a list of supported arch for each module
Date: Thu, 16 Sep 2021 22:29:04 -0300
Message-Id: <20210917012904.26544-3-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917012904.26544-1-jziviani@suse.de>
References: <20210917012904.26544-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling QEMU with more than one target, for instance,
--target-list=s390x-softmmu,x86_64-softmmu, modinfo.c will be
filled with modules available for both, with no specification
of what modules can/cannot be loaded for a particular target.

This will cause message errors when executing the target that
shouldn't be loading that module, such as:

$ qemu-system-s390x -nodefaults -display none -accel qtest -M none -device help
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common

This patch changes the module infrastructure to use a list of
architectures, obtained during the build time, to specify what
targets can load each module.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 include/qemu/module.h       |  2 +-
 meson.build                 | 18 +++++++++++++-----
 scripts/modinfo-collect.py  | 10 ++++++++++
 scripts/modinfo-generate.py |  7 +++----
 util/module.c               | 18 +++++++++++++-----
 5 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 3deac0078b..3b487c646c 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -144,7 +144,7 @@ void module_allow_arch(const char *arch);
 typedef struct QemuModinfo QemuModinfo;
 struct QemuModinfo {
     const char *name;
-    const char *arch;
+    const char **archs;
     const char **objs;
     const char **deps;
     const char **opts;
diff --git a/meson.build b/meson.build
index d1d3fd84ec..efba275092 100644
--- a/meson.build
+++ b/meson.build
@@ -2343,11 +2343,19 @@ foreach d, list : modules
         # unique when it comes to lookup in compile_commands.json.
         # Depnds on a mesion version with
         # https://github.com/mesonbuild/meson/pull/8900
-        modinfo_files += custom_target(d + '-' + m + '.modinfo',
-                                       output: d + '-' + m + '.modinfo',
-                                       input: module_ss.sources() + genh,
-                                       capture: true,
-                                       command: [modinfo_collect, module_ss.sources()])
+        if modules_arch.has_key(m)
+          modinfo_files += custom_target(d + '-' + m + '.modinfo',
+                                        output: d + '-' + m + '.modinfo',
+                                        input: module_ss.sources() + genh,
+                                        capture: true,
+                                        command: [modinfo_collect, module_ss.sources(), '--archs', modules_arch[m]])
+        else
+          modinfo_files += custom_target(d + '-' + m + '.modinfo',
+                                        output: d + '-' + m + '.modinfo',
+                                        input: module_ss.sources() + genh,
+                                        capture: true,
+                                        command: [modinfo_collect, module_ss.sources()])
+        endif
       endif
     else
       if d == 'block'
diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
index 4acb188c3e..739cd23e2f 100755
--- a/scripts/modinfo-collect.py
+++ b/scripts/modinfo-collect.py
@@ -50,6 +50,16 @@ def main(args):
         print("MODINFO_START arch \"%s\" MODINFO_END" % arch)
     with open('compile_commands.json') as f:
         compile_commands = json.load(f)
+
+    try:
+        arch_idx = args.index('--archs')
+        archs = args[arch_idx + 1:]
+        args = args[:arch_idx]
+        for arch in archs:
+            print("MODINFO_START arch \"%s\" MODINFO_END" % arch)
+    except ValueError:
+        pass
+
     for src in args:
         print("MODINFO_DEBUG src %s" % src)
         command = find_command(src, target, compile_commands)
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index f559eed007..e1d13acd92 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -33,7 +33,7 @@ def parse_line(line):
     return (kind, data)
 
 def generate(name, lines):
-    arch = ""
+    archs = []
     objs = []
     deps = []
     opts = []
@@ -47,14 +47,13 @@ def generate(name, lines):
             elif kind == 'opts':
                 opts.append(data)
             elif kind == 'arch':
-                arch = data;
+                archs.append(data);
             else:
                 print("unknown:", kind)
                 exit(1)
 
     print("    .name = \"%s\"," % name)
-    if arch != "":
-        print("    .arch = %s," % arch)
+    print_array("archs", archs)
     print_array("objs", objs)
     print_array("deps", deps)
     print_array("opts", opts)
diff --git a/util/module.c b/util/module.c
index 6bb4ad915a..7009143bfc 100644
--- a/util/module.c
+++ b/util/module.c
@@ -131,16 +131,24 @@ void module_allow_arch(const char *arch)
 
 static bool module_check_arch(const QemuModinfo *modinfo)
 {
-    if (modinfo->arch) {
+    const char **arch;
+
+    if (modinfo->archs) {
         if (!module_arch) {
             /* no arch set -> ignore all */
             return false;
         }
-        if (strcmp(module_arch, modinfo->arch) != 0) {
-            /* mismatch */
-            return false;
+
+        for (arch = modinfo->archs; *arch != NULL; arch++) {
+            if (strcmp(module_arch, *arch) == 0) {
+                return true;
+            }
         }
+
+        /* mismatch */
+        return false;
     }
+
     return true;
 }
 
@@ -245,7 +253,7 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     g_hash_table_add(loaded_modules, module_name);
 
     for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
-        if (modinfo->arch) {
+        if (modinfo->archs) {
             if (strcmp(modinfo->name, module_name) == 0) {
                 if (!module_check_arch(modinfo)) {
                     return false;
-- 
2.33.0


