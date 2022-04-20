Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F6508FAE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:47:22 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFMH-0005hh-4K
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl5-00029V-8Q
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:56 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:47098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl3-0001ad-E8
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:54 -0400
Received: by mail-ej1-x633.google.com with SMTP id t11so5119922eju.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MrPtie6r+qr/yFRgb4nLSe75TU6uNJoD0wz3bvVh8mg=;
 b=DAXVzX5Ai0n4rC+dQTjkfkOE1yeZeTkTqPCMgyGRwOaXAcamz+JcRg+pNXD8EwlEK5
 KsTVWSw6WAOCyvPm4nId8S9PMttHarKK5XLL+QHVjEWg0S/5aOxwGxOmE8vKYrveOupb
 J2wPFu8Hz38Wa5Ee54oviL/W3gLCiiCuWMAQpOP37xPfdWempQuXlzjHBUbApM8Yijgt
 oXbXz7/LT4kH29HuNjM3rjJTje6OsRI2USwDCHLaVSi/rIz/v4E0nKt+qOM1FUOf6JNU
 nUmjl6iK8tt15J3rW4G4g+D9irVzk8d7zpm3zPRuhHwRJbJJuft6DVvwYQKCsRlcDo9I
 6hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrPtie6r+qr/yFRgb4nLSe75TU6uNJoD0wz3bvVh8mg=;
 b=7Pksmj3DIjK517Al8u3yT9073ajOxdorSWkk8B3rrwdL3JfPfRHWKoKEAS0/Mfxv15
 u6xePED/D4AB5M0rCc8B2ku9NbRyG5WGOsQSGoRKtly6QRgbpZQR/qs6k8LcAlLWyv/L
 yOeMvaGmNp5sdLVAI4dj/C50bBZVYvz1LJP8bV1G6D2aChHeUQv6/At4slFY+4b14i5b
 DcV9Ll4MND8ehPPbkxHrU/CUpF5DgCQ8R5GQcxmI7MWoK/XmbpvcPoUvNtQSX5/RxOBS
 H70FlStk9aVURAoe6P9wXrrlGFLvg6J8GfkObrQ6mTHrxxBNxHSmbP6NxnXdvPNajYSp
 0OQA==
X-Gm-Message-State: AOAM532ixb+sUZfPCPdkoCVJ5w+IQRnpsg4XmWrryvMlDXWQ3QCYGKar
 vr28HNyBgUatWlnF+6RL7aJ44pyfEHL0xQ==
X-Google-Smtp-Source: ABdhPJwWGe0bNQveeKMGJakIWBxJaM9fvA1tyPNOswoJzSTTwJR6GEyox/U0zyzNhdrAfo0np3RJQQ==
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id
 gn22-20020a1709070d1600b006d6e3b69cd8mr19320101ejc.94.1650478132197; 
 Wed, 20 Apr 2022 11:08:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056402400b00b00423e5bdd6e3sm4882002eda.84.2022.04.20.11.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A91B81FFC8;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 16/25] tests/tcg: list test targets in Makefile.prereqs
Date: Wed, 20 Apr 2022 19:08:23 +0100
Message-Id: <20220420180832.3812543-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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

Omit the rules altogether for targets that do not have a compiler.
Makefile.qemu now is only invoked if the tests are actually built/run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-14-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-17-alex.bennee@linaro.org>

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


