Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408795F4542
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:17:28 +0200 (CEST)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofijf-0002sV-3A
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhqX-0001Nu-JU
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq7-0001sy-OL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 p36-20020a05600c1da400b003bd24ccae2eso828106wms.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AhAdWLqI3hTu5u5BSfQpR5bY8MIRwXJMzwU8OB2KT/Q=;
 b=otfUaFN4/uJNaOPhocyTvtcBj6YfhgJMTAKx8hZiKYdI9utJ6/LIgEvdkwC4pgzTTm
 vm9ItVBk9ijPffAFfpV0a2Gjkn3ts4jBJvIcRnhtvd4e/e2iFflDo2Jlj2chZ1ba0407
 waLROZrzw6SFEDoIzIWXQidl6Xhm0XkBYrreBt8JPtXU5MbAGZVuIR4mUfzgRWIK6dQb
 3ZEip5Eqfzhoik6L6lWu+FdEDbCcCjQRe1CCnTD/EKdA5maFiwXFeo8wRZhc6svnQAbx
 iJiITo9XdXW7teZgFkMZQu47MLquD7QkSVnGBkkJeA+xkFOzjhEJbCdzb6dFIM9CgN74
 D3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AhAdWLqI3hTu5u5BSfQpR5bY8MIRwXJMzwU8OB2KT/Q=;
 b=zAAKOQ6B2P50CT5NNJg/09TkwF3+k6QJEWku8++03t8g2vdCmnFHcAXBr8wydIfDoy
 yowMGXY9tZdVAPhHmGh90eaYeLrolXLff+XZ/6Ms2mfjauWEEtxs4yNZZ6zvUN9wrA0H
 860L5d4Q5jlhdVxEijSTbRB0+i0stuFoHIbpcJ9f/MRuHQbzwxk7aQvbWgreKaMzPTWm
 mYe7uC/jFy/+LhZttXE+mfsUDiUifN5c0OjANqqCSR57bhEwQ9yt0S2XWLWWfLumf+6K
 Lg65Xna5/Vn4oP1Bwo8tyDyVPR0xKuSQDAWG7zBSu7E57bHjAHKSztAEH19JvHjuaECe
 y3KA==
X-Gm-Message-State: ACrzQf1MYLvwAUo+ExEYZWnfYYCHSlCfEI/xRZFTbkyKH+/SZIalJzJ2
 3yi/6XbytQOvLfbTFsCoOvVtdA==
X-Google-Smtp-Source: AMsMyM6DSQ6UORyPTSdv5aLU+D4ECPiNtBfaCKlkScf02/XzBd8y19u1n1yVQ1ZicoINDG5Togq3nQ==
X-Received: by 2002:a05:600c:1c84:b0:3b3:ef37:afd3 with SMTP id
 k4-20020a05600c1c8400b003b3ef37afd3mr9797890wms.155.1664889601644; 
 Tue, 04 Oct 2022 06:20:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003a6a3595edasm14802487wma.27.2022.10.04.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 200C21FFCD;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 24/54] tests/tcg: move compiler tests to Makefiles
Date: Tue,  4 Oct 2022 14:01:08 +0100
Message-Id: <20221004130138.2299307-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Further decoupling of tests/tcg from the main QEMU Makefile, and making
the build more similar between the cross compiler case and the vetted
container images.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-25-alex.bennee@linaro.org>

diff --git a/configure b/configure
index a48a731bf4..ceb1213292 100755
--- a/configure
+++ b/configure
@@ -2562,73 +2562,11 @@ for target in $target_list; do
 
   probe_target_compiler $target
   if test $got_cross_cc = yes; then
-      # Test for compiler features for optional tests. We only do this
-      # for cross compilers because ensuring the docker containers based
-      # compilers is a requirememt for adding a new test that needs a
-      # compiler feature.
-
-      echo "BUILD_STATIC=$build_static" >> "$config_target_mak"
       write_target_makefile >> "$config_target_mak"
-      case $target in
-          aarch64-*)
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.1-a+sve -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE=y" >> "$config_target_mak"
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE2=y" >> "$config_target_mak"
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.3-a -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_3=y" >> "$config_target_mak"
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -mbranch-protection=standard -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> "$config_target_mak"
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.5-a+memtag -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> "$config_target_mak"
-              fi
-              ;;
-          ppc*)
-              if do_compiler "$target_cc" $target_cflags \
-                             -mpower8-vector -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> "$config_target_mak"
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -mpower10 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER10=y" >> "$config_target_mak"
-              fi
-              ;;
-          i386-linux-user)
-              if do_compiler "$target_cc" $target_cflags \
-                             -Werror -fno-pie -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> "$config_target_mak"
-              fi
-              ;;
-      esac
   elif test -n "$container_image"; then
+      build_static=y
       echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-      echo "BUILD_STATIC=y" >> "$config_target_mak"
       write_container_target_makefile >> "$config_target_mak"
-      case $target in
-          aarch64-*)
-              echo "CROSS_CC_HAS_SVE=y" >> "$config_target_mak"
-              echo "CROSS_CC_HAS_SVE2=y" >> "$config_target_mak"
-              echo "CROSS_CC_HAS_ARMV8_3=y" >> "$config_target_mak"
-              echo "CROSS_CC_HAS_ARMV8_BTI=y" >> "$config_target_mak"
-              echo "CROSS_CC_HAS_ARMV8_MTE=y" >> "$config_target_mak"
-              ;;
-          ppc*)
-              echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> "$config_target_mak"
-              echo "CROSS_CC_HAS_POWER10=y" >> "$config_target_mak"
-              ;;
-          i386-linux-user)
-              echo "CROSS_CC_HAS_I386_NOPIE=y" >> "$config_target_mak"
-              ;;
-      esac
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
@@ -2637,6 +2575,7 @@ for target in $target_list; do
       ln -sf "../config-$target.mak" "tests/tcg/$target/config-target.mak"
       echo "TARGET=$target" >> "$config_target_mak"
       echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
+      echo "BUILD_STATIC=$build_static" >> "$config_target_mak"
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index cd0a2ad873..75257f2b29 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -40,10 +40,18 @@ endif
 
 # for including , in command strings
 COMMA := ,
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX=tests/tcg/$(TARGET):$(SPACE)
 
 quiet-@ = $(if $(V),,@$(if $1,printf "  %-7s %s\n" "$(strip $1)" "$(strip $2)" && ))
 quiet-command = $(call quiet-@,$2,$3)$1
 
+cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
+cc-option = if $(call cc-test, $1); then \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "$(strip $2)=y" >&3; else \
+    echo "$(TARGET_PREFIX)$1 not detected"; fi
+
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
@@ -190,4 +198,4 @@ clean:
 	rm -f $(TESTS) *.o $(CLEANFILES)
 
 distclean:
-	rm -f config-target.mak ../config-$(TARGET).mak
+	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 84a9990f8d..a1368905f5 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -19,6 +19,11 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-march=armv8.3-a, CROSS_CC_HAS_ARMV8_3)) 3> config-cc.mak
+-include config-cc.mak
+
 # building head blobs
 .PRECIOUS: $(CRT_OBJS)
 
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9837a809dc..fc8d90ed69 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -17,6 +17,15 @@ run-fcvt: fcvt
 	$(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-march=armv8.1-a+sve,          CROSS_CC_HAS_SVE); \
+	    $(call cc-option,-march=armv8.1-a+sve2,         CROSS_CC_HAS_SVE2); \
+	    $(call cc-option,-march=armv8.3-a,              CROSS_CC_HAS_ARMV8_3); \
+	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
+	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE)) 3> config-cc.mak
+-include config-cc.mak
+
 # Pauth Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 8af066efc5..3273aa8061 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -5,6 +5,12 @@ I386_SRC=$(SRC_PATH)/tests/tcg/i386
 # Set search path for all sources
 VPATH 		+= $(I386_SRC)
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+          $(call cc-option,-fno-pie, CROSS_CC_HAS_I386_NOPIE)) 3> config-cc.mak
+
+-include config-cc.mak
+
 I386_SRCS=$(notdir $(wildcard $(I386_SRC)/*.c))
 ALL_X86_TESTS=$(I386_SRCS:.c=)
 SKIP_I386_TESTS=test-i386-ssse3 test-avx test-3dnow test-mmx
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 7db7a3e2b3..f081f1c683 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -4,6 +4,13 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-mpower8-vector,   CROSS_CC_HAS_POWER8_VECTOR); \
+	    $(call cc-option,-mpower10,         CROSS_CC_HAS_POWER10)) 3> config-cc.mak
+
+-include config-cc.mak
+
 ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
 endif
-- 
2.34.1


