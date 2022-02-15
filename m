Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05A4B6828
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:50:17 +0100 (CET)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuTQ-0001Wv-Cl
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCP-0004Ju-15
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:41 -0500
Received: from [2a00:1450:4864:20::631] (port=44922
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCM-0008SJ-IV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:40 -0500
Received: by mail-ej1-x631.google.com with SMTP id p14so18652682ejf.11
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=deO2F0ErgO8GDflMKY+3HW/h9IN8YSSqPFluAnL4JQw=;
 b=T/aSRDmlCK6yR0d0sgaB/lm5BC7FsJHWb6AN8qSpWMx8wD7GhwJS9sKr9GYFPUcNwa
 X0Lj0w2SIQSbo3zuccTW5QTeCrOso4ylEQLoP7htC3ZuKX2r33BlsM465+++r0nkmOyv
 zGkkkXr7McgskVKDIPEHVSV/htQo/245qQ9rrInWyA/w0OFOgAc/6wTFq6R//A6r7mmw
 /4FTD1Gm3lMSUvFIUjkFuJ/WaKz1MDLYKjVbRLBNDaUE+SQno1j6AAS0s6mjzjKfLktH
 gVxgprRy8kCHeUSGoJhQHVUSXkob+TsqN7kPmQYsqs4YYNREbx4Qto1smLTFEF09cXKc
 40rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=deO2F0ErgO8GDflMKY+3HW/h9IN8YSSqPFluAnL4JQw=;
 b=brOSQf/aQ5XylO1WXarXDzz3mm+IPIovBg91NPXv++aZkq5VewlU19RWk1CYILXTcv
 nGbuR0Dzx0Eikii6mjTG+ZZR+8JX1cC/LFjZB9SN/L7AjiAGOYsGl54NxuzpmU+Kpn8D
 YGNlW10W4/QqvZcXXsA9WNTwKqcNsQkW1+TGUcE7IuxgPz6HRJTcIxD7/81DThUjYusW
 W9QthAoQYLRfTJsMiLjI80m2DbqQ795kCWhT4cicC5XkrctrqPDIVBN6/z0ecjSs/jR3
 vKPgS+UVwlw1oXxDmlJy0SoJk53yaFbjNH5KC+0TX3eTlCuHO6O5y3U9xf68WvcTyMpR
 4SFw==
X-Gm-Message-State: AOAM532H2MekJUDvOG8i/eMOUU6FhFtWRm+NbclE1CY1zimJJqiYG7Ia
 gpVYc3gY07xZrFgnFSwyWdshI8oe8bw=
X-Google-Smtp-Source: ABdhPJyQfumNzCSZPGOXasNvj+lgnggWPk1kp+OC3U61oN1g8Dp6+pQ29FbyZBFYzqr/3ojBrofzaA==
X-Received: by 2002:a17:906:6888:: with SMTP id n8mr2260321ejr.0.1644917557129; 
 Tue, 15 Feb 2022 01:32:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] configure, meson: move guest-agent, tools to meson
Date: Tue, 15 Feb 2022 10:32:11 +0100
Message-Id: <20220215093223.110827-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                          | 48 ++--------------------------
 contrib/vhost-user-gpu/meson.build |  2 +-
 docs/meson.build                   |  2 --
 meson.build                        | 50 ++++++++++++++++--------------
 meson_options.txt                  |  4 +++
 qga/meson.build                    |  7 +++++
 scripts/meson-buildoptions.sh      |  6 ++++
 tests/Makefile.include             |  2 +-
 tests/unit/meson.build             |  4 +--
 9 files changed, 50 insertions(+), 75 deletions(-)

diff --git a/configure b/configure
index 9230ebd4a8..a66e2c0d71 100755
--- a/configure
+++ b/configure
@@ -317,10 +317,8 @@ pie=""
 trace_backends="log"
 trace_file="trace"
 opengl="$default_feature"
-guest_agent="$default_feature"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
-want_tools="$default_feature"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
@@ -960,10 +958,6 @@ for opt do
   ;;
   --disable-zlib-test)
   ;;
-  --enable-guest-agent) guest_agent="yes"
-  ;;
-  --disable-guest-agent) guest_agent="no"
-  ;;
   --with-vss-sdk) vss_win32_sdk=""
   ;;
   --with-vss-sdk=*) vss_win32_sdk="$optarg"
@@ -976,10 +970,6 @@ for opt do
   ;;
   --without-win-sdk) win_sdk="no"
   ;;
-  --enable-tools) want_tools="yes"
-  ;;
-  --disable-tools) want_tools="no"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -1256,7 +1246,6 @@ cat << EOF
   user            supported user emulation targets
   linux-user      all linux usermode emulation targets
   bsd-user        all BSD usermode emulation targets
-  guest-agent     build the QEMU Guest Agent
   pie             Position Independent Executables
   modules         modules support (non-Windows)
   module-upgrades try to load modules from alternate paths for upgrades
@@ -1275,7 +1264,6 @@ cat << EOF
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
   opengl          opengl support
-  tools           build qemu-io, qemu-nbd and qemu-img tools
   gio             libgio support
 
 NOTE: The object files are built at the place where configure is launched
@@ -1678,16 +1666,6 @@ else
     exit 1
 fi
 
-##########################################
-# system tools
-if test -z "$want_tools"; then
-    if test "$softmmu" = "no"; then
-        want_tools=no
-    else
-        want_tools=yes
-    fi
-fi
-
 #########################################
 # vhost interdependencies and host support
 
@@ -2344,7 +2322,7 @@ fi
 # check if we have VSS SDK headers for win
 
 guest_agent_with_vss="no"
-if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
+if test "$mingw32" = "yes" && \
         test "$vss_win32_sdk" != "no" ; then
   case "$vss_win32_sdk" in
     "")   vss_win32_include="-isystem $source_path" ;;
@@ -2381,7 +2359,7 @@ fi
 # VSS provider from the source. It is usually unnecessary because the
 # pre-compiled .tlb file is included.
 
-if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
+if test "$mingw32" = "yes" && \
         test "$guest_agent_with_vss" = "yes" ; then
   if test -z "$win_sdk"; then
     programfiles="$PROGRAMFILES"
@@ -2399,7 +2377,7 @@ fi
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
 guest_agent_ntddscsi="no"
-if test "$mingw32" = "yes" && test "$guest_agent" != "no"; then
+if test "$mingw32" = "yes"; then
   cat > $TMPC << EOF
 #include <windows.h>
 #include <ntddscsi.h>
@@ -2825,20 +2803,6 @@ if test "$mingw32" = "yes" ; then
     done
 fi
 
-# Probe for guest agent support/options
-
-if [ "$guest_agent" != "no" ]; then
-  if [ "$softmmu" = no -a "$want_tools" = no ] ; then
-      guest_agent=no
-  elif [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" -o "$mingw32" = "yes" ] ; then
-      guest_agent=yes
-  elif [ "$guest_agent" != yes ]; then
-      guest_agent=no
-  else
-      error_exit "Guest agent is not supported on this platform"
-  fi
-fi
-
 # Guest agent Windows MSI package
 
 if test "$QEMU_GA_MANUFACTURER" = ""; then
@@ -2968,12 +2932,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-if test "$want_tools" = "yes" ; then
-  echo "CONFIG_TOOLS=y" >> $config_host_mak
-fi
-if test "$guest_agent" = "yes" ; then
-  echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
-fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 qemu_version=$(head $source_path/VERSION)
diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index 92c8f3a86a..b4e26045da 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -1,4 +1,4 @@
-if 'CONFIG_TOOLS' in config_host and virgl.found() and gbm.found() \
+if have_tools and virgl.found() and gbm.found() \
     and 'CONFIG_LINUX' in config_host and pixman.found()
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
              dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
diff --git a/docs/meson.build b/docs/meson.build
index 57b28a3146..831d4aea2b 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -37,8 +37,6 @@ endif
 if build_docs
   SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
 
-  have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
-
   man_pages = {
         'qemu-ga.8': (have_ga ? 'man8' : ''),
         'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
diff --git a/meson.build b/meson.build
index 7b3cfb6316..b9bedf928a 100644
--- a/meson.build
+++ b/meson.build
@@ -44,21 +44,7 @@ config_host_data = configuration_data()
 genh = []
 qapi_trace_events = []
 
-target_dirs = config_host['TARGET_DIRS'].split()
-have_linux_user = false
-have_bsd_user = false
-have_system = false
-foreach target : target_dirs
-  have_linux_user = have_linux_user or target.endswith('linux-user')
-  have_bsd_user = have_bsd_user or target.endswith('bsd-user')
-  have_system = have_system or target.endswith('-softmmu')
-endforeach
-have_user = have_linux_user or have_bsd_user
-have_tools = 'CONFIG_TOOLS' in config_host
-have_block = have_system or have_tools
-
-python = import('python').find_installation()
-
+bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
   'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
@@ -72,6 +58,28 @@ endif
 
 targetos = host_machine.system()
 
+target_dirs = config_host['TARGET_DIRS'].split()
+have_linux_user = false
+have_bsd_user = false
+have_system = false
+foreach target : target_dirs
+  have_linux_user = have_linux_user or target.endswith('linux-user')
+  have_bsd_user = have_bsd_user or target.endswith('bsd-user')
+  have_system = have_system or target.endswith('-softmmu')
+endforeach
+have_user = have_linux_user or have_bsd_user
+have_tools = get_option('tools') \
+  .disable_auto_if(not have_system) \
+  .allowed()
+have_ga = get_option('guest_agent') \
+  .disable_auto_if(not have_system and not have_tools) \
+  .require(targetos in ['sunos', 'linux', 'windows'],
+           error_message: 'unsupported OS for QEMU guest agent') \
+  .allowed()
+have_block = have_system or have_tools
+
+python = import('python').find_installation()
+
 if cpu not in supported_cpus
   host_arch = 'unknown'
 elif cpu == 'x86'
@@ -3214,11 +3222,7 @@ if 'CONFIG_PLUGIN' in config_host
   install_headers('include/qemu/qemu-plugin.h')
 endif
 
-if 'CONFIG_GUEST_AGENT' in config_host
-  subdir('qga')
-elif get_option('guest_agent_msi').enabled()
-  error('Guest agent MSI requested, but the guest agent is not being built')
-endif
+subdir('qga')
 
 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
 # when we don't build tools or system
@@ -3341,7 +3345,7 @@ if config_host.has_key('HAVE_GDB_BIN')
   summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
 endif
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
-if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
+if targetos == 'windows' and have_ga
   summary_info += {'wixl':            wixl}
 endif
 if slirp_opt != 'disabled' and have_system
@@ -3379,7 +3383,7 @@ summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
-summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
+summary_info += {'build guest agent': have_ga}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
 
 # Compilation information
@@ -3589,7 +3593,7 @@ summary_info += {'GBM':               gbm}
 summary_info += {'libiscsi support':  libiscsi}
 summary_info += {'libnfs support':    libnfs}
 if targetos == 'windows'
-  if config_host.has_key('CONFIG_GUEST_AGENT')
+  if have_ga
     summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
     summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   endif
diff --git a/meson_options.txt b/meson_options.txt
index 59220b52c8..589d242439 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -36,8 +36,12 @@ option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
 option('sparse', type : 'feature', value : 'auto',
        description: 'sparse checker')
+option('guest_agent', type : 'feature', value : 'auto',
+       description: 'Build QEMU Guest Agent')
 option('guest_agent_msi', type : 'feature', value : 'auto',
        description: 'Build MSI package for the QEMU Guest Agent')
+option('tools', type : 'feature', value : 'auto',
+       description: 'build support utilities that come with QEMU')
 
 option('malloc_trim', type : 'feature', value : 'auto',
        description: 'enable libc malloc_trim() for memory optimization')
diff --git a/qga/meson.build b/qga/meson.build
index 56fb6539e5..97cc391fe1 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -1,3 +1,10 @@
+if not have_ga
+  if get_option('guest_agent_msi').enabled()
+    error('Guest agent MSI requested, but the guest agent is not being built')
+  endif
+  subdir_done()
+endif
+
 all_qga = []
 
 qga_qapi_outputs = [
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index fb8812693c..4edc611273 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -62,6 +62,7 @@ meson_options_help() {
   printf "%s\n" '  glusterfs       Glusterfs block device driver'
   printf "%s\n" '  gnutls          GNUTLS cryptography support'
   printf "%s\n" '  gtk             GTK+ user interface'
+  printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
   printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
   printf "%s\n" '  hax             HAX acceleration support'
   printf "%s\n" '  hvf             HVF acceleration support'
@@ -108,6 +109,7 @@ meson_options_help() {
   printf "%s\n" '  spice           Spice server support'
   printf "%s\n" '  spice-protocol  Spice protocol support'
   printf "%s\n" '  tcg             TCG support'
+  printf "%s\n" '  tools           build support utilities that come with QEMU'
   printf "%s\n" '  tpm             TPM support'
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
@@ -209,6 +211,8 @@ _meson_option_parse() {
     --disable-gprof) printf "%s" -Dgprof=false ;;
     --enable-gtk) printf "%s" -Dgtk=enabled ;;
     --disable-gtk) printf "%s" -Dgtk=disabled ;;
+    --enable-guest-agent) printf "%s" -Dguest_agent=enabled ;;
+    --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
     --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
     --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
     --enable-hax) printf "%s" -Dhax=enabled ;;
@@ -315,6 +319,8 @@ _meson_option_parse() {
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
     --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
+    --enable-tools) printf "%s" -Dtools=enabled ;;
+    --disable-tools) printf "%s" -Dtools=disabled ;;
     --enable-tpm) printf "%s" -Dtpm=enabled ;;
     --disable-tpm) printf "%s" -Dtpm=disabled ;;
     --enable-trace-backends=*) quote_sh "-Dtrace_backends=$2" ;;
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 646c8b1334..e7153c8e91 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -150,7 +150,7 @@ check-acceptance: check-acceptance-deprecated-warning | check-avocado
 .PHONY: check-block check check-clean get-vm-images
 check:
 
-ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
+ifneq ($(.check-block.deps),)
 check: check-block
 check-block: run-ninja
 	$(if $(MAKE.n),,+)$(MESON) test $(MTESTARGS) $(.mtestargs) --verbose \
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 0959061faf..3a51759ebc 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -149,9 +149,7 @@ if have_system
   endif
 endif
 
-if 'CONFIG_TSAN' not in config_host and \
-   'CONFIG_GUEST_AGENT' in config_host and \
-   'CONFIG_LINUX' in config_host
+if have_ga and targetos == 'linux' and 'CONFIG_TSAN' not in config_host
   tests += {'test-qga': ['../qtest/libqtest.c']}
   test_deps += {'test-qga': qga}
 endif
-- 
2.34.1



