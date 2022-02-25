Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7054B4C4CD8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:48:16 +0100 (CET)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNehT-0008ML-EF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeH5-0004Jo-UZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:59 -0500
Received: from [2a00:1450:4864:20::531] (port=41919
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGp-0002PF-Io
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id w3so8328957edu.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kk3Oune+gYEbeOEMjHfa4vIyU98YLuRUzQb5fhro0RQ=;
 b=oXHwNRbXVisRJDmE/+5GQ9b7USWY+WUVKSh7JuXIZ/ifQqCJ9zw0JCng1+fZKbpdNI
 W0BSTaGj3TGyAO+RCW7Vlt6MocDDpT32kATc1xGMY4I6HI0W00rHXh1kSK02JiNj9giz
 HQDpPoasCHPktpGV8bnFqbmZD0KJp/e+JM5a5A2SLgjMBjIcYVR4pW8jEr3+cGcpRlN1
 0E9IT5s+lLx7jh30P2q+P+A/PuihUSVt7DUbPQk9wzR6vpWj+WB2YH1N1F4pDhA92K3P
 UXe4BuWUdpj8SLjZj67DIanWIafi/qL3dhZ33wI15GvG0UkgB4X/KyHi8fcCQn4maP9S
 joIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kk3Oune+gYEbeOEMjHfa4vIyU98YLuRUzQb5fhro0RQ=;
 b=QP/VjnP0I778RqXHGIz/ZfKReMeeY0bWFwrwpmA3Q1lRvwwmFnXoVLzHKpA6Td0VF2
 VOj83dC82Y1QlFoIorqffUL0sg4+O4oDLLOtb4z3SUDniKzsfMWCN4fXGIXtj+kCtqrM
 3uBj6RWVTnn6qcSFfxQjrc4dDTcjJr1cgNEw4u9COWdKww5y7HE6LiukJ4O3svDmtEi5
 WX0d8YY0tmttwn5QAOlFjbIOBcwRWdDIez+X3gvim2lYlK+9dUia35rUB7gbVfHZBd9V
 e4iNaKdTsb+CmyYeDLvHQTZyH6bzNwm4V5rPqWsPcUdFsZnizk+hXy97y1uwT2NX6MIr
 bpWQ==
X-Gm-Message-State: AOAM533T7BpwJacieeQkEy7NFx0AqXUkgrcuzsvkS0XJ8UmValGf+9kW
 5eA45OZuFjEf5veluks03qQqtQ==
X-Google-Smtp-Source: ABdhPJwmTHjdovPpyw7tJcXD1IdpJ3C6wX43jb2OvYn4+WOv8zE1JCyox2d/b9Cwmw9SdBDDjThfNA==
X-Received: by 2002:a50:c346:0:b0:413:4750:b36a with SMTP id
 q6-20020a50c346000000b004134750b36amr7921024edb.433.1645809642220; 
 Fri, 25 Feb 2022 09:20:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm1225915ejb.164.2022.02.25.09.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DF2D1FFC5;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 13/18] tests/tcg: add vectorised sha512 versions
Date: Fri, 25 Feb 2022 17:20:16 +0000
Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 berrange@redhat.com, David Hildenbrand <david@redhat.com>, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org,
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
  - ppc64/ppc64le (power10 vectors)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202191242.652607-5-alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-12-alex.bennee@linaro.org>

---
v2
  - expanded to include both flavours of ppc64
---
 tests/tcg/aarch64/Makefile.target | 7 +++++++
 tests/tcg/arm/Makefile.target     | 8 ++++++++
 tests/tcg/i386/Makefile.target    | 6 ++++++
 tests/tcg/ppc64/Makefile.target   | 9 ++++++++-
 tests/tcg/ppc64le/Makefile.target | 9 ++++++++-
 tests/tcg/s390x/Makefile.target   | 9 +++++++++
 tests/tcg/x86_64/Makefile.target  | 7 +++++++
 7 files changed, 53 insertions(+), 2 deletions(-)

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


