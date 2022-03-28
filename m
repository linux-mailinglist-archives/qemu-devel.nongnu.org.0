Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29004E9913
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:14:09 +0200 (CEST)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYq8H-0007pu-1l
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:14:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxK-0001j4-Kw
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxG-0004jt-70
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MCxxax9wq8kNEPq5EpixvBBE6JvifmLwRPXsQ37P8g=;
 b=WE30IRl+2dhHIogrdxAXxBBNSYsmjrDGHb1SzO9izOKaF6KB+9L06ILVOHncZni752WyWO
 CWE2Ku47KHKBhP7s5ITZ19l6BO+Gbh4M5LXr0D7lC7tWt+EuYWaW5KvW3YheCg9nuA+PwW
 ECwcKnRCISjClVqe24i58wDX9RLZmYA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-4iGG7qE6MTaoVjfv3-bzCQ-1; Mon, 28 Mar 2022 10:02:43 -0400
X-MC-Unique: 4iGG7qE6MTaoVjfv3-bzCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 914292A5957B;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7893B1121318;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] tests/tcg: invoke Makefile.target directly from QEMU's
 makefile
Date: Mon, 28 Mar 2022 10:02:38 -0400
Message-Id: <20220328140240.40798-14-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build the "docker.py cc" invocation directly in tests/tcg/configure.sh, and
remove the Makefile.qemu wrapper around Makefile.target.  The config-*.mak
files now include the actual variables used when building the tests, rather
than the CROSS_* variables that Makefile.qemu used to "translate".

This is a first step towards generalizing the cross-compilation infrastructure
so that it can be used for firmware as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include    |  40 +++++++-------
 tests/tcg/Makefile.qemu   | 110 --------------------------------------
 tests/tcg/Makefile.target |   3 +-
 tests/tcg/configure.sh    |  28 +++++-----
 4 files changed, 35 insertions(+), 146 deletions(-)
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
index 083b09c742..24543cc09f 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -185,4 +185,5 @@ gdb-%: %
 .PHONY: run
 run: $(RUN_TESTS)
 
-# There is no clean target, the calling make just rm's the tests build dir
+clean:
+	rm -f $(TESTS) *.o
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 05e1ac507b..5c95adfd0d 100755
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
+                  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --" >> $config_target_mak
               fi
               if test -n "$container_cross_ld"; then
-                  echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
-                      $config_target_mak
+                  echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --" >> $config_target_mak
               fi
               break
           fi
@@ -367,8 +362,9 @@ for target in $target_list; do
   else
       continue
   fi
+  mkdir -p tests/tcg/$target
   echo "QEMU=$PWD/$qemu" >> $config_target_mak
-  echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
+  echo "EXTRA_CFLAGS=$target_compiler_cflags" >> $config_target_mak
   echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
   tcg_tests_targets="$tcg_tests_targets $target"
 done
-- 
2.31.1



