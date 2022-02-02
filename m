Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C84A7937
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:10:06 +0100 (CET)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLx6-0005qn-QO
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:10:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3m-0000sc-Jx
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:55 -0500
Received: from [2a00:1450:4864:20::433] (port=37703
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3j-000776-F8
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id w11so466296wra.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dwxi45ylVlVmohtVMhPGgDq2cZ2Znxxnv1eEMPMfHBc=;
 b=Zj7bUH3XGiL4ex9JFjf/GZrJWlkpVAeGzF9hJwMSy+FEGiYdyj1FFK29/ZXxqkJdb5
 T6kffCZ09Nzg39wPyWseP4KKiS4PEdCRAKzhf11OxjOsX4t3UV69WObaoWdKRbDGOzqj
 2qaU5JvqBKUpcdeu8aqc1hryfoTcNhWgGtGjm96eFcTBe663hk1MS6WJtrPpO4fIsMhS
 vKiY3/eWBXv22xFGLPXKqHJ65zN74Ii8x7SqGt/2Sb2YkGk7Tepzah+ZdWHBcfSxxJBs
 5Zr2Hb2w0RumI7kz2Zn24ZKLLsW8jc8mi3fslPGAd4hqJz+2Cxc5gIbePGkG91iIK9G1
 RQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dwxi45ylVlVmohtVMhPGgDq2cZ2Znxxnv1eEMPMfHBc=;
 b=13A5OTjO4mOR2BA2H133zN7QUC3mNuX5lZsH8rN4dvSWBhrQbt9i5XfnILdft9lErT
 vauNle2q5McLX2ZAQbrj7PU0uxqiJ8L0BqJotx/oyMmogaDS4NtyeYWiv25+nWG/WEQv
 6cXQ8ThDn+W4dpTRLbZYMbeY7cNQ4UoCuR+HyJqJx1eoPIPnDeIIYGd3YSfGXmz6np2n
 d5mVR1BeiVEp5W0pbSxHiLeBu4YV0rz7IRGSCePXxAYv1ewoJq9MQYAFnBb+kqqBQdE1
 WO1YUycDytNkK6w46uT3hKBKvry3OsUbEIrHWJ6/W3L6cbvv8Ymy1fkXS2BoqxLUfgzw
 +uTg==
X-Gm-Message-State: AOAM531WsrwxifesI2JQf77amarCn32bzAKh75zp/Wk66oNABm6OY623
 jY+uHDwIzH/7nXNwdIAExuT1tg==
X-Google-Smtp-Source: ABdhPJzbtsTA+uX1MQlLpFOTFISpD5m9gdE+xErZ3pWu5Xpw3twHVbiD8j7jEgF5Nmn0n3q9fDMczQ==
X-Received: by 2002:adf:e80d:: with SMTP id o13mr23657391wrm.532.1643829169795; 
 Wed, 02 Feb 2022 11:12:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o27sm5789777wms.4.2022.02.02.11.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 11:12:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2768C1FFBC;
 Wed,  2 Feb 2022 19:12:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH  4/4] tests/tcg: add vectorised sha512 versions
Date: Wed,  2 Feb 2022 19:12:42 +0000
Message-Id: <20220202191242.652607-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202191242.652607-1-alex.bennee@linaro.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, David Hildenbrand <david@redhat.com>, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds vectorised versions of sha512 to exercise the vector code:

  - aarch64 (sve and sve2)
  - i385 (SSE)
  - s390x (MVX)
  - ppc64 (vector)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 11 +++++++++++
 tests/tcg/i386/Makefile.target    |  6 ++++++
 tests/tcg/ppc64le/Makefile.target |  5 ++++-
 tests/tcg/s390x/Makefile.target   |  9 +++++++++
 tests/tcg/x86_64/Makefile.target  |  7 +++++++
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index a03844ce48..33e3cea7fd 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -62,6 +62,17 @@ run-sha1-vector: sha1-vector run-sha1
 
 TESTS += sha1-vector
 
+# SVE versions of sha512
+sha512-sve: CFLAGS=-march=armv8.1-a+sve -O3
+sha512-sve: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+sha512-sve2: CFLAGS=-march=armv8.1-a+sve2 -O3
+sha512-sve2: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS += sha512-sve sha512-sve2
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 38c10379af..0ff7e1bfcc 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -71,3 +71,9 @@ TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
 
 # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
 EXTRA_RUNS+=run-test-mmap-4096
+
+sha512-sse: CFLAGS=-march=pentium4 -O3
+sha512-sse: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+TESTS+=sha512-sse
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 480ff0898d..4f1d03dfcf 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -5,10 +5,13 @@
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64LE_TESTS=bcdsub non_signalling_xscv
+PPC64LE_TESTS=bcdsub non_signalling_xscv sha512-vector
 endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
+sha512-vector: sha512.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS += byte_reverse
 endif
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


