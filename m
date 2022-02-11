Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAC4B29E5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:15:32 +0100 (CET)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYa3-0006TT-Dq
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:15:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOa-0007Pv-S9
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:40 -0500
Received: from [2a00:1450:4864:20::631] (port=46964
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOU-0005D6-RR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:38 -0500
Received: by mail-ej1-x631.google.com with SMTP id e7so19804946ejn.13
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xaRSiVfaKuCepr53kcwbOQoAtU5qIFsM0RJYtnBGOYM=;
 b=MXBzEEWObFBUY5AKQ74BrJZM3DQ4Vab6yWTcOEWqvVEGzQIKO/NMZDVNmN2DpXc4lY
 puzbWMBR0jxRoz4Cr6vymLmkRpO4Z6aCnmyum+4e8qh7CZPla5Jo7BE80JOh8O0BToXL
 bQdt0WjTIdCO87qKhixGPK1aO2lh5rRAImMdmPJx/uUjpznteCA4kCEeHMjJodjeOzIA
 d797LkMSgYaBKX5/ogRxmFoMMQvYT8PyTRRpAPq8ha9G0J9iRUaeiZe5519v7JZ83l5N
 GHTDbkI23Kq1Y3sg8IHsw6uoEOmqJqBkwwriVt/YRX+nWXFEsLq2v5OjItUdujpQYpk/
 gSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xaRSiVfaKuCepr53kcwbOQoAtU5qIFsM0RJYtnBGOYM=;
 b=eWw0jN6tEze7DW3WQ7duIZ5PgmaSTP6wRShqyH1B/iH5qWVPHXU1YRyIvVcheJ8rcB
 N3I4z7fE0AeEK1HENRdIMSI9yMIwIoLnbgHqcexlk6yOtlGW3RH6Cu8L3Pwn8xlgCgL8
 hnMkcMArYLtd3M/5e8tFLY9Z3jQDF1VSkMwtY074EtdkBgqVwwZzzGQKdYpOfCeuGoX+
 XY/caL8Lr3jsnZ8rUWc1E5QdN4sK+1pOBis9WF1fWW8LxM5vmKya+kTNh6cxrlyoIGZo
 C0zdP5bFGu1sFbjwB9+4qYki3aAADDn4co+nLQGuGZlsaRcsQHrxoLqHQRdB2m6Lyfw9
 y9tg==
X-Gm-Message-State: AOAM530tnyyLeRWBsVhaqPRwM7e/Vp+cRPNu9+zKrCZZxC3eSiiQUYjK
 7uw/J3Fd4FmIzA1ESu3IL3NBNg==
X-Google-Smtp-Source: ABdhPJyTDHJHO69xiPSxvgbEohKDnIGu9o7B7hUgjZEt6hsWw9SRqHRQ4CXG/NQcPSnrtd3xUFHaFg==
X-Received: by 2002:a17:906:518f:: with SMTP id
 y15mr1946170ejk.18.1644595406047; 
 Fri, 11 Feb 2022 08:03:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q7sm4951018ejj.8.2022.02.11.08.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2BFA1FFC3;
 Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 11/11] tests/tcg: add vectorised sha512 versions
Date: Fri, 11 Feb 2022 16:03:09 +0000
Message-Id: <20220211160309.335014-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
 berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds vectorised versions of sha512 to exercise the vector code:

  - aarch64 (AdvSimd)
  - i386 (SSE)
  - s390x (MVX)
  - ppc64 (vector)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202191242.652607-5-alex.bennee@linaro.org>

---
v2
  - use -msse4.1 -O3 instead of -pentium4 for i386 build
---
 tests/tcg/multiarch/sha512.c      | 2 +-
 tests/tcg/aarch64/Makefile.target | 7 +++++++
 tests/tcg/arm/Makefile.target     | 8 ++++++++
 tests/tcg/i386/Makefile.target    | 6 ++++++
 tests/tcg/ppc64le/Makefile.target | 5 ++++-
 tests/tcg/s390x/Makefile.target   | 9 +++++++++
 tests/tcg/x86_64/Makefile.target  | 7 +++++++
 7 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/multiarch/sha512.c b/tests/tcg/multiarch/sha512.c
index d61942d1e0..e1729828b9 100644
--- a/tests/tcg/multiarch/sha512.c
+++ b/tests/tcg/multiarch/sha512.c
@@ -43,7 +43,7 @@
 
 typedef uint64_t beint64_t;
 
-#if BYTE_ORDER == BIG_ENDIAN
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
 
 /**
  * CPU_TO_BE64 - convert a constant uint64_t value to big-endian
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
index 38c10379af..099556efdc 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -71,3 +71,9 @@ TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
 
 # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
 EXTRA_RUNS+=run-test-mmap-4096
+
+sha512-sse: CFLAGS=-msse4.1 -O3
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


