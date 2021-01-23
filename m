Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055853015EB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:36:08 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K1G-0000PV-Tk
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx2-0003Sx-Gt
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jwt-0005n0-9x
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfOHFLc+xaX9VNCaiHgCnHGEgBGgoOA+pyzDfGHs+5Q=;
 b=hXthlZXowSQKUd10xQ3XdaJ4ybG27EQ6sSzeuJ0+YgIyAX6HLP8SOgboFIUmvVmzg95Vkv
 InGHNcN3US598FJ51zX1X+3Xyb426bY0OAht+CVnMqXHPVSXwFWau+jckIeJ/srbpEdj4y
 cJ3YFrEYcxwF2T03NQ7nlVMLUC2gd1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Q6BRHnX1PoW3XlqLrqo0Dg-1; Sat, 23 Jan 2021 09:31:32 -0500
X-MC-Unique: Q6BRHnX1PoW3XlqLrqo0Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C69A180A096
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECB165D9CC
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/31] build-system: clean up TCG/TCI configury
Date: Sat, 23 Jan 2021 09:31:01 -0500
Message-Id: <20210123143128.1167797-5-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
a warning) if the host CPU is unsupported, making it more similar to
other --enable-* options.

Remove TCG-specific include paths from !CONFIG_TCG builds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 11 +++--------
 disas/meson.build |  2 --
 meson.build       | 46 +++++++++++++++++++++++++---------------------
 meson_options.txt |  2 ++
 4 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index f16fa99060..a84df7c4ad 100755
--- a/configure
+++ b/configure
@@ -359,7 +359,7 @@ sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
-tcg_interpreter="no"
+tcg_interpreter="false"
 bigendian="no"
 mingw32="no"
 gcov="no"
@@ -1119,9 +1119,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="no"
+  --disable-tcg-interpreter) tcg_interpreter="true"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="yes"
+  --enable-tcg-interpreter) tcg_interpreter="false"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -5834,11 +5834,6 @@ fi
 if test "$optreset" = "yes" ; then
   echo "HAVE_OPTRESET=y" >> $config_host_mak
 fi
-if test "$tcg" = "enabled"; then
-  if test "$tcg_interpreter" = "yes" ; then
-    echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
-  fi
-fi
 if test "$fdatasync" = "yes" ; then
   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
 fi
diff --git a/disas/meson.build b/disas/meson.build
index 09a852742e..da341a511e 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -22,5 +22,3 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: files('capstone.c'))
-
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
diff --git a/meson.build b/meson.build
index af2bc89741..2001e941f4 100644
--- a/meson.build
+++ b/meson.build
@@ -113,25 +113,8 @@ if targetos == 'linux'
                         language: ['c', 'cpp'])
 endif
 
-if 'CONFIG_TCG_INTERPRETER' in config_host
-  tcg_arch = 'tci'
-elif config_host['ARCH'] == 'sparc64'
-  tcg_arch = 'sparc'
-elif config_host['ARCH'] == 's390x'
-  tcg_arch = 's390'
-elif config_host['ARCH'] in ['x86_64', 'x32']
-  tcg_arch = 'i386'
-elif config_host['ARCH'] == 'ppc64'
-  tcg_arch = 'ppc'
-elif config_host['ARCH'] in ['riscv32', 'riscv64']
-  tcg_arch = 'riscv'
-else
-  tcg_arch = config_host['ARCH']
-endif
-add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
-                      '-iquote', '.',
+add_project_arguments('-iquote', '.',
                       '-iquote', meson.current_source_dir(),
-                      '-iquote', meson.current_source_dir() / 'accel/tcg',
                       '-iquote', meson.current_source_dir() / 'include',
                       '-iquote', meson.current_source_dir() / 'disas/libvixl',
                       language: ['c', 'cpp', 'objc'])
@@ -226,14 +209,33 @@ if not get_option('hax').disabled()
     accelerators += 'CONFIG_HAX'
   endif
 endif
+
+tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
-    if 'CONFIG_TCG_INTERPRETER' in config_host
+    if get_option('tcg_interpreter')
       warning('Unsupported CPU @0@, will use TCG with TCI (experimental)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   endif
+  if get_option('tcg_interpreter')
+    tcg_arch = 'tci'
+  elif config_host['ARCH'] == 'sparc64'
+    tcg_arch = 'sparc'
+  elif config_host['ARCH'] == 's390x'
+    tcg_arch = 's390'
+  elif config_host['ARCH'] in ['x86_64', 'x32']
+    tcg_arch = 'i386'
+  elif config_host['ARCH'] == 'ppc64'
+    tcg_arch = 'ppc'
+  elif config_host['ARCH'] in ['riscv32', 'riscv64']
+    tcg_arch = 'riscv'
+  endif
+  add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
+                        '-iquote', meson.current_source_dir() / 'accel/tcg',
+                        language: ['c', 'cpp', 'objc'])
+
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
 endif
@@ -1234,7 +1236,9 @@ foreach target : target_dirs
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
       config_target += { sym: 'y' }
       config_all += { sym: 'y' }
-      if sym == 'CONFIG_XEN' and have_xen_pci_passthrough
+      if sym == 'CONFIG_TCG' and tcg_arch == 'tci'
+        config_target += { 'CONFIG_TCG_INTERPRETER': 'y' }
+      elif sym == 'CONFIG_XEN' and have_xen_pci_passthrough
         config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
       accel_kconfig += [ sym + '=y' ]
@@ -2411,7 +2415,7 @@ summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
+  summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
 endif
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
diff --git a/meson_options.txt b/meson_options.txt
index 72a3ca22d6..7dcd81c06a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -37,6 +37,8 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
        description: 'Xen PCI passthrough support')
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
+option('tcg_interpreter', type: 'boolean', value: false,
+       description: 'TCG bytecode interpreter (TCI)')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
-- 
2.26.2



