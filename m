Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B1508FED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:04:01 +0200 (CEST)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFcO-0004bz-CS
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl8-0002Dq-M1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:58 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl6-0001b0-DQ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id s18so5288869ejr.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uem0wyrZ6v+AcRDIlt17tGMx1nakk4KRW34kYReCC3Q=;
 b=Bug9Gxf+ke8GYv3S/u9QOVvAUsGT2zw4jyJR1ut4jN3JYYF5VewHAcj4TgJ8l6aYCz
 mDdj++WDV75IQqWTgdOZTl7/CxmDZbdu7PUPymsH14YKLmgCuUoa5F2WJm/CMDVk5CPu
 GS2EfYNC5gMFNGPHrMgp3hNDgikVhey13r2DgOUkSp+cqiDfXd3CzlPW1H1btkFx997a
 p4cT95/1P9ugBgx+eXmN8XoiaxrTyX1NWOWwPbZutO6wGLTNicXyI+yP9mO2nS1iJ2+c
 usuAGadOXsgmkMDcUzTwuDH04QW9yFgTOXJwiIlBVC642hlVZ5nftL97Zz5QzeCQ6KUo
 YSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uem0wyrZ6v+AcRDIlt17tGMx1nakk4KRW34kYReCC3Q=;
 b=XsO2HJhOI2WJJCrIUwnG+bqoRntV0tDuPtbwRaBPNQK3vhUW/ubexVClTlhwOxo3P8
 Frn0vjYeWSjLSoodmIGuhFP99JuHmjvjrruFLc/qu4OMcSBtTt2mM+lWAVxJEbmVj/Rt
 nklQERec5SumFyZ9aU86q0vOzlJVsLmdwlIUjl5NT7BXJw7hslZ/rG+G0LyKjmnDqkNX
 L4RASk6HMy0/CS8mJ4IbTaa4frrgj1CxKoCn0UdG1IWShqnqSKZbvjSSANHTbcGmV0eB
 YDEGmFlRjU9AhR29A9E3/6g3o3451TvwzP19NG44t4ztP2wd2B4P+nY6njhJR8KOSN1E
 6OMQ==
X-Gm-Message-State: AOAM530AyAE2cY4o7Y8wUs8g1z5J83GpI3DyWVo08lTqkkzVAlN+4f/1
 MgXEGQFKxYZTJQpMiRFRxe6V5g==
X-Google-Smtp-Source: ABdhPJwShbVZXGduAp9X63joZCvI5MxXfnIc55q2qpVDmmBoBm03VjtK1kcKBuVBQC+SFcxFu9uQ1Q==
X-Received: by 2002:a17:906:6841:b0:6cf:9c02:8965 with SMTP id
 a1-20020a170906684100b006cf9c028965mr19422745ejs.440.1650478134808; 
 Wed, 20 Apr 2022 11:08:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r29-20020a50c01d000000b00415fb0dc793sm10607022edb.47.2022.04.20.11.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AB271FFC6;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 14/25] tests/tcg: remove CONFIG_USER_ONLY from config-target.mak
Date: Wed, 20 Apr 2022 19:08:21 +0100
Message-Id: <20220420180832.3812543-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-12-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-15-alex.bennee@linaro.org>

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


