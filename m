Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16541514CCC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:27:29 +0200 (CEST)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRai-0005OC-6N
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRx-0005kc-HV
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:26 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRv-0004Zb-Qq
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id y3so15684929ejo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/i+EfOfUAftxgvGpFuIKRv6QIV6ur0Tq52pMurNusU=;
 b=OBEgJzULWHfPQqT7zq2jEC9Ft0kII+0m60YAUcxwM3NqrunnuuQQuht8q3ig3bOfZh
 YJySsser33hbQS8VQiHP3cgoR+jU7gsZaMJQswfWniHgf5JEB/p2a4hnApFMfte5wONr
 E0RVheFq+yMdSL+59xf3KEA9bnganf61K/p6FHRzIesFLzNdwmHQVSHhob/IAfdu9sOx
 FP+r1h8gIt0HTkYi9P8tWvc493rlX9lZ/+cKAJiSCO7tMcW5Ok4T4MD4eAk/8HGdP6Cs
 Z6R2t9FO8v9YmPNdaw1l9IAVh0vZBoSvcriqP/1UDsb/+LB6GEvc+QyMmEtD7aUNg8DB
 vpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R/i+EfOfUAftxgvGpFuIKRv6QIV6ur0Tq52pMurNusU=;
 b=UEF7pPhQEgJbVCsGU5I+Cd2HHwnSJX5KRBYpbIMM1B0fP77X5grKuXdPfVkv9c2DhR
 OluHZfpJgRxcEQI9WMF4loYmDUIn+IFbBWHlkVslxlm4Wbqh79Rgr+lcM5hTpthQyHQJ
 ddBM2lRh19gMRCrByRm5bRb3jelwzYit4kHEm6fNceTRcYQIkQA/jxidyGLf1ffcNybI
 /Wb8tyzn2/aftQ4w0hw99jn9jldP/kUrIEo6xSkNaIl7CRKlkCTN2YBegTDiYA+BZ1EZ
 6+ej5S2RYt6+rpSWPKYKhMHLOzhDU4mjLOFEiYgZDm/zsShjwit+8sZA69CXJbw2bvSm
 KE9A==
X-Gm-Message-State: AOAM530zvZNPYAj5aKuFAjXFDrvRrKK0V07abF3kHh8sgIqzkesx6doW
 C+aAEdU0ITXQeSAirh0L6nFhZjSo/6ZTlg==
X-Google-Smtp-Source: ABdhPJwKHszpH8+5Ci65hjyL9ZMtYZl1FuW8lNjaIQ9PtfnUXEjGZ4eyS3ORIsTb54CdMou88QNygQ==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr34806503ejn.278.1651241902482; 
 Fri, 29 Apr 2022 07:18:22 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/12] configure: enable cross-compilation of s390-ccw
Date: Fri, 29 Apr 2022 16:18:09 +0200
Message-Id: <20220429141813.328975-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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

While container-based cross compilers are not supported, this already makes
it possible to build s390-ccw on any machine that has s390x GCC and binutils
installed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                    | 18 +++++++++++++-----
 pc-bios/s390-ccw/Makefile    |  9 +++++----
 pc-bios/s390-ccw/netboot.mak |  2 +-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index de2bc799cd..5c34d8ffc2 100755
--- a/configure
+++ b/configure
@@ -2251,24 +2251,32 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
     done
 fi
 
-# Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
-# or -march=z10 (which is the lowest architecture level that Clang supports)
-if test "$cpu" = "s390x" ; then
+# Only build s390-ccw bios the compiler has -march=z900 or -march=z10 (which is
+# the lowest architecture level that Clang supports)
+probe_target_compiler s390x
+if test -n "$target_cc" && test "$softmmu" = yes; then
   write_c_skeleton
-  compile_prog "-march=z900" ""
+  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
   has_z900=$?
-  if [ $has_z900 = 0 ] || compile_object "-march=z10 -msoft-float -Werror"; then
+  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
     if [ $has_z900 != 0 ]; then
       echo "WARNING: Your compiler does not support the z900!"
       echo "         The s390-ccw bios will only work with guest CPUs >= z10."
     fi
     roms="$roms s390-ccw"
+    config_mak=pc-bios/s390-ccw/config-host.mak
+    echo "# Automatically generated by configure - do not modify" > $config_mak
+    echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
+    write_target_makefile >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
     git_submodules="${git_submodules} roms/SLOF"
   fi
 fi
 
+#######################################
+# generate config-host.mak
+
 # Check that the C++ compiler exists and works with the C compiler.
 # All the QEMU_CXXFLAGS are based on QEMU_CFLAGS. Keep this at the end to don't miss any other that could be added.
 if has $cxx; then
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 0eb68efc7b..6eb713bf37 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -2,8 +2,9 @@ all: build-all
 # Dummy command so that make thinks it has done something
 	@true
 
-include ../../config-host.mak
+include config-host.mak
 CFLAGS = -O2 -g
+MAKEFLAGS += -rR
 
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
@@ -11,7 +12,7 @@ cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
-$(call set-vpath, $(SRC_PATH)/pc-bios/s390-ccw)
+$(call set-vpath, $(SRC_PATH))
 
 # Flags for dependency generation
 QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
@@ -49,8 +50,8 @@ s390-ccw.img: s390-ccw.elf
 
 $(OBJECTS): Makefile
 
-ifneq ($(wildcard $(SRC_PATH)/roms/SLOF/lib/libnet),)
-include $(SRC_PATH)/pc-bios/s390-ccw/netboot.mak
+ifneq ($(wildcard $(SRC_PATH)/../../roms/SLOF/lib/libnet),)
+include $(SRC_PATH)/netboot.mak
 else
 s390-netboot.img:
 	@echo "s390-netboot.img not built since roms/SLOF/ is not available."
diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 68b4d7edcb..1a06befa4b 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -1,5 +1,5 @@
 
-SLOF_DIR := $(SRC_PATH)/roms/SLOF
+SLOF_DIR := $(SRC_PATH)/../../roms/SLOF
 
 NETOBJS := start.o sclp.o cio.o virtio.o virtio-net.o jump2ipl.o netmain.o
 
-- 
2.35.1



