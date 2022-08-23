Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987B59EEE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:19:07 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcEk-0005nq-Ev
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc2H-0000dX-8X
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc2F-0001St-Bl
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:06:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso2332005pjb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=duBeBoFX8QNETCcok0dytuQZN74JHxnbRDKrjktEj6Y=;
 b=H2Nhl4GmnSpHvz8yVD8rohcHNy97tAa5i2gldxCG7R6zb7VZez+m+uh2GIk22O10zX
 JvRFsGbyfUBXff8EZTEKF3lqr5xelR93oZkamHkeFL8b39vnXzPLUL+7OO0eJcooPo1k
 wvLwP/X2cmM3GY8oEKQD9QT+fGzvEz1ZIdOOC7J5i/pO6DfK4Sw/PFYRiwlKbipheuPp
 huSIBguh2GKgmvBsEM6Yhyfp5Us2J5a6AeM6eUdv4X4/EQ3iCIR7ncI0YYEuPyr+hDh3
 zOD/CXmmLkAmP2PmX4m7w64stvg5GD19Lo8lyvZY68G8qLXbsUOweSFqTja9b7m8OJlO
 M0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=duBeBoFX8QNETCcok0dytuQZN74JHxnbRDKrjktEj6Y=;
 b=BO6lTwJhPz9CZlZDhVJId2+tl1Yx0vPAbdEoDxvO5fOnLSzhDM7cYOOkE3mqv3LGp+
 qH3GBbOcImV9GmIrR1MJTAso4KI8ziJ2aCVLR+7319qSs9RrsTTopwP7bGiA3UYgyG/u
 a6dXv1Yj4hvT7KcVdyff9SVNkBnqWKvpppeCseCnD6W3dxNcDT0/QRmLtsX1HQUnVDsG
 XYc8RGUnVb7xbB+Xl4Vz55hrhbd+aV/VfOjvuYt7HANJtMnYo4IdWzJa+CoQn5ifbGX6
 4HTV15en3ZkN3DQPOF8CiCg9jS2xlqMfkmrx0Qqn3YCB8TWBJ33xRWtox1WF/IEhxO3T
 Oqow==
X-Gm-Message-State: ACgBeo2kF7cx5LPETq8jez5E3CI1XwrE3Tht3Q+F+L11AGeR8r0Z5Dcu
 U69DpLmBlBPpPnkwAoZINjD9yEBVARhWnA==
X-Google-Smtp-Source: AA6agR6yUOb5xShFxamjwnlA9V/dagA6YgM39AzjbNeHy2yLy+knmA/ph1ZNtWgyysaOXTIWFERSvg==
X-Received: by 2002:a17:902:e5c4:b0:173:1015:d01c with SMTP id
 u4-20020a170902e5c400b001731015d01cmr1888476plf.15.1661292369821; 
 Tue, 23 Aug 2022 15:06:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 20/20] target/riscv: Make translator stop before the end of
 a page
Date: Tue, 23 Aug 2022 15:05:42 -0700
Message-Id: <20220823220542.1993395-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


