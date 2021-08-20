Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B03F3268
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:46:19 +0200 (CEST)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH8av-0008FQ-KH
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xz-0005I4-1y
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:15 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xq-0003mj-5O
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:11 -0400
Received: by mail-pj1-x102c.google.com with SMTP id oa17so7827495pjb.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEsAxRc7JdZ/BSsn2AS7p0rZoGqW6QfhyAngNtE9mC8=;
 b=blefX4G311GP7PEbFiIBfZixKg4EDoCXH1GLAONCaaNQ1alzzNPI6DcLL41GL3rC+P
 sxhxrA3Kxou6QRTyy5uMi8H0Nyt8bWCevuI/UnVcKhOfBZDJgRMtqNI8IXMGZNvm4JQ3
 UeXMGmFc6ybYn8afahAU+f2mU9QnVZ6qIGM9hUaRokgc3BwhxUor42FC8kJ2S1NRYCz/
 RoJ4GxqGABtGjg8B7GGeTILIqnUODtaiF4a3P5vjOs8DWeHVVF48NGDM+9ZaJHpMMihf
 h+nxyLaawpyRqE7+gFohl54SwgCm39h0Bmxj+v1HXrl9PP2obI3MdvHfoBea6uS6bFNE
 UjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEsAxRc7JdZ/BSsn2AS7p0rZoGqW6QfhyAngNtE9mC8=;
 b=NnrN1bKFfoJnPpYuyCNeAd0OZbSa2qGZou0ztkwXWk/A1CiMTf47oitBMVmjGarfte
 Hh69Hqm+OPh3xUgeoi1PnEoHoFcdAtRVG5cgNPTfcNr45rEnZkPRW6Yq0vSDhntHeypP
 gvj6R+5hOCFuEU2ODGZ0vN3ZdH5Ql+we/sQ6U7YtikOIqdTlZleKYIHdJUzXw2dUWT3X
 sBD4gB6y4707sg0nX6NwdIY0aBQR0Pcauei0ykU+WDR3FfvLkFt3JPWBzsON5W+FWSW8
 YgVT7AUNLBbyE2khQ4n5fH2gM90Pd1D72SPUuxw4DuhcmfXce+LB8MMEDA+X/RrRCdfR
 K6tA==
X-Gm-Message-State: AOAM531ZuVSEnodkiWUFcNZCakpOSiLhFFkzzm8BnXJOLhDE7/tSXYgT
 6V5ZB2I7/otZ9Teomaxtc3Y3MFGXloZSWg==
X-Google-Smtp-Source: ABdhPJw2TzyTwQhfuBnT8lLExyTuiwlHMhYZBIoIv50iY6beOVFiPwLvvGiVjzre2IZ7VLpo1ipDmA==
X-Received: by 2002:a17:90a:fa89:: with SMTP id
 cu9mr5444355pjb.5.1629481384290; 
 Fri, 20 Aug 2021 10:43:04 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/21] tests/tcg/riscv64: Add test for division
Date: Fri, 20 Aug 2021 07:42:38 -1000
Message-Id: <20210820174257.548286-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/riscv64/test-div.c      | 58 +++++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |  5 +++
 2 files changed, 63 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

diff --git a/tests/tcg/riscv64/test-div.c b/tests/tcg/riscv64/test-div.c
new file mode 100644
index 0000000000..a90480be3f
--- /dev/null
+++ b/tests/tcg/riscv64/test-div.c
@@ -0,0 +1,58 @@
+#include <assert.h>
+#include <limits.h>
+
+struct TestS {
+    long x, y, q, r;
+};
+
+static struct TestS test_s[] = {
+    { 4, 2, 2, 0 },                 /* normal cases */
+    { 9, 7, 1, 2 },
+    { 0, 0, -1, 0 },                /* div by zero cases */
+    { 9, 0, -1, 9 },
+    { LONG_MIN, -1, LONG_MIN, 0 },  /* overflow case */
+};
+
+struct TestU {
+    unsigned long x, y, q, r;
+};
+
+static struct TestU test_u[] = {
+    { 4, 2, 2, 0 },                 /* normal cases */
+    { 9, 7, 1, 2 },
+    { 0, 0, ULONG_MAX, 0 },         /* div by zero cases */
+    { 9, 0, ULONG_MAX, 9 },
+};
+
+#define ARRAY_SIZE(X)  (sizeof(X) / sizeof(*(X)))
+
+int main (void)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(test_s); i++) {
+        long q, r;
+
+        asm("div %0, %2, %3\n\t"
+            "rem %1, %2, %3"
+            : "=&r" (q), "=r" (r)
+            : "r" (test_s[i].x), "r" (test_s[i].y));
+
+        assert(q == test_s[i].q);
+        assert(r == test_s[i].r);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(test_u); i++) {
+        unsigned long q, r;
+
+        asm("divu %0, %2, %3\n\t"
+            "remu %1, %2, %3"
+            : "=&r" (q), "=r" (r)
+            : "r" (test_u[i].x), "r" (test_u[i].y));
+
+        assert(q == test_u[i].q);
+        assert(r == test_u[i].r);
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
new file mode 100644
index 0000000000..d41bf6d60d
--- /dev/null
+++ b/tests/tcg/riscv64/Makefile.target
@@ -0,0 +1,5 @@
+# -*- Mode: makefile -*-
+# RISC-V specific tweaks
+
+VPATH += $(SRC_PATH)/tests/tcg/riscv64
+TESTS += test-div
-- 
2.25.1


