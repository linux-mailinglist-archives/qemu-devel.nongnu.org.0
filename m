Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E7F5EF68C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:28:59 +0200 (CEST)
Received: from localhost ([::1]:45268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtb1-0003JP-2A
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3H-0000NL-5S
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3B-0002Np-33
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:49:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id s14so1822401wro.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OXzdsloRXB8WS1CH8p1FEaeaWBtMOAym3FLJbD2hm9Y=;
 b=gWsYgCyrKIeyKN5hfhEn0d45X20TbQKAjMSZ7o3Zrs9j72QXpaxDElDnVpYhSseeel
 NWyelFgRJrOK7nZK2lAoK8Zfh8LodSwBkr49i8nwS7mwjuIGgsE9iQEEe5ysDgq5lVoS
 9DIxeJztgwrSCqbOSIIVzroc5XzjJLynsPF3g6/BndmDaBrD+5ofHRLQ1ykR3Sqxk+bh
 pubwadUF8UTvQlVk5FjcD2KqKqvOVDYPYBnC7WrU6w+gJptyftcz0HeWxh3euEmCBlq0
 JCN5JkVvWBefT90Z2O8v+TMtCNYtIu7LCi5znWIAf4eBmIvMxtrt8DcGuJsAB/KVa7tV
 FiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OXzdsloRXB8WS1CH8p1FEaeaWBtMOAym3FLJbD2hm9Y=;
 b=qO7jXrZ4Q67L8/v8JVJ+5+RmgFffijVUwTiheGBhOoe2BFjrX50cVBKIjnU6onmeQ0
 pe1F/UE1gj/5wnTLYtvjg7mJMfMuSEcuEIXdol+1Ne6oTJq0XndL/o/N9zIknzVyRICD
 C8/WVYY+IIxL63BNgS/T5exUtov0HOGCuVOLcGmC7tStUbnWMB2D5r2AasuVV3tYFFpp
 Knllq12Tu/7ZKwfKk7xi/+F7Y2IQYUBZzmCU0WziaJtv0iQNvOMlYwU4k52hL49HcW9w
 2YPY8925NueDxC68L2em7Xt0rh3BXJ6LpZ3R+iSWIm7LUwDYJlwM+yhDDHbJqe6ykTzc
 LkUA==
X-Gm-Message-State: ACrzQf3YayAqZxX4ncy8m8zEFXZdkBOcB9jKykBpbjgm3KnbOhmaGgSa
 B3OEHdSacmNkZApPaAU5E95nhQ==
X-Google-Smtp-Source: AMsMyM7h3WF7//7seLVnOiZIy3AeoCRuwu7IhFIUz8lY144P/kaYXEImCobuA5s2MWs9YqLJ9X3G9Q==
X-Received: by 2002:a05:6000:1ac7:b0:22a:906d:3577 with SMTP id
 i7-20020a0560001ac700b0022a906d3577mr2026118wry.33.1664452194911; 
 Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a1cf30a000000b003b47575d304sm4949402wmq.32.2022.09.29.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1499F1FFCD;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 24/51] tests/tcg: move compiler tests to Makefiles
Date: Thu, 29 Sep 2022 12:42:04 +0100
Message-Id: <20220929114231.583801-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
---
 configure                                 | 65 +----------------------
 tests/tcg/Makefile.target                 | 10 +++-
 tests/tcg/aarch64/Makefile.softmmu-target |  5 ++
 tests/tcg/aarch64/Makefile.target         |  9 ++++
 tests/tcg/i386/Makefile.target            |  6 +++
 tests/tcg/ppc64/Makefile.target           |  7 +++
 6 files changed, 38 insertions(+), 64 deletions(-)

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


