Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4E64EEF20
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:18:46 +0200 (CEST)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI6w-0003e6-1D
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:18:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI24-0003bD-Pa
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:44 -0400
Received: from [2a00:1450:4864:20::534] (port=41965
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI22-0006d0-T3
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:44 -0400
Received: by mail-ed1-x534.google.com with SMTP id x34so3113528ede.8
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90ODrqTa0HPFamgrUO9+dLhhPkpjhaQvAYHl7V1rkzY=;
 b=Z3v7k78NZou8/NjsDtt7zKQe3vsX4Bvs1Utnnc7S+t3/HPgpHcFfa5NpOGyaarY+rX
 G1Y66MKCw7NvcOCeGF6PwIcT80d1ZvlMijoESaOwG7IzD8NDHBAyK3CbsXu9CcBP6ziL
 3kbddDrInnxEn6ayJCl2MlEUl1to90Ifgvb2naSWykn0rcINjUN0U4Ll4LNgiN6/SDml
 6b8imZ2lBDjW6tiMerslVV4Yspww1P/YYOTsJZxE7OrtdTSj6ltgiL0oNKhB/iGakpTQ
 0b2G22TsVj5tnyh/ON64C3z6Dh/8UBGJ+EXVYAsyuQM/RlXx0u9z6b+9bTiQ84jTeWRE
 pLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=90ODrqTa0HPFamgrUO9+dLhhPkpjhaQvAYHl7V1rkzY=;
 b=b3UnYTItHbfRNKABY/lJ+mOG/ocm7wNjtznQG7P56JLVb/bHejHesAXsQ05rTsHNsL
 5ZVWWah315J8NiHd8YZiqfk7uiXGqhVEsQG7kBqDAujn1M/qklA6YuVqDk/8tDSGxXAr
 f5ixIPcSQh0HIQDPtTCQuvEsAQ6aWTIgh8gjkdAd2DpBwu0896pXYccu4cSDpXsOpIZT
 CiF7ndQvmtfkYR2eeDf+voJp1+xKs5DsEu3/r55D/IS3QABuIvakMnF5qURFgtFa52IK
 tLxf9rn8iYfDIVEXlzy4l0OFDpxTQRngB6cJXmFrY2ofPrlza+VGfxxt1SjhnOmTNUda
 ksOQ==
X-Gm-Message-State: AOAM532/nZ6A6zD0QHt6Uj01RItrUiGLJv0aMGibDvaEFRvI979jffr3
 aEPy6vtVGl2bLF8ovSD96Dg7N6poj7E=
X-Google-Smtp-Source: ABdhPJwTpYLJpeTrmLx0u7SquB92eIPEsv2RRazxBfkiXRtTRDqIXGcVd6DzyvhpmP/PmBePp1e/Dg==
X-Received: by 2002:aa7:c755:0:b0:419:2f66:e22c with SMTP id
 c21-20020aa7c755000000b004192f66e22cmr20616474eds.381.1648822421598; 
 Fri, 01 Apr 2022 07:13:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/17] tests/tcg: add compiler test variables when using
 containers
Date: Fri,  1 Apr 2022 16:13:18 +0200
Message-Id: <20220401141326.1244422-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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

Even for container-based cross compilation use $(CROSS_CC_HAS_*) variables.
This makes the TCG test makefiles oblivious of whether the compiler is
invoked through a container or not.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220328140240.40798-9-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.35.1



