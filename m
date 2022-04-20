Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BDF50901A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:14:01 +0200 (CEST)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFm4-0001ba-Qu
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhErB-0008SO-5h
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEr8-0002MW-HQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso4296476wma.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uhmh9to/JkQtkjRI7wXOnfGqe1NXCIBkoM9Ep7MMlbI=;
 b=xT3CS10F2FY2cX45ZiEeVDy2JTr5Lh21mCT7U1q1MY8yIGVTI8IimEb0ew7AGHLXBR
 h9SiHdAexYdyPjsr3czjL/k66TQZzkkkWUUM1IQnaqarZzE+2/3dCy1VsZ/Ga/FAulyq
 eL6tZUtjD3jl7em8J2u/QWiE/bvq98zdiQP9O5UZaw8t6qBqUbFYd+yJwi16EyoOFR76
 1zg383oGrph1PF6rcgt7mI1sCwI/LtT1pyKz+egMbG0XnFSfjtSaD7FGJ+x7PSQ7zz6M
 SAJ+6I7baq5GsmXUHD7YsbPIQ0U3jv0I0Us8q6p+ZA6Ujf9310oLLuyXy5a80KUGpmyg
 0ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uhmh9to/JkQtkjRI7wXOnfGqe1NXCIBkoM9Ep7MMlbI=;
 b=Bfcd+DEV5OAX3EYXafG3ittyYKJI7SHwXbh1cvgjjyvq4AKgx+URmGr0nbZEGqkvCZ
 wty+qVCFVzlBNgdDX2W9JosQHvqaiArgT0Wil+AO2N7CjfgZOruObUui3wimTtQqj6Ue
 MGasoue/zc3z5LX0Rs1KuG9xwQSe0inXoXXLv90CohQAAWhlFfbyG7Kzl/aTpEaja1Xb
 R+6uiJOcD24dQkYmtKQpwfiDBqAhlpLhkxlnoEpCGUBq4b3d3jYT2xVoAxP0N6dmqRXh
 K+p4Ff3xmHzKSpsZSHLoqo1O8GHFT8G14acpaNmDq0blHzsb+kRSW5jhdyZ/SsmYpf85
 vZpg==
X-Gm-Message-State: AOAM533Iul8MeMdpAXRpm2HVUD+ABCbZJ6/lLCjPu73G3Ew9HjD8dn0P
 TuUoj/ApcJ6GazNA6iUmC79+OA==
X-Google-Smtp-Source: ABdhPJzQdvHZV0MKMDNrKP/XR5rm/K1iA3OPloFfKVbKiOUisoL5eJlgT79KuWtTjCILd3vrf+0ofg==
X-Received: by 2002:a05:600c:4e4a:b0:392:88e1:74a7 with SMTP id
 e10-20020a05600c4e4a00b0039288e174a7mr4934671wmq.174.1650478495270; 
 Wed, 20 Apr 2022 11:14:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a5d4149000000b00207adbc4982sm410442wrq.94.2022.04.20.11.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD39A1FFC9;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 17/25] tests/tcg: invoke Makefile.target directly from QEMU's
 makefile
Date: Wed, 20 Apr 2022 19:08:24 +0100
Message-Id: <20220420180832.3812543-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Build the "docker.py cc" invocation directly in tests/tcg/configure.sh, and
remove the Makefile.qemu wrapper around Makefile.target.  The config-*.mak
files now include the actual variables used when building the tests, rather
than the CROSS_* variables that Makefile.qemu used to "translate".

This is a first step towards generalizing the cross-compilation infrastructure
so that it can be used for firmware as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-15-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-18-alex.bennee@linaro.org>

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
-
-$(RUN_TCG_TARGET_RULES): run-tcg-tests-%: build-tcg-tests-% all
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
-		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
-		SRC_PATH=$(SRC_PATH) SPEED="$(SPEED)" \
-		V="$(V)" TARGET="$*" run-guest-tests, \
-		"RUN", "TCG tests for $*")
-
-$(CLEAN_TCG_TARGET_RULES): clean-tcg-tests-%:
-	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
-		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
-		SRC_PATH=$(SRC_PATH) TARGET="$*" clean-guest-tests, \
-		"CLEAN", "TCG tests for $*")
+.PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
+	$(call quiet-command, \
+            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
+                        DOCKER_SCRIPT="$(DOCKER_SCRIPT)" \
+                        TARGET="$*" SRC_PATH="$(SRC_PATH)", \
+        "BUILD","$* guest-tests")
+
+.PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins)
+	$(call quiet-command, \
+           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
+                        TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
+        "RUN", "$* guest-tests")
+
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
2.30.2


