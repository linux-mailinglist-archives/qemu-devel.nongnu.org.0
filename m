Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758773D045A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:15:09 +0200 (CEST)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5y16-0007VW-HN
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5y03-000688-Fr
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:14:03 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5y01-0007FQ-OT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:14:03 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FB7E22498;
 Tue, 20 Jul 2021 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626819240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQ++T/l6J0S5iRZ6AdhfJo3BE0taZTfUI7XZ+fAAYLI=;
 b=LpRu/guafmd9f/tf5DTqBQE7m1tcMYzA6fnWRZegL66zi8tQMIFyee5Qh5eC4UL/R7+zzI
 hNxAPvIwqs1afdzHyDn2qND7BZpOKnufh1EPtbLRdDbbXMkxqdSyvMx24YTwaxvBdr2gIn
 0hR9hlD5cZhf4n+AehOnIAb8XRMjx1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626819240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQ++T/l6J0S5iRZ6AdhfJo3BE0taZTfUI7XZ+fAAYLI=;
 b=TlZyUGsAPYcKgaSgXDtn/dnfzzsBQ1cmfGHtCWwhPKpQWZUdqYAQnGNwouWDDMTvB1NMlS
 R+lIuZjIczlTOfAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7F9E513BAB;
 Tue, 20 Jul 2021 22:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id eOuoEaZK92DjEQAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 20 Jul 2021 22:13:58 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] modules: Option to build native TCG with --enable-modules
Date: Tue, 20 Jul 2021 19:13:51 -0300
Message-Id: <20210720221351.13354-2-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210720221351.13354-1-jziviani@suse.de>
References: <20210720221351.13354-1-jziviani@suse.de>
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
Cc: thuth@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 richard.henderson@linaro.org, kraxel@redhat.com, pbonzini@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds an option (--enable-tcg-builtin) to build TCG natively when
--enable-modules argument is passed to the build system. It gives
the opportunity to have this important accelerator built-in and
still take advantage of the new modular system.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 configure         | 12 ++++++++++--
 meson.build       | 11 ++++++++++-
 meson_options.txt |  2 ++
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 232c54dcc1..64d7a909ce 100755
--- a/configure
+++ b/configure
@@ -345,6 +345,7 @@ tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
 tcg_interpreter="false"
+tcg_builtin="false"
 bigendian="no"
 mingw32="no"
 gcov="no"
@@ -1120,6 +1121,8 @@ for opt do
   ;;
   --enable-tcg) tcg="enabled"
   ;;
+  --enable-tcg-builtin) tcg_builtin="true"
+  ;;
   --disable-malloc-trim) malloc_trim="disabled"
   ;;
   --enable-malloc-trim) malloc_trim="enabled"
@@ -1817,6 +1820,7 @@ Advanced options (experts only):
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
   --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
+  --enable-tcg-builtin     force TCG builtin even with --enable-modules
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
@@ -2318,7 +2322,11 @@ if test "$solaris" = "yes" ; then
   fi
 fi
 
-if test "$tcg" = "enabled"; then
+if test "$tcg" = "disabled"; then
+    debug_tcg="no"
+    tcg_interpreter="false"
+    tcg_builtin="false"
+else
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 fi
@@ -5229,7 +5237,7 @@ if test "$skip_meson" = no; then
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
-	-Dtcg_interpreter=$tcg_interpreter \
+        -Dtcg_interpreter=$tcg_interpreter -Dtcg_builtin=$tcg_builtin \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 2f377098d7..2909043aab 100644
--- a/meson.build
+++ b/meson.build
@@ -93,9 +93,13 @@ if cpu in ['x86', 'x86_64']
 endif
 
 modular_tcg = []
+is_tcg_modular = false
 # Darwin does not support references to thread-local variables in modules
 if targetos != 'darwin'
   modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+  is_tcg_modular = config_host.has_key('CONFIG_MODULES') \
+                   and get_option('tcg').enabled() \
+                   and not get_option('tcg_builtin')
 endif
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
@@ -279,6 +283,9 @@ if not get_option('tcg').disabled()
 
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
+  if is_tcg_modular
+    config_host += { 'CONFIG_TCG_MODULAR': 'y' }
+  endif
 endif
 
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
@@ -1567,7 +1574,7 @@ foreach target : target_dirs
       elif sym == 'CONFIG_XEN' and have_xen_pci_passthrough
         config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
-      if target in modular_tcg
+      if target in modular_tcg and is_tcg_modular
         config_target += { 'CONFIG_TCG_MODULAR': 'y' }
       else
         config_target += { 'CONFIG_TCG_BUILTIN': 'y' }
@@ -2976,6 +2983,8 @@ summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   if get_option('tcg_interpreter')
     summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+  elif is_tcg_modular
+    summary_info += {'TCG backend':   'module (@0@)'.format(cpu)}
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..c27749b864 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -43,6 +43,8 @@ option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (experimental and slow)')
+option('tcg_builtin', type: 'boolean', value: 'false',
+       description: 'Force TCG builtin')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
-- 
2.32.0


