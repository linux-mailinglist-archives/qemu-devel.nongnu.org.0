Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B34EEF3F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:22:39 +0200 (CEST)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIAg-00012J-IY
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:22:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI27-0003mO-NJ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:47 -0400
Received: from [2a00:1450:4864:20::62b] (port=34344
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI25-0006dY-Ue
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:47 -0400
Received: by mail-ej1-x62b.google.com with SMTP id o10so6193878ejd.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYWfkb2s9iXIVRdcJNAHIocSfZ6ohdTAP3coLhBDfr8=;
 b=SBHiGfWdmG1MLIXBjfKLSOlIdNInrirp2uOPRaXONngIGdyO6QZezQuPAM4MdUg9WU
 spOeFeJslGGRq4OMCi44ZYdh6AajESjvMVVBA+xbFCQQmRwXCyrB9IVqHcOuN4RLOgB8
 lUS3W8j83blMNdkMsuFFw5yXmdAiCsQrW3R2qMEQoTs4a69FBV/7wrf6bblnCcPbO3yM
 GgHBFOhkkAPDhY9I/YQXPyHZkJv2J8RX+UsSCVx2tmJ8t/spbX2XxgHhW/LdUua1xe4w
 sIXMyzFKR6QmyIBB77In9gehDdvz8ui3SxMXfqILf6p92r58RSiYQY7U4bRSd3pmO+Vi
 hjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XYWfkb2s9iXIVRdcJNAHIocSfZ6ohdTAP3coLhBDfr8=;
 b=y1tA2FFkw920SfCeKfotOdmECYTX21ILwY0VJjXe2q4rwq6CBxi3mhPdoLu8ZTwgoP
 xcbghTWNkzRGkiq7JHy1FeWpSCC6JZk5EXp+c+5JJ0A0Gx0SQ1ADO7BdPcupdb+SpFCN
 caDxgbpoZJ2qHChfDblZ0imaCcs7N4UG5d0Qe/XzQZ8wwToYUpNYh2C8RCXjPWTIeieH
 EDTEQ2VLPZaNbn2AQeBgN8yoAcNax0hqkdPe1eXp5HWXcvy1Uq1h+2297br/xR4vMJP4
 Jylt+Ujn2svrQYxyeFUqfC8X1T+vJtEDSGPYX7hoDHz3oGKF5SWfVvFx8bdx6Tm3+xm7
 ma4w==
X-Gm-Message-State: AOAM530GTB890a0kvJhOAYIcMUK9UxI1pjmT80JI007pfYwUq0WGlfy7
 HS7B32jqEKxme2qPhBgasZ9Zzhzc1Hk=
X-Google-Smtp-Source: ABdhPJz1q2+bLmY1uI6aCcDCzGgX/89VOH0bb9jEDZIohM7sHPkkRBYtUd0XWW+FivFSsDFj1eqfRQ==
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id
 nd33-20020a17090762a100b006da7952d4d2mr42616ejc.260.1648822424169; 
 Fri, 01 Apr 2022 07:13:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/17] tests/tcg: prepare Makefile.prereqs at configure time
Date: Fri,  1 Apr 2022 16:13:21 +0200
Message-Id: <20220401141326.1244422-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

List the dependencies of the build-tcg-tests-* and run-tcg-tests-*
targets in a Makefile fragment, without going through Makefile.prereqs's
"parsing" of config-*.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-12-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.35.1



