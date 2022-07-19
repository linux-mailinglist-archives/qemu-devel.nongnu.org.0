Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2057A63D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:12:55 +0200 (CEST)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDriJ-0005YD-0K
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWp-0006qC-3c
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:03 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWm-0006FO-Md
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:02 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 k8-20020a9d4b88000000b0061c7f8c4f77so11347230otf.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+zv7fxYQK+R9uuv5ZXmELK++eFHf5p7TqYGKSG47nw=;
 b=YglwtyW821ERvJbJ0IyXNYTc07904+3siCLQ6LqaRDC82HytHmm4Ll0/gtzXztRCvo
 sLHB8X3hE32bznQ6CH+4zwQUSt2YWGf9O0spdR8gIy1BLomBFIz9WKYjirPAE+Wkk4SG
 JqZyumDKMx/MqNHHMXXmL1hpRm6D+nvS53Z6m6mGL1TUSa5PrviST3pTY5pva4gfDrRw
 HJckt2bRb/Gxxxe/vh/b9HRyHgnR5v7o/ezWZ3oyyCOi6GOhxotQQjCYl1lL608rNDQJ
 7A165LF8fz20a1YEIjz0KqI9VzhMOHLvZ92e86xNoyi6RkW0e/tE2YvxtkfqfuMuSVzg
 NQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+zv7fxYQK+R9uuv5ZXmELK++eFHf5p7TqYGKSG47nw=;
 b=7r3CFgBEWArrTIpR+CcoM4Iz9w4+Dr/2knSRQUl1ut4POjZdMw0NdxPnvKmDd76dQc
 Cdpv76JVpAFEm+dzVUAU5dQZnMzn2H1Ih7fFRLzPepJfzCaJGQvdyxq8Crx00TQeIWfV
 4PFD9LfaKuVrhoA3o1kGlSeJOEzDqk5BZ/edY62oInwCxcDhLzCu6DQ/9rSQaU+tgGiM
 nF/uBBEbHdAUOgKXCF3VjkV0c8x812x6YPm5y9+Isl2cq30NymqJ8IQHwvsTrjIwI/ve
 gLxMa+IebNYi6JIh0pKqdiXK+SIVLcPachaVZHozY1Dg2ODCGhfDxgv0mKLog+Al50Bd
 X3Cw==
X-Gm-Message-State: AJIora+cInbS+6ssbQAB8W92jnUyZ0tOnjTgfI89O6fKHIzWJ0jlEkcX
 O4AD70ULJ9E/GpBk+PgA2WmlAPkZaPBeUsdH
X-Google-Smtp-Source: AGRyM1vHe8BAGO3y3HTa64mwode/+zEs7V0w9xS47avFYPIcdPb4qkEUzhieiuRUgbIar454te9Idg==
X-Received: by 2002:a05:6830:6006:b0:616:ae3a:73ca with SMTP id
 bx6-20020a056830600600b00616ae3a73camr13648139otb.359.1658253659588; 
 Tue, 19 Jul 2022 11:00:59 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 12/21] tests/tcg/loongarch64: Add div and mod related
 instructions test
Date: Tue, 19 Jul 2022 23:29:51 +0530
Message-Id: <20220719180000.378186-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This includes:
- DIV.{W[U]/D[U]}
- MOD.{W[U]/D[U]}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-6-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/loongarch64/test_div.c      | 54 +++++++++++++++++++++++++++
 tests/tcg/loongarch64/Makefile.target |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 tests/tcg/loongarch64/test_div.c

diff --git a/tests/tcg/loongarch64/test_div.c b/tests/tcg/loongarch64/test_div.c
new file mode 100644
index 0000000000..6c31fe97ae
--- /dev/null
+++ b/tests/tcg/loongarch64/test_div.c
@@ -0,0 +1,54 @@
+#include <assert.h>
+#include <inttypes.h>
+#include <stdio.h>
+
+#define TEST_DIV(N, M)                               \
+static void test_div_ ##N(uint ## M ## _t rj,        \
+                          uint ## M ## _t rk,        \
+                          uint64_t rm)               \
+{                                                    \
+    uint64_t rd = 0;                                 \
+                                                     \
+    asm volatile("div."#N" %0,%1,%2\n\t"             \
+                 : "=r"(rd)                          \
+                 : "r"(rj), "r"(rk)                  \
+                 : );                                \
+    assert(rd == rm);                                \
+}
+
+#define TEST_MOD(N, M)                               \
+static void test_mod_ ##N(uint ## M ## _t rj,        \
+                          uint ## M ## _t rk,        \
+                          uint64_t rm)               \
+{                                                    \
+    uint64_t rd = 0;                                 \
+                                                     \
+    asm volatile("mod."#N" %0,%1,%2\n\t"             \
+                 : "=r"(rd)                          \
+                 : "r"(rj), "r"(rk)                  \
+                 : );                                \
+    assert(rd == rm);                                \
+}
+
+TEST_DIV(w, 32)
+TEST_DIV(wu, 32)
+TEST_DIV(d, 64)
+TEST_DIV(du, 64)
+TEST_MOD(w, 32)
+TEST_MOD(wu, 32)
+TEST_MOD(d, 64)
+TEST_MOD(du, 64)
+
+int main(void)
+{
+    test_div_w(0xffaced97, 0xc36abcde, 0x0);
+    test_div_wu(0xffaced97, 0xc36abcde, 0x1);
+    test_div_d(0xffaced973582005f, 0xef56832a358b, 0xffffffffffffffa8);
+    test_div_du(0xffaced973582005f, 0xef56832a358b, 0x11179);
+    test_mod_w(0x7cf18c32, 0xa04da650, 0x1d3f3282);
+    test_mod_wu(0x7cf18c32, 0xc04da650, 0x7cf18c32);
+    test_mod_d(0x7cf18c3200000000, 0xa04da65000000000, 0x1d3f328200000000);
+    test_mod_du(0x7cf18c3200000000, 0xc04da65000000000, 0x7cf18c3200000000);
+
+    return 0;
+}
diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index c0bd8b9b86..24d6bb11e9 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -11,5 +11,6 @@ VPATH += $(LOONGARCH64_SRC)
 LDFLAGS+=-lm
 
 LOONGARCH64_TESTS  = test_bit
+LOONGARCH64_TESTS  += test_div
 
 TESTS += $(LOONGARCH64_TESTS)
-- 
2.34.1


