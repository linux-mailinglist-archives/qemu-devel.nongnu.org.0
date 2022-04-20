Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF96508FE3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:01:11 +0200 (CEST)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFZe-0006Zt-Sd
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqp-0008Gs-GW
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqm-0002KP-LK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id w4so3352870wrg.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8fl+J6lwVlhRd48g05kC8jCxUyF5vfAFYt23/0f79o=;
 b=WLqiOfiv9oPMAcgEJIP5p/rML20zbwJHNpdPY1+d14G2W03WeQH0lSYrocsQZQs9bY
 ePh+DE0x/Jq2vgMiX8JwO5bPuuiDw/gJWD0PZDvBtbz9XkUXav7CwqQ5outrW6l9Unal
 cOinSq898CLO3gMiFq9/RXlK5O2InbWNbEhq5febz6PZDokjJa1FNKHR4IkZxtyxbK/a
 jZmkWjphiguVPxSR1XsV7ST7N0xf3fUVtaL8XLyEQB/pA80EviGwBTHAJPl/QMwrhNqf
 W3CEiGegc+xpq69cg/4RM2IIUyiqTEzDawhfRPx8etVoj8qTjqpBxxFjNETXoSqubsh1
 uGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8fl+J6lwVlhRd48g05kC8jCxUyF5vfAFYt23/0f79o=;
 b=ChOjhBiFhxkGGX4XYmk6SLgcWqqdG+rydMXsMgl4MDrP1ILfxBOL6MKcuMNd6Tb87L
 eNjqNe4k1tq+W5BxdC6WFGYNpDfLA2dDHO63xTGSRFHqOC8sTXcgwlgmF1Ptvnr9F1yS
 bL50BzNYvoMuiWO+DsHep/ARV9Ws+1phbN86QIoBd5yESes13ZsDakVtoxxG2ZmKEJFd
 iX4UIhYhr3t5J/162QnsPhi5hJkSoi0yia1NeUIyuJcAEdED3Ja+EgPB6/R1DdarNbZP
 IHh91M+b2J+DbHQbDRHAMfJgcDfP+rN3+Jk/LoIdOgvzUSlf7BV8toeUHXMJE4GRuNf4
 WKuQ==
X-Gm-Message-State: AOAM533pouHMfNLDBC7wQ+hfPhIJhrbjjzG7JYnMCQazXqEV6X5Zfn1f
 5r7JM6WkBNgdvmHM0x47ihu7xw==
X-Google-Smtp-Source: ABdhPJzq69Yhq/MWnJ6IF8y45vl//6Wju1XfzPMBrPfMUderBQ9Rql1nZWvVtcTvkiIiyjRwMCLMJw==
X-Received: by 2002:a05:6000:1a8b:b0:20a:aaf7:75e8 with SMTP id
 f11-20020a0560001a8b00b0020aaaf775e8mr5475237wry.66.1650478485552; 
 Wed, 20 Apr 2022 11:14:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003928b925796sm64799wmq.47.2022.04.20.11.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50EE71FFC4;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 12/25] tests/tcg: add compiler test variables when using
 containers
Date: Wed, 20 Apr 2022 19:08:19 +0100
Message-Id: <20220420180832.3812543-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-13-alex.bennee@linaro.org>

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


