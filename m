Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13ED514CE2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:28:52 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRc4-0008RA-1G
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRS0-0005l6-0Y
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRy-0004a9-Ab
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:27 -0400
Received: by mail-ej1-x629.google.com with SMTP id gh6so15826313ejb.0
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOjpMWbtSWYMaSIQQN91Mhp5Lq9EP7onS/rq0Krzws0=;
 b=mGtgHrTCkZPzZeNwrVkUVOR0wCXhNFHYKn0SewqaqyRD/8dB4mGcpv3MfkTRsVrhWF
 EgR8zf84n/SrXNc/nBLvcsL9/PQU51PC6SqQf3E1bU3R6nxXbN0SU6ihEeswDMT5gqPi
 Bb5iWacTuZMrtF1VrD9UqGl6dovls0FQHcGPoBgx6H98VSsaxiCQzdeD9WgGTjokwm8p
 qYlZgYIaCOpRW0+sXqVjz9bBicvtCOuFm/5WAJJA4pX7y6KOCGXlNDwCc1iXii13cltQ
 dt0q5HLvcu8FaVqkPaB5MsIGpPehvmlNlk8Y4dpKGB5LrJSfNADkYhT1Wmn4K2SSJNbE
 k87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mOjpMWbtSWYMaSIQQN91Mhp5Lq9EP7onS/rq0Krzws0=;
 b=X0r8qfLOjW8c4OFBaQcn0wvBz/htr2agnqMSpyuxyI6Yt75Nt8Y8hpjd8bI2pDLkIq
 Qju5Rcjb62MgijVf+IW+w1BgCq7L9cSdce9xWrf9dDRSllzfbOEl+GcYOt4d8C/JOdth
 1YcMtHVPJLRTQl0RUX3F+2WeUPT75Sm2Swh5LICwaqTApN3rTLmZLQa6ZFKcSft7sFtJ
 oI/QUaxkWzwgdyRaalplX0FAaTGDzF4Iq8Zvp3hcjnGVsM+z3StLyJyEj8nvgLSsAgwJ
 aQDfX9wW7KCG1ifv169nL1h51wtnGccbybI1n5YDPQR9fvcr0mtqMKjgE3xPXCp9NOrr
 l9YQ==
X-Gm-Message-State: AOAM531vxVsA3sLb7POZGYGjpj8KoB5QW3Ca3CAkU7os5WZlFZk6bCov
 jTpqRY87ACeUJ1+a9GMsK0RyG+iMZmYCVA==
X-Google-Smtp-Source: ABdhPJzqOIjiVY8eOK5vQwRnr3LEnrc0dNnsF67xHuNkfKsP6TMtvsJkVnLs9BWn3GXqIBvjpFTe+g==
X-Received: by 2002:a17:906:5006:b0:6ce:3762:c72e with SMTP id
 s6-20020a170906500600b006ce3762c72emr35602275ejj.30.1651241904991; 
 Fri, 29 Apr 2022 07:18:24 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/12] configure: enable cross-compilation of optionrom
Date: Fri, 29 Apr 2022 16:18:12 +0200
Message-Id: <20220429141813.328975-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
it possible to build x86 optionroms on any machine that has an installation
of GCC and binutils for 32- or 64-bit x86.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 29 +++++++++++++++++++++--------
 pc-bios/optionrom/Makefile |  4 +---
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 07ee586ef5..6b8e2e2fdb 100755
--- a/configure
+++ b/configure
@@ -2100,6 +2100,13 @@ probe_target_compiler() {
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
@@ -2210,6 +2217,9 @@ fi
 
 QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
+#######################################
+# cross-compiled firmware targets
+
 # Set up build tree symlinks that point back into the source tree
 # (these can be both files and directories).
 # Caution: avoid adding files or directories here using wildcards. This
@@ -2236,19 +2246,27 @@ done
 
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
 
 # Only build s390-ccw bios the compiler has -march=z900 or -march=z10 (which is
@@ -2403,7 +2421,6 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
@@ -2593,10 +2610,6 @@ for target in $target_list; do
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
index 2494ad9c25..6696ce010a 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -6,7 +6,6 @@ all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bi
 # Dummy command so that make thinks it has done something
 	@true
 
-include ../../config-host.mak
 CFLAGS = -O2 -g
 
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
@@ -44,13 +43,12 @@ Wa = -Wa,
 override ASFLAGS += -32
 override CFLAGS += $(call cc-option, $(Wa)-32)
 
-LD_I386_EMULATION ?= elf_i386
 override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CPP) $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
+	$(call quiet-command,$(CC) -E $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
-- 
2.35.1



