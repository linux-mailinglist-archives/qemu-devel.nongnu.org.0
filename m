Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4811D41C5BE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:34:41 +0200 (CEST)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZjM-00077a-Bc
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIY-0007mH-Nx
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:07:00 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:33322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIV-0006XF-9v
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:56 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 d12-20020a05683025cc00b0054d8486c6b8so2823363otu.0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ynnp9vGqHmT6kBqqAm5CvgCkc8r0kk+mLzxDi9UCsM=;
 b=mvRtgLBzAt+bZSG8RlwHk4zvHquy+UygSVZG2U8ECHZxr5mHCMvcheturV0uFklSY/
 mUtl1u/F4eDWrkKvKsKLFTCfEz+8cbzym+j/hlxnhjqXfO0z1Ji8qvIeqYMMmhBnn1YI
 sXsqH/TqjCvIc+jZrTgvISAE1Z5/x45g6gCOSnpPD885+9OQEl2bi6KUDVFcvybQxfXg
 7a8MZRzcyoRSEEThKRM9g2LIo8uR9W9HYc78XMOKp0ghTQ+B0rodkHY9TnEMG/RC6Sqk
 3i2pAYFaRPUfTzidN1v/n2NQOwoZIKCbpr0c6t2qwxFfByPDOsNsWlVqhEHWsdE8XV10
 /itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ynnp9vGqHmT6kBqqAm5CvgCkc8r0kk+mLzxDi9UCsM=;
 b=1HYcKI5TTeKXhRdtNBwqTn2QcTAzqtzCoZmZrad0/TTEEe0KTvQsVLCAp06Rv8o6w6
 R3EhcMn8XIFwR3Q7nWTfg/dfJ3jwYhUO94Mz5ZJqkNfgDgJoXrb352vZUJ6pG5WVYFLp
 PuXu3/fN2Nz3N89T9th017oUe6+EEAJRTwAF0rUBoPmnWnSZ6lzN9F0GM5zUt2yWXtXX
 75GTkqSiXsiHlKjsn/DMHo2gTak7e5PR1foHj3aDnljN9mD89NREWrYPUcacXV6kaEQ0
 FKFIcv2Mfx24o9Lmv5oLqnSE89QUDt11tzsb/GhYmFHom5Zjh0igh3WrDA2dM1xleDS1
 m/Fw==
X-Gm-Message-State: AOAM533AS9iEOcebcJty3+2L8CwKPlRzLZ4+qob40e7tK35rd8Y47eCw
 nJ+cC6bf2nVg114mqeM7dOTR+cEPDViDug==
X-Google-Smtp-Source: ABdhPJx4TOr2SXp/t3iPvA/zm7WXecwdqGMogI0m5ZIGKucR2nzbfPEEP2MNkHYPoAUJB0t+4e8HIw==
X-Received: by 2002:a05:6830:101:: with SMTP id
 i1mr3611867otp.107.1632920814238; 
 Wed, 29 Sep 2021 06:06:54 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/26] tests/tcg/multiarch: Re-enable signals test for most
 guests
Date: Wed, 29 Sep 2021 09:05:53 -0400
Message-Id: <20210929130553.121567-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With signal trampolines safely off the stack for all
guests besides hppa, we can re-enable this test.

It does show up a problem with sh4 (unrelated?),
so leave that test disabled for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/hppa/Makefile.target      | 7 +++++++
 tests/tcg/i386/Makefile.target      | 3 ---
 tests/tcg/multiarch/Makefile.target | 8 --------
 tests/tcg/sh4/Makefile.target       | 7 +++++++
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index 473864d1d4..d0d5e0e257 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -5,3 +5,10 @@
 # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
 
+# This triggers failures for hppa-linux about 1% of the time
+# HPPA is the odd target that can't use the sigtramp page;
+# it requires the full vdso with dwarf2 unwind info.
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index a053ca3f15..38c10379af 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -65,9 +65,6 @@ run-plugin-%-with-libinsn.so:
 	       -d plugin -D $*-with-libinsn.so.pout $*, \
 		"$* (inline) on $(TARGET_NAME)")
 
-run-plugin-signals-with-libinsn.so:
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
-
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 85a6fb7a2e..3f283eabe6 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -32,14 +32,6 @@ threadcount: LDFLAGS+=-lpthread
 
 signals: LDFLAGS+=-lrt -lpthread
 
-# This triggers failures on s390x hosts about 4% of the time
-# This triggers failures for hppa-linux about 1% of the time
-run-signals: signals
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
-
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
-
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 9d18d44612..47c39a44b6 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -5,3 +5,10 @@
 
 # On sh Linux supports 4k, 8k, 16k and 64k pages (but only 4k currently works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-8192 run-test-mmap-16384 run-test-mmap-65536
+
+# This triggers failures for sh4-linux about 10% of the time.
+# Random SIGSEGV at unpredictable guest address, cause unknown.
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.25.1


