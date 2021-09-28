Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8BB41B89B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 22:48:31 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVK1e-00010m-JO
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 16:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVJzt-00082n-Mh
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:46:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVJzr-0006h2-O1
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:46:41 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BF62224D8;
 Tue, 28 Sep 2021 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632861998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSOa9+unSoK7j+FcRBA4mg2MRzG8eWKyjtNAXFNEppw=;
 b=u7hJH5qRleRgp2CbiaNLoXJR/BMY52dvVBfeTp+NgO9BthOCZcd++q3eQfazeXI6gRf/u0
 93B5REIMO/Ix8PyNNvwECMbIOSb/tO3FF5clempsCrd313gThPEKs3Q+0vfOcEZZUbOLKI
 nfL+fluvxycxHct7QhaB/hsc9B9x0Jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632861998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSOa9+unSoK7j+FcRBA4mg2MRzG8eWKyjtNAXFNEppw=;
 b=SqTSWYwLaeA8/qJO//JJ8KyyXPo38YdsXYQKZ0p2ukKi8q9Jag9j0dkoFuYqK4vXWv6Yo1
 aIWgWj3L3XLXP3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB8F113E72;
 Tue, 28 Sep 2021 20:46:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aNMTHyx/U2HdegAAMHmgww
 (envelope-from <jziviani@suse.de>); Tue, 28 Sep 2021 20:46:36 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] modules: generates per-target modinfo
Date: Tue, 28 Sep 2021 17:46:28 -0300
Message-Id: <20210928204628.20001-3-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928204628.20001-1-jziviani@suse.de>
References: <20210928204628.20001-1-jziviani@suse.de>
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

This patch changes the way modinfo is generated and built. Instead of
one modinfo.c it generates one modinfo-<target>-softmmu.c per target. It
aims a fine-tune control of modules by configuring Kconfig.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 meson.build                 | 25 +++++++++++++++-------
 scripts/modinfo-generate.py | 42 ++++++++++++++++++++++---------------
 2 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/meson.build b/meson.build
index 15ef4d3c41..a617be73de 100644
--- a/meson.build
+++ b/meson.build
@@ -2403,14 +2403,23 @@ foreach d, list : target_modules
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
-- 
2.33.0


