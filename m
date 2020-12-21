Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDD2DFD2B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:05:15 +0100 (CET)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMkM-0003qj-Kj
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR6-0004pE-RW
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:22 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQu-0007jK-1z
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id i9so11318491wrc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kJa5b37NoOOjx5BjBu3wk4ktmMHtcJ+x4xO2oRIBMmg=;
 b=maPSh4h99CFqTPG/1Kl4q/wwdH+JsoVbG3MU5JMg6QLUB3I+ql3w21ILgWM8kyxDyr
 9eUhtK7LvZdR7FPhdrZiPPaujYmXJhfJWJd9TrCOcaeeqB19T+72SO7H+bOeTi0pQq02
 q0L2DKLPNAMxVeIN7lL/QhsXn1wrkwmZw5gjfmgrfrcdJ0rNJJzYNH6+OyK0FjD/GGFf
 NI2T4PpPdmlnRiF5YwrW5wy2g5z2B/JtY+7j/ELiM0dfAUDWRAUzxXk73MaJoAyPZ4pP
 xCyjsZChe/1pcxuQq+SG4qWdVvd23CZV0r+7gUF03JSCl0FIs+vvQy2hjlPyHtSeIZSg
 t5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kJa5b37NoOOjx5BjBu3wk4ktmMHtcJ+x4xO2oRIBMmg=;
 b=FwZ6knX114nJBhj24JewFj2WrlYTQbuLeGJJnHpy76HY8li1uDU5Kxeb5Wv9U5yUq2
 sgr6cI6oqd4LNaapsycPzh/DWExa8l7GeWaGQC2WOSZwCM9uocKMSC8G4vBm+yTkr5f6
 IKTrOq4lEm6Jz3yCcZoXo7nItX2eo0ZkzmMxIrWo0pdZLLVIjMGB7D4o8S26Vrec2B0p
 Cn2cgd2JIg9i8G2FhhKwde9woHALG12nZqYNhnAedqrPhlst6YinsZxlxtpgAP3RgE0L
 ILAnbUN60nKzUYHq30fUhHNqhYtky7fj0r0jj4k+BE7g5shbLfIy0wWuxobWQCN3W+Yo
 4rkw==
X-Gm-Message-State: AOAM531tljx3RAXfpNKj0CwohDdtWpGeqYBDKNM9echpowJCdDMHxq5b
 YaUTsaHl1jsamqb7NepMAUZQPSXN0jI=
X-Google-Smtp-Source: ABdhPJzAmeg4aUZe5u5YjwgVIliOz0FirijPdHYBvUcujy3+9jaMarxaKkOhmo2a22u8z9vmLba+aQ==
X-Received: by 2002:adf:f891:: with SMTP id u17mr19249942wrp.253.1608561906240; 
 Mon, 21 Dec 2020 06:45:06 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/55] configure,meson: support Control-Flow Integrity
Date: Mon, 21 Dec 2020 15:44:11 +0100
Message-Id: <20201221144447.26161-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, LONGWORDS=2.035,
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
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

This patch adds a flag to enable/disable control flow integrity checks
on indirect function calls.
This feature only allows indirect function calls at runtime to functions
with compatible signatures.

This feature is only provided by LLVM/Clang, and depends on link-time
optimization which is currently supported only with LLVM/Clang >= 6.0

We also add an option to enable a debugging version of cfi, with verbose
output in case of a CFI violation.

CFI on indirect function calls does not support calls to functions in
shared libraries (since they were not known at compile time), and such
calls are forbidden. QEMU relies on dlopen/dlsym when using modules,
so we make modules incompatible with CFI.

All the checks are performed in meson.build. configure is only used to
forward the flags to meson

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 22 ++++++++++++++++++++--
 meson.build       | 44 ++++++++++++++++++++++++++++++++++++++++++++
 meson_options.txt |  4 ++++
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 55e77bf289..f470cdbe50 100755
--- a/configure
+++ b/configure
@@ -411,6 +411,8 @@ coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
 crypto_afalg="no"
+cfi="false"
+cfi_debug="false"
 seccomp="$default_feature"
 glusterfs="$default_feature"
 glusterfs_xlator_opt="no"
@@ -1195,6 +1197,16 @@ for opt do
   ;;
   --disable-safe-stack) safe_stack="no"
   ;;
+  --enable-cfi)
+      cfi="true";
+      lto="true";
+  ;;
+  --disable-cfi) cfi="false"
+  ;;
+  --enable-cfi-debug) cfi_debug="true"
+  ;;
+  --disable-cfi-debug) cfi_debug="false"
+  ;;
   --disable-curses) curses="disabled"
   ;;
   --enable-curses) curses="enabled"
@@ -1788,7 +1800,13 @@ disabled with --disable-FEATURE, default is enabled if available
   sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-
+  cfi             Enable Control-Flow Integrity for indirect function calls.
+                  In case of a cfi violation, QEMU is terminated with SIGILL
+                  Depends on lto and is incompatible with modules
+                  Automatically enables Link-Time Optimization (lto)
+  cfi-debug       In case of a cfi violation, a message containing the line that
+                  triggered the error is written to stderr. After the error,
+                  QEMU is still terminated with SIGILL
   gnutls          GNUTLS cryptography support
   nettle          nettle cryptography support
   gcrypt          libgcrypt cryptography support
@@ -6970,7 +6988,7 @@ NINJA=$ninja $meson setup \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto \
+        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
diff --git a/meson.build b/meson.build
index d05d880114..94ef023ad1 100644
--- a/meson.build
+++ b/meson.build
@@ -773,6 +773,7 @@ elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
 endif
 
+
 if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
   error('Cannot enable fuse-lseek while fuse is disabled')
 endif
@@ -795,6 +796,46 @@ if not get_option('fuse_lseek').disabled()
   endif
 endif
 
+if get_option('cfi')
+  cfi_flags=[]
+  # Check for dependency on LTO
+  if not get_option('b_lto')
+    error('Selected Control-Flow Integrity but LTO is disabled')
+  endif
+  if config_host.has_key('CONFIG_MODULES')
+    error('Selected Control-Flow Integrity is not compatible with modules')
+  endif
+  # Check for cfi flags. CFI requires LTO so we can't use
+  # get_supported_arguments, but need a more complex "compiles" which allows
+  # custom arguments
+  if cc.compiles('int main () { return 0; }', name: '-fsanitize=cfi-icall',
+                 args: ['-flto', '-fsanitize=cfi-icall'] )
+    cfi_flags += '-fsanitize=cfi-icall'
+  else
+    error('-fsanitize=cfi-icall is not supported by the compiler')
+  endif
+  if cc.compiles('int main () { return 0; }',
+                 name: '-fsanitize-cfi-icall-generalize-pointers',
+                 args: ['-flto', '-fsanitize=cfi-icall',
+                        '-fsanitize-cfi-icall-generalize-pointers'] )
+    cfi_flags += '-fsanitize-cfi-icall-generalize-pointers'
+  else
+    error('-fsanitize-cfi-icall-generalize-pointers is not supported by the compiler')
+  endif
+  if get_option('cfi_debug')
+    if cc.compiles('int main () { return 0; }',
+                   name: '-fno-sanitize-trap=cfi-icall',
+                   args: ['-flto', '-fsanitize=cfi-icall',
+                          '-fno-sanitize-trap=cfi-icall'] )
+      cfi_flags += '-fno-sanitize-trap=cfi-icall'
+    else
+      error('-fno-sanitize-trap=cfi-icall is not supported by the compiler')
+    endif
+  endif
+  add_project_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
+  add_project_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
+endif
+
 #################
 # config-host.h #
 #################
@@ -831,6 +872,7 @@ config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
+config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2195,6 +2237,8 @@ if targetos == 'windows'
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
+summary_info += {'CFI support':       get_option('cfi')}
+summary_info += {'CFI debug support': get_option('cfi_debug')}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
diff --git a/meson_options.txt b/meson_options.txt
index f8f053b5c8..242e0769fb 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -35,6 +35,10 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
+option('cfi', type: 'boolean', value: 'false',
+       description: 'Control-Flow Integrity (CFI)')
+option('cfi_debug', type: 'boolean', value: 'false',
+       description: 'Verbose errors in case of CFI violation')
 
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
-- 
2.29.2



