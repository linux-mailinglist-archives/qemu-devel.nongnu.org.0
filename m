Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897814B67C3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:38:50 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuIL-0006FL-M0
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:38:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCF-0003mR-8t
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:31 -0500
Received: from [2a00:1450:4864:20::529] (port=44905
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCD-0008Pf-Cm
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:30 -0500
Received: by mail-ed1-x529.google.com with SMTP id w10so12457157edd.11
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l0lSzYmnjceD5TlBT3DDHL52VR3qBcs3rQSEbockbds=;
 b=OBVQSuD/FwJP+qFDtwguxGe13MtSDWcua8XGyYc/jQP5RX7zoe1KK1oPQCiLM9epW/
 JnoW4x1GrGNWFTzi2/ocdqlqe5eBIsainy4VVJsZFfOcZrMUn4R6W2RuinYukqhrBYaa
 YzoojGRe2kdKjlDamnxRTSHNez70J7tagpsZlEXW7DAFyAAnSUpwiJY3uvb7kA7ef0CB
 3Sz4flq4rXuURiAAV28t8HqPniEdgCZNL+5w0iurcyN38UQpwnZ9MsytfPs82CKeHP3m
 O5iq9690/cJwUfbBL/Vu55nJ+gRXgJ7E/2GiYgK8YE126PhnzleytRYc6YOabmAYAIff
 gKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l0lSzYmnjceD5TlBT3DDHL52VR3qBcs3rQSEbockbds=;
 b=6KInhYO4yJRRWYId52K4ntETeKboPaD/dbWstmrONx8QnmgiN0WSvANo+r6Ql6Dow0
 UH5QI5zOvmo3y3B1tV0279zzZXBQXzS+nKJ6KG2pDy5t6Zr4xfuwrZ8RLl0YoQl+NqJP
 mTZsCcBK3ssM8ZUr6eiayrtee/zXBZyQrM8Z010NYe+P37OOs8w95SqZVFIhVS8OIBBK
 00HJo1Nm1QsyIBcG00+lGphx4obAZIOUWt/nXwP3FTReUUUr2XvR0Thv4UMZqKn2FVFq
 C4RQ9Ksgnum0A7lyss/OpCOydShe0zZD2tkac3PwC0ry7y5ndjdb4M6ZRP36+M5Ctw+X
 U6GA==
X-Gm-Message-State: AOAM53018mCisNFlx2HkNugv4jiApJv79/C5yC9JIag6avN2MO2h6KX0
 UAvrrkU8vATUi84E3HCRO8zEO4Tsceg=
X-Google-Smtp-Source: ABdhPJxV++1xzJ6MKGB647VCJ24MToR94yIYnrbezr3/pmdRso3YQgEN/1aQ7n3ewkSjIXoa43DNhA==
X-Received: by 2002:a05:6402:1841:: with SMTP id
 v1mr2933410edy.190.1644917548122; 
 Tue, 15 Feb 2022 01:32:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] meson: use .allowed() method for features
Date: Tue, 15 Feb 2022 10:31:57 +0100
Message-Id: <20220215093223.110827-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The method is now in 0.59, using it simplifies some boolean conditions.
The other new methods .require() and .disable_auto_if() can be used too,
but introducing them is not just a matter of search-and-replace.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build       | 42 +++++++++++++++++++++---------------------
 tests/meson.build |  2 +-
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meson.build b/meson.build
index ae5f7eec6e..af136b780d 100644
--- a/meson.build
+++ b/meson.build
@@ -1,4 +1,4 @@
-project('qemu', ['c'], meson_version: '>=0.58.2',
+project('qemu', ['c'], meson_version: '>=0.59.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
@@ -99,7 +99,7 @@ else
 endif
 
 kvm_targets_c = '""'
-if not get_option('kvm').disabled() and targetos == 'linux'
+if get_option('kvm').allowed() and targetos == 'linux'
   kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
 endif
 config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
@@ -276,7 +276,7 @@ endif
 if targetos != 'linux' and get_option('multiprocess').enabled()
   error('Multiprocess QEMU is supported only on Linux')
 endif
-multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
+multiprocess_allowed = targetos == 'linux' and get_option('multiprocess').allowed()
 
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
@@ -313,7 +313,7 @@ elif targetos == 'haiku'
             cc.find_library('network'),
             cc.find_library('bsd')]
 elif targetos == 'openbsd'
-  if not get_option('tcg').disabled() and target_dirs.length() > 0
+  if get_option('tcg').allowed() and target_dirs.length() > 0
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
@@ -321,16 +321,16 @@ endif
 
 # Target-specific configuration of accelerators
 accelerators = []
-if not get_option('kvm').disabled() and targetos == 'linux'
+if get_option('kvm').allowed() and targetos == 'linux'
   accelerators += 'CONFIG_KVM'
 endif
-if not get_option('xen').disabled() and 'CONFIG_XEN_BACKEND' in config_host
+if get_option('xen').allowed() and 'CONFIG_XEN_BACKEND' in config_host
   accelerators += 'CONFIG_XEN'
-  have_xen_pci_passthrough = not get_option('xen_pci_passthrough').disabled() and targetos == 'linux'
+  have_xen_pci_passthrough = get_option('xen_pci_passthrough').allowed() and targetos == 'linux'
 else
   have_xen_pci_passthrough = false
 endif
-if not get_option('whpx').disabled() and targetos == 'windows'
+if get_option('whpx').allowed() and targetos == 'windows'
   if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
     error('WHPX requires 64-bit host')
   elif cc.has_header('WinHvPlatform.h', required: get_option('whpx')) and \
@@ -338,14 +338,14 @@ if not get_option('whpx').disabled() and targetos == 'windows'
     accelerators += 'CONFIG_WHPX'
   endif
 endif
-if not get_option('hvf').disabled()
+if get_option('hvf').allowed()
   hvf = dependency('appleframeworks', modules: 'Hypervisor',
                    required: get_option('hvf'))
   if hvf.found()
     accelerators += 'CONFIG_HVF'
   endif
 endif
-if not get_option('hax').disabled()
+if get_option('hax').allowed()
   if get_option('hax').enabled() or targetos in ['windows', 'darwin', 'netbsd']
     accelerators += 'CONFIG_HAX'
   endif
@@ -358,7 +358,7 @@ if targetos == 'netbsd'
 endif
 
 tcg_arch = host_arch
-if not get_option('tcg').disabled()
+if get_option('tcg').allowed()
   if host_arch == 'unknown'
     if get_option('tcg_interpreter')
       warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
@@ -472,7 +472,7 @@ libattr_test = '''
 
 libattr = not_found
 have_old_libattr = false
-if not get_option('attr').disabled()
+if get_option('attr').allowed()
   if cc.links(libattr_test)
     libattr = declare_dependency()
   else
@@ -628,7 +628,7 @@ endif
 mpathlibs = [libudev]
 mpathpersist = not_found
 mpathpersist_new_api = false
-if targetos == 'linux' and have_tools and not get_option('mpath').disabled()
+if targetos == 'linux' and have_tools and get_option('mpath').allowed()
   mpath_test_source_new = '''
     #include <libudev.h>
     #include <mpath_persist.h>
@@ -697,7 +697,7 @@ endif
 
 iconv = not_found
 curses = not_found
-if have_system and not get_option('curses').disabled()
+if have_system and get_option('curses').allowed()
   curses_test = '''
     #if defined(__APPLE__) || defined(__OpenBSD__)
     #define _XOPEN_SOURCE_EXTENDED 1
@@ -759,7 +759,7 @@ if have_system and not get_option('curses').disabled()
       endforeach
     endif
   endif
-  if not get_option('iconv').disabled()
+  if get_option('iconv').allowed()
     foreach link_args : [ ['-liconv'], [] ]
       # Programs will be linked with glib and this will bring in libiconv on FreeBSD.
       # We need to use libiconv if available because mixing libiconv's headers with
@@ -938,7 +938,7 @@ if liblzfse.found() and not cc.links('''
 endif
 
 oss = not_found
-if have_system and not get_option('oss').disabled()
+if get_option('oss').allowed() and have_system
   if not cc.has_header('sys/soundcard.h')
     # not found
   elif targetos == 'netbsd'
@@ -1092,7 +1092,7 @@ vnc = not_found
 png = not_found
 jpeg = not_found
 sasl = not_found
-if have_system and not get_option('vnc').disabled()
+if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
@@ -1236,7 +1236,7 @@ selinux = dependency('libselinux',
 malloc = []
 if get_option('malloc') == 'system'
   has_malloc_trim = \
-    not get_option('malloc_trim').disabled() and \
+    get_option('malloc_trim').allowed() and \
     cc.links('''#include <malloc.h>
                 int main(void) { malloc_trim(0); return 0; }''')
 else
@@ -1291,7 +1291,7 @@ fuse = dependency('fuse3', required: get_option('fuse'),
                   kwargs: static_kwargs)
 
 fuse_lseek = not_found
-if not get_option('fuse_lseek').disabled()
+if get_option('fuse_lseek').allowed()
   if fuse.version().version_compare('>=3.8')
     # Dummy dependency
     fuse_lseek = declare_dependency()
@@ -1714,7 +1714,7 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
   }'''))
 
 have_l2tpv3 = false
-if not get_option('l2tpv3').disabled() and have_system
+if get_option('l2tpv3').allowed() and have_system
   have_l2tpv3 = cc.has_type('struct mmsghdr',
     prefix: gnu_source_prefix + '''
       #include <sys/socket.h>
@@ -1723,7 +1723,7 @@ endif
 config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
 
 have_netmap = false
-if not get_option('netmap').disabled() and have_system
+if get_option('netmap').allowed() and have_system
   have_netmap = cc.compiles('''
     #include <inttypes.h>
     #include <net/if.h>
diff --git a/tests/meson.build b/tests/meson.build
index 079c8f3727..1d05109eb4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -85,7 +85,7 @@ if 'CONFIG_TCG' in config_all
   subdir('fp')
 endif
 
-if not get_option('tcg').disabled()
+if get_option('tcg').allowed()
   if 'CONFIG_PLUGIN' in config_host
     subdir('plugin')
   endif
-- 
2.34.1



