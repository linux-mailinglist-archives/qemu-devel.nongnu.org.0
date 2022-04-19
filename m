Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994015067CD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:38:50 +0200 (CEST)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkJt-0000lu-MU
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1e-0007UO-BE
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:20:01 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1c-0001Qw-J2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:58 -0400
Received: by mail-ed1-x531.google.com with SMTP id 21so20486005edv.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMXdqaBvBQuHrKpie85Ska6hXE6seJj5amvl/y2ZlaY=;
 b=nVXI0+53PfORPEwH5joHyNzEk2cE8lUMShX7ZZk5qERItX4hOBw63o6ZiWuOot10wR
 2yWVMfYya5pNKNRPk1QEWd3aPlgkB5ea2EQGGxjbTaWKujF0IvNSbsOFBhO3Yfen3tro
 80ucs/dSC8XqI7ZsJIGBVXO5cQzNh+fY+LR+1b/olrdqKaVT7eyqaX/lFIvNLL5g67F6
 /bLuYmSFW3TTED6hyEby1mhvbtuuBrJI2EnbC2i+Yhhi90YI/G/kkmLHd8UoKNjtfBib
 IB37cfv2Pstx9ec6eJkwndPl172P72bICzqwLlhm8WILkhVTHKNqCn9U+hduPkXDxa6f
 PlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMXdqaBvBQuHrKpie85Ska6hXE6seJj5amvl/y2ZlaY=;
 b=r5Y6r4npuJA+dfI25Dvn1lEzUomQ2GpLmzC3r4iJKJZJ94Nl8SXIpNBXS7n/Xln3Ad
 1K+PSBRLGHYqbXRY5NCQTEPeHlk8dvEu0SSsDisPMc55IOmy4yD5o/wzI9pfgxM4tyFO
 dEBLRFQgxGGwDmP9ouXt9T508uBvHdp56gyXvY2ghdjVJ3wPrBEfCPwWWJR0FXDJfy8G
 XAX50f4yVL5HyS5/m69anuMRMf+VCpZIvqIpHnz8jLLl37v9m6cEMzqdrKf9QvAJZgqr
 LlnolaahQjg0Yp2OtIeBZ6qSN8ccyXsvXw3NtI/tM1TCuO0teKbBmX1hkqc2c1S+YrNI
 FeeQ==
X-Gm-Message-State: AOAM5332jqMrvDQh2eQIB/Qn9K0aZC7ZJB2KCF517ubR0wxogsLhoD04
 748rI7/mRfvG/ZM8iPyCOtxJLA==
X-Google-Smtp-Source: ABdhPJx2px5J8YbeN6+Ndp8ymBu9+Tovx3u8jBOfjzPJhdd+4w9EMlrwCpIx+WQ/BODbs4dGOxL18g==
X-Received: by 2002:a05:6402:1148:b0:416:a4fb:3c2e with SMTP id
 g8-20020a056402114800b00416a4fb3c2emr16380879edw.182.1650359995306; 
 Tue, 19 Apr 2022 02:19:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a170906134c00b006ef8be0e8e9sm2953602ejb.168.2022.04.19.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B6C551FFC8;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 16/25] tests/tcg: list test targets in Makefile.prereqs
Date: Tue, 19 Apr 2022 10:10:11 +0100
Message-Id: <20220419091020.3008144-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Omit the rules altogether for targets that do not have a compiler.
Makefile.qemu now is only invoked if the tests are actually built/run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-14-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.30.2


