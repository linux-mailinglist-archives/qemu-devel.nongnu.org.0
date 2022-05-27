Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264C53659C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:02:40 +0200 (CEST)
Received: from localhost ([::1]:38050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucQB-0006uc-Ji
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8J-00032R-Kj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8H-0003sJ-TN
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so770845wrb.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8XF8iPBZc3R5SAOp42FEF7Tkk/PzFsQPDZ9qsBNAPc=;
 b=Jh+ikDZKmO3+nDXFe0tUZoxvggeJuzPkOYkZ/6B4nxEDmGtwVhFLgELgKzjacSbXFY
 rqkagd1zxc71ixSxCHeqqSNxfC4awia2iSiba291jh+BKuXhnaW12oyvDL28iNK1YZA4
 4hrBbcQLqzB2+PEkL85mfoWRvPuO4BqBbACVZL88wI8vyDp4oscEqbMrflB4XMQIL65S
 Tp+zYgxZ4Tkv2a9Wug8lONem7gkV8Km/F2dEPU7+Uh5WrhFtY+HNOtu0UugfSa230OOT
 S0O/aVeyuJBXGI8DbwbXxuXcOV2ZoUA24fjM4Hz2An5c+TBI8F7CvAW8O6mUV5zgzopb
 pcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8XF8iPBZc3R5SAOp42FEF7Tkk/PzFsQPDZ9qsBNAPc=;
 b=bswN4y7JF+udWS7ERwQljfkJhb5I7b/1BM7nLgGepW+W7KUWOoCvpV1ZA+UhJM1cbp
 yO1p4BbgVCnn64lEmhSmNVwIVZMhn48Z7j75Fff7Cmg177fyvrTBHxX+dIfmdR82rshq
 Ga/IgrbZgwwsUwq1J2JDYwQ1ghNEYhhxR7/J46ita3ItAkr3QLfcTby+i4Ta8eE27kNw
 OrxHcrOQfEnDs2Gfxgx7OYnr6dcm6LBmNpOATQaiaZaefCHvClu5VcoDVsxATzJASgBK
 9ztInfISHC2RkBj5/OvQ2WfTSVN6cHFwDXvr/yFilTw0nZEihL2Z3ecfYT5jiKWqTZ6E
 oJCQ==
X-Gm-Message-State: AOAM530yezHY+g+oa51lbXILZJGHQQFlM5osboCQ7OG2TPX5VLryIACZ
 J5HLnfm86aXeehZV1I/eL8u+mQ==
X-Google-Smtp-Source: ABdhPJyUjFB+paDQ4hFc30cMF7hfhnJWWcDNHr8NYFhDRcKUUF7I/0CaY3lti/fzW+RpKdBrIhKL0w==
X-Received: by 2002:adf:e543:0:b0:210:1ca6:9869 with SMTP id
 z3-20020adfe543000000b002101ca69869mr2549639wrm.205.1653666248599; 
 Fri, 27 May 2022 08:44:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d4448000000b0020fe43fca50sm1871007wrr.91.2022.05.27.08.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 182DE1FFD1;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 25/33] configure: enable cross-compilation of optionrom
Date: Fri, 27 May 2022 16:35:55 +0100
Message-Id: <20220527153603.887929-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
---
 configure                  | 29 +++++++++++++++++++++--------
 pc-bios/optionrom/Makefile |  2 --
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 99626df869..b974db3ebd 100755
--- a/configure
+++ b/configure
@@ -2077,6 +2077,13 @@ probe_target_compiler() {
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
@@ -2187,6 +2194,9 @@ fi
 
 QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
+#######################################
+# cross-compiled firmware targets
+
 # Set up build tree symlinks that point back into the source tree
 # (these can be both files and directories).
 # Caution: avoid adding files or directories here using wildcards. This
@@ -2213,19 +2223,27 @@ done
 
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
@@ -2378,7 +2396,6 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
@@ -2568,10 +2585,6 @@ for target in $target_list; do
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


