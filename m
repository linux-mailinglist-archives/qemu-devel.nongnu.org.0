Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F99A46FE0C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:41:24 +0100 (CET)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvcP5-00036H-K3
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvba8-00085L-4K
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:48:44 -0500
Received: from [2a00:1450:4864:20::532] (port=40642
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvba4-0002VO-Dh
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:48:43 -0500
Received: by mail-ed1-x532.google.com with SMTP id r25so27122871edq.7
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MIAOBpsRNe2XIXJ8E2SWgfu36FQJPNIIXrVHoTZakXE=;
 b=OI6lszUBRtpLvaKYY8MWdtnJnEaZlz+N5Bi2csanPf2BsoVOqklkd6jsoxwz+kENSd
 06InWKNSYZukFRcyVjUJKi0xlPYe+1VwAgs/+RYnqRwmyziUaLMRo4xdvflzqve/r8iF
 lxSM/qHIU8u1cgtg2boz8+tQ2yN6ZD0cQ0TY9+IPzdNseHno+EI0OF+D4lqeIjC5YGdE
 55zLvPGC5H1wn7IV4lJtEzSI2QJdeDFSx+qj+GUxREKjyFeVyD6k726utksS6ytJtyNG
 Qowh9OjWvy1QLgU591VsnEpMCKShGWw1AwtsXV8m5MIqp1b5YwPPnjbjQf7INoHx4Bs6
 vVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MIAOBpsRNe2XIXJ8E2SWgfu36FQJPNIIXrVHoTZakXE=;
 b=FFS6jB2emNaIjzVni6FXw301cQ47L5fm7VhWbS78DB8PvTZMZZHwtk5KCGIOcy+QM/
 4eTge1hsznhSZps9at/jSqtLy+loCxcVqqQjchnxTGOOVeBBM3yfHI0b8HgYFapPDHUj
 XCtHBJc8J6+Wdbm9foq6N2GIrjLCNyZ9l2/qgtpwyNwBDlQbysuuZIHmthLGzGZ1Egyh
 cNky52GcmIiwfC0vrtDdM/U9Gk7OeA0Yg4GbJ06JK4MFYx4wbV6wrH775LZH/GiTnTTg
 b2MvNHKXKdDrNxaP0FEN+xPzVxcxxcGZ3irvQqr8JDuVM9+BEpO0gLEWiZpn+AwYpDB3
 3XqQ==
X-Gm-Message-State: AOAM532xget5rE56b8SFrcdjaKrfH/oPaiRw84CbR2S3RO5OFqjuVTRj
 +oE3WkCeTGJ0k7g3OKRhmYrZal0VGOA=
X-Google-Smtp-Source: ABdhPJw+BXAENsy11ilyQ7R6SaETdmXrUEyywCLm3IMKUasp46Zm3ARbQDy2aaeVLZDoH/1xBovugg==
X-Received: by 2002:a50:fb09:: with SMTP id d9mr35421695edq.283.1639126118985; 
 Fri, 10 Dec 2021 00:48:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id hx14sm1079714ejc.92.2021.12.10.00.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:48:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: use CONFIG_LINUX_USER, not CONFIG_LINUX
Date: Fri, 10 Dec 2021 09:48:36 +0100
Message-Id: <20211210084836.25202-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The two more or less overlap, because CONFIG_LINUX is a requirement for Linux
user-mode emulation.  However, CONFIG_LINUX is technically a host symbol
that applies even to system emulation.  Defining CONFIG_LINUX_USER, and
CONFIG_BSD_USER for eventual future use, is cleaner.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/configure.sh              | 8 +++++++-
 tests/tcg/multiarch/Makefile.target | 2 +-
 tests/tcg/x86_64/Makefile.target    | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 9ef913df5b..f859b61d90 100755
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
2.33.1


