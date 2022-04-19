Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D05067F7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:44:42 +0200 (CEST)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkPZ-00089Q-Qc
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsp-0005XO-7R
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:52 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsm-0008Sx-8v
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:50 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l7so31582725ejn.2
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SKBn7TAAlntoysJx3Eu5dxtcs/hYSUSflfkP5bBE/3M=;
 b=HutMYUt8/+8pXyHHcDQRXsen9X72xcFWQ6jLAw/htVqIVSKKR/emwaAPeWnGmkpNIK
 ouXMlAJ5nmaej5ZA6YJTTkSfo0cHxO4VXdwk0wA5a7vgHoxtBhNKOf6tZUbMRvDdqBQl
 Cg8QE5Av9Y9TpRStzqagJeUBwRxDWmbRyijpN02IOkUCeAVtddMxlkyosA68Z8JL9iGE
 OvypmFnnpRucKHvtMIF0xGt9/sYo4TGuKk/RhJZLhBKMrBmdP5vYB/eZjUnPln/5/qEO
 WK+q34InrhO79DXNrogw4iY8qnon/R+4BOrue+ESKzpliQbPySqXkZXsaKM6FtgXQrhR
 TGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SKBn7TAAlntoysJx3Eu5dxtcs/hYSUSflfkP5bBE/3M=;
 b=TZXY7ebeC+CsznZArUmyxTH/yKnLI4/5djSMvxhOyFlNdN/X5EbNRJpHH5aXTmKSsb
 anioXD8ma5OM22zMM/vm1T/DuvCVu0b1UnyNyoNedhkLnhYwXlv/bR7i1OOUTsOd0g6E
 DkIpkjQJfym6PMD9URSHCk7mcYkdv4vPL7b6QPraAcbKtHnN4qfIa31qCD1/pAgdu/UP
 u/4n3cLBE+fZnbKOTGj8YK5HxZ3xoCFiUt6oBUDfqVmmtO6K0w1ovy48oTVdiPOr8Raw
 3ER4Ugr5SfsCOToCFe6WpCkNIQePN1pRUtMLF6mGmkD18EDvdNDADS+iMgY/sRPVAz/F
 /qKg==
X-Gm-Message-State: AOAM531IEbcYcpOo4PsiZG1duFemM/eGsFvoNswUVaNrc96WWw1RpByG
 sDXdcaZr4WhSAniBC1oBo7nL7D5lVWrX7A==
X-Google-Smtp-Source: ABdhPJzLs64rhWdnFlBJTA27P/noyYXxKqYrIQpoBmwci5ejPuTkqvXS15+G3aO659TNwAECVY5pLQ==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id
 l4-20020a170906794400b006dab8342f3emr12790552ejo.353.1650359443789; 
 Tue, 19 Apr 2022 02:10:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b006ea4d2928e5sm5451364ejc.218.2022.04.19.02.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E6FD1FFC5;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/25] tests/tcg: remove CONFIG_LINUX_USER from
 config-target.mak
Date: Tue, 19 Apr 2022 10:10:08 +0100
Message-Id: <20220419091020.3008144-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220401141326.1244422-11-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.30.2


