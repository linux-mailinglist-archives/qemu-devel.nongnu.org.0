Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D04EEF49
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:24:46 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naICj-0006cW-6Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:24:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI26-0003gp-7L
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:46 -0400
Received: from [2a00:1450:4864:20::52b] (port=46851
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI24-0006dN-Jt
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:45 -0400
Received: by mail-ed1-x52b.google.com with SMTP id z92so3082545ede.13
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHZZ80ALv+K7PZJdkF1ud/9uldCP93oAdPnykBe3hyM=;
 b=pOv4HbsOTSoeE7EfQ+mh/cBAzYh6IodARnsVN2IbBy3/RngSYHNyZq3fjQyzi3Xed7
 GJfAABsUbxggmZQ5fBXbUp3W3vsT1qRfQQB1Of5vAVOqLqf5d6/VSIjfLDL2rgEpgjid
 P2o551XNOEEUn2lnUqdTCrKpdj/smdwXXgyKPeEAcbPawLhZ/SnCso1K1Y7UDnJWoLyE
 k0SYmrOb0qRLZlOF95GMLicDBpAPrpZCpScLo1Sl11mIyn2pobDL698is73JNASGJ+dM
 P+ucNx0mnzAvfRNCaMnvIDIF3k8OvqRQdP0DkT9ewi3jM1Xni/gBVgFtu75vcBWmyFvE
 pVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EHZZ80ALv+K7PZJdkF1ud/9uldCP93oAdPnykBe3hyM=;
 b=HItsKY8ZJ8KMbCpfaYdV2/bi4bHmD79gG3kxP0XqRC8oBBOqxIA60eopdnDMz+bHi2
 6nj9nqcHHzEUNX7wqtbzaY8vmK+7Y2CC6Q8N0OxnGu0PFBaWRIE5hMR0D1VCArIiXmdN
 ZSkbAaV1gZigXHtJcTFeQgzvh/FbQKqfFSw59699eck1Ebcg7tJ50F6rI4e58bmCNlCE
 MjuugndUfQVlYsHU2mkfUAzCvQu4uOtkh8zIW1nWDw53JPw95bX94SeNNmKe1XQQaXmm
 NvFFzLWDGuAWVM2AeYcIogxV7ntvu/BM5zHFEmBQSsju+MfUYl+D/XchhtFZikXvgl9+
 E66A==
X-Gm-Message-State: AOAM5323E+zzuKaYTgR2jkdqeSWQqDqzHPwBdt27ijtk/+fStJjJzK+a
 8WxiknDYtUMupkvJhNyhpS94mU8wakQ=
X-Google-Smtp-Source: ABdhPJxsrxH/RgPlGUzESL8W+U/nOtKp21kusbbQXMkP5Jg8e5za2fzaRniECYWYRp8pcoDGhdBTtA==
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr21657486edd.405.1648822423284; 
 Fri, 01 Apr 2022 07:13:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] tests/tcg: remove CONFIG_USER_ONLY from
 config-target.mak
Date: Fri,  1 Apr 2022 16:13:20 +0200
Message-Id: <20220401141326.1244422-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just check the target name instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-11-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.35.1



