Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7855284794
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 09:41:43 +0200 (CEST)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPhbS-0000vL-RW
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 03:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPhQG-0002sH-My
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 03:30:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPhQE-0001SV-3q
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 03:30:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id w5so12225291wrp.8
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b33bn38NadSwKtQL54nStprGVkEdcrAKRDNn88+9DKo=;
 b=T4P+HDC1FF9PqLsamNFTnvW5fuOTb1ECsOpXmB+rXYtTDnekgpcjq5W9s1683sO0Tm
 2a10mRQAcrErTzOnX0PaPiykvQA9PSsQ9w40n0cXqWRl9qENu2lhP3q7fS1hxLBuEuh6
 ESHaEtSx7ugLglotZHSqq+b2T/6aFEbY4o4+zuLDDlSx+G9fJFPMEKVlehZ0Wg5he0+c
 /BxtO6nho5xJoLym49zaFBYwwD5uQr9zKr1RxhA4uyqbgdoiZzPAjUbYSsQc03ZAqcRx
 0OqZPQURDkJA9ErhTND+QYFXHXkbtM2jRePK0TwQde27Oe0d8xfcSNXVe98atJ+XNynm
 AneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b33bn38NadSwKtQL54nStprGVkEdcrAKRDNn88+9DKo=;
 b=Vlw6yth5eWlSocFPJieMdabzcF8p/bbpw/WcaLv78JMsQlxtNy5iZTflD+3CAHhKqs
 3Szfc//2+D2AQuTZClaqZxlep/HBCWVlas0xy4nwvxRpOPdPDU48MSg8gFm0sOhUf1w9
 WPdigNKcyeM4QjNOB2o7z6Q9UUJQt/zgFxj15FM0RaA90H6RFuntEtKb/IMmKXcvadyg
 Om9po+E8HOKT88mAThqdVbvekRs9nq/PPGDdtaHKlDPPDgeujoj8ztRdgdK8PB9u5qRZ
 dCu0h2fBWHPViRtUgAsxZ+4LAp/8PSGA1MlDgwfe7OzeZjyQO64psY7vFtiOQehO2bEK
 XkcA==
X-Gm-Message-State: AOAM531UleBctVQJCiB/1RKZDN2IP5M5ta7poXSZW3XXlGa+ZcGzQdP/
 vNBQ0DCokp1js1+Fhu5GcKO1NSETjyc=
X-Google-Smtp-Source: ABdhPJwn7OsHm5/GwHrel/q5DfAi2Sl1VQEB0upkFkaqI/+GjXWFc248A9dC/NyC2epUhmQwh2e9hQ==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr3234444wru.193.1601969404156; 
 Tue, 06 Oct 2020 00:30:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id i9sm2576329wma.47.2020.10.06.00.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 00:30:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/37] dtc: Convert Makefile bits to meson bits
Date: Tue,  6 Oct 2020 09:29:30 +0200
Message-Id: <20201006072947.487729-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006072947.487729-1-pbonzini@redhat.com>
References: <20201006072947.487729-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the library via the main meson.build just like for capstone.
This improves the current state of affairs in that we will re-link
the qemu executables against a changed libfdt.a, which we wouldn't
do before-hand, and lets us remove the whole recursive make machinery.

Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                                      | 23 +----
 configure                                     | 93 ++++---------------
 default-configs/targets/aarch64-softmmu.mak   |  1 +
 default-configs/targets/arm-softmmu.mak       |  1 +
 .../targets/microblaze-softmmu.mak            |  1 +
 .../targets/microblazeel-softmmu.mak          |  1 +
 default-configs/targets/mips64el-softmmu.mak  |  1 +
 default-configs/targets/ppc-softmmu.mak       |  1 +
 default-configs/targets/ppc64-softmmu.mak     |  1 +
 default-configs/targets/riscv32-softmmu.mak   |  1 +
 default-configs/targets/riscv64-softmmu.mak   |  1 +
 default-configs/targets/rx-softmmu.mak        |  1 +
 meson.build                                   | 61 ++++++++++--
 meson_options.txt                             |  3 +
 14 files changed, 84 insertions(+), 106 deletions(-)

diff --git a/Makefile b/Makefile
index 9d6b7fc8c0..c37e513431 100644
--- a/Makefile
+++ b/Makefile
@@ -142,28 +142,7 @@ SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
 include $(SRC_PATH)/tests/Makefile.include
 
 all: recurse-all
-Makefile: $(addsuffix /all, $(SUBDIRS))
-
-# LIBFDT_lib="": avoid breaking existing trees with objects requiring -fPIC
-DTC_MAKE_ARGS=-I$(SRC_PATH)/dtc VPATH=$(SRC_PATH)/dtc -C dtc V="$(V)" LIBFDT_lib=""
-DTC_CFLAGS=$(CFLAGS) $(QEMU_CFLAGS)
-DTC_CPPFLAGS=-I$(SRC_PATH)/dtc/libfdt
-
-.PHONY: dtc/all
-dtc/all: .git-submodule-status dtc/libfdt
-	$(call quiet-command,$(MAKE) $(DTC_MAKE_ARGS) CPPFLAGS="$(DTC_CPPFLAGS)" CFLAGS="$(DTC_CFLAGS)" LDFLAGS="$(QEMU_LDFLAGS)" ARFLAGS="$(ARFLAGS)" CC="$(CC)" AR="$(AR)" LD="$(LD)" $(SUBDIR_MAKEFLAGS) libfdt,)
-
-dtc/%: .git-submodule-status
-	@mkdir -p $@
-
-# Retain for a while so that incremental build across this patch
-# does not raise an error for missing target "capstone/all", which
-# comes from the saved SUBDIRS value.
-.PHONY: capstone/all
-capstone/all:
-
-.PHONY: slirp/all
-slirp/all:
+Makefile:
 
 ROM_DIRS = $(addprefix pc-bios/, $(ROMS))
 ROM_DIRS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROM_DIRS)))
diff --git a/configure b/configure
index 51f4e978be..2fdb4339e8 100755
--- a/configure
+++ b/configure
@@ -296,7 +296,7 @@ brlapi=""
 curl=""
 curses=""
 docs=""
-fdt=""
+fdt="auto"
 netmap="no"
 sdl="auto"
 sdl_image="auto"
@@ -1181,9 +1181,13 @@ for opt do
   ;;
   --enable-curl) curl="yes"
   ;;
-  --disable-fdt) fdt="no"
+  --disable-fdt) fdt="disabled"
   ;;
-  --enable-fdt) fdt="yes"
+  --enable-fdt) fdt="enabled"
+  ;;
+  --enable-fdt=git) fdt="internal"
+  ;;
+  --enable-fdt=system) fdt="system"
   ;;
   --disable-linux-aio) linux_aio="no"
   ;;
@@ -3941,67 +3945,15 @@ fi
 
 ##########################################
 # fdt probe
-# fdt support is mandatory for at least some target architectures,
-# so insist on it if we're building those system emulators.
-fdt_required=no
-for target in $target_list; do
-  case $target in
-    aarch64*-softmmu|arm*-softmmu|ppc*-softmmu|microblaze*-softmmu|mips64el-softmmu|riscv*-softmmu|rx-softmmu)
-      fdt_required=yes
-    ;;
-  esac
-done
-
-if test "$fdt_required" = "yes"; then
-  if test "$fdt" = "no"; then
-    error_exit "fdt disabled but some requested targets require it." \
-      "You can turn off fdt only if you also disable all the system emulation" \
-      "targets which need it (by specifying a cut down --target-list)."
-  fi
-  fdt=yes
-elif test "$fdt" != "yes" ; then
-  fdt=no
-fi
-
-# fdt is only required when building softmmu targets
-if test -z "$fdt" -a "$softmmu" != "yes" ; then
-    fdt="no"
-fi
 
-if test "$fdt" != "no" ; then
-  fdt_libs="-lfdt"
-  # explicitly check for libfdt_env.h as it is missing in some stable installs
-  # and test for required functions to make sure we are on a version >= 1.4.2
-  cat > $TMPC << EOF
-#include <libfdt.h>
-#include <libfdt_env.h>
-int main(void) { fdt_check_full(NULL, 0); return 0; }
-EOF
-  if compile_prog "" "$fdt_libs" ; then
-    # system DTC is good - use it
-    fdt=system
-  else
-      # have GIT checkout, so activate dtc submodule
-      if test -e "${source_path}/.git" ; then
-          git_submodules="${git_submodules} dtc"
-      fi
-      if test -d "${source_path}/dtc/libfdt" || test -e "${source_path}/.git" ; then
-          fdt=git
-          mkdir -p dtc
-          fdt_cflags="-I${source_path}/dtc/libfdt"
-          fdt_ldflags="-Ldtc/libfdt"
-          fdt_libs="$fdt_libs"
-      elif test "$fdt" = "yes" ; then
-          # Not a git build & no libfdt found, prompt for system install
-          error_exit "DTC (libfdt) version >= 1.4.2 not present." \
-                     "Please install the DTC (libfdt) devel package"
-      else
-          # don't have and don't want
-          fdt_libs=
-          fdt=no
-      fi
-  fi
-fi
+case "$fdt" in
+  auto | enabled | internal)
+    # Simpler to always update submodule, even if not needed.
+    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+      git_submodules="${git_submodules} dtc"
+    fi
+    ;;
+esac
 
 ##########################################
 # opengl probe (for sdl2, gtk, milkymist-tmu2)
@@ -6107,9 +6059,6 @@ fi
 if test $git_update = 'yes' ; then
     (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
 fi
-if test "$fdt" = "git" ; then
-    symlink "$source_path/dtc/Makefile" "dtc/Makefile"
-fi
 
 config_host_mak="config-host.mak"
 
@@ -6213,7 +6162,6 @@ if test "$guest_agent" = "yes" ; then
   echo "CONFIG_GUEST_AGENT=y" >> $config_host_mak
 fi
 echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
-subdirs=
 if test "$vde" = "yes" ; then
   echo "CONFIG_VDE=y" >> $config_host_mak
   echo "VDE_LIBS=$vde_libs" >> $config_host_mak
@@ -6539,11 +6487,6 @@ fi
 if test "$preadv" = "yes" ; then
   echo "CONFIG_PREADV=y" >> $config_host_mak
 fi
-if test "$fdt" != "no" ; then
-  echo "CONFIG_FDT=y" >> $config_host_mak
-  echo "FDT_CFLAGS=$fdt_cflags" >> $config_host_mak
-  echo "FDT_LIBS=$fdt_ldflags $fdt_libs" >> $config_host_mak
-fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
@@ -7083,14 +7026,10 @@ for target in $target_list; do
     esac
 done
 
-if [ "$fdt" = "git" ]; then
-  subdirs="$subdirs dtc"
-fi
 echo "CONFIG_QEMU_INTERP_PREFIX=$interp_prefix" | sed 's/%M/@0@/' >> $config_host_mak
 if test "$default_targets" = "yes"; then
   echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
 fi
-echo "SUBDIRS=$subdirs" >> $config_host_mak
 
 if test "$numa" = "yes"; then
   echo "CONFIG_NUMA=y" >> $config_host_mak
@@ -7269,7 +7208,7 @@ NINJA=${ninja:-$PWD/ninjatool} $meson setup \
 	-Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
 	-Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
 	-Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f \
-	-Dcapstone=$capstone -Dslirp=$slirp \
+	-Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/default-configs/targets/aarch64-softmmu.mak b/default-configs/targets/aarch64-softmmu.mak
index a8c0174fc3..7703127674 100644
--- a/default-configs/targets/aarch64-softmmu.mak
+++ b/default-configs/targets/aarch64-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/arm-softmmu.mak b/default-configs/targets/arm-softmmu.mak
index 9b1a7f37c6..84a98f4818 100644
--- a/default-configs/targets/arm-softmmu.mak
+++ b/default-configs/targets/arm-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/microblaze-softmmu.mak b/default-configs/targets/microblaze-softmmu.mak
index 0b5c78ef00..33f2a00402 100644
--- a/default-configs/targets/microblaze-softmmu.mak
+++ b/default-configs/targets/microblaze-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=microblaze
 TARGET_WORDS_BIGENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/microblazeel-softmmu.mak b/default-configs/targets/microblazeel-softmmu.mak
index dc822219d8..af40391f2f 100644
--- a/default-configs/targets/microblazeel-softmmu.mak
+++ b/default-configs/targets/microblazeel-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=microblaze
 TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/mips64el-softmmu.mak b/default-configs/targets/mips64el-softmmu.mak
index b751ae1bcf..5a52aa4b64 100644
--- a/default-configs/targets/mips64el-softmmu.mak
+++ b/default-configs/targets/mips64el-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
 TARGET_ALIGNED_ONLY=y
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/ppc-softmmu.mak b/default-configs/targets/ppc-softmmu.mak
index ef69037a2c..f4eef1819a 100644
--- a/default-configs/targets/ppc-softmmu.mak
+++ b/default-configs/targets/ppc-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=ppc
 TARGET_WORDS_BIGENDIAN=y
 TARGET_XML_FILES= gdb-xml/power-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/ppc64-softmmu.mak b/default-configs/targets/ppc64-softmmu.mak
index 0fde2d02b9..84fbf46be9 100644
--- a/default-configs/targets/ppc64-softmmu.mak
+++ b/default-configs/targets/ppc64-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=ppc
 TARGET_WORDS_BIGENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/power64-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml gdb-xml/power-vsx.xml
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/riscv32-softmmu.mak b/default-configs/targets/riscv32-softmmu.mak
index 4544e1ae9a..9446d96d13 100644
--- a/default-configs/targets/riscv32-softmmu.mak
+++ b/default-configs/targets/riscv32-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/riscv64-softmmu.mak b/default-configs/targets/riscv64-softmmu.mak
index 6ce0b283cf..d809bd666a 100644
--- a/default-configs/targets/riscv64-softmmu.mak
+++ b/default-configs/targets/riscv64-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
+TARGET_NEED_FDT=y
diff --git a/default-configs/targets/rx-softmmu.mak b/default-configs/targets/rx-softmmu.mak
index 2d410e0b0c..0c458b2d07 100644
--- a/default-configs/targets/rx-softmmu.mak
+++ b/default-configs/targets/rx-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=rx
 TARGET_XML_FILES= gdb-xml/rx-core.xml
+TARGET_NEED_FDT=y
diff --git a/meson.build b/meson.build
index 165716ddad..0b8ec210f0 100644
--- a/meson.build
+++ b/meson.build
@@ -531,11 +531,6 @@ if get_option('vnc').enabled()
                               compile_args: '-DSTRUCT_IOVEC_DEFINED')
   endif
 endif
-fdt = not_found
-if 'CONFIG_FDT' in config_host
-  fdt = declare_dependency(compile_args: config_host['FDT_CFLAGS'].split(),
-                           link_args: config_host['FDT_LIBS'].split())
-endif
 snappy = not_found
 if 'CONFIG_SNAPPY' in config_host
   snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
@@ -723,6 +718,7 @@ ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
 default_targets = 'CONFIG_DEFAULT_TARGETS' in config_host
 actual_target_dirs = []
+fdt_required = []
 foreach target : target_dirs
   config_target = { 'TARGET_NAME': target.split('-')[0] }
   if target.endswith('linux-user')
@@ -774,6 +770,10 @@ foreach target : target_dirs
   config_target += keyval.load('default-configs/targets' / target + '.mak')
   config_target += { 'TARGET_' + config_target['TARGET_ARCH'].to_upper(): 'y' }
 
+  if 'TARGET_NEED_FDT' in config_target
+    fdt_required += target
+  endif
+
   # Add default keys
   if 'TARGET_BASE_ARCH' not in config_target
     config_target += {'TARGET_BASE_ARCH': config_target['TARGET_ARCH']}
@@ -1053,7 +1053,54 @@ if have_system
   endif
 endif
 
+fdt = not_found
+fdt_opt = get_option('fdt')
+if have_system
+  if fdt_opt in ['enabled', 'auto', 'system']
+    have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
+    fdt = cc.find_library('fdt', static: enable_static,
+                          required: fdt_opt == 'system' or
+                                    fdt_opt == 'enabled' and not have_internal)
+    if fdt.found() and cc.links('''
+       #include <libfdt.h>
+       #include <libfdt_env.h>
+       int main(void) { fdt_check_full(NULL, 0); return 0; }''',
+         dependencies: fdt)
+      fdt_opt = 'system'
+    elif have_internal
+      fdt_opt = 'internal'
+    else
+      fdt_opt = 'disabled'
+    endif
+  endif
+  if fdt_opt == 'internal'
+    fdt_files = files(
+      'dtc/libfdt/fdt.c',
+      'dtc/libfdt/fdt_ro.c',
+      'dtc/libfdt/fdt_wip.c',
+      'dtc/libfdt/fdt_sw.c',
+      'dtc/libfdt/fdt_rw.c',
+      'dtc/libfdt/fdt_strerror.c',
+      'dtc/libfdt/fdt_empty_tree.c',
+      'dtc/libfdt/fdt_addresses.c',
+      'dtc/libfdt/fdt_overlay.c',
+      'dtc/libfdt/fdt_check.c',
+    )
+
+    fdt_inc = include_directories('dtc/libfdt')
+    libfdt = static_library('fdt',
+                            sources: fdt_files,
+                            include_directories: fdt_inc)
+    fdt = declare_dependency(link_with: libfdt,
+                             include_directories: fdt_inc)
+  endif
+endif
+if not fdt.found() and fdt_required.length() > 0
+  error('fdt not available but required by targets ' + ', '.join(fdt_required))
+endif
+
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
+config_host_data.set('CONFIG_FDT', fdt.found())
 config_host_data.set('CONFIG_SLIRP', slirp.found())
 
 genh += configure_file(output: 'config-host.h', configuration: config_host_data)
@@ -1323,7 +1370,7 @@ softmmu_ss.add(files(
 
 softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
 softmmu_ss.add(when: 'CONFIG_SECCOMP', if_true: [files('qemu-seccomp.c'), seccomp])
-softmmu_ss.add(when: ['CONFIG_FDT', fdt],  if_true: [files('device_tree.c')])
+softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
 
 common_ss.add(files('cpus-common.c'))
 
@@ -1817,7 +1864,7 @@ endif
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
-summary_info += {'fdt support':       config_host.has_key('CONFIG_FDT')}
+summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
 summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
 summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
diff --git a/meson_options.txt b/meson_options.txt
index 8a362fb08d..1d3c94840a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -55,3 +55,6 @@ option('capstone', type: 'combo', value: 'auto',
 option('slirp', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the slirp library')
+option('fdt', type: 'combo', value: 'auto',
+       choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
+       description: 'Whether and how to find the libfdt library')
-- 
2.26.2



