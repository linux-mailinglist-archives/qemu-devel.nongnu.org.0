Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA46EAB57
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:15:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqao-00081d-BE; Fri, 21 Apr 2023 09:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqam-000807-7v
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:14:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqaW-0000cR-A9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:14:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso4238305e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682082846; x=1684674846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o2gs4j1vcgytDmnJ6f5k26mePJruhnEBihlqTwcKDQk=;
 b=mzG3RWT2DIXAW9aw0PNvWplbfAaU3zBVlA7hK3o+2yEGmuLy7E5RF1zhWo6dj671+D
 VBRxiQA/hiXJ7p7fgQC1+N38NMVbuD6r0SmYENdOBq4414N1+sj8uJtXYPICFz9rHKBl
 CtLc4vj5UvH5cB88FHPNqNsrKGt6SJABYNSRE/SRLwNml2WfPMOF1gpsjuKQCZlx2iUG
 nWZ5wNZwpgUecZoLg8g6CCgPxSotZsB+2QEPgRo9n41niHWRhfFp1k4f9A9Bk7PunJbS
 ehzEKu4cdKt89BeX/ek+WGtmXJCgPo2ywk2bgug2BYWX5gwT2T+yUJDGjBVCvy7LIKkT
 EuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682082846; x=1684674846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o2gs4j1vcgytDmnJ6f5k26mePJruhnEBihlqTwcKDQk=;
 b=YpbV3eaGDvLdXwbo/tDoRrgwhVczkKPJHcIqsbSZGJBPe103ctB+zJogPsPGEHrWxG
 wxFTKl7EsoPgLXj7zohH66B3daIhEQIREpMo2KH5aucYG5yqcoF5ew1AjTt7R7MwlY57
 u/rQ+jw7uQG0xmpw9HvlknT8Np4spnFImNvCB5anMba0EXpFQtT8kKK2t19sMFhqvh7k
 M4XwrpHgvI8zlumbIShkBXRfmQsgeJO4yNxETt9FCUAAcP0IocGfTMHJGwRRRnUhPfSL
 fQVqq1BlzR1MK/TxFr5JA5RozNQW84nY8TUekWO01IVDu0QirqqYo0jJ4KOZGwIva8r5
 TlDQ==
X-Gm-Message-State: AAQBX9eISe+gM7w1gIejbwCzqWU/BlhcOtxGQgcc6n5RSlqR0Q4o+xUY
 XO5qOaldL6BgZQCHKJbtMz0OAg==
X-Google-Smtp-Source: AKy350aLBwZA87dcCqhSgPfsuxBfj85AQzbYVHNbiTS6IvbTF1Dyf5Abb5aZypQaNzk/nNV9Ek2X5w==
X-Received: by 2002:a05:600c:244:b0:3f1:954f:82e3 with SMTP id
 4-20020a05600c024400b003f1954f82e3mr840682wmj.24.1682082846114; 
 Fri, 21 Apr 2023 06:14:06 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003ee63fe5203sm4813143wma.36.2023.04.21.06.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:14:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E46F41FFB7;
 Fri, 21 Apr 2023 14:14:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [RFC PATCH] tests/tcg: limit the scope of the plugin tests
Date: Fri, 21 Apr 2023 14:14:00 +0100
Message-Id: <20230421131400.2750123-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Running every plugin with every test is getting excessive as well as
not really improving coverage that much. Restrict the plugin tests to
just the MULTIARCH_TESTS which are shared between most architecture
for both system and user-mode. For those that aren't we need to squash
MULTIARCH_TESTS so we don't add them when they are not part of the
TESTS global.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target                 | 10 +++++++---
 tests/tcg/aarch64/Makefile.softmmu-target |  2 --
 tests/tcg/aarch64/Makefile.target         |  1 -
 tests/tcg/arm/Makefile.softmmu-target     |  4 +++-
 tests/tcg/arm/Makefile.target             |  8 --------
 tests/tcg/cris/Makefile.target            |  3 +++
 tests/tcg/hppa/Makefile.target            |  2 --
 tests/tcg/i386/Makefile.target            | 10 ----------
 tests/tcg/ppc64/Makefile.target           |  2 --
 tests/tcg/riscv64/Makefile.softmmu-target |  3 +++
 tests/tcg/riscv64/Makefile.target         |  1 -
 tests/tcg/s390x/Makefile.softmmu-target   |  3 +++
 tests/tcg/tricore/Makefile.softmmu-target |  3 +++
 tests/tcg/xtensa/Makefile.softmmu-target  |  3 +++
 14 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 8318caf924..72876cc84e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -152,13 +152,17 @@ PLUGINS=$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c)))
 
 # We need to ensure expand the run-plugin-TEST-with-PLUGIN
 # pre-requistes manually here as we can't use stems to handle it. We
-# also add some special helpers the run-plugin- rules can use bellow.
+# only expand MULTIARCH_TESTS which are common on most of our targets
+# to avoid an exponential explosion as new tests are added. We also
+# add some special helpers the run-plugin- rules can use bellow.
 
+ifneq ($(MULTIARCH_TESTS),)
 $(foreach p,$(PLUGINS), \
-	$(foreach t,$(TESTS),\
+	$(foreach t,$(MULTIARCH_TESTS),\
 		$(eval run-plugin-$(t)-with-$(p): $t $p) \
 		$(eval RUN_TESTS+=run-plugin-$(t)-with-$(p))))
-endif
+endif # MULTIARCH_TESTS
+endif # CONFIG_PLUGIN
 
 strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
 extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index df9747bae8..b74a2534e3 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -81,6 +81,4 @@ pauth-3:
 	$(call skip-test, "BUILD of $@", "missing compiler support")
 run-pauth-3:
 	$(call skip-test, "RUN of pauth-3", "not built")
-run-plugin-pauth-3-with-%:
-	$(call skip-test, "RUN of pauth-3 ($*)", "not built")
 endif
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9e91a20b0d..0315795487 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -32,7 +32,6 @@ ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
 pauth-%: CFLAGS += -march=armv8.3-a
 run-pauth-%: QEMU_OPTS += -cpu max
-run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
 # BTI Tests
diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 7df88ddea8..8b546e2aa3 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -23,4 +23,6 @@ LDFLAGS+=-nostdlib -N -static
 test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
-run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
+
+# We don't currently support the multiarch system tests
+undefine MULTIARCH_TESTS
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index b3b1504a1c..0038cef02c 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -46,11 +46,6 @@ semihosting-arm: semihosting.c
 run-semihosting-arm: semihosting-arm
 	$(call run-test,$<,$(QEMU) $< 2> $<.err)
 
-run-plugin-semihosting-arm-with-%:
-	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
-		 $(call strip-plugin,$<) 2> $<.err)
-
 ARM_TESTS += semiconsole-arm
 
 semiconsole: CFLAGS += -mthumb
@@ -62,9 +57,6 @@ semiconsole-arm: semihosting.c
 run-semiconsole-arm: semiconsole-arm
 	$(call skip-test, $<, "MANUAL ONLY")
 
-run-plugin-semiconsole-arm-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
-
 endif
 
 ARM_TESTS += commpage
diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index 372287bd03..43587d2769 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -57,3 +57,6 @@ SIMG:=cris-axis-linux-gnu-run
 # e.g.: make -f ../../tests/tcg/Makefile run-check_orm-on-sim
 run-%-on-sim:
 	$(call run-test, $<, $(SIMG) $<)
+
+# We don't currently support the multiarch tests
+undefine MULTIARCH_TESTS
diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index b78e6b4849..cdd0d572a7 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -10,8 +10,6 @@ EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
 # it requires the full vdso with dwarf2 unwind info.
 run-signals: signals
 	$(call skip-test, $<, "BROKEN awaiting vdso support")
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN awaiting vdso support")
 
 VPATH += $(SRC_PATH)/tests/tcg/hppa
 TESTS += stby
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index bafd8c2180..821822ed0c 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -18,19 +18,15 @@ X86_64_TESTS:=$(filter test-i386-adcox test-i386-bmi2 $(SKIP_I386_TESTS), $(ALL_
 
 test-i386-sse-exceptions: CFLAGS += -msse4.1 -mfpmath=sse
 run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
-run-plugin-test-i386-sse-exceptions-%: QEMU_OPTS += -cpu max
 
 test-i386-pcmpistri: CFLAGS += -msse4.2
 run-test-i386-pcmpistri: QEMU_OPTS += -cpu max
-run-plugin-test-i386-pcmpistri-%: QEMU_OPTS += -cpu max
 
 test-i386-bmi2: CFLAGS=-O2
 run-test-i386-bmi2: QEMU_OPTS += -cpu max
-run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max
 
 test-i386-adcox: CFLAGS=-O2
 run-test-i386-adcox: QEMU_OPTS += -cpu max
-run-plugin-test-i386-adcox-%: QEMU_OPTS += -cpu max
 
 #
 # hello-i386 is a barebones app
@@ -52,8 +48,6 @@ test-i386:
 	$(call skip-test, "BUILD of $@", "missing -no-pie compiler support")
 run-test-i386:
 	$(call skip-test, "RUN of test-i386", "not built")
-run-plugin-test-i386-with-%:
-	$(call skip-test, "RUN of test-i386 ($*)", "not built")
 endif
 
 ifeq ($(SPEED), slow)
@@ -87,7 +81,6 @@ sha512-sse: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-sha512-sse: QEMU_OPTS+=-cpu max
-run-plugin-sha512-sse-with-%: QEMU_OPTS+=-cpu max
 
 TESTS+=sha512-sse
 
@@ -103,15 +96,12 @@ test-avx.h: test-avx.py x86.csv
 
 test-3dnow: CFLAGS += -masm=intel -O -I.
 run-test-3dnow: QEMU_OPTS += -cpu max
-run-plugin-test-3dnow: QEMU_OPTS += -cpu max
 test-3dnow: test-3dnow.h
 
 test-mmx: CFLAGS += -masm=intel -O -I.
 run-test-mmx: QEMU_OPTS += -cpu max
-run-plugin-test-mmx: QEMU_OPTS += -cpu max
 test-mmx: test-mmx.h
 
 test-avx: CFLAGS += -mavx -masm=intel -O -I.
 run-test-avx: QEMU_OPTS += -cpu max
-run-plugin-test-avx: QEMU_OPTS += -cpu max
 test-avx: test-avx.h
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index f081f1c683..6d47d3cae6 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -24,14 +24,12 @@ PPC64_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
-run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
 sha512-vector: CFLAGS +=-mcpu=power10 -O3
 sha512-vector: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-sha512-vector: QEMU_OPTS+=-cpu POWER10
-run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
 PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index e22cdb34c5..d5b126e5f1 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -19,3 +19,6 @@ QEMU_OPTS += -M virt -display none -semihosting -device loader,file=
 EXTRA_RUNS += run-issue1060
 run-issue1060: issue1060
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
+
+# We don't currently support the multiarch system tests
+undefine MULTIARCH_TESTS
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index cc3ed65ffd..9973ba3b5f 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -9,4 +9,3 @@ TESTS += noexec
 TESTS += test-noc
 test-noc: LDFLAGS = -nostdlib -static
 run-test-noc: QEMU_OPTS += -cpu rv64,c=false
-run-plugin-test-noc-%: QEMU_OPTS += -cpu rv64,c=false
diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 3e7f72abcd..192315dd20 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -23,3 +23,6 @@ include $(S390X_SRC)/pgm-specification.mak
 $(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
 $(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-softmmu.o
 TESTS += $(PGM_SPECIFICATION_TESTS)
+
+# We don't currently support the multiarch system tests
+undefine MULTIARCH_TESTS
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index b3cd56fffc..49e573bc3b 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -29,3 +29,6 @@ QEMU_OPTS += -M tricore_testboard -cpu tc27x -nographic -kernel
 
 %.tst: %.o
 	$(LD) $(LDFLAGS) $< -o $@
+
+# We don't currently support the multiarch system tests
+undefine MULTIARCH_TESTS
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index ba6cd9fde3..78bf72dfaa 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -41,3 +41,6 @@ $(XTENSA_USABLE_TESTS): linker.ld macros.inc $(CRT) Makefile.softmmu-target
 	$(CC) $(XTENSA_INC) $(ASFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(NOSTDFLAGS) $(CRT)
 
 endif
+
+# We don't currently support the multiarch system tests
+undefine MULTIARCH_TESTS
-- 
2.39.2


