Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4648C3B3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:07:21 +0100 (CET)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cPQ-0008Oj-BC
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvU-0007e6-Ht
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:25 -0500
Received: from [2a00:1450:4864:20::52d] (port=33754
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvS-0004kV-UE
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:24 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b13so8954549edn.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Dofen9yGQk4H2fZxtbFrTLfDJ0qI4JPBaMuVHuukOA=;
 b=GMJFcD0pOA8Soihk5pTff67Rr/Ibm4wVUCc1+oIOEvDeYKYl5GHolHturjhBVDHdeU
 YOZAtZwM1bIgtOIX9afgZr8jSqeaHefk0BgdeulgjQNGjJKkM+is1JnWWDo53bbO0Idp
 THZmYQuLMKmqDzrw7lFgrXAcHJO0quhbrwXCoinksZiDN/vxJc5ywEhdf7Q/mNJOUcUm
 n3SzATertEHHH8IVqn/lTWg+Ern7j/KM+p3/eXtI+wZymMOudjq5XYlRw+rb3UTDP61U
 IFxIrYEIzFapXb6SaJV9/h6bR5pVOgaX5FT14cYaeRtB3f25MGlvbSyzTuafZBRYwcy5
 2t9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Dofen9yGQk4H2fZxtbFrTLfDJ0qI4JPBaMuVHuukOA=;
 b=4J0PFsrf2Mh8LCio/P/8+Qaiq2RqSdxYSrI6ACOVVc2ocDKkKUzrJwL3bbar5Y7I+T
 6QBenC4PukxQB3xnkzjmOAxlQBmYryzxCkCu/btJN23bDgny6GAf0P/6+VAmCZfFFUmZ
 6XkSYY+TQBVSr/XXc7RF01qULfWZUjxVfVdxUM50nwhf4E/0X2yPtSrDZue8jbgpcQcE
 bpeeOzZyLdvakoQjahPIGbzOb1FmcynhmywwxPZy8leG1SFlMZb2yBrpXYVjqEKyrBxD
 Lv6TSAHR8KEB4T6dNY3XaAfdYnJmAUTRL2Y0jfpBPszoj/RApVVbRjIrWndd6Eu24lCe
 UMLA==
X-Gm-Message-State: AOAM5314CI44PvEl37KgELhUBVk1EugKV6P6io5QMWvL6HUWEXS+fpEW
 g91B20GBtkqIvNB+XTFpawaaHg==
X-Google-Smtp-Source: ABdhPJy2DQkK27Nu5XJjjNvX4FaR6PWvWYuIuR8ikp0qFZHAEIDS8/STko+7x1VSEz8Cb3i/PJZkEA==
X-Received: by 2002:aa7:dc53:: with SMTP id g19mr8526761edu.294.1641987381614; 
 Wed, 12 Jan 2022 03:36:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm4382351ejc.168.2022.01.12.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F35A41FFCB;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/31] tests/tcg: use CONFIG_LINUX_USER, not CONFIG_LINUX
Date: Wed, 12 Jan 2022 11:27:10 +0000
Message-Id: <20220112112722.3641051-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The two more or less overlap, because CONFIG_LINUX is a requirement for Linux
user-mode emulation.  However, CONFIG_LINUX is technically a host symbol
that applies even to system emulation.  Defining CONFIG_LINUX_USER, and
CONFIG_BSD_USER for eventual future use, is cleaner.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211210084836.25202-1-pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220105135009.1584676-20-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 8eb4287c84..309335a2bd 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -225,8 +225,14 @@ for target in $target_list; do
   echo "TARGET_NAME=$arch" >> $config_target_mak
   echo "target=$target" >> $config_target_mak
   case $target in
-    *-linux-user | *-bsd-user)
+    *-linux-user)
       echo "CONFIG_USER_ONLY=y" >> $config_target_mak
+      echo "CONFIG_LINUX_USER=y" >> $config_target_mak
+      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
+      ;;
+    *-bsd-user)
+      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
+      echo "CONFIG_BSD_USER=y" >> $config_target_mak
       echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
       ;;
     *-softmmu)
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index a83efb4a9d..dec401e67f 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -10,7 +10,7 @@ MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
 # Set search path for all sources
 VPATH 	       += $(MULTIARCH_SRC)
 MULTIARCH_SRCS =  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
-ifneq ($(CONFIG_LINUX),)
+ifneq ($(CONFIG_LINUX_USER),)
 VPATH 	       += $(MULTIARCH_SRC)/linux
 MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
 endif
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index d7a7385583..4a8a464c57 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -8,7 +8,7 @@
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
-ifneq ($(CONFIG_LINUX),)
+ifneq ($(CONFIG_LINUX_USER),)
 X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
-- 
2.30.2


