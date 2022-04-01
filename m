Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4162F4EEF7F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:26:42 +0200 (CEST)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIEb-0002P1-AX
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:26:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI25-0003df-CA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:45 -0400
Received: from [2a00:1450:4864:20::52a] (port=36848
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI23-0006dB-Oj
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:45 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h4so3138343edr.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=htpbnRni4wzuFT5jkH0Y5Ib5bx6mTz9ELOiSp0Rgt6s=;
 b=L4ztt78fFs/tia+N/UnwLx6jKdfNKlyFVOQrklxnl0a2wUTnL9Wny9En0274eka0qn
 1Okk8JWtR1AuaKf9K9wpfhsR1rhM7FoFVv5VDgCqlZVI6DnC9s3WHn5gi+bqiMtp/RON
 A/PRJZXdEp0FLCdw+yztN+YEnx6lPFPrFrXm/6A4inhFO+YYP+aQ05YnI381eNTtixIY
 XSweat/AD68q/eCJVEM/MAIc42xAHfIUazUCz/Gngf6Vs+nerJGqJGN7gP3vH73Z0N95
 pm/krnrrIvrUCeoI/U0jp5H942TB+Fc21hX92lVBE9X9Kh3L1G+IlY9TBUNI+dziDWoS
 qKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=htpbnRni4wzuFT5jkH0Y5Ib5bx6mTz9ELOiSp0Rgt6s=;
 b=WKJ0XCl9SFnMB+kvhtufC5wR356M+CyKHl2eV0M/2Ed2IQ+6VqbEO9EWpHZPFYyLB7
 rgE1ob2EAJU7A1peO+yr5Cn0Qh5S86LUgJ70fSfyel8utd/NoQUUsg4kVf2SPiTyfKaY
 1QQK0enI7US+YbuuCXcvpPLxGUJSMMUsT//YqfUyAFwMoNR3/4bgqY4BQNwIdUjY33Xw
 LuvLpRNhdCPleHUbH+6y1grHwq6KzOmBzMQAWjTU2NAp1wJe2/cJbP/qjuV46RPFKcXP
 dJmiElvXlHYxKDgRW+BgefUI2jFWxdMcK6p29xvx6qMjvBwetofFYiRJGteneg4aGc7/
 fndA==
X-Gm-Message-State: AOAM5308s8xM3Gx/tLhWWq7LqK8RUfgVWy8Um0Z7288qU0+0P2bcyxl8
 RT1aCRhdl1JuMVmlzLGLJLaTplNHhF0=
X-Google-Smtp-Source: ABdhPJzL0u3p7GN/Dz9DkQ+lNCQ10eGqFoY8fVqRDxJrqTpMKdzLhzLv/yu7c88vUHqDMtvVqVM6oA==
X-Received: by 2002:a05:6402:3586:b0:419:6059:f016 with SMTP id
 y6-20020a056402358600b004196059f016mr21439470edc.402.1648822422431; 
 Fri, 01 Apr 2022 07:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] tests/tcg: remove CONFIG_LINUX_USER from
 config-target.mak
Date: Fri,  1 Apr 2022 16:13:19 +0200
Message-Id: <20220401141326.1244422-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-10-pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/configure.sh              | 2 --
 tests/tcg/multiarch/Makefile.target | 2 +-
 tests/tcg/x86_64/Makefile.target    | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

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
2.35.1



