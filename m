Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB25AE406
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:22:09 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUmV-0007Hq-Vm
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6W-0002zE-O2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6U-0005UN-P2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id b17so959375wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=duBeBoFX8QNETCcok0dytuQZN74JHxnbRDKrjktEj6Y=;
 b=JWUP9Lswc0H4z0BN3y8CybqoJ/xAvUgPwNlFefR3R6UkfdmK2GBasCz+u+Vz4NePgY
 0RMDJ4GrmQouMphyfoiDr+6Z/cNw9OGCHWo31oSYcvEcH47KMH7JXopASY9j5L+40n0P
 dQJizfvK7SjcKs1eQk59L7MYn9Cw5xMmgA1GAWIztnes9Ad23LmDz2hBTPJZawEXAhxU
 Mo/XNoK1y7nlYum5c4+CkLapVpLGHR0ftKH3ZesJbEGycgpg8vk7Cowf0HWv6ECZrbLG
 TpwKm4lbbSfHOBRC0LYS030UTHKfcf+vR8WZQuINAQiLJQlR5JYIYHJqTlMF5N6KJMIl
 mS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=duBeBoFX8QNETCcok0dytuQZN74JHxnbRDKrjktEj6Y=;
 b=735/ShRvDrvT/3c2NNcJdQddojs6t4Xefh6jAhfgI2WiBtf5O2UvNYJCMykOxRyJxG
 ooGDYyh6Z8lFU439lcrZR+FTdm9puBKFkP5fhAqN6KYDCrc6XrPYXxDU9HxVetE+F9Aa
 LWIgmSRetUtqPxlvATjv8SlHN0IsRF+zKbWTxoUoIzftLwBHmjQlQOXArPmxd8Ywncyq
 oXo7RDv05rAwZz+hmBOg3bmUI4GG9DyjOd0FmQc1X7PGsXh3AeSNMHM5sSUL5+5/JsrI
 /LXnnjcVS8fR1aEif4lUEhaXKylXC0ho+X6UXkpJFbKOS3syAJhWjJA+Wn7TwFFT/B3b
 TUjA==
X-Gm-Message-State: ACgBeo3SEfG8EalBosgAFxBOWSq9MXt3Pl/8tijgZECtHPRhVfTts35G
 vBx7T4w3m09rdCm9qcMNjrbQ2SPCauB30/TC
X-Google-Smtp-Source: AA6agR49LcSG3W0gyBT6185ks8YfimKFkPSFOpDzZNWkKWc4Tr1nYLUqU3FQAkXBe1wpYT0vlATbOA==
X-Received: by 2002:a5d:48d1:0:b0:225:3ee8:e5b8 with SMTP id
 p17-20020a5d48d1000000b002253ee8e5b8mr25183711wrs.105.1662453521952; 
 Tue, 06 Sep 2022 01:38:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 20/20] target/riscv: Make translator stop before the end of
 a page
Date: Tue,  6 Sep 2022 09:38:15 +0100
Message-Id: <20220906083815.252478-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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

Right now the translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1155
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c          | 17 +++++--
 tests/tcg/riscv64/noexec.c        | 79 +++++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |  1 +
 3 files changed, 93 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/riscv64/noexec.c

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a719aa6e63..f8af6daa70 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1154,12 +1154,21 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
     ctx->nftemp = 0;
 
+    /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
-        target_ulong page_start;
-
-        page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
-        if (ctx->base.pc_next - page_start >= TARGET_PAGE_SIZE) {
+        if (!is_same_page(&ctx->base, ctx->base.pc_next)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
+        } else {
+            unsigned page_ofs = ctx->base.pc_next & ~TARGET_PAGE_MASK;
+
+            if (page_ofs > TARGET_PAGE_SIZE - MAX_INSN_LEN) {
+                uint16_t next_insn = cpu_lduw_code(env, ctx->base.pc_next);
+                int len = insn_len(next_insn);
+
+                if (!is_same_page(&ctx->base, ctx->base.pc_next + len)) {
+                    ctx->base.is_jmp = DISAS_TOO_MANY;
+                }
+            }
         }
     }
 }
diff --git a/tests/tcg/riscv64/noexec.c b/tests/tcg/riscv64/noexec.c
new file mode 100644
index 0000000000..86f64b28db
--- /dev/null
+++ b/tests/tcg/riscv64/noexec.c
@@ -0,0 +1,79 @@
+#include "../multiarch/noexec.c.inc"
+
+static void *arch_mcontext_pc(const mcontext_t *ctx)
+{
+    return (void *)ctx->__gregs[REG_PC];
+}
+
+static int arch_mcontext_arg(const mcontext_t *ctx)
+{
+    return ctx->__gregs[REG_A0];
+}
+
+static void arch_flush(void *p, int len)
+{
+    __builtin___clear_cache(p, p + len);
+}
+
+extern char noexec_1[];
+extern char noexec_2[];
+extern char noexec_end[];
+
+asm(".option push\n"
+    ".option norvc\n"
+    "noexec_1:\n"
+    "   li a0,1\n"       /* a0 is 0 on entry, set 1. */
+    "noexec_2:\n"
+    "   li a0,2\n"      /* a0 is 0/1; set 2. */
+    "   ret\n"
+    "noexec_end:\n"
+    ".option pop");
+
+int main(void)
+{
+    struct noexec_test noexec_tests[] = {
+        {
+            .name = "fallthrough",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2,
+            .entry_ofs = noexec_1 - noexec_2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = 0,
+            .expected_arg = 1,
+        },
+        {
+            .name = "jump",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2,
+            .entry_ofs = 0,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = 0,
+            .expected_arg = 0,
+        },
+        {
+            .name = "fallthrough [cross]",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2 - 2,
+            .entry_ofs = noexec_1 - noexec_2 - 2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = -2,
+            .expected_arg = 1,
+        },
+        {
+            .name = "jump [cross]",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2 - 2,
+            .entry_ofs = -2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = -2,
+            .expected_arg = 0,
+        },
+    };
+
+    return test_noexec(noexec_tests,
+                       sizeof(noexec_tests) / sizeof(noexec_tests[0]));
+}
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index d41bf6d60d..b5b89dfb0e 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -3,3 +3,4 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/riscv64
 TESTS += test-div
+TESTS += noexec
-- 
2.34.1


