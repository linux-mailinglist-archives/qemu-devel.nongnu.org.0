Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1890508FE0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:57:26 +0200 (CEST)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFW1-0008H3-UE
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl7-0002CY-9C
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:58 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl5-0001as-GZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:57 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g18so5146763ejc.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8RBURQF7qORMM+huCUIldjKVJxG3kQJ6LmXmYOxxKY=;
 b=ZSzJdMxQCYuVOgmtMPHTuSOarpxG0EP8hsyA0DAvE/dJRUBcTph7hRpHilWUZ1Jc1o
 +tSGYDBMU+wOSfImwsReyaK0zxtTy7BYeGeQR4GU6TzcN+KZiA+BWzUaXJHz2TsBZ0Lr
 BlNUVW8h/hXMCSBULbbtX7OR+R4qMgRI4vIQ0lA/MVmFuKpba9AyM5o4jmKlL81KpREX
 jaOqRBRVkkGZRie3IjhqhYJ6Qy6QGj0Njm0yDSA8uTQVPIesFPEk8YHAomnVhOmnJ8jd
 +7Rywayq7lP9BiGIz6b/67l1NVRNCYMrHaKHrS1eLnMuyCKq/5hH7maBa6ZS4WcLL7wN
 bKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8RBURQF7qORMM+huCUIldjKVJxG3kQJ6LmXmYOxxKY=;
 b=gp4+lNrvkHgfyofUJ4wx0L8JYHnMdf9cLrsh75W/SzcETVt2n/9VCxOiKk6qDy9X0l
 Q3XCkPyQ19C+hhanLianOZfji6hvvixVh/zhO9nqV2uP+/08LUyfTpw4Z3m99M099iRj
 2EXxnT9shNi9eDSEsAWvm9TDu0u9fYko4Mi1TaXjInvK356nMPk1JqfQd4AbIvofxXhk
 VA7yz54KzjxATscZjrHk3B0HQjjC7/CXeUVnmQ5LwEewzGwmyFcmGpEQGhxxNPc7Kipe
 ZE9lXrf2YCxkM4EiHDF+EYHyiIEymRW30dyl0vKx2En8SH1abhHRZ7bbzBnLZ5chvf4+
 oWRQ==
X-Gm-Message-State: AOAM532loax8iTM/VWEO51TQWviRtuW2sjSKh/Ou/TMu4XhOSjADq3ih
 HYvxaCkwCbo1B6iexhNHBlEEJA==
X-Google-Smtp-Source: ABdhPJw5uSUNAQJhlFYG+tg/NI3bXJNi3DNmtk/5c4iJP6iYdVOmRIt82V0L3QUi6OnhdbQ+ry3PSg==
X-Received: by 2002:a17:907:9713:b0:6f0:12d1:e07b with SMTP id
 jg19-20020a170907971300b006f012d1e07bmr891515ejc.716.1650478134076; 
 Wed, 20 Apr 2022 11:08:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lg4-20020a170906f88400b006e869103240sm6910572ejb.131.2022.04.20.11.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DA6D1FFC7;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 15/25] tests/tcg: prepare Makefile.prereqs at configure time
Date: Wed, 20 Apr 2022 19:08:22 +0100
Message-Id: <20220420180832.3812543-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

List the dependencies of the build-tcg-tests-* and run-tcg-tests-*
targets in a Makefile fragment, without going through Makefile.prereqs's
"parsing" of config-*.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-13-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-16-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 05c534ea56..b5d0d6bc98 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -39,14 +39,17 @@ SPEED = quick
 # Build up our target list from the filtered list of ninja targets
 TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
+-include tests/tcg/Makefile.prereqs
+config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
+tests/tcg/Makefile.prereqs: config-host.mak
+
 # Per guest TCG tests
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
 CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
 RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
 
-# Probe for the Docker Builds needed for each build
-$(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
-	$(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))
+$(foreach TARGET,$(TARGETS), \
+        $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
 $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
diff --git a/tests/tcg/Makefile.prereqs b/tests/tcg/Makefile.prereqs
deleted file mode 100644
index 9a29604a83..0000000000
--- a/tests/tcg/Makefile.prereqs
+++ /dev/null
@@ -1,18 +0,0 @@
-# -*- Mode: makefile -*-
-#
-# TCG Compiler Probe
-#
-# This Makefile fragment is included multiple times in the main make
-# script to probe for available compilers. This is used to build up a
-# selection of required docker targets before we invoke a sub-make for
-# each target.
-
-DOCKER_IMAGE:=
-
--include $(BUILD_DIR)/tests/tcg/config-$(PROBE_TARGET).mak
-
-ifneq ($(DOCKER_IMAGE),)
-build-tcg-tests-$(PROBE_TARGET): docker-image-$(DOCKER_IMAGE)
-endif
-$(BUILD_DIR)/tests/tcg/config_$(PROBE_TARGET).mak: config-host.mak
-config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 0d864c24fc..904c351029 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -80,6 +80,8 @@ fi
 : ${cross_as_tricore="tricore-as"}
 : ${cross_ld_tricore="tricore-ld"}
 
+makefile=tests/tcg/Makefile.prereqs
+: > $makefile
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -226,14 +228,17 @@ for target in $target_list; do
   echo "target=$target" >> $config_target_mak
   case $target in
     *-softmmu)
-      echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
+      qemu="qemu-system-$arch"
       ;;
     *-linux-user|*-bsd-user)
-      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
+      qemu="qemu-$arch"
       ;;
   esac
 
+  echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+
   eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
+  echo "QEMU=$PWD/$qemu" >> $config_target_mak
   echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
 
   got_cross_cc=no
@@ -329,6 +334,7 @@ for target in $target_list; do
           test -n "$container_image"; then
       for host in $container_hosts; do
           if test "$host" = "$cpu"; then
+              echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
               echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
               echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> \
                    $config_target_mak
-- 
2.30.2


