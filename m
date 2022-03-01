Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4A4C8903
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:10:47 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzSu-0006Sl-CJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6c-0003UO-EI
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:42 -0500
Received: from [2a00:1450:4864:20::42e] (port=40611
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6a-0007Bz-KJ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:42 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n14so19499332wrq.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOKi/+6sidqp+9I6HPtC5vDCZFQzKRhrF5k0IuKcYto=;
 b=Pe8Tg1V0iPmjySGW0sFuzctx1RYNreOPDRl8a8bns88YNcGxjAi4lCFLGHRq9zgBLP
 iya3QpuNyVEMAtfUxf16uz7nKOR5C02cqxthXEzHgWf4S4FPQNmYzkvP6d1eEcA0V/6a
 XqWoqcUROAx99JBgMUd2GZY6FPxsfA39xQRBc+Aa0kqCHQQ4RRj+xA9UuteBxDrSF8LB
 pXmdGllj47A9dE2xA5+vHHwtGFRBvFgi9nPR0FCcpUmtxRgQdFgCgCG2haOYcka8raSb
 g7l3bAsBBNpSMhrwOXVs0vnrpllcemay2eHK7Vp2dPvw/X+De1zIG59tqmljcUhFcQjt
 ragw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOKi/+6sidqp+9I6HPtC5vDCZFQzKRhrF5k0IuKcYto=;
 b=PKyIzJt6tGBGfATmcu0z9xuOZ1XJL3Bql6R2IsyKA6gDaO5IS0nl/4FYNAKRmbYSYP
 hzbfK4Zz/SLm5baWZGcrwY21RFGEd/Vm9wJmBF0261nnaWBhHUWa8NSo65p/E/t+aRwK
 L558h+6kfzsRpGQ5LzGFltIykvUQXUCV7mvTn3TL5Xa6i5LsPB65gpWV+jYXxs+qLh8Z
 tf02iwOB8S4mpoUGPIjV+JQiJeZeC2lHhAwtRf8HOIVre5N6Ssjl2MqOOoi/hxEiSRM+
 qnuu3e81b/fWqZlywzmSZAcgtxOOjjyAB1CWenbFMJgx37spE51V4tNzfm2tNPAyAjUx
 C1JA==
X-Gm-Message-State: AOAM531NATU9Y/sw8KusRe4C6bt4150x2jkYSR2jB8A4KXUCDt3lb3Uf
 UDHa6xIAow+xHyLLEsJJw+vL3uMrTXCZPQ==
X-Google-Smtp-Source: ABdhPJyfP3K1kO7yejMhntnWUuYRQXzeIzNBxz+j9Y4vAzOGL+RB6ngyDf2g6Gh76FM4pJcYQa67SA==
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr19008315wrs.620.1646128059349; 
 Tue, 01 Mar 2022 01:47:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00380fc02ff76sm2136062wms.15.2022.03.01.01.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 911BD1FFC5;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/18] tests/tcg: add vectorised sha512 versions
Date: Tue,  1 Mar 2022 09:47:10 +0000
Message-Id: <20220301094715.550871-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds vectorised versions of sha512 to exercise the vector code:

  - aarch64 (AdvSimd)
  - i386 (SSE)
  - s390x (MVX)
  - ppc64/ppc64le (power10 vectors)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index df3f8e9438..ac07acde66 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -60,6 +60,13 @@ run-sha1-vector: sha1-vector run-sha1
 
 TESTS += sha1-vector
 
+# Vector versions of sha512 (-O3 triggers vectorisation)
+sha512-vector: CFLAGS=-O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS += sha512-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 2dc94931c3..2f815120a5 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -79,6 +79,14 @@ run-sha1-vector: sha1-vector run-sha1
 	$(call diff-out, sha1-vector, sha1.out)
 
 ARM_TESTS += sha1-vector
+
+# Vector versions of sha512 (-O3 triggers vectorisation)
+sha512-vector: CFLAGS=-O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+ARM_TESTS += sha512-vector
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 38c10379af..e1c0310be6 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -71,3 +71,12 @@ TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
 
 # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
 EXTRA_RUNS+=run-test-mmap-4096
+
+sha512-sse: CFLAGS=-msse4.1 -O3
+sha512-sse: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-sse: QEMU_OPTS+=-cpu max
+run-plugin-sha512-sse-with-%: QEMU_OPTS+=-cpu max
+
+TESTS+=sha512-sse
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 9d6dfc1e26..c9498053df 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -13,12 +13,19 @@ $(PPC64_TESTS): CFLAGS += -mpower8-vector
 PPC64_TESTS += mtfsf
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
-PPC64_TESTS += byte_reverse
+PPC64_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
+sha512-vector: CFLAGS +=-mcpu=power10 -O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-vector: QEMU_OPTS+=-cpu POWER10
+run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
+
 PPC64_TESTS += signal_save_restore_xer
 
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 480ff0898d..12d85e946b 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -10,12 +10,19 @@ endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
-PPC64LE_TESTS += byte_reverse
+PPC64LE_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
+sha512-vector: CFLAGS +=-mcpu=power10 -O3
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-vector: QEMU_OPTS+=-cpu POWER10
+run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
+
 PPC64LE_TESTS += mtfsf
 PPC64LE_TESTS += signal_save_restore_xer
 
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7238b4eb..e53b599b22 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,3 +25,12 @@ run-gdbstub-signals-s390x: signals-s390x
 
 EXTRA_RUNS += run-gdbstub-signals-s390x
 endif
+
+# MVX versions of sha512
+sha512-mvx: CFLAGS=-march=z13 -mvx -O3
+sha512-mvx: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha512-mvx: QEMU_OPTS+=-cpu max
+
+TESTS+=sha512-mvx
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 4a8a464c57..17cf168f0a 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -22,3 +22,10 @@ test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 
 vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
+# TCG does not yet support all SSE (SIGILL on pshufb)
+# sha512-sse: CFLAGS=-march=core2 -O3
+# sha512-sse: sha512.c
+# 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS+=sha512-sse
-- 
2.30.2


