Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE399508FD6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:54:16 +0200 (CEST)
Received: from localhost ([::1]:36650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFSy-0002hC-0n
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl4-000275-2h
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:54 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl2-0001aS-Gn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:53 -0400
Received: by mail-ej1-x62d.google.com with SMTP id k23so5215012ejd.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v2zcpnobRYJz5R1sDIRmg4/sCBbKlCI+NIoM1ZGmmdo=;
 b=ciUZl5KJqQS90TLvlvkulhcWuPIU/WEEMLTGjiw6xEt3IcLAepZodK6ZCtgR2sDWOe
 zeu30ASyHGzJOllQ1Vjt3VOVd8tvRk/blG7GlOTOjCZnLkzNbRw/uUXx0kPuRmA3cHqz
 wRJQlswGfSpGCqhgI73BlyHd565D8ncMLfrt9DRWuqj6HHc0QoBqmz0g58++i6QpY6KS
 Gmw2VlSo4Z0bxMSq7agaeoSte5seGaPtrE9z4M1p/B/qxyuxHtOkbhUxIM8zpqz+mmjE
 0QgvFNbOY9QcEbBurP31QPyTVuDtT3I3nv0B9PFDGXo1wwri1QaEW80IZ+Cggi4yYCX5
 13+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2zcpnobRYJz5R1sDIRmg4/sCBbKlCI+NIoM1ZGmmdo=;
 b=gjf7XScXlim2HQZat9T9MD+vvK4W89VuoWtCvISV/3osxU15vTcmKIUk3kWHI2fTZE
 kxOZTDADhik/BGKYUeQNVjqf/eqk0GiaIU8XBZnywAxZF5uF4A5yrid02Okr3Y1hxrZD
 F/ENZ6dnEy8n1YPJwF74a+6Pg0pi0yMZS8rumV9nD4uZEUnP45/gmSgl4vxfBX8b/cUV
 f/tvr00LwQ2dq1ocikHPqfLJRPa10xtf8Ymbdmur9sYE13hi+g760UcxrgfVMMLe+iVA
 W1jxMHu1eTWYnOPuiE88bM/DFgPvuc1n1N68GT2mc+iH2LU33rCioN4fR0juJUh75VS2
 izzA==
X-Gm-Message-State: AOAM531wMFV3zE3DP9/6mppYnexjPOawTi7vfFwJmyYEgIUI3hJzJIIE
 MRq9EeiXBrzoRy9qm7JbWhd7qj6H4jb5gQ==
X-Google-Smtp-Source: ABdhPJzZU5bk9kcs0Af4Yv+GMkRUGGdpe+AKN3ryXPqrKDAvVPtOwt+EYU1CVxpomLVs1b3Ng1cR5g==
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr19843501ejc.285.1650478131290; 
 Wed, 20 Apr 2022 11:08:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a170906350f00b006e9c9cdb4f9sm6961664eja.202.2022.04.20.11.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 623F61FFC5;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 13/25] tests/tcg: remove CONFIG_LINUX_USER from
 config-target.mak
Date: Wed, 20 Apr 2022 19:08:20 +0100
Message-Id: <20220420180832.3812543-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220401141326.1244422-11-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-14-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 8927a2b260..57026b5899 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -227,12 +227,10 @@ for target in $target_list; do
   case $target in
     *-linux-user)
       echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "CONFIG_LINUX_USER=y" >> $config_target_mak
       echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
       ;;
     *-bsd-user)
       echo "CONFIG_USER_ONLY=y" >> $config_target_mak
-      echo "CONFIG_BSD_USER=y" >> $config_target_mak
       echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
       ;;
     *-softmmu)
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index dec401e67f..6bba523729 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -10,7 +10,7 @@ MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
 # Set search path for all sources
 VPATH 	       += $(MULTIARCH_SRC)
 MULTIARCH_SRCS =  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
-ifneq ($(CONFIG_LINUX_USER),)
+ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 VPATH 	       += $(MULTIARCH_SRC)/linux
 MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
 endif
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 17cf168f0a..f9fcd31caf 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -8,7 +8,7 @@
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
-ifneq ($(CONFIG_LINUX_USER),)
+ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
-- 
2.30.2


