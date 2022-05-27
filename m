Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07153659E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:03:09 +0200 (CEST)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucQe-0007kY-GJ
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8R-0003F3-J6
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8P-0003t9-QW
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i9-20020a1c3b09000000b00397345f2c6fso378919wma.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cURQBC1xsuc9L+Q4YyBLWsYow6paKWZDi+FvrPi8TPk=;
 b=E1ip46J3mT+eTfideOUbACnKJmU7cG9M/9qdQfS4oZGgBkIhCwNw3AfuGRfSdmlc2N
 F12MGCft/F8dCymfNy1FY9TRRiydi7TALzmkCX+LOp82PZNHqSvs8CrUf8RBccGMTRCr
 A44xUJgvTYmhLGy3eOqy1QxXJGijNyFfy+MOzZW33MdIqRkbGavMBDjgnKCeexlF8keO
 f1nze7a7PTdVSiIPmK86MLD2xrAOd1ektxEBCNC34219OIc8dub/51fMFq8rvahFU5Wm
 gmNN2raOHc0CM9Rl+hD2YZl5hK7IIev90J29ZB8Uynb1WPGOUHR/CJViI3soMU0tvvJY
 /KkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cURQBC1xsuc9L+Q4YyBLWsYow6paKWZDi+FvrPi8TPk=;
 b=E/0+wMr40f89S0mOh6/2z+yDINcJUpgQMmHujU1M4ILcE+OlzcJNv8W4jy6/01PilN
 SmZVLCp61LPvF8pmuJ/qo8w52429q8/Hjf9lWyQ/lamgkVRKiqVN5XlORSeCFfzRljEx
 Dp8sOuYAKukInTZqrQhYaqfn0WqntEeZQrOphef8tQ4B5Znjjkeik4WT8gqQ4PZJoAKJ
 cSvGdPd7jH4x+peQAwDaa8wfUwGf7ChR4XJtTbP1AIaC9UigCY6VER//qwNFR1H02hE6
 R3HFs8XnwKjSfQ/1BeCoTUOU21N1BloYuU7o5zXhyQr3U7iBPGzxE4sIT83sUT4Ryca1
 aNbw==
X-Gm-Message-State: AOAM531me2irsLUyUdRvHdqguviCVy5Q/G4QCIi10aAPx6ILogAK+oP3
 P3QDpxKhzJgTzMctAAv1Y7HlCw==
X-Google-Smtp-Source: ABdhPJyJTYcjnt6sRt3fFw4iP/q5hDimEqxPmNPTZ9DhCwluwdgyykpqf5bySlbk+xDdw3qpoq0f7Q==
X-Received: by 2002:a05:600c:892:b0:397:7b6c:b59d with SMTP id
 l18-20020a05600c089200b003977b6cb59dmr7378538wmp.85.1653666255574; 
 Fri, 27 May 2022 08:44:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d4a06000000b0020fe280aa96sm1938150wrq.107.2022.05.27.08.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F05011FFD0;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390-ccw boot)
Subject: [PATCH  v1 24/33] configure: enable cross-compilation of s390-ccw
Date: Fri, 27 May 2022 16:35:54 +0100
Message-Id: <20220527153603.887929-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

While container-based cross compilers are not supported, this already makes
it possible to build s390-ccw on any machine that has s390x GCC and binutils
installed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-14-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                    | 18 +++++++++++++-----
 pc-bios/s390-ccw/netboot.mak |  2 +-
 pc-bios/s390-ccw/Makefile    |  9 +++++----
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 82c2ddc79a..99626df869 100755
--- a/configure
+++ b/configure
@@ -2228,24 +2228,32 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
     done
 fi
 
-# Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
-# or -march=z10 (which is the lowest architecture level that Clang supports)
-if test "$cpu" = "s390x" ; then
+# Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
+# (which is the lowest architecture level that Clang supports)
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
diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 68b4d7edcb..1a06befa4b 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -1,5 +1,5 @@
 
-SLOF_DIR := $(SRC_PATH)/roms/SLOF
+SLOF_DIR := $(SRC_PATH)/../../roms/SLOF
 
 NETOBJS := start.o sclp.o cio.o virtio.o virtio-net.o jump2ipl.o netmain.o
 
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
-- 
2.30.2


