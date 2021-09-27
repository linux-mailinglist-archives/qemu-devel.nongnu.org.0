Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6B419611
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:16:48 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrR1-0008W8-3b
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mUrMm-0003UR-TY
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mUrMg-0005nc-Ds
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 318C6221ED;
 Mon, 27 Sep 2021 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632751937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLT3mkHcGKsKQnI/z1NQlD0W7SfmvXPeUCUV5W6U3Qg=;
 b=oAz7VXdTzsBM/t2tQpKBEsMr5J1QWPHpaAmAcdYrqpsAPEG1GnpU9i3kFeXDFwV9oiPNW/
 i8CduhNZb11JGY+5FcIEaXAmTtbMLZeWTmHHXJ+CPbq1fq3UH5m12cXg4FJgMNWEBwJhGj
 sTKiCf1AAlZzo1bCQoWtIUxtj5YnF7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632751937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLT3mkHcGKsKQnI/z1NQlD0W7SfmvXPeUCUV5W6U3Qg=;
 b=jfHDNn1q2dMGH4yhucNeDHqFTYZtyU4L86kQgXrj8GWYDZULlNyMO6SqriBGfHiXNT+cP9
 FPL8jRSDWVYmZtCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A78DB13A91;
 Mon, 27 Sep 2021 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MMS5Gj/RUWH+LwAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 27 Sep 2021 14:12:15 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] modules: generates per-target modinfo
Date: Mon, 27 Sep 2021 11:12:01 -0300
Message-Id: <20210927141201.21833-4-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927141201.21833-1-jziviani@suse.de>
References: <20210927141201.21833-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
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

This patch changes the way modinfo is generated and built. Today we have
only modinfo.c being genereated and linked to all targets, now it
generates (and link) one modinfo per target.

It also makes use of the module_need to add modules that makes sense for
the selected target.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 meson.build                 | 25 +++++++++++++++--------
 scripts/modinfo-generate.py | 40 +++++++++++++++++++++----------------
 2 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/meson.build b/meson.build
index 2711cbb789..9d25ebb2f9 100644
--- a/meson.build
+++ b/meson.build
@@ -2395,14 +2395,23 @@ foreach d, list : target_modules
 endforeach
 
 if enable_modules
-  modinfo_src = custom_target('modinfo.c',
-                              output: 'modinfo.c',
-                              input: modinfo_files,
-                              command: [modinfo_generate, '@INPUT@'],
-                              capture: true)
-  modinfo_lib = static_library('modinfo', modinfo_src)
-  modinfo_dep = declare_dependency(link_whole: modinfo_lib)
-  softmmu_ss.add(modinfo_dep)
+  foreach target : target_dirs
+    if target.endswith('-softmmu')
+      config_target = config_target_mak[target]
+      config_devices_mak = target + '-config-devices.mak'
+      modinfo_src = custom_target('modinfo-' + target + '.c',
+                                  output: 'modinfo-' + target + '.c',
+                                  input: modinfo_files,
+                                  command: [modinfo_generate, '--devices', config_devices_mak, '@INPUT@'],
+                                  capture: true)
+
+      modinfo_lib = static_library('modinfo-' + target + '.c', modinfo_src)
+      modinfo_dep = declare_dependency(link_with: modinfo_lib)
+
+      arch = config_target['TARGET_NAME'] == 'sparc64' ? 'sparc64' : config_target['TARGET_BASE_ARCH']
+      hw_arch[arch].add(modinfo_dep)
+    endif
+  endforeach
 endif
 
 nm = find_program('nm')
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index 9d3e037b15..25fb241b2d 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -32,7 +32,7 @@ def parse_line(line):
             continue
     return (kind, data)
 
-def generate(name, lines):
+def generate(name, lines, core_modules):
     arch = ""
     objs = []
     deps = []
@@ -49,7 +49,11 @@ def generate(name, lines):
             elif kind == 'arch':
                 arch = data;
             elif kind == 'need':
-                pass # ignore
+                # don't add a module which dependency is not enabled
+                # in kconfig
+                if data.strip() not in core_modules:
+                    print("    /* module {} is missing. */\n".format(data))
+                    return []
             else:
                 print("unknown:", kind)
                 exit(1)
@@ -60,7 +64,7 @@ def generate(name, lines):
     print_array("objs", objs)
     print_array("deps", deps)
     print_array("opts", opts)
-    print("},{");
+    print("},{")
     return deps
 
 def print_pre():
@@ -74,26 +78,28 @@ def print_post():
     print("}};")
 
 def main(args):
+    if len(args) < 3 or args[0] != '--devices':
+        print('Expected: modinfo-generate.py --devices '
+              'config-device.mak [modinfo files]', file=sys.stderr)
+        exit(1)
+
+    # get all devices enabled in kconfig, from *-config-device.mak
+    enabled_core_modules = set()
+    with open(args[1]) as file:
+        for line in file.readlines():
+            config = line.split('=')
+            if config[1].rstrip() == 'y':
+                enabled_core_modules.add(config[0][7:]) # remove CONFIG_
+
     deps = {}
     print_pre()
-    for modinfo in args:
+    for modinfo in args[2:]:
         with open(modinfo) as f:
             lines = f.readlines()
         print("    /* %s */" % modinfo)
-        (basename, ext) = os.path.splitext(modinfo)
-        deps[basename] = generate(basename, lines)
+        (basename, _) = os.path.splitext(modinfo)
+        deps[basename] = generate(basename, lines, enabled_core_modules)
     print_post()
 
-    flattened_deps = {flat.strip('" ') for dep in deps.values() for flat in dep}
-    error = False
-    for dep in flattened_deps:
-        if dep not in deps.keys():
-            print("Dependency {} cannot be satisfied".format(dep),
-                  file=sys.stderr)
-            error = True
-
-    if error:
-        exit(1)
-
 if __name__ == "__main__":
     main(sys.argv[1:])
-- 
2.33.0


