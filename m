Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD174EEF4A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:24:55 +0200 (CEST)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naICs-0006sj-IL
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:24:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI2D-00047x-AJ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:53 -0400
Received: from [2a00:1450:4864:20::62e] (port=36785
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI27-0006ds-JI
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:53 -0400
Received: by mail-ej1-x62e.google.com with SMTP id k23so2694063ejd.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=55bDDPjorfrhLfpzYQWb1AXkVQNF3GZ0BEJsxunEeXI=;
 b=ULW8FkpO/3dqpWN7BnCn/Ct8JaglZC1B9WQp3Vzrj3303nGpMGtDbSnnnP5S57+Dsm
 iyzMePyDrKYkY18QYMQgCchk/12z9zAPWb7ZdI5QpnJrqW7AD2xtY757yayd7tkzDVcL
 tH+LQOtCOjVDwnFp6lIppaBufAjn8jgYvRhdmY5YLPbqJSFiS4EZKznW/Qah0oDpgq2O
 QTd9MYYguJ3naXlTwlCOu3L4QZ7iQ9yzUwClgfYn/IR65om+gVuq0QOaAftHm0h1Cd4s
 rKA/Hzj/Ce/xKdxG46JxgdCGd+tAaU6ASVery+vvQ2uKyEKay+yqgZowbcmI+m4I76eL
 tUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=55bDDPjorfrhLfpzYQWb1AXkVQNF3GZ0BEJsxunEeXI=;
 b=NlNBSxBWWTf+X2z0Sr31h6b5VyFnyp4wmq5o6Qw6UH0Yz9SBLZ23wsoQyBPP0HEAsv
 82ZujHTUsL4aIAj2j9rXawZYHb8/IHan5kFf4yklOZlHi2Um/c4MjFqlbpc6jnmhq6S4
 srXttUxAjmTbOKTWD/BSyzgglKFNonnEm83KXuOyqcJC4TZZXgFCSjZfEAiApT35/xhA
 0+QKhsQXZ/E7zbqBhqOnAEx3VPwBRKGayBpoZphuQ6/KEk8kSSS0ZAPpl9raPgSe4rhM
 u14PxR6K+dF6aHI5P/++6Vqc/FxqFZ0d4eHfFiMUKsbXn2s4PX5rbi09/8tOXV0lU5g2
 8iWw==
X-Gm-Message-State: AOAM532IF6i3Fmj1zm4+pWxEHcngF5FnIHfAnYQUEKPN8L06QJRj4YOm
 +KQrbnHEzNtV22cOUnEHC8yrMwGAH2I=
X-Google-Smtp-Source: ABdhPJwNLDRs7CGWCJolW6aaIyOGQldj36GPi6XrcLS5Q7J4QTbIUBKJXw+vpx4aoBBrs0MWLBraiQ==
X-Received: by 2002:a17:906:a1c8:b0:6da:a635:e402 with SMTP id
 bx8-20020a170906a1c800b006daa635e402mr24252ejb.598.1648822425921; 
 Fri, 01 Apr 2022 07:13:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] tests/tcg: invoke Makefile.target directly from QEMU's
 makefile
Date: Fri,  1 Apr 2022 16:13:23 +0200
Message-Id: <20220401141326.1244422-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the "docker.py cc" invocation directly in tests/tcg/configure.sh, and
remove the Makefile.qemu wrapper around Makefile.target.  The config-*.mak
files now include the actual variables used when building the tests, rather
than the CROSS_* variables that Makefile.qemu used to "translate".

This is a first step towards generalizing the cross-compilation infrastructure
so that it can be used for firmware as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-14-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include    |  36 +++++++------
 tests/tcg/Makefile.qemu   | 110 --------------------------------------
 tests/tcg/Makefile.target |   3 +-
 tests/tcg/configure.sh    |  28 +++++-----
 4 files changed, 33 insertions(+), 144 deletions(-)
 delete mode 100644 tests/tcg/Makefile.qemu

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 091ca8513f..ec84b2ebc0 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -48,25 +48,27 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 $(foreach TARGET,$(TCG_TESTS_TARGETS), \
         $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
-$(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
-		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
-		SRC_PATH=$(SRC_PATH) \
-	       	V="$(V)" TARGET="$*" guest-tests, \
-		"BUILD", "TCG tests for $*")
+.PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
+	$(call quiet-command, \
+            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
+                        DOCKER_SCRIPT="$(DOCKER_SCRIPT)" \
+                        TARGET="$*" SRC_PATH="$(SRC_PATH)", \
+        "BUILD","$* guest-tests")
 
-$(RUN_TCG_TARGET_RULES): run-tcg-tests-%: build-tcg-tests-% all
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
-		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
-		SRC_PATH=$(SRC_PATH) SPEED="$(SPEED)" \
-		V="$(V)" TARGET="$*" run-guest-tests, \
-		"RUN", "TCG tests for $*")
+.PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins)
+	$(call quiet-command, \
+           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
+                        TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
+        "RUN", "$* guest-tests")
 
-$(CLEAN_TCG_TARGET_RULES): clean-tcg-tests-%:
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
-		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
-		SRC_PATH=$(SRC_PATH) TARGET="$*" clean-guest-tests, \
-		"CLEAN", "TCG tests for $*")
+.PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
+	$(call quiet-command, \
+           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
+                        TARGET="$*" SRC_PATH="$(SRC_PATH)" clean, \
+        "CLEAN", "$* guest-tests")
 
 .PHONY: build-tcg
 build-tcg: $(BUILD_TCG_TARGET_RULES)
diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
deleted file mode 100644
index cda5e5a33e..0000000000
--- a/tests/tcg/Makefile.qemu
+++ /dev/null
@@ -1,110 +0,0 @@
-# -*- Mode: makefile -*-
-#
-# TCG tests (per-target rules)
-#
-# This Makefile fragment is included from the build-tcg target, once
-# for each target we build. We have two options for compiling, either
-# using a configured guest compiler or calling one of our docker images
-# to do it for us.
-#
-
-# The configure script fills in extra information about
-# useful docker images or alternative compiler flags.
-
-# Usage: $(call quiet-command,command and args,"NAME","args to print")
-# This will run "command and args", and either:
-#  if V=1 just print the whole command and args
-#  otherwise print the 'quiet' output in the format "  NAME     args to print"
-# NAME should be a short name of the command, 7 letters or fewer.
-# If called with only a single argument, will print nothing in quiet mode.
-quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
-quiet-@ = $(if $(V),,@)
-quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
-
-CROSS_CC_GUEST:=
-CROSS_AS_GUEST:=
-CROSS_LD_GUEST:=
-DOCKER_IMAGE:=
-
--include tests/tcg/config-$(TARGET).mak
-
-GUEST_BUILD=
-TCG_MAKE=../Makefile.target
-
-# We also need the Docker make rules to depend on
-SKIP_DOCKER_BUILD=1
-include $(SRC_PATH)/tests/docker/Makefile.include
-
-# Support installed Cross Compilers
-
-ifdef CROSS_CC_GUEST
-
-.PHONY: cross-build-guest-tests
-cross-build-guest-tests:
-	$(call quiet-command, \
-	   (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
-	    $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC="$(CROSS_CC_GUEST)" \
-			$(if $(CROSS_AS_GUEST),AS="$(CROSS_AS_GUEST)") \
-			$(if $(CROSS_LD_GUEST),LD="$(CROSS_LD_GUEST)") \
-			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=$(CROSS_CC_GUEST_STATIC) \
-			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
-	"BUILD","$(TARGET) guest-tests with $(CROSS_CC_GUEST)")
-
-GUEST_BUILD=cross-build-guest-tests
-
-endif
-
-# Support building with Docker
-
-ifneq ($(DOCKER_IMAGE),)
-
-DOCKER_COMPILE_CMD="$(DOCKER_SCRIPT) cc \
-		--cc $(DOCKER_CROSS_CC_GUEST) \
-		-i qemu/$(DOCKER_IMAGE) \
-		-s $(SRC_PATH) -- "
-
-DOCKER_AS_CMD=$(if $(DOCKER_CROSS_AS_GUEST),"$(DOCKER_SCRIPT) cc \
-		--cc $(DOCKER_CROSS_AS_GUEST) \
-		-i qemu/$(DOCKER_IMAGE) \
-		-s $(SRC_PATH) -- ")
-
-DOCKER_LD_CMD=$(if $(DOCKER_CROSS_LD_GUEST),"$(DOCKER_SCRIPT) cc \
-		--cc $(DOCKER_CROSS_LD_GUEST) \
-		-i qemu/$(DOCKER_IMAGE) \
-		-s $(SRC_PATH) -- ")
-
-
-.PHONY: docker-build-guest-tests
-docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
-	$(call quiet-command, \
-	  (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
-	   $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC=$(DOCKER_COMPILE_CMD) \
-			$(if $(DOCKER_AS_CMD),AS=$(DOCKER_AS_CMD)) \
-			$(if $(DOCKER_LD_CMD),LD=$(DOCKER_LD_CMD)) \
-			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=y \
-			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
-	"BUILD","$(TARGET) guest-tests with docker qemu/$(DOCKER_IMAGE)")
-
-GUEST_BUILD=docker-build-guest-tests
-
-endif
-
-# Final targets
-all:
-	@echo "Do not invoke this Makefile directly"; exit 1
-
-.PHONY: guest-tests
-
-guest-tests: $(GUEST_BUILD)
-
-run-guest-tests: guest-tests
-	$(call quiet-command, \
-	(cd tests/tcg/$(TARGET) && \
-	 $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" \
-	 		SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run), \
-	"RUN", "tests for $(TARGET_NAME)")
-
-# It doesn't matter if these don't exits
-.PHONY: clean-guest-tests
-clean-guest-tests:
-	rm -rf tests/tcg/$(TARGET)
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index c75e8d983f..95499d8c9b 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -187,4 +187,5 @@ gdb-%: %
 .PHONY: run
 run: $(RUN_TESTS)
 
-# There is no clean target, the calling make just rm's the tests build dir
+clean:
+	rm -f $(TESTS) *.o
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e51cd56b60..a577dd7ece 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -227,7 +227,6 @@ for target in $target_list; do
 
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
   echo "TARGET_NAME=$arch" >> $config_target_mak
-  echo "target=$target" >> $config_target_mak
   case $target in
     *-softmmu)
       test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
@@ -257,13 +256,13 @@ for target in $target_list; do
                   if do_compiler "$target_compiler" $target_compiler_cflags \
                                  -o $TMPE $TMPC ; then
                       got_cross_cc=yes
-                      echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
-                      echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+                      echo "BUILD_STATIC=y" >> $config_target_mak
+                      echo "CC=$target_compiler" >> $config_target_mak
                   fi
               else
                   got_cross_cc=yes
-                  echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
-                  echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+                  echo "BUILD_STATIC=y" >> $config_target_mak
+                  echo "CC=$target_compiler" >> $config_target_mak
               fi
           fi
       fi
@@ -274,9 +273,8 @@ for target in $target_list; do
       if has $target_as && has $target_ld; then
           case $target in
               tricore-softmmu)
-                  echo "CROSS_CC_GUEST=$target_as" >> $config_target_mak
-                  echo "CROSS_AS_GUEST=$target_as" >> $config_target_mak
-                  echo "CROSS_LD_GUEST=$target_ld" >> $config_target_mak
+                  echo "AS=$target_as" >> $config_target_mak
+                  echo "LD=$target_ld" >> $config_target_mak
                   got_cross_cc=yes
                   ;;
           esac
@@ -334,16 +332,13 @@ for target in $target_list; do
       for host in $container_hosts; do
           if test "$host" = "$cpu"; then
               echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-              echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
-              echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> \
-                   $config_target_mak
+              echo "BUILD_STATIC=y" >> $config_target_mak
+              echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --" >> $config_target_mak
               if test -n "$container_cross_as"; then
-                  echo "DOCKER_CROSS_AS_GUEST=$container_cross_as" >> \
-                      $config_target_mak
+                  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --" >> $config_target_mak
               fi
               if test -n "$container_cross_ld"; then
-                  echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
-                      $config_target_mak
+                  echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --" >> $config_target_mak
               fi
               case $target in
                   aarch64-*)
@@ -367,8 +362,9 @@ for target in $target_list; do
       done
   fi
   if test $got_cross_cc = yes; then
+      mkdir -p tests/tcg/$target
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
-      echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
+      echo "EXTRA_CFLAGS=$target_compiler_cflags" >> $config_target_mak
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
-- 
2.35.1



