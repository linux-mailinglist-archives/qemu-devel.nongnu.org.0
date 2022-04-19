Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DBA506805
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:49:45 +0200 (CEST)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkUS-00059e-7D
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsp-0005XK-1F
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:52 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsm-0008T5-8j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t25so20403987edt.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhjqK7BccN+pHoeZVVHbIr0pT0XMcF2jQWuBfeKOkJs=;
 b=ZjVEiLDstcm2bENxxbq8jYkZmY8kOp8ti/cL7mN3sZ3u79lKOqlCiy4zgiQ+Srjo+p
 7aaziEPuXNELWDoMQyz4/1i73CVpH3OTz2pwTqGFfCbr1BzLnnj8Z2KBSC/rJ4k+kvsO
 WPYQYQPbYONuhLx2swoQtGvY5QLyl7gUxybLA7eqHkI+yH/budbzpS1DP2gUFdfiZtKQ
 Rke53U0Ar/DDg1mdKGh6oZq3X9mMsnJjM45gDpu4JsFsXDfJg/CWm5hUHNboGAwOH/cC
 LVsOcYHPKuvec37J6LVoPLcx22rjjp1v2mqokI2HHbrqW6uMcTCbprLgkOTN4KpcdfME
 wuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhjqK7BccN+pHoeZVVHbIr0pT0XMcF2jQWuBfeKOkJs=;
 b=757wihA25xZDAhGqiEQREDqK4vLcJdZTe3IrxldfGZuUiTgLmrajx2lJxVNzTXiiwD
 IruCQWGbhBbe0C1vj2enIf7Mi0fujyfHhthfUc0xkbiI0LgvguzK5qGb/QSU4LyTk+Wu
 ELuG3A/fIU7RM18y8gtVkuujuqVpOoLwtyov3x0er1ec7drFYnqKr7sLXg9lrKstR1da
 hzkYY8jrF5IgTcxvpanz/nCNi8K6W+84fmF8Mpw57mvAVBd5ni83hQaQi/g0Ax/NCiHE
 Z8NebD9Vb8Z+DRcd7YO1r2Eub3iQ0Qp0LHEJaB8UCzEFKel2Hfs5iMy2TgGFt7yWlDBd
 FXkg==
X-Gm-Message-State: AOAM533GvAPKRQl0TGBK+LzZc1v+ey2Y8hqH4GfInbnBCWxiGKxhaa64
 LTvtE8nL7MIv6a5wPTIr2uj5vQ==
X-Google-Smtp-Source: ABdhPJwI2277YonY1qln9gvK1+IS0w9hUxFP0RU9auktA2tQHmi5ET0RnSopyCxJ7U5A0utfbxrwBQ==
X-Received: by 2002:a05:6402:5146:b0:415:fd95:6afa with SMTP id
 n6-20020a056402514600b00415fd956afamr16309299edd.200.1650359445908; 
 Tue, 19 Apr 2022 02:10:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a17090657c300b006d01de78926sm5429237ejr.22.2022.04.19.02.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 609151FFC4;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/25] tests/tcg: add compiler test variables when using
 containers
Date: Tue, 19 Apr 2022 10:10:07 +0100
Message-Id: <20220419091020.3008144-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Even for container-based cross compilation use $(CROSS_CC_HAS_*) variables.
This makes the TCG test makefiles oblivious of whether the compiler is
invoked through a container or not.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401141326.1244422-10-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target |  2 +-
 tests/tcg/aarch64/Makefile.target         | 10 +++++-----
 tests/tcg/configure.sh                    | 17 +++++++++++++++++
 tests/tcg/i386/Makefile.target            |  2 +-
 tests/tcg/ppc64/Makefile.target           |  4 ++--
 tests/tcg/ppc64le/Makefile.target         |  4 ++--
 6 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a7286ac295..f6fcd4829e 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -64,7 +64,7 @@ run-memory-replay: memory-replay run-memory-record
 
 EXTRA_RUNS+=run-memory-replay
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 pauth-3: CFLAGS += -march=armv8.3-a
 else
 pauth-3:
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index f7121cb4d8..6ad0ad49f9 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -18,7 +18,7 @@ run-fcvt: fcvt
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
 # Pauth Tests
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
 pauth-%: CFLAGS += -march=armv8.3-a
 run-pauth-%: QEMU_OPTS += -cpu max
@@ -27,7 +27,7 @@ endif
 
 # BTI Tests
 # bti-1 tests the elf notes, so we require special compiler support.
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
+ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1
 bti-1: CFLAGS += -mbranch-protection=standard
 bti-1: LDFLAGS += -nostdlib
@@ -36,12 +36,12 @@ endif
 AARCH64_TESTS += bti-2
 
 # MTE Tests
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
+ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
+ifneq ($(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
 sysregs: CFLAGS+=-march=armv8.1-a+sve
@@ -88,7 +88,7 @@ EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
 endif
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE2),)
+ifneq ($(CROSS_CC_HAS_SVE2),)
 AARCH64_TESTS += test-826
 test-826: CFLAGS+=-march=armv8.1-a+sve2
 endif
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 84f928f7f8..8927a2b260 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -348,6 +348,23 @@ for target in $target_list; do
                   echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
                       $config_target_mak
               fi
+              case $target in
+                  aarch64-*)
+                      echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+                      ;;
+                  ppc*)
+                      echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+                      ;;
+                  i386-linux-user)
+                      echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+                      ;;
+              esac
+              break
           fi
       done
   fi
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index e1c0310be6..bd73c96d0d 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -30,7 +30,7 @@ hello-i386: LDFLAGS+=-nostdlib
 # test-386 includes a couple of additional objects that need to be
 # linked together, we also need a no-pie capable compiler due to the
 # non-pic calls into 16-bit mode
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_I386_NOPIE),)
+ifneq ($(CROSS_CC_HAS_I386_NOPIE),)
 test-i386: CFLAGS += -fno-pie
 
 test-i386: test-i386.c test-i386-code16.S test-i386-vm86.S test-i386.h test-i386-shift.h test-i386-muldiv.h
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 8197c288a7..babd209573 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -5,14 +5,14 @@
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
 PPC64_TESTS += mtfsf
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 9624bb1e9c..5b0eb5e870 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -4,12 +4,12 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64LE_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
-- 
2.30.2


