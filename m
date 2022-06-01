Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1766D53ACD1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:31:25 +0200 (CEST)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwT7q-0003QJ-8R
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr7-0001jf-5k
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr4-0006Z8-Ti
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id q1so5395663ejz.9
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1r2rKk9p3Z4WuyVHz9vKxY76XN/AUS8op6qSsWyyueQ=;
 b=D5Hr4Fs5RLuWq/vyoBRX2Dsjtxxs80rnS/u4Mmt2UXc77lgoDoy6foPgD34PDe2njt
 A+QrJ9zsiGowVIkbYqCx9Ld7v5Gg/Zv5l+t/LiiXnQKaVVJemIb+lxW2l3g5tuiQPEqB
 lXf2H2eCjLirAQQLVUpMSY/tfOan1NXkzmZyfk+QG51crpzpAyhnjePPzWyVRmB0OKnN
 3PJpktSg8sYt6QUN6So8jbAcKTN4UlBJ3DUhuKpwrgaWd2M5Fam2iWuzCJoQZgRkqLqD
 +WUeJmbAGx8POlj2hN89KGnep99nWDlFvlF48+GKqI6IskSdgzLqkScKBPsa/0umZTMZ
 du2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1r2rKk9p3Z4WuyVHz9vKxY76XN/AUS8op6qSsWyyueQ=;
 b=hiEygkD2EeRUz6lqdwpJRja1Qlwc0eez66NU5uk4X3qjG/U/D1M+1P8purwGP0SOW6
 qMI+fZNtS66iB4gN0hthjXDFaklJJNYfQ+FK8DFwrIGdIPdQ/tpJBdx6FtCgK3Z9DPXv
 R/FHUy9O01FwpCNx6BAiQx0KWuvJPqAVf4t5HIASIajz7kQMxBWFRbbGBhwFLLALqGLn
 II7nM5PHGmNYfTuFCSA8YXRfsv0WaUaJdCYIBaz/bNSCv/1dWxuBEJdjR4BAo8JLT5Q/
 40zgh9XxlOJjzH0OXGFq9dgDWYQbeO2L9wmoMq3T8+OwtDLFbBPbQGZHpXJz+kPDF5vt
 /0kg==
X-Gm-Message-State: AOAM530qKZK1npHueaNEBiPnKJ45oRujNqRwRGQh91SGFFoMyt/NTKBO
 kx1iaPlO1AoBA7o215ozh7/0Fg==
X-Google-Smtp-Source: ABdhPJwmp2jJLaKjK7XiccfuvLfv4pKcdJgTXu/MKVuKHsUxBboaZYEw0erU9AEcAw5dBwA9niJ3uQ==
X-Received: by 2002:a17:907:6ea5:b0:6fa:967d:6d57 with SMTP id
 sh37-20020a1709076ea500b006fa967d6d57mr748802ejc.276.1654107241559; 
 Wed, 01 Jun 2022 11:14:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056402050b00b0042dd7e13391sm1367056edv.45.2022.06.01.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:13:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D091C1FFCF;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390-ccw boot)
Subject: [PULL 24/33] configure: enable cross-compilation of s390-ccw
Date: Wed,  1 Jun 2022 19:05:28 +0100
Message-Id: <20220601180537.2329566-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220527153603.887929-25-alex.bennee@linaro.org>

diff --git a/configure b/configure
index aa17b0fa55..f509bce304 100755
--- a/configure
+++ b/configure
@@ -2231,24 +2231,32 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
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


