Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82083447C48
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:52:50 +0100 (CET)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0OX-0006p4-ED
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0L6-0002bz-NJ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:49:16 -0500
Received: from [2a00:1450:4864:20::12e] (port=33771
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0Ks-00031P-0U
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:49:16 -0500
Received: by mail-lf1-x12e.google.com with SMTP id bu18so34557818lfb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oC2g5DYgcXQyti9StAWo25MaNnIwTjjzZC2EUcw/2ks=;
 b=HHBev6iTb3fKD8fixrMtTjoEMEBrrXk0arnZRbFEhAeVcF2jJlx1Wi9nJhS+Y9JpsF
 Qg7H4gy/8CPWf1CpclGu6QFjLuEXwkJWS4ron2/rKsA1QNcwu9z19XbNui/CMRv3MJDO
 LM9KE2pAV+nvCeMbO4iK5jO5DyJl7WW/vbmuAwW7aI5SY0B3TI3rprK5POlK6XXzC9lh
 WouvXC8AjJGCEYNPA9k+W/Rx59x+1cGRxcRqEILOJhOYMs+Nv/Ark0Tw4cCgr5ROlzgz
 0z6gnKxOpUDVxssY2kXmaPDxae0YN97xjLqJHighC3qSuPt7AGSfRh81SsoSSSi+drXD
 dNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oC2g5DYgcXQyti9StAWo25MaNnIwTjjzZC2EUcw/2ks=;
 b=7q9LQotsex+a9frB+lt5Z6nfuBVDYmlPA6XvQIoZiV4lgQVcZdd58ApJ8yDumpfOSx
 C2f8nQ38VeIBVRC5zYSaKzfMjwIlGigVVqVVsDzCCX3TH8iI2IWL+RHKvz2zyXDmH2Ki
 F4+Xhd5BhAgxFL3w/w0swhjg0hF6qRskiG9442nn9u/L6bQYvCllVEoSSIyJDRmyzn0h
 22CZe56y6ZOxsjn+bqFgGGoUTpQkzuNVu+saV5B54BsWy80YDEGZY8EPFmDOtseJv0Qn
 pud3RornM8sTzIU2b2PmEe3Adi3H87gKUS/4izh/qYnwHy3Iq02vbqMxeDIJmWIJsdwH
 yyHw==
X-Gm-Message-State: AOAM530Yp599qtDZ7cdoqwgtCI3Jf8rLwt8XUPcclMlGeol4Q4mA+YL6
 gYgM8ftEMRSZw9ybi8Dk4Ub0GTo+2l4=
X-Google-Smtp-Source: ABdhPJzEhAB+lNzEyc3gxo4+IECpCW2hBArUXw6bNZhYwuP+p+iSxpHyhvW1DcxrHxxNoVNpNkOTOg==
X-Received: by 2002:a50:cd5a:: with SMTP id d26mr98090522edj.132.1636360993754; 
 Mon, 08 Nov 2021 00:43:13 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i5sm1479953ejw.121.2021.11.08.00.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 00:43:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] configure: propagate --extra-cflags and --extra-ldflags
 to meson compile tests
Date: Mon,  8 Nov 2021 09:43:12 +0100
Message-Id: <20211108084312.541927-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson (intentionally) does not add QEMU_CFLAGS to cc.compiles/cc.links
tests, as they are supposed to be independent of the specific sets of
compilation flags used to build the programs.  However, the user can
still use CFLAGS or the toolchain file's LANG_args/LANG_link_args option
to specify -I or -L options that apply to cc.compiles/cc.links as well.

This is also the intended use of configure's --extra-cflags,
--extra-cxxflags and --extra-ldflags options.  For example, if
one has netmap's header in a nonstandard directory, up to commit
837b84b1c078bf3e909 it used to work fine to do:

.../configure --enable-netmap \
     --extra-cflags=-I/path/to/netmap/sys

but since the test was converted to meson, this does not work anymore.

The main change in the series is in patch 3, where these options are
passed to meson via the toolchain file, instead of via config-host.mak.
This solves the issue since the toolchain file's variables have the
same purpose as configure's --extra-*flags arguments.

Paolo


Paolo Bonzini (4):
  configure: simplify calls to meson_quote
  configure: preserve CFLAGS, CXXFLAGS and LDFLAGS in config.status
  configure: propagate --extra-cflags and --extra-ldflags to meson
    compile tests
  configure: ignore preexisting QEMU_*FLAGS envvars

 configure | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

-- 
2.33.1

From b850924dcda890c0ee33ea05a49cfde131dc3a94 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 5 Nov 2021 10:07:37 +0100
Subject: [PATCH 1/4] configure: simplify calls to meson_quote

meson_quote assumes a non-empty argument list, and incorrectly returns a
one-entry array if passed nothing.  Move the check for an empty argument
list from the invocations to the function itself.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 33682cb971..369b5455b6 100755
--- a/configure
+++ b/configure
@@ -3894,6 +3894,7 @@ echo "TOPSRC_DIR=$source_path" >> $config_mak
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
   meson_quote() {
+    test $# = 0 && return
     echo "'$(echo $* | sed "s/ /','/g")'"
   }
 
@@ -3908,10 +3909,10 @@ if test "$skip_meson" = no; then
 
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
-  echo "c_args = [${CFLAGS:+$(meson_quote $CFLAGS)}]" >> $cross
-  echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
-  echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
-  echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
+  echo "c_args = [$(meson_quote $CFLAGS)]" >> $cross
+  echo "cpp_args = [$(meson_quote $CXXFLAGS)]" >> $cross
+  echo "c_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
+  echo "cpp_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.33.1


From 5d0ab3fa02f05b1698898ac1f2b7d93222d9e073 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 5 Nov 2021 10:08:43 +0100
Subject: [PATCH 2/4] configure: preserve CFLAGS, CXXFLAGS and LDFLAGS in
 config.status

CFLAGS, CXXFLAGS and LDFLAGS influence the tests (for example if they include
-L or -I options), so they should be kept from the invocation of configure
to the subsequent reinvocations via config.status.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 369b5455b6..d268f59246 100755
--- a/configure
+++ b/configure
@@ -4057,9 +4057,12 @@ preserve_env AR
 preserve_env AS
 preserve_env CC
 preserve_env CPP
+preserve_env CFLAGS
 preserve_env CXX
+preserve_env CXXFLAGS
 preserve_env INSTALL
 preserve_env LD
+preserve_env LDFLAGS
 preserve_env LD_LIBRARY_PATH
 preserve_env LIBTOOL
 preserve_env MAKE
-- 
2.33.1


From 3171fa19f22631ab26e82047159a3ecb1212dbe1 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 5 Nov 2021 10:09:26 +0100
Subject: [PATCH 3/4] configure: propagate --extra-cflags and --extra-ldflags
 to meson compile tests

Meson (intentionally) does not add QEMU_CFLAGS to cc.compiles/cc.links
tests, as they are supposed to be independent of the specific sets of
compilation flags used to build the programs.  However, the user can
still use CFLAGS or the toolchain file's LANG_args/LANG_link_args option
to specify -I or -L options that apply to cc.compiles/cc.links as well.

This is also the intended use of configure's --extra-cflags,
--extra-cxxflags and --extra-ldflags options.  For example, if
one has netmap's header in a nonstandard directory, up to commit
837b84b1c078bf3e909 it used to work fine to do:

.../configure --enable-netmap \
     --extra-cflags=-I/path/to/netmap/sys

but since the test was converted to meson, this does not work anymore.

Pass these options to meson via the toolchain file instead of via
config-host.mak, since the toolchain file's variables have the
same purpose as configure's --extra-*flags arguments.

Reported-by: Owen LaGarde
Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 47b30835e4 ("configure: consistently pass CFLAGS/CXXFLAGS/LDFLAGS to meson", 2020-10-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index d268f59246..1ea26c67e5 100755
--- a/configure
+++ b/configure
@@ -174,14 +174,14 @@ update_cxxflags() {
 
 compile_object() {
   local_cflags="$1"
-  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
+  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
 }
 
 compile_prog() {
   local_cflags="$1"
   local_ldflags="$2"
-  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
-      $LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
+  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
+      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
 }
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
@@ -286,6 +286,10 @@ for opt do
   esac
 done
 
+EXTRA_CFLAGS=""
+EXTRA_CXXFLAGS=""
+EXTRA_LDFLAGS=""
+
 xen_ctrl_version="$default_feature"
 xfs="$default_feature"
 membarrier="$default_feature"
@@ -394,13 +398,13 @@ for opt do
   ;;
   --cpu=*) cpu="$optarg"
   ;;
-  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
-                    QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
+  --extra-cflags=*)
+    EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
+    EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
+    ;;
+  --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
   ;;
-  --extra-cxxflags=*) QEMU_CXXFLAGS="$QEMU_CXXFLAGS $optarg"
-  ;;
-  --extra-ldflags=*) QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
-                     EXTRA_LDFLAGS="$optarg"
+  --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
   --enable-debug-info) debug_info="yes"
   ;;
@@ -1346,8 +1350,8 @@ Advanced options (experts only):
                            build time
   --cxx=CXX                use C++ compiler CXX [$cxx]
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
-  --extra-cflags=CFLAGS    append extra C compiler flags QEMU_CFLAGS
-  --extra-cxxflags=CXXFLAGS append extra C++ compiler flags QEMU_CXXFLAGS
+  --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
+  --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
@@ -3402,7 +3406,7 @@ EOF
 
     update_cxxflags
 
-    if do_cxx $CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
+    if do_cxx $CXXFLAGS $EXTRA_CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
         # C++ compiler $cxx works ok with C compiler $cc
         :
     else
@@ -3909,10 +3913,10 @@ if test "$skip_meson" = no; then
 
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
-  echo "c_args = [$(meson_quote $CFLAGS)]" >> $cross
-  echo "cpp_args = [$(meson_quote $CXXFLAGS)]" >> $cross
-  echo "c_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
-  echo "cpp_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
+  echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
+  echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  echo "c_link_args = [$(meson_quote $LDFLAGS $EXTRA_LDFLAGS)]" >> $cross
+  echo "cpp_link_args = [$(meson_quote $LDFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.33.1


From a5da9ab1c0f8980aa52302afbc5c6dabed95ad0b Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 8 Nov 2021 08:58:23 +0100
Subject: [PATCH 4/4] configure: ignore preexisting QEMU_*FLAGS envvars

User flags should be passed via CFLAGS/CXXFLAGS/LDFLAGS,
or --extra-cflags/extra-cxxflags/--extra-ldflags on the
command line.

QEMU_CFLAGS, QEMU_CXXFLAGS and QEMU_LDFLAGS are reserved
for flags detected by configure, so do not add to them
and clear them at the beginning of the script.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1ea26c67e5..2048a52b20 100755
--- a/configure
+++ b/configure
@@ -158,7 +158,7 @@ update_cxxflags() {
     # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
     # options which some versions of GCC's C++ compiler complain about
     # because they only make sense for C programs.
-    QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
+    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
     CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
     for arg in $QEMU_CFLAGS; do
         case $arg in
@@ -465,11 +465,13 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 # left shift of signed integers is well defined and has the expected
 # 2s-complement style results. (Both clang and gcc agree that it
 # provides these semantics.)
-QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
+QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
+QEMU_LDFLAGS=
+
 # Flags that are needed during configure but later taken care of by Meson
 CONFIGURE_CFLAGS="-std=gnu11 -Wall"
 CONFIGURE_LDFLAGS=
-- 
2.33.1


