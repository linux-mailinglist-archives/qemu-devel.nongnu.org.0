Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653823507F9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 22:16:55 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRhGo-0000HK-8L
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 16:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lRh8n-0006r2-Eq
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:08:38 -0400
Received: from 13thmonkey.org ([80.100.255.32]:60959
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lRh8k-0002xT-67
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:08:37 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 168ECC13793; Wed, 31 Mar 2021 22:08:31 +0200 (CEST)
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/4] Add NVMM accelerator: configure and build logic
Date: Wed, 31 Mar 2021 22:07:57 +0200
Message-Id: <20210331200800.24168-2-reinoud@NetBSD.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331200800.24168-1-reinoud@NetBSD.org>
References: <20210331200800.24168-1-reinoud@NetBSD.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>
Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>

---
 accel/Kconfig     |  3 +++
 configure         | 12 +++++++++---
 meson.build       | 23 ++++++++++++++++++++---
 meson_options.txt |  2 ++
 qemu-options.hx   |  8 ++++----
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c771..8bdedb7d15 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,6 +1,9 @@
 config WHPX
     bool
 
+config NVMM
+    bool
+
 config HAX
     bool
 
diff --git a/configure b/configure
index 535e6a9269..0d4e6dd521 100755
--- a/configure
+++ b/configure
@@ -352,6 +352,7 @@ kvm="auto"
 hax="auto"
 hvf="auto"
 whpx="auto"
+nvmm="auto"
 rdma="$default_feature"
 pvrdma="$default_feature"
 gprof="no"
@@ -886,7 +887,7 @@ for opt do
   ;;
   --python=*) python="$optarg" ; explicit_python=yes
   ;;
-  --sphinx-build=*) sphinx_build="$optarg"
+  --sphinx-build-3.8-3.8=*) sphinx_build="$optarg"
   ;;
   --skip-meson) skip_meson=yes
   ;;
@@ -1107,6 +1108,10 @@ for opt do
   ;;
   --enable-hvf) hvf="enabled"
   ;;
+  --disable-nvmm) nvmm="disabled"
+  ;;
+  --enable-nvmm) nvmm="enabled"
+  ;;
   --disable-whpx) whpx="disabled"
   ;;
   --enable-whpx) whpx="enabled"
@@ -1727,7 +1732,7 @@ Advanced options (experts only):
   --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
-  --sphinx-build=SPHINX    use specified sphinx-build [$sphinx_build]
+  --sphinx-build-3.8-3.8=SPHINX    use specified sphinx-build-3.8-3.8 [$sphinx_build]
   --meson=MESON            use specified meson [$meson]
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
@@ -1848,6 +1853,7 @@ disabled with --disable-FEATURE, default is enabled if available
   kvm             KVM acceleration support
   hax             HAX acceleration support
   hvf             Hypervisor.framework acceleration support
+  nvmm            NVMM acceleration support
   whpx            Windows Hypervisor Platform acceleration support
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
@@ -6410,7 +6416,7 @@ NINJA=$ninja $meson setup \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
-        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
+        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
diff --git a/meson.build b/meson.build
index c6f4b0cf5e..e33face775 100644
--- a/meson.build
+++ b/meson.build
@@ -87,6 +87,7 @@ if cpu in ['x86', 'x86_64']
   accelerator_targets += {
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
+    'CONFIG_NVMM': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
   }
 endif
@@ -170,6 +171,7 @@ version_res = []
 coref = []
 iokit = []
 emulator_link_args = []
+nvmm = []
 hvf = not_found
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
@@ -195,6 +197,12 @@ elif targetos == 'openbsd'
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
+elif targetos == 'netbsd'
+  if not get_option('nvmm').disabled()
+    if cc.has_header('nvmm.h')
+      nvmm = cc.find_library('nvmm')
+    endif
+  endif
 endif
 
 accelerators = []
@@ -227,6 +235,11 @@ if not get_option('hax').disabled()
     accelerators += 'CONFIG_HAX'
   endif
 endif
+if not get_option('nvmm').disabled()
+  if cc.has_header('nvmm.h', required: get_option('nvmm'))
+    accelerators += 'CONFIG_NVMM'
+  endif
+endif
 
 tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
@@ -271,6 +284,9 @@ endif
 if 'CONFIG_HVF' not in accelerators and get_option('hvf').enabled()
   error('HVF not available on this platform')
 endif
+if 'CONFIG_NVMM' not in accelerators and get_option('nvmm').enabled()
+  error('NVMM not available on this platform')
+endif
 if 'CONFIG_WHPX' not in accelerators and get_option('whpx').enabled()
   error('WHPX not available on this platform')
 endif
@@ -607,7 +623,7 @@ if have_system and not get_option('curses').disabled()
       has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
     endif
     if has_curses_h
-      curses_libname_list = (targetos == 'windows' ? ['pdcurses'] : ['ncursesw', 'cursesw'])
+      curses_libname_list = (targetos == 'windows' ? ['pdcurses'] : ['ncursesw', 'cursesw', 'curses'])
       foreach curses_libname : curses_libname_list
         libcurses = cc.find_library(curses_libname,
                                     required: false,
@@ -625,7 +641,7 @@ if have_system and not get_option('curses').disabled()
     endif
   endif
   if not get_option('iconv').disabled()
-    foreach link_args : [ ['-liconv'], [] ]
+    foreach link_args : [ [], ['-liconv'] ]
       # Programs will be linked with glib and this will bring in libiconv on FreeBSD.
       # We need to use libiconv if available because mixing libiconv's headers with
       # the system libc does not work.
@@ -2226,7 +2242,7 @@ foreach target : target_dirs
       'name': 'qemu-system-' + target_name,
       'gui': false,
       'sources': files('softmmu/main.c'),
-      'dependencies': []
+      'dependencies': [nvmm]
     }]
     if targetos == 'windows' and (sdl.found() or gtk.found())
       execs += [{
@@ -2576,6 +2592,7 @@ if have_system
   summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
   summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
   summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+  summary_info += {'NVMM support':      config_all.has_key('CONFIG_NVMM')}
   summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
   if config_host.has_key('CONFIG_XEN_BACKEND')
     summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
diff --git a/meson_options.txt b/meson_options.txt
index 9734019995..91034420a1 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -33,6 +33,8 @@ option('whpx', type: 'feature', value: 'auto',
        description: 'WHPX acceleration support')
 option('hvf', type: 'feature', value: 'auto',
        description: 'HVF acceleration support')
+option('nvmm', type: 'feature', value: 'auto',
+       description: 'NVMM acceleration support')
 option('xen', type: 'feature', value: 'auto',
        description: 'Xen backend support')
 option('xen_pci_passthrough', type: 'feature', value: 'auto',
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd6..dadf11fae9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -26,7 +26,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop[=value][,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
     "                property accel=accel1[:accel2[:...]] selects accelerator\n"
-    "                supported accelerators are kvm, xen, hax, hvf, whpx or tcg (default: tcg)\n"
+    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx or tcg (default: tcg)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
@@ -58,7 +58,7 @@ SRST
 
     ``accel=accels1[:accels2[:...]]``
         This is used to enable an accelerator. Depending on the target
-        architecture, kvm, xen, hax, hvf, whpx or tcg can be available.
+        architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available.
         By default, tcg is used. If there is more than one accelerator
         specified, the next one is used if the previous one fails to
         initialize.
@@ -135,7 +135,7 @@ ERST
 
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,prop[=value][,...]]\n"
-    "                select accelerator (kvm, xen, hax, hvf, whpx or tcg; use 'help' for a list)\n"
+    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx or tcg; use 'help' for a list)\n"
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
@@ -145,7 +145,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
 SRST
 ``-accel name[,prop=value[,...]]``
     This is used to enable an accelerator. Depending on the target
-    architecture, kvm, xen, hax, hvf, whpx or tcg can be available. By
+    architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available. By
     default, tcg is used. If there is more than one accelerator
     specified, the next one is used if the previous one fails to
     initialize.
-- 
2.29.2


