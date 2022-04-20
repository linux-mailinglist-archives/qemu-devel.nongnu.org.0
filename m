Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF51508CEA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:12:46 +0200 (CEST)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCwf-0001dy-9H
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLx-0001yD-Cs
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLv-0000zb-BR
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id u3so2804245wrg.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxRdYJWzNGSycLSAS+vnJamXrUs82CCJ8f9Qt8EjEOw=;
 b=UkTNbcNWQnABELHQxIJC6V+ibFbkoDYfZFETSU49sNnr0vBXucMPGpe7Q9qstNuqdS
 jskl3JI71PhY2yo7nZBHfYiE4WGP+fBLud290fvmCd2X9fw1Kwjdartrpek58NE6z6f5
 seFg+1F2SRGrQjo0lGHqNA3wAPxGX0lRQawoepFyxtiXf5LPn+P18JCfB9WjeNa2xv6M
 8Ue7vru6ys2Ic6Na7ylxBWiz+BOaGSZanhOLVV49KTBSxhkw1Ea46f5XvPdybRT+e+G4
 9yK2C4PLa4P4+9LJ43y9twzN8zOtjsvoDKGucac/rkDjMMfsD8X+YqDOlQkuWlQnRGSv
 +zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jxRdYJWzNGSycLSAS+vnJamXrUs82CCJ8f9Qt8EjEOw=;
 b=xW2jQXGc3RNJa2egamGIW9kpY3VUVmZ4nQig9FVOD85Mf1UBenLEugy1RzsCCiqNW+
 zYA147IuIZIdfM30wk2tt49PS4n6NWJAJEcnDqt8JLwH/0HRO2vNc+fvlxMm1GLB0+rq
 y14MAFEZw1M39Li2LZG16d6HT/bTTxRHPs04XyrGBXchXc2xwg1G70+CCNpVvSbLwpK+
 dwK1+a9XXWhR3wjrvdRsU+nlCZw2qqXxuevmSpzLGUEeZk6PgXXy4AqnRHkpI9Ja8vr3
 mplqSppUmWButCs2gEQN1h54us78cDoFR6ilK/9uABAP8IUPJeG/p5AedmA3Ry3IBW5a
 LkSg==
X-Gm-Message-State: AOAM532xkFOBIxGFty+vI+iflaJ3y1UMTQIGNNbNf5ZzyUJZAguKJEKf
 7SUByyy5FoT58alPLFw7zuBNdv0nKx/4hQ==
X-Google-Smtp-Source: ABdhPJzk7KhA3vkPlex7TL8000Ho9gX8m1IvBDDIklqV2wAJ3IssTzWYsOwrknrPS196d/i8908cAw==
X-Received: by 2002:adf:e289:0:b0:1e3:14ad:75fe with SMTP id
 v9-20020adfe289000000b001e314ad75femr16191005wri.685.1650468885890; 
 Wed, 20 Apr 2022 08:34:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/34] configure: switch directory options to automatic parsing
Date: Wed, 20 Apr 2022 17:33:57 +0200
Message-Id: <20220420153407.73926-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

While prefix, bindir and qemu_suffix needs special treatment due to
differences between Windows and POSIX systems, everything else
needs no extra code in configure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 58 ++---------------------------------
 meson_options.txt             |  4 +--
 scripts/meson-buildoptions.py | 11 +++++--
 scripts/meson-buildoptions.sh | 21 +++++++++++++
 4 files changed, 34 insertions(+), 60 deletions(-)

diff --git a/configure b/configure
index 200ef3be23..b704453c68 100755
--- a/configure
+++ b/configure
@@ -311,6 +311,7 @@ plugins="$default_feature"
 meson=""
 meson_args=""
 ninja=""
+bindir="bin"
 skip_meson=no
 
 # The following Meson options are handled manually (still they
@@ -669,6 +670,7 @@ if test "$mingw32" = "yes" ; then
   CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
   write_c_skeleton;
   prefix="/qemu"
+  bindir=""
   qemu_suffix=""
 fi
 
@@ -775,30 +777,10 @@ for opt do
     static="yes"
     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
   ;;
-  --mandir=*) mandir="$optarg"
-  ;;
   --bindir=*) bindir="$optarg"
   ;;
-  --libdir=*) libdir="$optarg"
-  ;;
-  --libexecdir=*) libexecdir="$optarg"
-  ;;
-  --includedir=*) includedir="$optarg"
-  ;;
-  --datadir=*) datadir="$optarg"
-  ;;
   --with-suffix=*) qemu_suffix="$optarg"
   ;;
-  --docdir=*) docdir="$optarg"
-  ;;
-  --localedir=*) localedir="$optarg"
-  ;;
-  --sysconfdir=*) sysconfdir="$optarg"
-  ;;
-  --localstatedir=*) local_statedir="$optarg"
-  ;;
-  --firmwarepath=*) firmwarepath="$optarg"
-  ;;
   --host=*|--build=*|\
   --disable-dependency-tracking|\
   --sbindir=*|--sharedstatedir=*|\
@@ -1021,23 +1003,6 @@ case $git_submodules_action in
     ;;
 esac
 
-libdir="${libdir:-$prefix/lib}"
-libexecdir="${libexecdir:-$prefix/libexec}"
-includedir="${includedir:-$prefix/include}"
-
-if test "$mingw32" = "yes" ; then
-    bindir="${bindir:-$prefix}"
-else
-    bindir="${bindir:-$prefix/bin}"
-fi
-mandir="${mandir:-$prefix/share/man}"
-datadir="${datadir:-$prefix/share}"
-docdir="${docdir:-$prefix/share/doc}"
-sysconfdir="${sysconfdir:-$prefix/etc}"
-local_statedir="${local_statedir:-$prefix/var}"
-firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
-localedir="${localedir:-$datadir/locale}"
-
 if eval test -z "\${cross_cc_$cpu}"; then
     eval "cross_cc_${cpu}=\$cc"
     cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
@@ -1115,16 +1080,7 @@ Advanced options (experts only):
   --with-git-submodules=validate fail if git submodules are not up to date
   --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
   --static                 enable static build [$static]
-  --mandir=PATH            install man pages in PATH
-  --datadir=PATH           install firmware in PATH/$qemu_suffix
-  --localedir=PATH         install translation in PATH/$qemu_suffix
-  --docdir=PATH            install documentation in PATH/$qemu_suffix
   --bindir=PATH            install binaries in PATH
-  --libdir=PATH            install libraries in PATH
-  --libexecdir=PATH        install helper binaries in PATH
-  --sysconfdir=PATH        install config in PATH/$qemu_suffix
-  --localstatedir=PATH     install local state in PATH (set at runtime on win32)
-  --firmwarepath=PATH      search PATH for firmware files
   --efi-aarch64=PATH       PATH of efi file to use for aarch64 VMs.
   --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
   --without-default-features default all --enable-* options to "disabled"
@@ -2409,18 +2365,8 @@ if test "$skip_meson" = no; then
   run_meson() {
     NINJA=$ninja $meson setup \
         --prefix "$prefix" \
-        --libdir "$libdir" \
-        --libexecdir "$libexecdir" \
         --bindir "$bindir" \
-        --includedir "$includedir" \
-        --datadir "$datadir" \
-        --mandir "$mandir" \
-        --sysconfdir "$sysconfdir" \
-        --localedir "$localedir" \
-        --localstatedir "$local_statedir" \
         -Ddefault_devices=$default_devices \
-        -Ddocdir="$docdir" \
-        -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
diff --git a/meson_options.txt b/meson_options.txt
index 848426460c..a76fadbd7d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -4,9 +4,9 @@
 
 option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
-option('docdir', type : 'string', value : 'doc',
+option('docdir', type : 'string', value : 'share/doc',
        description: 'Base directory for documentation installation (can be empty)')
-option('qemu_firmwarepath', type : 'string', value : '',
+option('qemu_firmwarepath', type : 'string', value : 'qemu-firmware',
        description: 'search PATH for firmware files')
 option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 0f9603a7f6..45cda8cd84 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -27,9 +27,7 @@
 
 SKIP_OPTIONS = {
     "default_devices",
-    "docdir",
     "fuzzing_engine",
-    "qemu_firmwarepath",
     "qemu_suffix",
     "smbd",
 }
@@ -37,12 +35,21 @@
 OPTION_NAMES = {
     "malloc": "enable-malloc",
     "pkgversion": "with-pkgversion",
+    "qemu_firmwarepath": "firmwarepath",
     "trace_backends": "enable-trace-backends",
     "trace_file": "with-trace-file",
 }
 
 BUILTIN_OPTIONS = {
+    "datadir",
+    "includedir",
+    "libdir",
+    "libexecdir",
+    "localedir",
+    "localstatedir",
+    "mandir",
     "strip",
+    "sysconfdir",
 }
 
 LINE_WIDTH = 76
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index a0c86db116..a52cc14d13 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -8,8 +8,11 @@ meson_options_help() {
   printf "%s\n" '  --block-drv-rw-whitelist=VALUE'
   printf "%s\n" '                           set block driver read-write whitelist (by default'
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
+  printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
+  printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
+  printf "%s\n" '                           (can be empty) [share/doc]'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
   printf "%s\n" '                           use block whitelist also in tools instead of only'
   printf "%s\n" '                           QEMU'
@@ -40,10 +43,18 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
+  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [qemu-firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
+  printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
   printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
+  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
+  printf "%s\n" '  --libexecdir=VALUE       Library executable directory [libexec]'
+  printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
+  printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
+  printf "%s\n" '  --mandir=VALUE           Manual page directory [share/man]'
   printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
+  printf "%s\n" '  --sysconfdir=VALUE       Sysconf data directory [etc]'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
@@ -206,6 +217,7 @@ _meson_option_parse() {
     --disable-curl) printf "%s" -Dcurl=disabled ;;
     --enable-curses) printf "%s" -Dcurses=enabled ;;
     --disable-curses) printf "%s" -Dcurses=disabled ;;
+    --datadir=*) quote_sh "-Ddatadir=$2" ;;
     --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
     --enable-debug-mutex) printf "%s" -Ddebug_mutex=true ;;
@@ -214,6 +226,7 @@ _meson_option_parse() {
     --disable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=false ;;
     --enable-dmg) printf "%s" -Ddmg=enabled ;;
     --disable-dmg) printf "%s" -Ddmg=disabled ;;
+    --docdir=*) quote_sh "-Ddocdir=$2" ;;
     --enable-docs) printf "%s" -Ddocs=enabled ;;
     --disable-docs) printf "%s" -Ddocs=disabled ;;
     --enable-dsound) printf "%s" -Ddsound=enabled ;;
@@ -252,6 +265,7 @@ _meson_option_parse() {
     --iasl=*) quote_sh "-Diasl=$2" ;;
     --enable-iconv) printf "%s" -Diconv=enabled ;;
     --disable-iconv) printf "%s" -Diconv=disabled ;;
+    --includedir=*) quote_sh "-Dincludedir=$2" ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
     --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
@@ -265,6 +279,8 @@ _meson_option_parse() {
     --disable-l2tpv3) printf "%s" -Dl2tpv3=disabled ;;
     --enable-libdaxctl) printf "%s" -Dlibdaxctl=enabled ;;
     --disable-libdaxctl) printf "%s" -Dlibdaxctl=disabled ;;
+    --libdir=*) quote_sh "-Dlibdir=$2" ;;
+    --libexecdir=*) quote_sh "-Dlibexecdir=$2" ;;
     --enable-libiscsi) printf "%s" -Dlibiscsi=enabled ;;
     --disable-libiscsi) printf "%s" -Dlibiscsi=disabled ;;
     --enable-libnfs) printf "%s" -Dlibnfs=enabled ;;
@@ -283,6 +299,8 @@ _meson_option_parse() {
     --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=disabled ;;
     --enable-live-block-migration) printf "%s" -Dlive_block_migration=enabled ;;
     --disable-live-block-migration) printf "%s" -Dlive_block_migration=disabled ;;
+    --localedir=*) quote_sh "-Dlocaledir=$2" ;;
+    --localstatedir=*) quote_sh "-Dlocalstatedir=$2" ;;
     --enable-lzfse) printf "%s" -Dlzfse=enabled ;;
     --disable-lzfse) printf "%s" -Dlzfse=disabled ;;
     --enable-lzo) printf "%s" -Dlzo=enabled ;;
@@ -290,6 +308,7 @@ _meson_option_parse() {
     --enable-malloc=*) quote_sh "-Dmalloc=$2" ;;
     --enable-malloc-trim) printf "%s" -Dmalloc_trim=enabled ;;
     --disable-malloc-trim) printf "%s" -Dmalloc_trim=disabled ;;
+    --mandir=*) quote_sh "-Dmandir=$2" ;;
     --enable-membarrier) printf "%s" -Dmembarrier=enabled ;;
     --disable-membarrier) printf "%s" -Dmembarrier=disabled ;;
     --enable-module-upgrades) printf "%s" -Dmodule_upgrades=true ;;
@@ -323,6 +342,7 @@ _meson_option_parse() {
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
     --disable-qed) printf "%s" -Dqed=disabled ;;
+    --firmwarepath=*) quote_sh "-Dqemu_firmwarepath=$2" ;;
     --enable-qga-vss) printf "%s" -Dqga_vss=enabled ;;
     --disable-qga-vss) printf "%s" -Dqga_vss=disabled ;;
     --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=true ;;
@@ -361,6 +381,7 @@ _meson_option_parse() {
     --disable-spice-protocol) printf "%s" -Dspice_protocol=disabled ;;
     --enable-strip) printf "%s" -Dstrip=true ;;
     --disable-strip) printf "%s" -Dstrip=false ;;
+    --sysconfdir=*) quote_sh "-Dsysconfdir=$2" ;;
     --enable-tcg) printf "%s" -Dtcg=enabled ;;
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
-- 
2.35.1



