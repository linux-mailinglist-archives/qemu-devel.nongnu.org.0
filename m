Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAB50684D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:05:48 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkjy-0001A8-RQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1a-0007RV-6o
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:54 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1Y-0001Px-Dz
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:53 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v15so20381589edb.12
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=18HVvyVsxNNT4szZrpdgPZelaQsmL8IAzeUGHiqEhUQ=;
 b=dP85BJp27MK406dy+hsJcWapn9M2rBMQnkuEXnMMuIElFXsdB7LsXxiLUoj/oUWfwd
 /E5HylllGq+6ppJU4riikg8AH4MsxBdy5Q3LkC33zOiiW/GRxorjkka+9NxTpErwIL3/
 ujRsH+B3uDsKdYGq9jttPaOYsSqZfaWSkcBlTdv2KCrc+1B6ur6v0kZUCIVbBPFrVnSD
 vDu8AECFTeXTjQESJV+L7K3wGP1TLp6v5+WKOm/mRJTuB7psXc7/0CbSUSqadAiMU4Dz
 RgrUKnDCgRsFsMuJV1DYaGIzdf5XZJTkTi9SPMRj9mXbEVygt9mThdXBh2lle/I0Y0O+
 zAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=18HVvyVsxNNT4szZrpdgPZelaQsmL8IAzeUGHiqEhUQ=;
 b=x9HsblvEt6KdzVigPkXHJ3RCGPmZ1tnjENG/l5JJdTOERDfi3/AV2MnZ8GD03hZe0p
 sY4eC+lxSSnT6WeyLUD3kiKHNLkvvsc0W/tKmuf03kqyJXlhULkgQY1ODEk/Q+UJs398
 02czHi+EWfidCZYVZiQ7NDyAZkmocVE/bCqJen1sMTOVyYzKcTZ0EF9TMTiCjfU85FFn
 7QFELmKDVMLgTJLKCZPk35ko0mgJ7hsh8Bb+Ys91yErwPms20sSzyDk8kmjIBSOeI0LN
 LT0DkU9v11YvlPGfSyh/VvkFsSKsOwdK4IkYzNOi/6O8GSev9CsJ1fxAOBmVdI1ls0t5
 sRYg==
X-Gm-Message-State: AOAM532WrLA25j21TFlLji9zDHxGjVVSFG0R8pl4xuhU6KOkXvxZPVIi
 LqGCUidaatKiUWIwrQRFqt3FrQ==
X-Google-Smtp-Source: ABdhPJzW32n1GI4+RKOf4uZ6lmAb8k+XfZXQB7T8NUrrFjspqTfMWg6Dg6PW8SunPPiJGCurVgPAVw==
X-Received: by 2002:a05:6402:1941:b0:413:2b7e:676e with SMTP id
 f1-20020a056402194100b004132b7e676emr16809600edz.114.1650359991056; 
 Tue, 19 Apr 2022 02:19:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q7-20020aa7cc07000000b00423ded189aesm3467454edt.13.2022.04.19.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A61D11FFC7;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/25] tests/tcg: prepare Makefile.prereqs at configure time
Date: Tue, 19 Apr 2022 10:10:10 +0100
Message-Id: <20220419091020.3008144-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

List the dependencies of the build-tcg-tests-* and run-tcg-tests-*
targets in a Makefile fragment, without going through Makefile.prereqs's
"parsing" of config-*.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-13-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include     |  9 ++++++---
 tests/tcg/Makefile.prereqs | 18 ------------------
 tests/tcg/configure.sh     | 10 ++++++++--
 3 files changed, 14 insertions(+), 23 deletions(-)
 delete mode 100644 tests/tcg/Makefile.prereqs

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


