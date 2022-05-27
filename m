Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD95368BD
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 00:22:46 +0200 (CEST)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuiM0-0000gw-Uh
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 18:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuiKC-0007PY-15; Fri, 27 May 2022 18:20:52 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuiJy-0000Se-Vt; Fri, 27 May 2022 18:20:50 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6174C2199A;
 Fri, 27 May 2022 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653690037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGClF45tEGhZCnJ8RYQx/+Bck2Mtd3EyHLTS+ABjBVg=;
 b=hVWQLatlwgDNLN9AwO3xUiox4CdKdUtIMl8BUHJxjbZSJBwHd11BfxysryYr2cSvmVPozi
 qK7MDgjRa3dCQcOC20UnwJ1HXkUKY5gC/UmEDHeeTnNwWNQCTHR618qk36kV+wUZa0c5Ec
 BC2itnAUUf0KG3mJE4+jkgHzErh/hT8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0863F13A84;
 Fri, 27 May 2022 22:20:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qxAqO7ROkWKwJAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Fri, 27 May 2022 22:20:36 +0000
Subject: [RESEND PATCH 2/2] modules: generates per-target modinfo
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: "Jose R. Ziviani" <jziviani@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Date: Sat, 28 May 2022 00:20:35 +0200
Message-ID: <165369003038.5857.13084289285185196779.stgit@work>
In-Reply-To: <165368982364.5857.13012746434823168062.stgit@work>
References: <165368982364.5857.13012746434823168062.stgit@work>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=dfaggioli@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Jose R. Ziviani <jziviani@suse.de>

This patch changes the way modinfo is generated and built. Instead of
one modinfo.c it generates one modinfo-<target>-softmmu.c per target. It
aims a fine-tune control of modules by configuring Kconfig.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-s390x@nongnu.org
---
 meson.build                 |   25 +++++++++++++++++--------
 scripts/modinfo-generate.py |   42 +++++++++++++++++++++++++-----------------
 2 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/meson.build b/meson.build
index df7c34b076..3744923aa7 100644
--- a/meson.build
+++ b/meson.build
@@ -3172,14 +3172,23 @@ foreach d, list : target_modules
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
index 689f33c0f2..a0c09edae1 100755
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
@@ -49,7 +49,13 @@ def generate(name, lines):
             elif kind == 'arch':
                 arch = data;
             elif kind == 'kconfig':
-                pass # ignore
+                # don't add a module which dependency is not enabled
+                # in kconfig
+                if data.strip() not in core_modules:
+                    print("    /* module {} isn't enabled in Kconfig. */"
+                          .format(data.strip()))
+                    print("/* },{ */")
+                    return []
             else:
                 print("unknown:", kind)
                 exit(1)
@@ -60,7 +66,7 @@ def generate(name, lines):
     print_array("objs", objs)
     print_array("deps", deps)
     print_array("opts", opts)
-    print("},{");
+    print("},{")
     return deps
 
 def print_pre():
@@ -74,26 +80,28 @@ def print_post():
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



