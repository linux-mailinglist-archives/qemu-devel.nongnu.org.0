Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BF68AB45
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUA-0005Bz-Ca; Sat, 04 Feb 2023 11:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLU7-0005BX-Uo
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:51 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLU6-0002Tr-BH
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:51 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso11535525pjj.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=WRKse3cnNmGf1HtdJbbxjiurAlv6wV+C40wlV43Jl2JveiAAhelgwSoG/LegdI/b0V
 BoCKbu44ZhLbdmNZpBiaEdfYhimFSxP5CysVWLP/0lqdUvaQ6FqAzRXQqP87FZXukj0Z
 r+mfhpR5ClBXeWvhGKvkiCNNddI3YU9o9FghETE9xL1FNzL+gq90NFhA520kGFlcSwg3
 haKCMW+XK/gnUr1ZEOu02Eu4IrUx8NMhH8NoA5/HV1e9vK4iyHBhmX5cy28tEyQMNb6q
 wQbrU2qGRgCo93O13qVPOWAjvUuh9wiVU2WWLDXvJpPf66fGj0MoinGI6yZqvESX1tIk
 qY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=vaDbs2TvIvno7660RdyTqU1iIhaUqYPSHgg+sUWEmzi7l22Gn5Y4uoisdT/DUKwvqE
 UYIOmSVp3EAI9doVTt5mCrRpRL52F2kQBbXjm64yGoTDZ5XhgyKfk9/nFoPs4eNKJRYw
 bDVX9BuD4iMXQxr9/pLXC/mEiTK2TmwFXu3BuHuL/+bVZAcZOo6E8GBN/FXIZEmY9s7u
 5YccgFtSIQUVQOVKn20K/2jQuV7v5kpPJlk4JS20Vi9uGXlZYLOcDwnLlhTGxNLtPysu
 6IGRaOdqW9IOuZrTvyjary0emamH5VTQ/O6SVA6Qd69yBwhE2dCJ6pQfbU8NFCqqZAS+
 uhdw==
X-Gm-Message-State: AO0yUKUSffz/k4K8RoVbYpVVAfbeYaBITaPhNtGxtzYzVGdmPf5Hm+F5
 dTUpWGy77gN2f0GE76IwOsoQxDQKvhfx9SaA
X-Google-Smtp-Source: AK7set8REjLpYQfe/KSXavUIM3iIIyuwHoHq7toNHP1xWRZQ7FnNw17KZyyiJBp7bPj6UZRwr/87Zw==
X-Received: by 2002:a17:902:f24a:b0:198:f027:5925 with SMTP id
 j10-20020a170902f24a00b00198f0275925mr2376231plc.64.1675528429516; 
 Sat, 04 Feb 2023 08:33:49 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 23/40] tests/tcg/s390x: Add div.c
Date: Sat,  4 Feb 2023 06:32:53 -1000
Message-Id: <20230204163310.815536-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221101111300.2539919-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/div.c           | 40 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 tests/tcg/s390x/div.c

diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
new file mode 100644
index 0000000000..5807295614
--- /dev/null
+++ b/tests/tcg/s390x/div.c
@@ -0,0 +1,40 @@
+#include <assert.h>
+#include <stdint.h>
+
+static void test_dr(void)
+{
+    register int32_t r0 asm("r0") = -1;
+    register int32_t r1 asm("r1") = -4241;
+    int32_t b = 101, q, r;
+
+    asm("dr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlr(void)
+{
+    register uint32_t r0 asm("r0") = 0;
+    register uint32_t r1 asm("r1") = 4243;
+    uint32_t b = 101, q, r;
+
+    asm("dlr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
+int main(void)
+{
+    test_dr();
+    test_dlr();
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 07fcc6d0ce..ab7a3bcfb2 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -24,6 +24,7 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
+TESTS+=div
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


