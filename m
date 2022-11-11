Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA662554C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6H-0001Fk-8U; Fri, 11 Nov 2022 03:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5X-00010G-Fb
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:38 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5T-0002Dp-CV
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:33 -0500
Received: by mail-pf1-x430.google.com with SMTP id 130so4274219pfu.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=KFEOlE5WV6LomtCQx9lDL29ipj4MF8ZZrCnCE6E6sBIEbq8i50IJpqO7HhvjxJLWFM
 s1sVrkdkBHqeSU+hsauyaIJl5Rg6KuzTD7PgtiWhn8DBJn9tzxHnGfTMqyJJ0evDUv25
 FRhKCMJqzvfO1B/BhLdgqdXYo/vtxA5ik/94QEVu3IbXMEr3Jbn16SE3OKxN7D0lVp7u
 DhDmM4JI8sua9R46c9eFpDfFjS2g4teevAjBM7iBRQ0w9ztY01IYeoHat6b2BT+VYNEm
 O0f/i+ymH+Nzsj0E+1t9x8AMXTi9i6t7WxR8xSZU4gJ6RzXILHd3o0dicQ6Fv59Dpx5A
 UUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=yhtQogyo61cZ9Gmlp4nQ4wUpbJX0DJxBNVrLhNxaL6eIqm9L6qDp7Lyv3EHj51SVRM
 qEW5lOlhMpCMzHOSU7dNFN4so0CCYbiHat6q6QHkOsEfGbJVfR3MWX16E/XXsykYXTcR
 mCprtkQj4eX/aotCS2OMi5YZC0ftLRaflIXgeZjMbI2ksC0eKt0ZFoJDC7W7bJFuT7iB
 5fsQ2SKm286hs1iBCVIGXfySAkNvK77U+clN/M4t0X/fAsDOPbvbwj42Uwe+44sTa+Q4
 tYjfy2CPjwc2TItBixi8jgabqvtxg8lSoc6ANe5b+SfAq7Xq+F982KSw4n3qzxwkiEoF
 a1ZA==
X-Gm-Message-State: ANoB5pk0+wF5vZ4lVtbcRi7M1aN+kCcAmeSvq5rnV/my1TdnGLSQzXSM
 lgYjWtgny82VBwbWVNG6f6mzzQy1eWyJ7ams
X-Google-Smtp-Source: AA0mqf69IpPrKr98yheVb77jMnNZutB+fQ+wt0vx6zjdckfGx746PU8BK99mLrlUj06Y8K6QST4onw==
X-Received: by 2002:a63:4d1c:0:b0:462:e0d0:2582 with SMTP id
 a28-20020a634d1c000000b00462e0d02582mr740380pgb.48.1668154109891; 
 Fri, 11 Nov 2022 00:08:29 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	david@redhat.com
Subject: [PATCH for-8.0 v2 01/13] tests/tcg/s390x: Add div.c
Date: Fri, 11 Nov 2022 18:08:08 +1000
Message-Id: <20221111080820.2132412-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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


