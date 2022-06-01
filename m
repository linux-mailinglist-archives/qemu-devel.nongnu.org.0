Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FCE53ACD4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:32:03 +0200 (CEST)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwT8T-000580-Vt
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr5-0001dx-DO
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:03 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr3-0006Xa-Hy
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:03 -0400
Received: by mail-ej1-x62e.google.com with SMTP id jx22so5361624ejb.12
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3D8/UyD+ztVeocgeehcA/xb0KzGAE86uC41XX1vBnSs=;
 b=wEHO5EN1aGj4BbNXnK77aPshmjP+Ksk+4YpNovNp6ZZW5AkTwrI4S2j1ckcIsFzUrO
 u3aDFSYb3U8kmZRzfMrRu3522JnfigsrbA1wfB8BP031QbSzd0zR1KVJp/yfAC5w/uOu
 RngoonLfaz1efkh6qsF6owusdN2Y4ebG2mPToopZiq4lN860oPDHMtkgNTH8ylhKtngg
 5DKA9GUWaw2Ryiz1n9MaxO2aM8T7J0w/NsVvDLMXEDYt7CiO0FAK9iyFszFilx/mUgxy
 s4HjJeGB1xc25D943jVVuYUCb9SQzqufAwYxOEDdZNXHYMVhyc6fvxDMJk77GP5Q7fyP
 N5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3D8/UyD+ztVeocgeehcA/xb0KzGAE86uC41XX1vBnSs=;
 b=57VaqCf/i+LkJButQr2o252cxxvwhM2cEFZkOE2NDAxH1bSRSGRERb3/OuINwHY0H3
 hiBM3uELU/2OlqkmAn7UAHlmneF+HqaZ9iTY2waENNw9IOkejM5frMidw5khdwU58fMW
 Y/+uK3Zfdll9DuYjlYwvJnnNcRJGBPsMEFd1QKhNKqlz/spEC+onfkTglR5lzSQdGtkE
 yf/ptcJ44LeVaCsHu28uPrYH5ZRP8MUPBGu6mOsB9JwkOE4gE+BplZmHbpxtI1J6dU0f
 PTIAGMxrgKtpMuycwQzHtP+z9I4ETmn8vcVeiNrOivgT+vdL94XspWiyJOewh05hgjNT
 M1rg==
X-Gm-Message-State: AOAM532FzXHOz0IaPhnBz9Gahs5T2DIfGjJrskOs473aXL49VDRBnQuh
 LC18YzGWyHKgg3YrSR6WMxxeKg==
X-Google-Smtp-Source: ABdhPJygpemRDc+iXtpuVJBBJGmI4e/0gts0XggJV4N9gJD3zC3L+jwujoIAOtHoLElEOUy5zD3GNw==
X-Received: by 2002:a17:906:6a29:b0:705:dc2b:727b with SMTP id
 qw41-20020a1709066a2900b00705dc2b727bmr737227ejc.80.1654107239012; 
 Wed, 01 Jun 2022 11:13:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m3-20020aa7c483000000b0042de29d8fc0sm1329097edq.94.2022.06.01.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:13:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 15D481FFD0;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 25/33] configure: enable cross-compilation of optionrom
Date: Wed,  1 Jun 2022 19:05:29 +0100
Message-Id: <20220601180537.2329566-26-alex.bennee@linaro.org>
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
it possible to build x86 optionroms on any machine that has an installation
of GCC and binutils for 32- or 64-bit x86.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-15-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-26-alex.bennee@linaro.org>

diff --git a/configure b/configure
index f509bce304..1ae5c950f0 100755
--- a/configure
+++ b/configure
@@ -2082,6 +2082,13 @@ probe_target_compiler() {
   fi
 }
 
+probe_target_compilers() {
+  for i; do
+    probe_target_compiler $i
+    test -n "$target_cc" && return 0
+  done
+}
+
 write_target_makefile() {
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
@@ -2190,6 +2197,10 @@ if test "$QEMU_GA_VERSION" = ""; then
     QEMU_GA_VERSION=$(cat $source_path/VERSION)
 fi
 
+
+#######################################
+# cross-compiled firmware targets
+
 # Set up build tree symlinks that point back into the source tree
 # (these can be both files and directories).
 # Caution: avoid adding files or directories here using wildcards. This
@@ -2216,19 +2227,27 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
+probe_target_compilers i386 x86_64
+if test -n "$target_cc" &&
         test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
         test "$targetos" != "haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
     for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
+        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
             ld_i386_emulation="$emu"
-            roms="optionrom"
             break
         fi
     done
+    if test -n "$ld_i386_emulation"; then
+        roms="optionrom"
+        config_mak=pc-bios/optionrom/config.mak
+        echo "# Automatically generated by configure - do not modify" > $config_mak
+        echo "TOPSRC_DIR=$source_path" >> $config_mak
+        echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
+        write_target_makefile >> $config_mak
+    fi
 fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
@@ -2381,7 +2400,6 @@ echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_BINDIR=$glib_bindir" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
@@ -2571,10 +2589,6 @@ for target in $target_list; do
 done
 echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile)
 
-config_mak=pc-bios/optionrom/config.mak
-echo "# Automatically generated by configure - do not modify" > $config_mak
-echo "TOPSRC_DIR=$source_path" >> $config_mak
-
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
   meson_quote() {
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 17ccc76241..f639915b4f 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -6,7 +6,6 @@ all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bi
 # Dummy command so that make thinks it has done something
 	@true
 
-include ../../config-host.mak
 CFLAGS = -O2 -g
 
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
@@ -44,7 +43,6 @@ Wa = -Wa,
 override ASFLAGS += -32
 override CFLAGS += $(call cc-option, $(Wa)-32)
 
-LD_I386_EMULATION ?= elf_i386
 override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 
 pvh.img: pvh.o pvh_main.o
-- 
2.30.2


