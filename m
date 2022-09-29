Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2985EF631
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:14:35 +0200 (CEST)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtN4-0002fu-4n
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwE-0004bu-JR
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:46 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwC-0001Cr-IO
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id h7so1731149wru.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vrIiwWvYH6Oys260k16Iv1ACdB9Bz2M9k9kQGx9jGO8=;
 b=NEz0xA7EmC7GvAKB+xPqUJT1o6R46etOMgRwbvtiotuAQaJcIjZFTEnW/oMWRhNYs2
 pi0Wg6fGSBXxYjbyrUGrNu9wLirlTsbmtBAU/DK8HOMXv4suR17i4Xcr4Tf4pgD08Ngw
 /jz7mvOIY4bULsy8AUTYA/BlEMWfPQxMuSoMFcyZHWdbDH6bxcLOisN3hy8I6UdnThrJ
 lnFZy/qLwkxXjEKSq2ZzzN1cYKzoFcFZt2JiPqOYFVSwdFIqxpqOujLRabWCLZkb+ECH
 /QlMmebUr1Aur7LMCLcteAUgfUh5DhX7hAAHDQ1gLioDsBm9bBieMm0cSsEcbZoar1uD
 FyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vrIiwWvYH6Oys260k16Iv1ACdB9Bz2M9k9kQGx9jGO8=;
 b=K275TTR0tUpPS1nwY1/vF7k/U2VlbhrW6p+SuFA7OibkyroE3v2f6QtfB+8k8PiAcb
 HcTYPVZF4hJTQGWiW/IKJs/sa2Wwb594auI7p7Zi5LP/iyvkjdCGHZ0OY1IHVKxXXEny
 zN93SMM+3Qg8533numl86edm6ceOnRB106rPwAiumoz5oo0u0j83k0m1XvgeumB11KaY
 P3/D1yMXYaPDJbcmE/+ZWscND+3Ve6amnSMHq4uufNOOCcxkbmFIW6JPhMjvXRXYIasx
 bPHjSPocNZ5jqf7sI5/8WZmwgf863swtGPz+4i9ikidBgxafD3mu6+j3UHHxm3AEDjNJ
 qMoA==
X-Gm-Message-State: ACrzQf05WATMKEZiuyvaKc3K6r0NR89xMdLE4Ec+892X0em9QqzA2y0T
 QvkLjSh9NvrdCWF9C+KMg4h/0A==
X-Google-Smtp-Source: AMsMyM4xPI8dHAlJAByKOQZo6sIRcFVNErmKOj1sQk+ihfuHENalbsZIDrWRXYeu7N3HefGMpcHkaw==
X-Received: by 2002:a05:6000:1561:b0:22a:72a1:e3f1 with SMTP id
 1-20020a056000156100b0022a72a1e3f1mr2023108wrz.456.1664451763790; 
 Thu, 29 Sep 2022 04:42:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d5150000000b0021f131de6aesm6227767wrt.34.2022.09.29.04.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66E791FFC9;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 19/51] tests: simplify Makefile invocation for tests/tcg
Date: Thu, 29 Sep 2022 12:41:59 +0100
Message-Id: <20220929114231.583801-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Remove the DOCKER_SCRIPT and TARGET variable from the Makefile invocation
for tests/tcg.  For DOCKER_SCRIPT, resolve the path to docker.py in configure;
for TARGET, move it to config-$(TARGET).mak and use a symbolic link to break
the cycle.

The symbolic link is still needed because tests/tcg includes dummy config files
for targets that are not buildable.  Once that is cleaned up, the symbolic link
will go away too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                 | 23 ++++++++++++++---------
 tests/Makefile.include    |  9 +++------
 tests/tcg/Makefile.target |  2 +-
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index ad70c81bfe..784b77ae90 100755
--- a/configure
+++ b/configure
@@ -1815,6 +1815,9 @@ if test $use_containers = "yes"; then
         podman) container=podman ;;
         no) container=no ;;
     esac
+    if test "$container" != "no"; then
+        docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+    fi
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2184,16 +2187,16 @@ write_target_makefile() {
 write_container_target_makefile() {
   echo "EXTRA_CFLAGS=$target_cflags"
   if test -n "$container_cross_cc"; then
-    echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
-    echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CCAS=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
   fi
-  echo "AR=\$(DOCKER_SCRIPT) cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
-  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
-  echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
-  echo "NM=\$(DOCKER_SCRIPT) cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
-  echo "OBJCOPY=\$(DOCKER_SCRIPT) cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
-  echo "RANLIB=\$(DOCKER_SCRIPT) cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
-  echo "STRIP=\$(DOCKER_SCRIPT) cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
+  echo "AR=$docker_py cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
+  echo "AS=$docker_py cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
+  echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+  echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+  echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+  echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+  echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
 }
 
 
@@ -2630,6 +2633,8 @@ for target in $target_list; do
   fi
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
+      ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
+      echo "TARGET=$target" >> "$config_target_mak"
       echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3accb83b13..826b1895f4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -50,23 +50,20 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
-            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        DOCKER_SCRIPT="$(DOCKER_SCRIPT)" \
-                        TARGET="$*" SRC_PATH="$(SRC_PATH)", \
+            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS), \
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
+                        SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        TARGET="$*" SRC_PATH="$(SRC_PATH)" clean, \
+           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
 .PHONY: build-tcg
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index c896d1033e..b9c3d247e9 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -31,7 +31,7 @@
 
 all:
 -include ../config-host.mak
--include ../config-$(TARGET).mak
+-include config-target.mak
 
 # Get semihosting definitions for user-mode emulation
 ifeq ($(filter %-softmmu, $(TARGET)),)
-- 
2.34.1


