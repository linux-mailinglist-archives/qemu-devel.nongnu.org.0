Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE68E5365FC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:29:52 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucqV-0002c1-TP
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nucI5-0004ud-4h
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nucI0-0005iq-IK
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id t6so6411766wra.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42CbITctj1B+teYMnbPPYmJAst7mS1Ngwe91YF9E5Z0=;
 b=Q+R07wf/Ops4IW6azNg39jHCibXruCh2O4pirAeCnENoPEkgMUthFkVR6kMNz+fcB4
 WL8k2chncunb/9rIZ1+CAwNBRW3V0liOMb4KJIGmV06rd9JrznRbrtt81ZKBSBB+8sVY
 ST11AaVxynz4fE1gMZYuXYfBrxJKTtifo5lRWeyOdoJGuqTS6kdoCgVHL6fnSauIYqvg
 BMhJ9Jnj3BmjzwIQY7r/XO2TCb9skRIuc0O/WLUIKy6k/Nt41AePNgy/aJF7D6L9dXzr
 5p8JXPylhqr1Qm/tkW1jZnNtOh00XE3vUg+j/Rs74CeW8KUCkXatxjdA5JhKog6cCgGe
 cxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42CbITctj1B+teYMnbPPYmJAst7mS1Ngwe91YF9E5Z0=;
 b=Xv3hnBxmh2AfwiYwPaHRGmY3EebLUjbkgwymKJnxSqQmx7GvN3hwIMJ1cvShbvNt9J
 6pbzmsKQZxqFWRObBeeUJAmqB2ePJTk4fo8AxNf/XDpIRrMJzkZ3v4FMQcvY2kSLYtX1
 jMO9I7mSLApUnlUBhx54NVKbr0qQCLm5vMNFpTKTcuZe4xjpPkYcJqVzHqteLK6tbXKB
 d8jkeF03ZSyr9r2jaH8SVEruMAoo9ZxmUhoeQXjZbIgAVa4zS4k2rEtHgTqyc2j/L931
 JPAV8fp0sGNeRonGKfMEIGuoxBlEZnpE5GoVMeW+ah6zouCmXru/nYZPS5bIe741xd7v
 DkUg==
X-Gm-Message-State: AOAM5327uEnmKmS5jlU/LgFJU5m7n1Msz6fW9kPID8x7Z39y34dMP5rN
 twMsSqEruCt7i4PfCMAZJC72Pg==
X-Google-Smtp-Source: ABdhPJxCPx1L+DSfUqAI2MlKxYYKZIBL+mVym5yEt/RlAk5y+66hMKazx6Ul2YTfrmN6WaOYKVsYxw==
X-Received: by 2002:adf:dc92:0:b0:20f:e1a9:9d92 with SMTP id
 r18-20020adfdc92000000b0020fe1a99d92mr20059205wrj.199.1653666841454; 
 Fri, 27 May 2022 08:54:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a1ca305000000b003942a244f3asm2530665wme.19.2022.05.27.08.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:53:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2EB71FFCD;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 21/33] configure: introduce --cross-prefix-*=
Date: Fri, 27 May 2022 16:35:51 +0100
Message-Id: <20220527153603.887929-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Also in preparation for handling more binaries from the cross binutils,
support an option --cross-prefix-ARCH.  All cross_cc_* defaults are
replaced with cross_prefix_*; the cross_cc_* fallbacks are extended
to the cross-compilation prefix, but the compiler fallbacks remain
as well.  This way, for example, --cross-cc-arm=arm-linux-gnueabihf-clang
also applies to armeb binaries.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-11-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 137 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 77 insertions(+), 60 deletions(-)

diff --git a/configure b/configure
index addbb0fe44..c2b16c17b9 100755
--- a/configure
+++ b/configure
@@ -363,6 +363,11 @@ for opt do
   --cross-cc-*) cc_arch=${opt#--cross-cc-}; cc_arch=${cc_arch%%=*}
                 eval "cross_cc_${cc_arch}=\$optarg"
   ;;
+  --cross-prefix-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-prefix-FOO option"
+  ;;
+  --cross-prefix-*) cc_arch=${opt#--cross-prefix-}; cc_arch=${cc_arch%%=*}
+                    eval "cross_prefix_${cc_arch}=\$optarg"
+  ;;
   esac
 done
 # OS specific
@@ -728,6 +733,8 @@ for opt do
   ;;
   --cross-cc-*)
   ;;
+  --cross-prefix-*)
+  ;;
   --enable-debug-info) meson_option_add -Ddebug=true
   ;;
   --disable-debug-info) meson_option_add -Ddebug=false
@@ -1016,6 +1023,7 @@ Advanced options (experts only):
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
+  --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
   --meson=MESON            use specified meson [$meson]
@@ -1813,44 +1821,54 @@ if test $use_containers = "yes"; then
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
-: ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
+: ${cross_prefix_aarch64="aarch64-linux-gnu-"}
+: ${cross_prefix_aarch64_be="$cross_prefix_aarch64"}
+: ${cross_prefix_alpha="alpha-linux-gnu-"}
+: ${cross_prefix_arm="arm-linux-gnueabihf-"}
+: ${cross_prefix_armeb="$cross_prefix_arm"}
+: ${cross_prefix_hexagon="hexagon-unknown-linux-musl-"}
+: ${cross_prefix_hppa="hppa-linux-gnu-"}
+: ${cross_prefix_i386="i686-linux-gnu-"}
+: ${cross_prefix_m68k="m68k-linux-gnu-"}
+: ${cross_prefix_microblaze="microblaze-linux-musl-"}
+: ${cross_prefix_mips64el="mips64el-linux-gnuabi64-"}
+: ${cross_prefix_mips64="mips64-linux-gnuabi64-"}
+: ${cross_prefix_mipsel="mipsel-linux-gnu-"}
+: ${cross_prefix_mips="mips-linux-gnu-"}
+: ${cross_prefix_nios2="nios2-linux-gnu-"}
+: ${cross_prefix_ppc="powerpc-linux-gnu-"}
+: ${cross_prefix_ppc64="powerpc64-linux-gnu-"}
+: ${cross_prefix_ppc64le="$cross_prefix_ppc64"}
+: ${cross_prefix_riscv64="riscv64-linux-gnu-"}
+: ${cross_prefix_s390x="s390x-linux-gnu-"}
+: ${cross_prefix_sh4="sh4-linux-gnu-"}
+: ${cross_prefix_sparc64="sparc64-linux-gnu-"}
+: ${cross_prefix_sparc="$cross_prefix_sparc64"}
+: ${cross_prefix_x86_64="x86_64-linux-gnu-"}
+
 : ${cross_cc_aarch64_be="$cross_cc_aarch64"}
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
-: ${cross_cc_alpha="alpha-linux-gnu-gcc"}
-: ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
 : ${cross_cc_armeb="$cross_cc_arm"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
-: ${cross_cc_hppa="hppa-linux-gnu-gcc"}
-: ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
-: ${cross_cc_m68k="m68k-linux-gnu-gcc"}
-: ${cross_cc_microblaze="microblaze-linux-musl-gcc"}
-: ${cross_cc_mips64el="mips64el-linux-gnuabi64-gcc"}
-: ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
-: ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
-: ${cross_cc_mips="mips-linux-gnu-gcc"}
-: ${cross_cc_nios2="nios2-linux-gnu-gcc"}
-: ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
-: ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
 : ${cross_cc_ppc64le="$cross_cc_ppc64"}
 : ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
-: ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
-: ${cross_cc_s390x="s390x-linux-gnu-gcc"}
-: ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
 : ${cross_cc_sparc="$cross_cc_sparc64"}
 : ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
-: ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
-# tricore is special as it doesn't have a compiler
-: ${cross_as_tricore="tricore-as"}
-: ${cross_ld_tricore="tricore-ld"}
+compute_target_variable() {
+  if eval test -n "\"\${cross_prefix_$1}\""; then
+    if eval has "\"\${cross_prefix_$1}\$3\""; then
+      eval "$2=\"\${cross_prefix_$1}\$3\""
+    fi
+  fi
+}
 
 probe_target_compiler() {
   # reset all output variables
@@ -1896,93 +1914,99 @@ probe_target_compiler() {
       aarch64)
         # We don't have any bigendian build tools so we only use this for AArch64
         container_image=debian-arm64-cross
-        container_cross_cc=aarch64-linux-gnu-gcc-10
+        container_cross_prefix=aarch64-linux-gnu-
+        container_cross_cc=${container_cross_prefix}gcc-10
         ;;
       alpha)
         container_image=debian-alpha-cross
-        container_cross_cc=alpha-linux-gnu-gcc
+        container_cross_prefix=alpha-linux-gnu-
         ;;
       arm)
         # We don't have any bigendian build tools so we only use this for ARM
         container_image=debian-armhf-cross
-        container_cross_cc=arm-linux-gnueabihf-gcc
+        container_cross_prefix=arm-linux-gnueabihf-
         ;;
       cris)
         container_image=fedora-cris-cross
-        container_cross_cc=cris-linux-gnu-gcc
+        container_cross_prefix=cris-linux-gnu-
         ;;
       hexagon)
         container_image=debian-hexagon-cross
-        container_cross_cc=hexagon-unknown-linux-musl-clang
+        container_cross_prefix=hexagon-unknown-linux-musl-
+        container_cross_cc=${container_cross_prefix}clang
         ;;
       hppa)
         container_image=debian-hppa-cross
-        container_cross_cc=hppa-linux-gnu-gcc
+        container_cross_prefix=hppa-linux-gnu-
         ;;
       i386)
         container_image=fedora-i386-cross
-        container_cross_cc=gcc
+        container_cross_prefix=
         ;;
       m68k)
         container_image=debian-m68k-cross
-        container_cross_cc=m68k-linux-gnu-gcc
+        container_cross_prefix=m68k-linux-gnu-
         ;;
       microblaze)
         container_image=debian-microblaze-cross
-        container_cross_cc=microblaze-linux-musl-gcc
+        container_cross_prefix=microblaze-linux-musl-
         ;;
       mips64el)
         container_image=debian-mips64el-cross
-        container_cross_cc=mips64el-linux-gnuabi64-gcc
+        container_cross_prefix=mips64el-linux-gnuabi64-
         ;;
       mips64)
         container_image=debian-mips64-cross
-        container_cross_cc=mips64-linux-gnuabi64-gcc
+        container_cross_prefix=mips64-linux-gnuabi64-
         ;;
       mipsel)
         container_image=debian-mipsel-cross
-        container_cross_cc=mipsel-linux-gnu-gcc
+        container_cross_prefix=mipsel-linux-gnu-
         ;;
       mips)
         container_image=debian-mips-cross
-        container_cross_cc=mips-linux-gnu-gcc
+        container_cross_prefix=mips-linux-gnu-
         ;;
       nios2)
         container_image=debian-nios2-cross
-        container_cross_cc=nios2-linux-gnu-gcc
+        container_cross_prefix=nios2-linux-gnu-
         ;;
       ppc)
         container_image=debian-powerpc-test-cross
-        container_cross_cc=powerpc-linux-gnu-gcc-10
+        container_cross_prefix=powerpc-linux-gnu-
+        container_cross_cc=${container_cross_prefix}gcc-10
         ;;
       ppc64|ppc64le)
         container_image=debian-powerpc-test-cross
-        container_cross_cc=powerpc${1#ppc}-linux-gnu-gcc-10
+        container_cross_prefix=powerpc${1#ppc}-linux-gnu-
+        container_cross_cc=${container_cross_prefix}gcc-10
         ;;
       riscv64)
         container_image=debian-riscv64-test-cross
-        container_cross_cc=riscv64-linux-gnu-gcc
+        container_cross_prefix=riscv64-linux-gnu-
         ;;
       s390x)
         container_image=debian-s390x-cross
-        container_cross_cc=s390x-linux-gnu-gcc
+        container_cross_prefix=s390x-linux-gnu-
         ;;
       sh4)
         container_image=debian-sh4-cross
-        container_cross_cc=sh4-linux-gnu-gcc
+        container_cross_prefix=sh4-linux-gnu-
         ;;
       sparc64)
         container_image=debian-sparc64-cross
-        container_cross_cc=sparc64-linux-gnu-gcc
+        container_cross_prefix=sparc64-linux-gnu-
         ;;
       tricore)
         container_image=debian-tricore-cross
+        container_cross_prefix=tricore-
         container_cross_as=tricore-as
         container_cross_ld=tricore-ld
+        break
         ;;
       x86_64)
         container_image=debian-amd64-cross
-        container_cross_cc=x86_64-linux-gnu-gcc
+        container_cross_prefix=x86_64-linux-gnu-
         ;;
       xtensa*)
         # FIXME: xtensa-linux-user?
@@ -1990,9 +2014,12 @@ probe_target_compiler() {
         container_image=debian-xtensa-cross
 
         # default to the dc232b cpu
-        container_cross_cc=/opt/2020.07/xtensa-dc232b-elf/bin/xtensa-dc232b-elf-gcc
+        container_cross_prefix=/opt/2020.07/xtensa-dc232b-elf/bin/xtensa-dc232b-elf-
         ;;
     esac
+    : ${container_cross_cc:=${container_cross_prefix}gcc}
+    : ${container_cross_as:=${container_cross_prefix}as}
+    : ${container_cross_ld:=${container_cross_prefix}ld}
   done
 
   eval "target_cflags=\${cross_cc_cflags_$1}"
@@ -2000,17 +2027,11 @@ probe_target_compiler() {
     if eval has "\"\${cross_cc_$1}\""; then
       eval "target_cc=\"\${cross_cc_$1}\""
     fi
+  else
+    compute_target_variable $1 target_cc gcc
   fi
-  if eval test -n "\"\${cross_as_$1}\""; then
-    if eval has "\"\${cross_as_$1}\""; then
-      eval "target_as=\"\${cross_as_$1}\""
-    fi
-  fi
-  if eval test -n "\"\${cross_ld_$1}\""; then
-    if eval has "\"\${cross_ld_$1}\""; then
-      eval "target_ld=\"\${cross_ld_$1}\""
-    fi
-  fi
+  compute_target_variable $1 target_as as
+  compute_target_variable $1 target_ld ld
   if test "$1" = $cpu; then
     : ${target_cc:=$cc}
     : ${target_as:=$as}
@@ -2043,12 +2064,8 @@ write_container_target_makefile() {
   if test -n "$container_cross_cc"; then
     echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
   fi
-  if test -n "$container_cross_as"; then
-    echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
-  fi
-  if test -n "$container_cross_ld"; then
-    echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
-  fi
+  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
+  echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
 }
 
 
-- 
2.30.2


