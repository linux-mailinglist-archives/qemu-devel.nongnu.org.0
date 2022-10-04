Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C195F444D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:34:57 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi4V-0002jO-V2
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgO-0007R6-Rc
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgM-00008e-4V
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so703575wmr.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ht3EcFdMZjpHHWXTDaaW7bvMGh1A8/gT1GjW4z49bbU=;
 b=a1qesWspbSKqALIKhsBkPdem1I0Isg8Lz6+nGpdgcHkSKqBQoPBEZlZvlvMW7BYJZu
 Ar61Cya+S1ED2/n96qBvn+9jfXo+pqm6FJtlxTyPMidMybs98eE0Ukt9akitCCX2ckvO
 W0PNp28pzOanJ3UquOAFsR96LLkrZk7jzOy8K4zQKuO1LKbAoeFyotNyxVPVK2JpHjO1
 ZKEDCSJHsfPH+FzfdFFfeBJYRZB9cdZevlhq8wBWET4S6FIaP8SWKHRzO4BV7tNhCq0y
 gAHTtRHVPTi8cM0xvZEjgs3gWmH0c6QFEZOjJZpecmrYYkYBtD9/kWRaykacLfQaVXm0
 CmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ht3EcFdMZjpHHWXTDaaW7bvMGh1A8/gT1GjW4z49bbU=;
 b=EIvOf4p65wqlqs+Xlqp4zz5lxwCsRma/DTbf1e4IMk56yUyYsColnkOtojMbBNB7/Z
 VN0vVbySM0sKWY3YoPc/5hiQTaqs5Ac8pL24nseSyLdpPsOAsgqm4HRDxcCYAaDzBlUE
 oU+rrTAHi9i5rvNHhk+9f3UbKlNtU/GB5CzZi6HUgrpgTFaRrGPbsScyhJSA5LB73DVI
 YshzD+yA0nJvGxpxCHNn49+MJI/Y0p9VamVXEnFNyEwp4IRvSfgIbhPiGIAyBcQYKTwF
 VRD7mE/PsRMvmpKvA3AeA//JluMuqi62rnY+yHFVwaBifzgVzyol4jZrEQ8JQjVG1T9o
 SysQ==
X-Gm-Message-State: ACrzQf252KPkSgyGucmziny7sZ+TbMa6sl1yzWTgonNa8XyE2bOtzGkm
 NCBYjqE493CX7slyWV8ZCMB6PQ==
X-Google-Smtp-Source: AMsMyM4WdB34va3BHwFAZANyrTkEZqQIb/bs/GbjkRTt1KJTRbzS/su7ieIX2WVeKC6SWxMyYuL+1g==
X-Received: by 2002:a05:600c:1f15:b0:3b4:8600:fd7e with SMTP id
 bd21-20020a05600c1f1500b003b48600fd7emr10455472wmb.40.1664888995667; 
 Tue, 04 Oct 2022 06:09:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a1c2109000000b003b4fac020c8sm18731564wmh.16.2022.10.04.06.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 695621FFC9;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 19/54] tests: simplify Makefile invocation for tests/tcg
Date: Tue,  4 Oct 2022 14:01:03 +0100
Message-Id: <20221004130138.2299307-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Message-Id: <20220929114231.583801-20-alex.bennee@linaro.org>

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


