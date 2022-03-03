Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC034CC7F4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:24:17 +0100 (CET)
Received: from localhost ([::1]:43008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsvo-0006Cd-Tb
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ2-0006DA-Cx
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:49 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37425
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYn-0004K6-I6
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:36 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso8894109pjj.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYMPBK8uImUtEf60mqBA0vpSt2l5oNERr0mQgdkY/9s=;
 b=xaqiNq+zku3KarcL4T2XSYSvyIozuwRYSZG/SR/pFF3fm5/GHLvRfS9+noFhL6pdjC
 XE7R+ahFp2VGSp3zMsTpERJFnW57oqWRizqv4y4ufsq4fkvICmdPhxovE4+FNlzhc0Ht
 lZA4ez9al59mH9eIR9NJgzFCIcV0yWObE7cT714oiHNfrXeHAk3kVT0DhSERORSp6+zr
 HNiyiOxRiIG2LXsClIIqHH6B11EAVbhOAJuJtTD2lPwXFFfCRxGr5aGua0XPLp3Tv0QQ
 2bbCd8aDcl9Q/ayMt+AqMiINCu0rGlOkflMaKwDa5OY7WtSIaolI5Kw68YtZVQUusYMY
 9i8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYMPBK8uImUtEf60mqBA0vpSt2l5oNERr0mQgdkY/9s=;
 b=hEPDV4lpSnbmE440SJHtXMjH0Py/g+jkXrpWzanLyFdFdIRC5U8/XipIBiI4qpsinU
 tJHDfrDEyNfRSzVNtr2XzrwdJAlL4MMhF522ecL6hMIQzdQjd1DNHO3m3Y3tdqrtSync
 bQi8nkyTR/gycZGN8wMJhzPXhSfHWcWRCZFqExf7/JlqTvnw4cc5/b2qiLe5nsjyTTEL
 UBKeB8OMioTGHzaQFOS0PXRTytVVbhfHf7j7BGwrVjLHHZT15f0GdDiisWgO3iq52Lf6
 5yd0VjKU1kxOI2uzvVzrdKUuBUUo2zOKu7YoXA1HWIqVOjIyonVk/MDfR71cEfMHWQqR
 P23w==
X-Gm-Message-State: AOAM533xReEuqMrRteuo0xkJYfpRWvgBy68sS7j5Z5r8c909mLuQ2Ei2
 qTZIihXZC6uUaxRbjBs7bVewi6rWOmyJ/g==
X-Google-Smtp-Source: ABdhPJz7GI4ciCKFwxwkgUU9rYODPb6dM8OSqVRkmXt/CJS6NrjTXO9B5tdGO+7i8pbuuVjMDkEVfg==
X-Received: by 2002:a17:902:ecca:b0:151:92a1:ce5 with SMTP id
 a10-20020a170902ecca00b0015192a10ce5mr11866866plh.79.1646341220253; 
 Thu, 03 Mar 2022 13:00:20 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] tcg: Add TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 10:59:36 -1000
Message-Id: <20220303205944.469445-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: WANG Xuerui <git@xen0n.name>, peter.maydell@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define as 0 for all tcg hosts.  Put this in a separate header,
because we'll want this in places that do not ordinarily have
access to all of tcg/tcg.h.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-sa32.h     | 1 +
 tcg/arm/tcg-target-sa32.h         | 1 +
 tcg/i386/tcg-target-sa32.h        | 1 +
 tcg/loongarch64/tcg-target-sa32.h | 1 +
 tcg/mips/tcg-target-sa32.h        | 1 +
 tcg/ppc/tcg-target-sa32.h         | 1 +
 tcg/riscv/tcg-target-sa32.h       | 1 +
 tcg/s390x/tcg-target-sa32.h       | 1 +
 tcg/sparc/tcg-target-sa32.h       | 1 +
 tcg/tci/tcg-target-sa32.h         | 1 +
 tcg/tcg.c                         | 4 ++++
 11 files changed, 14 insertions(+)
 create mode 100644 tcg/aarch64/tcg-target-sa32.h
 create mode 100644 tcg/arm/tcg-target-sa32.h
 create mode 100644 tcg/i386/tcg-target-sa32.h
 create mode 100644 tcg/loongarch64/tcg-target-sa32.h
 create mode 100644 tcg/mips/tcg-target-sa32.h
 create mode 100644 tcg/ppc/tcg-target-sa32.h
 create mode 100644 tcg/riscv/tcg-target-sa32.h
 create mode 100644 tcg/s390x/tcg-target-sa32.h
 create mode 100644 tcg/sparc/tcg-target-sa32.h
 create mode 100644 tcg/tci/tcg-target-sa32.h

diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/aarch64/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/arm/tcg-target-sa32.h b/tcg/arm/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/arm/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/i386/tcg-target-sa32.h b/tcg/i386/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/i386/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/loongarch64/tcg-target-sa32.h b/tcg/loongarch64/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/mips/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/ppc/tcg-target-sa32.h b/tcg/ppc/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/ppc/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/s390x/tcg-target-sa32.h b/tcg/s390x/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/s390x/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/sparc/tcg-target-sa32.h b/tcg/sparc/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/sparc/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/tci/tcg-target-sa32.h b/tcg/tci/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/tci/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 33a97eabdb..8c131293fe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -61,6 +61,10 @@
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg-internal.h"
+#include "tcg-target-sa32.h"
+
+/* Sanity check for TCG_TARGET_SIGNED_ADDR32. */
+QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS == 32 && TCG_TARGET_SIGNED_ADDR32);
 
 #ifdef CONFIG_TCG_INTERPRETER
 #include <ffi.h>
-- 
2.25.1


