Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A28514CAF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:23:31 +0200 (CEST)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRWs-0005wt-AX
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRs-0005fu-MI
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:20 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRp-0004YL-Ga
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:20 -0400
Received: by mail-ed1-x52e.google.com with SMTP id z19so9228672edx.9
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=318/kUuPaazLiyf6nNi4TZdS6a9iFGes1ZD8zTFxGz0=;
 b=e8EOfETBZormWhNK0fMKQjP39Iw1SMJX+GAe8glr5ADqLQSKI9Y3j9CzcZqbGWlWAt
 WJqqRcwR+h3lfBZy9sWl/rVFavj1XINQQ98lY3S9zO6ygb1Y6O4O+uxTiYbHGzHsVSoW
 ovchMJw+em+VQWMcexfAn+uf1bVuCwg9uSWJZANrGfRKqT6RA0mCbdRAr8UzqzI7Wvx3
 OgvIitGlBmkEwVbtpOE7vh/euBo5PGqIr1MbL9y7mnlNp/nHuwwW004PaM7umk6TlfVs
 jVzqGDWYqZWIMFw/96JZzvdkaha/2vR51y1ZJ7CbuhxYUX5JFRmI9NCIiZJwsuiu5nJn
 mvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=318/kUuPaazLiyf6nNi4TZdS6a9iFGes1ZD8zTFxGz0=;
 b=FFWQee6E3OJW0J+LtgiODWpuEZQyuciC0hpdYJNhHyAB+nOGHDSsegj2p/TvQT1ucG
 PmL5r/CUHR60RKj3G73P7Ql98wu0+Tt5KdCVqa/dvdYfu/zatIO3y3GNM8rh0Wo7pJOY
 EF6Zlp6H1ivYOxgm9FvhJgOCxFUfrFkjW6KtjGAfQ6rTNRj81YX0PRQopL9cSLcSW/vE
 G/IboKXXBW8RpVZDhgSfCBtVHiA1SJ+3B4rxrcXHt3xjjZkmP95f0H8IiwD6nNj1cXLH
 qUxZJEsIrwF+X2Hilr8FpWXNwlpOYqpcGTj1I2B9piRfEZRKeZ0R9v7ipbwUvMqsmih4
 KbxQ==
X-Gm-Message-State: AOAM5316gMsrQDrgl2KZQ0A42lx7hJzyZkwNnbrH5+mb0EhwC7bb5U6N
 5yLcluJSjGJk7WRXPBHHHg0lCAo46DiT1A==
X-Google-Smtp-Source: ABdhPJxQeXe5yEj/OvoAFfEBcTq9hJGqYh8VhcBnd+9hvhyjj6H7PpBwWpxM9VQHtlkFssNsjOelXQ==
X-Received: by 2002:a05:6402:e99:b0:41d:11f2:85e0 with SMTP id
 h25-20020a0564020e9900b0041d11f285e0mr40790872eda.339.1651241895879; 
 Fri, 29 Apr 2022 07:18:15 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/12] tests/tcg: merge configure.sh back into main
 configure script
Date: Fri, 29 Apr 2022 16:18:02 +0200
Message-Id: <20220429141813.328975-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/tcg/configure.sh has a complicated story.

In the beginning its code ran as part of the creation of config-target.mak
files, and that is where it placed the information on the target compiler.
However, probing for the buildability of TCG tests required multiple
inclusions of config-target.mak in the _main_ Makefile (not in
Makefile.target, which took care of building the QEMU executables in
the pre-Meson era), which polluted the namespace.

Thus, it was moved to a separate directory.  It created small config-*.mak
files in $(BUILD_DIR)/tests/tcg.  Those were also included multiple
times, but at least they were small and manageable; this was also an
important step in disentangling the TCG tests from Makefile.target.

Since then, Meson has allowed the configure script to go on a diet.
A few compilation tests survive (mostly for sanitizers) but these days
it mostly takes care of command line parsing, looking for tools, and
setting up the environment for Meson to do its stuff.

It's time to extend configure with the capability to build for more
than just one target: not just tests, but also firmware.  As a first
step, integrate all the logic to find cross compilers in the configure
script, and move tests/tcg/configure.sh back there (though as a
separate loop, not integrated in the one that generates target
configurations for Meson).

tests/tcg is actually very close to being buildable as a standalone
project, so I actually expect the compiler tests to move back to
tests/tcg, as a "configure" script of sorts which would run at Make
time after the docker images are built.  The GCC tree has a similar idea
of doing only bare-bones tree-wide configuration and leaving the rest
for Make time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 398 +++++++++++++++++++++++++++++++++++++++--
 tests/Makefile.include |   1 -
 tests/tcg/configure.sh | 376 --------------------------------------
 3 files changed, 388 insertions(+), 387 deletions(-)
 delete mode 100755 tests/tcg/configure.sh

diff --git a/configure b/configure
index e77b29b093..5d136492f8 100755
--- a/configure
+++ b/configure
@@ -109,6 +109,20 @@ error_exit() {
 }
 
 do_compiler() {
+  # Run the compiler, capturing its output to the log. First argument
+  # is compiler binary to execute.
+  local compiler="$1"
+  shift
+  if test -n "$BASH_VERSION"; then eval '
+      echo >>config.log "
+funcs: ${FUNCNAME[*]}
+lines: ${BASH_LINENO[*]}"
+  '; fi
+  echo $compiler "$@" >> config.log
+  $compiler "$@" >> config.log 2>&1 || return $?
+}
+
+do_compiler_werror() {
     # Run the compiler, capturing its output to the log. First argument
     # is compiler binary to execute.
     compiler="$1"
@@ -142,15 +156,15 @@ lines: ${BASH_LINENO[*]}"
 }
 
 do_cc() {
-    do_compiler "$cc" $CPU_CFLAGS "$@"
+    do_compiler_werror "$cc" $CPU_CFLAGS "$@"
 }
 
 do_cxx() {
-    do_compiler "$cxx" $CPU_CFLAGS "$@"
+    do_compiler_werror "$cxx" $CPU_CFLAGS "$@"
 }
 
 do_objc() {
-    do_compiler "$objcc" $CPU_CFLAGS "$@"
+    do_compiler_werror "$objcc" $CPU_CFLAGS "$@"
 }
 
 # Append $2 to the variable named $1, with space separation
@@ -347,11 +361,9 @@ for opt do
   ;;
   --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
                       eval "cross_cc_cflags_${cc_arch}=\$optarg"
-                      cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
   ;;
   --cross-cc-*) cc_arch=${opt#--cross-cc-}; cc_arch=${cc_arch%%=*}
                 eval "cross_cc_${cc_arch}=\$optarg"
-                cross_cc_vars="$cross_cc_vars cross_cc_${cc_arch}"
   ;;
   esac
 done
@@ -955,7 +967,6 @@ esac
 
 if eval test -z "\${cross_cc_$cpu}"; then
     eval "cross_cc_${cpu}=\$cc"
-    cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 fi
 
 default_target_list=""
@@ -1818,6 +1829,248 @@ case "$slirp" in
     ;;
 esac
 
+##########################################
+# functions to probe cross compilers
+
+container="no"
+if test $use_containers = "yes"; then
+    if has "docker" || has "podman"; then
+        container=$($python $source_path/tests/docker/docker.py probe)
+    fi
+fi
+
+# cross compilers defaults, can be overridden with --cross-cc-ARCH
+: ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
+: ${cross_cc_aarch64_be="$cross_cc_aarch64"}
+: ${cross_cc_cflags_aarch64_be="-mbig-endian"}
+: ${cross_cc_alpha="alpha-linux-gnu-gcc"}
+: ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
+: ${cross_cc_cflags_armeb="-mbig-endian"}
+: ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
+: ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
+: ${cross_cc_hppa="hppa-linux-gnu-gcc"}
+: ${cross_cc_i386="i686-linux-gnu-gcc"}
+: ${cross_cc_cflags_i386="-m32"}
+: ${cross_cc_m68k="m68k-linux-gnu-gcc"}
+: ${cross_cc_microblaze="microblaze-linux-musl-gcc"}
+: ${cross_cc_mips64el="mips64el-linux-gnuabi64-gcc"}
+: ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
+: ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
+: ${cross_cc_mips="mips-linux-gnu-gcc"}
+: ${cross_cc_nios2="nios2-linux-gnu-gcc"}
+: ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
+: ${cross_cc_cflags_ppc="-m32"}
+: ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
+: ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
+: ${cross_cc_ppc64le="$cross_cc_ppc64"}
+: ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
+: ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
+: ${cross_cc_s390x="s390x-linux-gnu-gcc"}
+: ${cross_cc_sh4="sh4-linux-gnu-gcc"}
+: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
+: ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
+: ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
+: ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
+: ${cross_cc_cflags_x86_64="-m64"}
+
+# tricore is special as it doesn't have a compiler
+: ${cross_as_tricore="tricore-as"}
+: ${cross_ld_tricore="tricore-ld"}
+
+probe_target_compiler() {
+  # reset all output variables
+  container_image=
+  container_hosts=
+  container_cross_cc=
+  container_cross_as=
+  container_cross_ld=
+  target_cc=
+  target_as=
+  target_ld=
+
+  case $1 in
+    aarch64) container_hosts="x86_64 aarch64" ;;
+    alpha) container_hosts=x86_64 ;;
+    arm) container_hosts="x86_64 aarch64" ;;
+    cris) container_hosts=x86_64 ;;
+    hexagon) container_hosts=x86_64 ;;
+    hppa) container_hosts=x86_64 ;;
+    i386) container_hosts=x86_64 ;;
+    m68k) container_hosts=x86_64 ;;
+    microblaze) container_hosts=x86_64 ;;
+    mips64el) container_hosts=x86_64 ;;
+    mips64) container_hosts=x86_64 ;;
+    mipsel) container_hosts=x86_64 ;;
+    mips) container_hosts=x86_64 ;;
+    nios2) container_hosts=x86_64 ;;
+    ppc) container_hosts=x86_64 ;;
+    ppc64|ppc64le) container_hosts=x86_64 ;;
+    riscv64) container_hosts=x86_64 ;;
+    s390x) container_hosts=x86_64 ;;
+    sh4) container_hosts=x86_64 ;;
+    sparc64) container_hosts=x86_64 ;;
+    tricore) container_hosts=x86_64 ;;
+    x86_64) container_hosts="aarch64 ppc64el x86_64" ;;
+    xtensa*) container_hosts=x86_64 ;;
+  esac
+
+  for host in $container_hosts; do
+    test "$container" != no || continue
+    test "$host" = "$cpu" || continue
+    case $1 in
+      aarch64)
+        # We don't have any bigendian build tools so we only use this for AArch64
+        container_image=debian-arm64-cross
+        container_cross_cc=aarch64-linux-gnu-gcc-10
+        ;;
+      alpha)
+        container_image=debian-alpha-cross
+        container_cross_cc=alpha-linux-gnu-gcc
+        ;;
+      arm)
+        # We don't have any bigendian build tools so we only use this for ARM
+        container_image=debian-armhf-cross
+        container_cross_cc=arm-linux-gnueabihf-gcc
+        ;;
+      cris)
+        container_image=fedora-cris-cross
+        container_cross_cc=cris-linux-gnu-gcc
+        ;;
+      hexagon)
+        container_image=debian-hexagon-cross
+        container_cross_cc=hexagon-unknown-linux-musl-clang
+        ;;
+      hppa)
+        container_image=debian-hppa-cross
+        container_cross_cc=hppa-linux-gnu-gcc
+        ;;
+      i386)
+        container_image=fedora-i386-cross
+        container_cross_cc=gcc
+        ;;
+      m68k)
+        container_image=debian-m68k-cross
+        container_cross_cc=m68k-linux-gnu-gcc
+        ;;
+      microblaze)
+        container_image=debian-microblaze-cross
+        container_cross_cc=microblaze-linux-musl-gcc
+        ;;
+      mips64el)
+        container_image=debian-mips64el-cross
+        container_cross_cc=mips64el-linux-gnuabi64-gcc
+        ;;
+      mips64)
+        container_image=debian-mips64-cross
+        container_cross_cc=mips64-linux-gnuabi64-gcc
+        ;;
+      mipsel)
+        container_image=debian-mipsel-cross
+        container_cross_cc=mipsel-linux-gnu-gcc
+        ;;
+      mips)
+        container_image=debian-mips-cross
+        container_cross_cc=mips-linux-gnu-gcc
+        ;;
+      nios2)
+        container_image=debian-nios2-cross
+        container_cross_cc=nios2-linux-gnu-gcc
+        ;;
+      ppc)
+        container_image=debian-powerpc-test-cross
+        container_cross_cc=powerpc-linux-gnu-gcc-10
+        ;;
+      ppc64|ppc64le)
+        container_image=debian-powerpc-test-cross
+        container_cross_cc=powerpc${1#ppc}-linux-gnu-gcc-10
+        ;;
+      riscv64)
+        container_image=debian-riscv64-test-cross
+        container_cross_cc=riscv64-linux-gnu-gcc
+        ;;
+      s390x)
+        container_image=debian-s390x-cross
+        container_cross_cc=s390x-linux-gnu-gcc
+        ;;
+      sh4)
+        container_image=debian-sh4-cross
+        container_cross_cc=sh4-linux-gnu-gcc
+        ;;
+      sparc64)
+        container_image=debian-sparc64-cross
+        container_cross_cc=sparc64-linux-gnu-gcc
+        ;;
+      tricore)
+        container_image=debian-tricore-cross
+        container_cross_as=tricore-as
+        container_cross_ld=tricore-ld
+        ;;
+      x86_64)
+        container_image=debian-amd64-cross
+        container_cross_cc=x86_64-linux-gnu-gcc
+        ;;
+      xtensa*)
+        # FIXME: xtensa-linux-user?
+        container_hosts=x86_64
+        container_image=debian-xtensa-cross
+
+        # default to the dc232b cpu
+        container_cross_cc=/opt/2020.07/xtensa-dc232b-elf/bin/xtensa-dc232b-elf-gcc
+        ;;
+    esac
+  done
+
+  eval "target_cflags=\${cross_cc_cflags_$1}"
+  if eval test -n "\"\${cross_cc_$1}\""; then
+    if eval has "\"\${cross_cc_$1}\""; then
+      eval "target_cc=\"\${cross_cc_$1}\""
+      case $1 in
+        i386|x86_64)
+          if $target_cc --version | grep -qi "clang"; then
+            unset target_cc
+          fi
+          ;;
+      esac
+    fi
+  fi
+  if eval test -n "\"\${cross_as_$1}\""; then
+    if eval has "\"\${cross_as_$1}\""; then
+      eval "target_as=\"\${cross_as_$1}\""
+    fi
+  fi
+  if eval test -n "\"\${cross_ld_$1}\""; then
+    if eval has "\"\${cross_ld_$1}\""; then
+      eval "target_ld=\"\${cross_ld_$1}\""
+    fi
+  fi
+}
+
+write_target_makefile() {
+  if test -n "$target_cc"; then
+    echo "CC=$target_cc"
+  fi
+  if test -n "$target_as"; then
+    echo "AS=$target_as"
+  fi
+  if test -n "$target_ld"; then
+    echo "LD=$target_ld"
+  fi
+}
+
+write_container_target_makefile() {
+  if test -n "$container_cross_cc"; then
+    echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+  fi
+  if test -n "$container_cross_as"; then
+    echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
+  fi
+  if test -n "$container_cross_ld"; then
+    echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+  fi
+}
+
+
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2145,11 +2398,136 @@ for f in $LINKS ; do
     fi
 done
 
-(for i in $cross_cc_vars; do
-  export $i
+# tests/tcg configuration
+(makefile=tests/tcg/Makefile.prereqs
+echo "# Automatically generated by configure - do not modify" > $makefile
+
+config_host_mak=tests/tcg/config-host.mak
+echo "# Automatically generated by configure - do not modify" > $config_host_mak
+echo "SRC_PATH=$source_path" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
+
+tcg_tests_targets=
+for target in $target_list; do
+  arch=${target%%-*}
+
+  probe_target_compiler ${arch}
+  config_target_mak=tests/tcg/config-$target.mak
+
+  echo "# Automatically generated by configure - do not modify" > $config_target_mak
+  echo "TARGET_NAME=$arch" >> $config_target_mak
+  case $target in
+    *-softmmu)
+      test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
+      qemu="qemu-system-$arch"
+      ;;
+    *-linux-user|*-bsd-user)
+      qemu="qemu-$arch"
+      ;;
+  esac
+
+  got_cross_cc=no
+  unset build_static
+
+  if test -n "$target_cc"; then
+      write_c_skeleton
+      if ! do_compiler "$target_cc" $target_cflags \
+           -o $TMPE $TMPC -static ; then
+          # For host systems we might get away with building without -static
+          if do_compiler "$target_cc" $target_cflags \
+                         -o $TMPE $TMPC ; then
+              got_cross_cc=yes
+          fi
+      else
+          got_cross_cc=yes
+          build_static=y
+      fi
+  elif test -n "$target_as" && test -n "$target_ld"; then
+      # Special handling for assembler only tests
+      case $target in
+          tricore-softmmu) got_cross_cc=yes ;;
+      esac
+  fi
+
+  if test $got_cross_cc = yes; then
+      # Test for compiler features for optional tests. We only do this
+      # for cross compilers because ensuring the docker containers based
+      # compilers is a requirememt for adding a new test that needs a
+      # compiler feature.
+
+      echo "BUILD_STATIC=$build_static" >> $config_target_mak
+      write_target_makefile >> $config_target_mak
+      case $target in
+          aarch64-*)
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.1-a+sve -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.3-a -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -mbranch-protection=standard -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -march=armv8.5-a+memtag -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+              fi
+              ;;
+          ppc*)
+              if do_compiler "$target_cc" $target_cflags \
+                             -mpower8-vector -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+              fi
+              if do_compiler "$target_cc" $target_cflags \
+                             -mpower10 -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+              fi
+              ;;
+          i386-linux-user)
+              if do_compiler "$target_cc" $target_cflags \
+                             -Werror -fno-pie -o $TMPE $TMPC; then
+                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+              fi
+              ;;
+      esac
+  elif test -n "$container_image"; then
+      echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
+      echo "BUILD_STATIC=y" >> $config_target_mak
+      write_container_target_makefile >> $config_target_mak
+      case $target in
+          aarch64-*)
+              echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+              ;;
+          ppc*)
+              echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+              echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+              ;;
+          i386-linux-user)
+              echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+              ;;
+      esac
+      got_cross_cc=yes
+  fi
+  if test $got_cross_cc = yes; then
+      mkdir -p tests/tcg/$target
+      echo "QEMU=$PWD/$qemu" >> $config_target_mak
+      echo "EXTRA_CFLAGS=$target_cflags" >> $config_target_mak
+      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+      tcg_tests_targets="$tcg_tests_targets $target"
+  fi
 done
-export target_list source_path use_containers cpu host_cc
-$source_path/tests/tcg/configure.sh)
+echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile)
 
 config_mak=pc-bios/optionrom/config.mak
 echo "# Automatically generated by configure - do not modify" > $config_mak
diff --git a/tests/Makefile.include b/tests/Makefile.include
index ec84b2ebc0..bef96a775c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -37,7 +37,6 @@ export SRC_PATH
 SPEED = quick
 
 -include tests/tcg/Makefile.prereqs
-config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
 tests/tcg/Makefile.prereqs: config-host.mak
 
 # Per guest TCG tests
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
deleted file mode 100755
index 691d90abac..0000000000
--- a/tests/tcg/configure.sh
+++ /dev/null
@@ -1,376 +0,0 @@
-#! /bin/sh
-
-if test -z "$source_path"; then
-  echo Do not invoke this script directly.  It is called
-  echo automatically by configure.
-  exit 1
-fi
-
-write_c_skeleton() {
-    cat > $TMPC <<EOF
-int main(void) { return 0; }
-EOF
-}
-
-has() {
-  command -v "$1" >/dev/null 2>&1
-}
-
-do_compiler() {
-  # Run the compiler, capturing its output to the log. First argument
-  # is compiler binary to execute.
-  local compiler="$1"
-  shift
-  if test -n "$BASH_VERSION"; then eval '
-      echo >>config.log "
-funcs: ${FUNCNAME[*]}
-lines: ${BASH_LINENO[*]}"
-  '; fi
-  echo $compiler "$@" >> config.log
-  $compiler "$@" >> config.log 2>&1 || return $?
-}
-
-
-TMPDIR1="config-temp"
-TMPC="${TMPDIR1}/qemu-conf.c"
-TMPE="${TMPDIR1}/qemu-conf.exe"
-
-container="no"
-if test $use_containers = "yes"; then
-    if has "docker" || has "podman"; then
-        container=$($python $source_path/tests/docker/docker.py probe)
-    fi
-fi
-
-# cross compilers defaults, can be overridden with --cross-cc-ARCH
-: ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
-: ${cross_cc_aarch64_be="$cross_cc_aarch64"}
-: ${cross_cc_cflags_aarch64_be="-mbig-endian"}
-: ${cross_cc_alpha="alpha-linux-gnu-gcc"}
-: ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
-: ${cross_cc_cflags_armeb="-mbig-endian"}
-: ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
-: ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
-: ${cross_cc_hppa="hppa-linux-gnu-gcc"}
-: ${cross_cc_i386="i686-linux-gnu-gcc"}
-: ${cross_cc_cflags_i386="-m32"}
-: ${cross_cc_m68k="m68k-linux-gnu-gcc"}
-: ${cross_cc_microblaze="microblaze-linux-musl-gcc"}
-: ${cross_cc_mips64el="mips64el-linux-gnuabi64-gcc"}
-: ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
-: ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
-: ${cross_cc_mips="mips-linux-gnu-gcc"}
-: ${cross_cc_nios2="nios2-linux-gnu-gcc"}
-: ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
-: ${cross_cc_cflags_ppc="-m32"}
-: ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
-: ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
-: ${cross_cc_ppc64le="$cross_cc_ppc64"}
-: ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
-: ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
-: ${cross_cc_s390x="s390x-linux-gnu-gcc"}
-: ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
-: ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
-: ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
-: ${cross_cc_cflags_x86_64="-m64"}
-
-# tricore is special as it doesn't have a compiler
-: ${cross_as_tricore="tricore-as"}
-: ${cross_ld_tricore="tricore-ld"}
-
-makefile=tests/tcg/Makefile.prereqs
-echo "# Automatically generated by configure - do not modify" > $makefile
-
-config_host_mak=tests/tcg/config-host.mak
-echo "# Automatically generated by configure - do not modify" > $config_host_mak
-echo "SRC_PATH=$source_path" >> $config_host_mak
-echo "HOST_CC=$host_cc" >> $config_host_mak
-
-tcg_tests_targets=
-for target in $target_list; do
-  arch=${target%%-*}
-
-  # reset all container fields
-  container_image=
-  container_hosts=
-  container_cross_cc=
-  container_cross_as=
-  container_cross_ld=
-
-  # suppress clang
-  supress_clang=
-
-  case $target in
-    aarch64-*)
-      # We don't have any bigendian build tools so we only use this for AArch64
-      container_hosts="x86_64 aarch64"
-      container_image=debian-arm64-cross
-      container_cross_cc=aarch64-linux-gnu-gcc-10
-      ;;
-    alpha-*)
-      container_hosts=x86_64
-      container_image=debian-alpha-cross
-      container_cross_cc=alpha-linux-gnu-gcc
-      ;;
-    arm-*)
-      # We don't have any bigendian build tools so we only use this for ARM
-      container_hosts="x86_64 aarch64"
-      container_image=debian-armhf-cross
-      container_cross_cc=arm-linux-gnueabihf-gcc
-      ;;
-    cris-*)
-      container_hosts=x86_64
-      container_image=fedora-cris-cross
-      container_cross_cc=cris-linux-gnu-gcc
-      ;;
-    hexagon-*)
-      container_hosts=x86_64
-      container_image=debian-hexagon-cross
-      container_cross_cc=hexagon-unknown-linux-musl-clang
-      ;;
-    hppa-*)
-      container_hosts=x86_64
-      container_image=debian-hppa-cross
-      container_cross_cc=hppa-linux-gnu-gcc
-      ;;
-    i386-*)
-      container_hosts=x86_64
-      container_image=fedora-i386-cross
-      container_cross_cc=gcc
-      supress_clang=yes
-      ;;
-    m68k-*)
-      container_hosts=x86_64
-      container_image=debian-m68k-cross
-      container_cross_cc=m68k-linux-gnu-gcc
-      ;;
-    microblaze-*)
-      container_hosts=x86_64
-      container_image=debian-microblaze-cross
-      container_cross_cc=microblaze-linux-musl-gcc
-      ;;
-    mips64el-*)
-      container_hosts=x86_64
-      container_image=debian-mips64el-cross
-      container_cross_cc=mips64el-linux-gnuabi64-gcc
-      ;;
-    mips64-*)
-      container_hosts=x86_64
-      container_image=debian-mips64-cross
-      container_cross_cc=mips64-linux-gnuabi64-gcc
-      ;;
-    mipsel-*)
-      container_hosts=x86_64
-      container_image=debian-mipsel-cross
-      container_cross_cc=mipsel-linux-gnu-gcc
-      ;;
-    mips-*)
-      container_hosts=x86_64
-      container_image=debian-mips-cross
-      container_cross_cc=mips-linux-gnu-gcc
-      ;;
-    nios2-*)
-      container_hosts=x86_64
-      container_image=debian-nios2-cross
-      container_cross_cc=nios2-linux-gnu-gcc
-      ;;
-    ppc-*)
-      container_hosts=x86_64
-      container_image=debian-powerpc-test-cross
-      container_cross_cc=powerpc-linux-gnu-gcc-10
-      ;;
-    ppc64-*|ppc64le-*)
-      container_hosts=x86_64
-      container_image=debian-powerpc-test-cross
-      container_cross_cc=${target%%-*}-linux-gnu-gcc-10
-      container_cross_cc=powerpc${container_cross_cc#ppc}
-      ;;
-    riscv64-*)
-      container_hosts=x86_64
-      container_image=debian-riscv64-test-cross
-      container_cross_cc=riscv64-linux-gnu-gcc
-      ;;
-    s390x-*)
-      container_hosts=x86_64
-      container_image=debian-s390x-cross
-      container_cross_cc=s390x-linux-gnu-gcc
-      ;;
-    sh4-*)
-      container_hosts=x86_64
-      container_image=debian-sh4-cross
-      container_cross_cc=sh4-linux-gnu-gcc
-      ;;
-    sparc64-*)
-      container_hosts=x86_64
-      container_image=debian-sparc64-cross
-      container_cross_cc=sparc64-linux-gnu-gcc
-      ;;
-    tricore-softmmu)
-      container_hosts=x86_64
-      container_image=debian-tricore-cross
-      container_cross_as=tricore-as
-      container_cross_ld=tricore-ld
-      ;;
-    x86_64-*)
-      container_hosts="aarch64 ppc64el x86_64"
-      container_image=debian-amd64-cross
-      container_cross_cc=x86_64-linux-gnu-gcc
-      supress_clang=yes
-      ;;
-    xtensa*-softmmu)
-      container_hosts=x86_64
-      container_image=debian-xtensa-cross
-
-      # default to the dc232b cpu
-      container_cross_cc=/opt/2020.07/xtensa-dc232b-elf/bin/xtensa-dc232b-elf-gcc
-      ;;
-  esac
-
-  config_target_mak=tests/tcg/config-$target.mak
-
-  echo "# Automatically generated by configure - do not modify" > $config_target_mak
-  echo "TARGET_NAME=$arch" >> $config_target_mak
-  case $target in
-    *-softmmu)
-      test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
-      qemu="qemu-system-$arch"
-      ;;
-    *-linux-user|*-bsd-user)
-      qemu="qemu-$arch"
-      ;;
-  esac
-
-  eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
-
-  got_cross_cc=no
-
-  if eval test "x\"\${cross_cc_$arch}\"" != xyes; then
-      eval "target_compiler=\"\${cross_cc_$arch}\""
-
-      if has $target_compiler; then
-          if test "$supress_clang" = yes &&
-                  $target_compiler --version | grep -qi "clang"; then
-              got_cross_cc=no
-          else
-              write_c_skeleton
-              if ! do_compiler "$target_compiler" $target_compiler_cflags \
-                   -o $TMPE $TMPC -static ; then
-                  # For host systems we might get away with building without -static
-                  if do_compiler "$target_compiler" $target_compiler_cflags \
-                                 -o $TMPE $TMPC ; then
-                      got_cross_cc=yes
-                      echo "CC=$target_compiler" >> $config_target_mak
-                  fi
-              else
-                  got_cross_cc=yes
-                  echo "BUILD_STATIC=y" >> $config_target_mak
-                  echo "CC=$target_compiler" >> $config_target_mak
-              fi
-          fi
-      fi
-
-      # Special handling for assembler only tests
-      eval "target_as=\"\${cross_as_$arch}\""
-      eval "target_ld=\"\${cross_ld_$arch}\""
-      if has $target_as && has $target_ld; then
-          case $target in
-              tricore-softmmu)
-                  echo "AS=$target_as" >> $config_target_mak
-                  echo "LD=$target_ld" >> $config_target_mak
-                  got_cross_cc=yes
-                  ;;
-          esac
-      fi
-  fi
-
-  if test $got_cross_cc = yes; then
-      # Test for compiler features for optional tests. We only do this
-      # for cross compilers because ensuring the docker containers based
-      # compilers is a requirememt for adding a new test that needs a
-      # compiler feature.
-
-      case $target in
-          aarch64-*)
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -march=armv8.1-a+sve -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -march=armv8.3-a -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -mbranch-protection=standard -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -march=armv8.5-a+memtag -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
-              fi
-              ;;
-          ppc*)
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -mpower8-vector -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -mpower10 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
-              fi
-              ;;
-          i386-linux-user)
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                             -Werror -fno-pie -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
-              fi
-              ;;
-      esac
-  elif test $got_cross_cc = no && test "$container" != no && \
-          test -n "$container_image"; then
-      for host in $container_hosts; do
-          if test "$host" = "$cpu"; then
-              echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-              echo "BUILD_STATIC=y" >> $config_target_mak
-              echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --" >> $config_target_mak
-              if test -n "$container_cross_as"; then
-                  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --" >> $config_target_mak
-              fi
-              if test -n "$container_cross_ld"; then
-                  echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --" >> $config_target_mak
-              fi
-              case $target in
-                  aarch64-*)
-                      echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
-                      echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
-                      echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-                      echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
-                      echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
-                      ;;
-                  ppc*)
-                      echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
-                      echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
-                      ;;
-                  i386-linux-user)
-                      echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
-                      ;;
-              esac
-              got_cross_cc=yes
-              break
-          fi
-      done
-  fi
-  if test $got_cross_cc = yes; then
-      mkdir -p tests/tcg/$target
-      echo "QEMU=$PWD/$qemu" >> $config_target_mak
-      echo "EXTRA_CFLAGS=$target_compiler_cflags" >> $config_target_mak
-      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
-      tcg_tests_targets="$tcg_tests_targets $target"
-  fi
-done
-echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile
-- 
2.35.1



