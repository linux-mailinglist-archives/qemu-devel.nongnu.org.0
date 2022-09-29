Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09355EF77E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:27:19 +0200 (CEST)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduVS-0003wd-7k
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3Q-0000fV-Qy
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3J-0002Pi-TM
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u16-20020a05600c211000b003b5152ebf09so3057127wml.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BsedzBh6Y4TJDrXaXa5qF+9URUKHB7fH5rVkqYS1zZI=;
 b=DfUm2SI+LxnkGgIKagl85FSRNj9k3EtpLUl2tjSnEQs/HCpx2bqB2ZFc6LTgDFpD/B
 hK5cKzcu7GbB4E5Nrp+3hiwQoiDeilR2faDMLHZzusz2B2RdMrRCSO/vfO5KnM92AyOa
 wWBJ7Oq3SCCR79qJjLT2NXEKf3tiI2tQL8GYKGHpKc+7kjlkxCBnLbE5XDDluPR6Vt1j
 mnD7433I9ltpLjZmy/K+h0tiSKV3CxDs52zAeMUP9IjO0h5SHyHUW8htPouE5PDGOXpF
 WR3aqJoV1R+UObbADy/aiVNFvxWKja/d6c46xnRbWevnTnm56bh06JjTJfnmn2P3nrmP
 mmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BsedzBh6Y4TJDrXaXa5qF+9URUKHB7fH5rVkqYS1zZI=;
 b=1e9EG7lYk4qzLVFb1xDwaT+1y+miw67euc3BtSQbKz1/+D9ZwWbyRGEV9X/AXd+mah
 T5MQXiajN27XMHQtlufyodejCoDaIPRMs8iDOnblkGW15/3SHJ//J3gJE9BKJPthqnEs
 dCC8BPrkfWpKbVqcn0/rYGiYvG/alP3C3s2OZiysdx4C34CBRw4WXcnPYLUT4F0KPplw
 HLnTtweSiSNP6dWDUqQs/VcyXkQD0tuz57gtAO9qHjI3gCocFZ5V7zqUZADfQgN7gunI
 Lh0quNzITJsP5bNlG0cyINtOemb+BlonbdkIQ0i/DIm1A1E+I5ZTmpqNjiMMxoY1wmv5
 i79w==
X-Gm-Message-State: ACrzQf2weFf1koFHNc9nTNS9uqvXk1vkr8PsrGCFPvAEjBqwtN/TELBD
 RmqYyEjYma8xOyI9Jru39oNwTQ==
X-Google-Smtp-Source: AMsMyM4LejfhBvxnDiU7XZ3IoKbmHV6R2aWKxKLU6n0gRNSaz6nQ+nHKLEBzpNs7UIloGf1YS/Ob/Q==
X-Received: by 2002:a05:600c:20b:b0:3b4:86ff:cd with SMTP id
 11-20020a05600c020b00b003b486ff00cdmr10453918wmi.35.1664452202013; 
 Thu, 29 Sep 2022 04:50:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r9-20020adfda49000000b002258235bda3sm6711234wrl.61.2022.09.29.04.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EC851FFCA;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 20/51] tests/tcg: remove -f from Makefile invocation
Date: Thu, 29 Sep 2022 12:42:00 +0100
Message-Id: <20220929114231.583801-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
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

Instead of linking tests/tcg/Makefile.target into the build tree, name
the symbolic link "Makefile" and create it in every target subdirectory.
This makes it possible to just invoke "make" in tests/tcg subdirectories.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure              | 7 ++++---
 tests/Makefile.include | 7 +++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 784b77ae90..a48a731bf4 100755
--- a/configure
+++ b/configure
@@ -2282,7 +2282,6 @@ fi
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
 LINKS="Makefile"
-LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS pc-bios/vof/Makefile"
@@ -2529,6 +2528,7 @@ fi
 echo "# Automatically generated by configure - do not modify" > $makefile
 
 config_host_mak=tests/tcg/config-host.mak
+mkdir -p tests/tcg
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
@@ -2632,8 +2632,9 @@ for target in $target_list; do
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
-      mkdir -p tests/tcg/$target
-      ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
+      mkdir -p "tests/tcg/$target"
+      ln -sf "$source_path/tests/tcg/Makefile.target" "tests/tcg/$target/Makefile"
+      ln -sf "../config-$target.mak" "tests/tcg/$target/config-target.mak"
       echo "TARGET=$target" >> "$config_target_mak"
       echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 826b1895f4..caef287957 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -50,20 +50,19 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
-            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS), \
+            $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS), \
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        SPEED=$(SPEED) run, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) clean, \
+           $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
 .PHONY: build-tcg
-- 
2.34.1


