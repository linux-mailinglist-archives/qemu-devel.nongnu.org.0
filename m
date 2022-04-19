Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5D5067DE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:40:10 +0200 (CEST)
Received: from localhost ([::1]:40466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkLB-0002N0-J2
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsm-0005VU-HM
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:48 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsf-0008SE-VK
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:43 -0400
Received: by mail-ej1-x629.google.com with SMTP id y20so11396762eju.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0g/7YkRkRJlbpc3p21xXYbGdbz93o1Ac3png7GbfMA=;
 b=gTcCEQUAsTnUo8RajFXoBp/vEHU3hNg5L9gGpmO6SGAjEGlth1ioIvDgBb5ZD4o24O
 455/d06M9Z2wAZtZEhanoAi+POjY+p4KprN66riW4G4lb9mBs+syFw3KLk3TD7bItzsQ
 DosP0Tkh+9qrttv4C49D0zybCUjfrMT1er8VSeibMD7BZEQnThIb7b/y8PsAaTkPmNPv
 YUJ5n4DwdL3Sad9lmWM15tQLqm725ADX0V8eodkI1AlCw6tCt3177ks1fIUBt0nX7YGP
 Pw/66eNc+6n4qCyh9TFWO6RQEK2YHw6KKzbUFtZhBnuKqfhsUGcOApSOh9j0zFZd3jx9
 ujGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0g/7YkRkRJlbpc3p21xXYbGdbz93o1Ac3png7GbfMA=;
 b=e+kRd8i+stx1poFoBo8k4lMCUksetahzv0Ov6Z+DTfPki4MrtqPhhhNRFGn8irdQyV
 900QWgguNGWRBSw/vqRzS08GY496bUv7wV7oqCZ+lYaqL5zOKNRRoaknBd3mZfBEIQ6k
 TF0utXc26CEhBh2rzqgE14xUEnoq6Xhw9Isdp79muhAqESHdUcwMOE4EvFKBEAy5SdP3
 WGHO8wbBGhZLg3ETK6ZfDFy0bUEma8n4mx5PntJ1vJShj1E9fG55kE0xDh8XS+QCdsqU
 RO2pHH/WFhjCQNZBH80FQMyz8+pv17rP34qlDEnQcKjxP5rb8dVjjjWxn2BXGQz4eh+T
 bByQ==
X-Gm-Message-State: AOAM533yzC5TBb8XXTcDkYKlNaGyruXxs+azcsleCl70H0qJ2EOHUPYR
 u8F7F1XVJpvXU6p1MG1kGx/T1A==
X-Google-Smtp-Source: ABdhPJzH/b6QnauZWQNycVAzpN5CXoLcx2L8z2rxB6Nbeejli3+Y5L+LcGiWgr/iVJ1700Rv2cRrbA==
X-Received: by 2002:a17:907:6e03:b0:6e8:c12b:fb3f with SMTP id
 sd3-20020a1709076e0300b006e8c12bfb3fmr12600995ejc.98.1650359440682; 
 Tue, 19 Apr 2022 02:10:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a056402238200b0041f351a8b83sm8118683eda.43.2022.04.19.02.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C57D1FFC6;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/25] tests/tcg: remove CONFIG_USER_ONLY from
 config-target.mak
Date: Tue, 19 Apr 2022 10:10:09 +0100
Message-Id: <20220419091020.3008144-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-12-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target |  8 ++++----
 tests/tcg/configure.sh    | 12 +++---------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index acda5bcec2..c75e8d983f 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -34,7 +34,7 @@ all:
 -include ../config-$(TARGET).mak
 
 # Get semihosting definitions for user-mode emulation
-ifeq ($(CONFIG_USER_ONLY),y)
+ifeq ($(filter %-softmmu, $(TARGET)),)
 -include $(SRC_PATH)/configs/targets/$(TARGET).mak
 endif
 
@@ -44,7 +44,7 @@ COMMA := ,
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # $1 = test name, $2 = cmd, $3 = desc
-ifdef CONFIG_USER_ONLY
+ifeq ($(filter %-softmmu, $(TARGET)),)
 run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
 	"TEST",$3)
 else
@@ -91,7 +91,7 @@ QEMU_OPTS=
 #   90s    with --enable-tcg-interpreter
 TIMEOUT=90
 
-ifdef CONFIG_USER_ONLY
+ifeq ($(filter %-softmmu, $(TARGET)),)
 # The order we include is important. We include multiarch first and
 # then the target. If there are common tests shared between
 # sub-targets (e.g. ARM & AArch64) then it is up to
@@ -153,7 +153,7 @@ extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
 
 RUN_TESTS+=$(EXTRA_RUNS)
 
-ifdef CONFIG_USER_ONLY
+ifeq ($(filter %-softmmu, $(TARGET)),)
 run-%: %
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
 
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 57026b5899..0d864c24fc 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -225,18 +225,12 @@ for target in $target_list; do
   echo "TARGET_NAME=$arch" >> $config_target_mak
   echo "target=$target" >> $config_target_mak
   case $target in
-    *-linux-user)
-      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
-      ;;
-    *-bsd-user)
-      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
-      ;;
     *-softmmu)
-      echo "CONFIG_SOFTMMU=y" >> $config_target_mak
       echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
       ;;
+    *-linux-user|*-bsd-user)
+      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
+      ;;
   esac
 
   eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
-- 
2.30.2


