Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E54EEF80
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:27:02 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIEw-0003pm-2Z
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:27:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI28-0003ne-31
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:48 -0400
Received: from [2a00:1450:4864:20::530] (port=42573
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI26-0006de-7H
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:47 -0400
Received: by mail-ed1-x530.google.com with SMTP id a17so3099126edm.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2NqiyeeSPW3e5hVpO2cR6jIRbiczXLcaet/rTv7pF4=;
 b=YHcLDX2FilnKzd9OndVAqmHScClsAYXhyuVlgRod5f9JoXMRk59F2LY8RJhfRkvS6z
 Fi3uAQL8js8J0ZoFebRckmSsdILpNoUoQBrJ9W+Ge8PfFDQmgRr/i6QlJu7JNj+ftRuQ
 gLnYHW61znEodzgBAeavDv8gPhS6my15EH3chnOBv8Szpigq62Vb8uEMb60S3O1H7NxO
 TgK4M3ZgpouvJLDfROY1/llQKzOORXyk4nfM8k4bfpmgpneY2dLTZk8wCOWbgKlTK522
 3PbZRgNNkx9Yy8yT/jXTUb7XXLjlgrwqukNFRdxGao3fTm4Lpzzw/3ID6z8jSCTZRzQM
 GN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S2NqiyeeSPW3e5hVpO2cR6jIRbiczXLcaet/rTv7pF4=;
 b=cjkbElLeRZVymQNCt7cHpcUpsr9dSMYaAFuXUcS6kMsLEW2o4aCC1hk2j7b3E+G2ZU
 qHXeNP+751aA1+bYctzifv8+m+UkZjxn+rM43orRgqP7KLm7J/L4KxZ6adrbjZ/RvKfF
 k76DgfQLFv9ueBC9MsY0hxmPqEavZGA3oRMoyCvqAnvSdwzs2FyUWmpXbyZeZ9eOUqJl
 ERu2Sl9vfnaY5aZMOcQYoS9qcCG3pRdgk9Dre/i4erwj8KWXKJ0LrqFWMMkHXYW/FXPr
 Rd6PmCtlFAFOjeXydF4k7CU9zP8Pyb3BpCm+VDU2uMvWEXhnDSKVmV1Dr470TUxS/Edf
 uZMg==
X-Gm-Message-State: AOAM531bwB8aAf/MxgNu3eZ8P0rnwf7xDNJGrZdeuwXrb7jKNug9te1P
 FFc7Hv/HY60AavkMoqp4T256SgoTzcg=
X-Google-Smtp-Source: ABdhPJw6hpZVqffweBaPhK2mQCBiWTWlcU0RT46RoolkKg+JkTFdxGtbFiknW47IK4nV7ipHnC09Mw==
X-Received: by 2002:a05:6402:4491:b0:419:4aeb:a648 with SMTP id
 er17-20020a056402449100b004194aeba648mr21431284edb.411.1648822424966; 
 Fri, 01 Apr 2022 07:13:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] tests/tcg: list test targets in Makefile.prereqs
Date: Fri,  1 Apr 2022 16:13:22 +0200
Message-Id: <20220401141326.1244422-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

Omit the rules altogether for targets that do not have a compiler.
Makefile.qemu now is only invoked if the tests are actually built/run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-13-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include  | 14 +++++++-------
 tests/tcg/Makefile.qemu | 11 -----------
 tests/tcg/configure.sh  | 17 ++++++++++++-----
 3 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index b5d0d6bc98..091ca8513f 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -36,19 +36,16 @@ export SRC_PATH
 
 SPEED = quick
 
-# Build up our target list from the filtered list of ninja targets
-TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
-
 -include tests/tcg/Makefile.prereqs
 config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
 tests/tcg/Makefile.prereqs: config-host.mak
 
 # Per guest TCG tests
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TESTS_TARGETS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TESTS_TARGETS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 
-$(foreach TARGET,$(TARGETS), \
+$(foreach TARGET,$(TCG_TESTS_TARGETS), \
         $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
 $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
@@ -84,6 +81,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 .PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
 
+# Build up our target list from the filtered list of ninja targets
+TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
+
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index 84c8543878..cda5e5a33e 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -95,7 +95,6 @@ all:
 
 .PHONY: guest-tests
 
-ifneq ($(GUEST_BUILD),)
 guest-tests: $(GUEST_BUILD)
 
 run-guest-tests: guest-tests
@@ -105,16 +104,6 @@ run-guest-tests: guest-tests
 	 		SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run), \
 	"RUN", "tests for $(TARGET_NAME)")
 
-else
-guest-tests:
-	$(call quiet-command, true, "BUILD", \
-		"$(TARGET) guest-tests SKIPPED")
-
-run-guest-tests:
-	$(call quiet-command, true, "RUN", \
-		"tests for $(TARGET) SKIPPED")
-endif
-
 # It doesn't matter if these don't exits
 .PHONY: clean-guest-tests
 clean-guest-tests:
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 904c351029..e51cd56b60 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -81,7 +81,9 @@ fi
 : ${cross_ld_tricore="tricore-ld"}
 
 makefile=tests/tcg/Makefile.prereqs
-: > $makefile
+echo "# Automatically generated by configure - do not modify" > $makefile
+
+tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -228,6 +230,7 @@ for target in $target_list; do
   echo "target=$target" >> $config_target_mak
   case $target in
     *-softmmu)
+      test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
       qemu="qemu-system-$arch"
       ;;
     *-linux-user|*-bsd-user)
@@ -235,11 +238,7 @@ for target in $target_list; do
       ;;
   esac
 
-  echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
-
   eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
-  echo "QEMU=$PWD/$qemu" >> $config_target_mak
-  echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
 
   got_cross_cc=no
 
@@ -362,8 +361,16 @@ for target in $target_list; do
                       echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
                       ;;
               esac
+              got_cross_cc=yes
               break
           fi
       done
   fi
+  if test $got_cross_cc = yes; then
+      echo "QEMU=$PWD/$qemu" >> $config_target_mak
+      echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
+      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+      tcg_tests_targets="$tcg_tests_targets $target"
+  fi
 done
+echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile
-- 
2.35.1



