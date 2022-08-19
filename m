Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7FC5993A2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:42:12 +0200 (CEST)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOste-0004W4-9T
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseh-0002Ok-ID
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:43 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOsef-0002k1-LV
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:43 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q9so1839329pgq.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eG1O+v8L8NJE9bJ3ZvxBbx6/WL3iXYhAToDfN+kCmp0=;
 b=vjHtIMwWNM8NKeTeKYqzlRL4PjUznKYu5wOaYlqIjR14ztgWVDOWLdABJ4S4DcVM63
 Y/6g+Q8/qt16YJlZYwfMgyeuP8/KnjvHjhPGu0SYz/foRv+c/vJTt4d5WSSfTl/NxKYY
 Nk2q5oqaE0H8AL8sKwgSHA07dJ1V3WTG9pGE6ToVPAD8enR1Ii1f2Ls9j0mFj7I8Ynkj
 jqyzVHyhhuA+UwHyPz29wtPlwPQpaVSf+9hHRcXcoEH3Hy43mmvzY2va8iDdTrdiXfGm
 G0JpZfYTIHblmtinJaAX71GJWkUZ8ilOd3tPOldXzm5scpk/Wjg3nSrjo1UTPl0uD4ma
 FmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eG1O+v8L8NJE9bJ3ZvxBbx6/WL3iXYhAToDfN+kCmp0=;
 b=Nv2lXlqU55X1No2H17ueHHSAHeM2GBBmvAWy48K4kgahHY5LXrxwdfZSvkom7mXNUp
 33e+KQ4KCsdeZFsPwV2LP+qUKamaxP7Hk4Gqe0tq7kXNbedmk3UC1JD/nBV7pZWVmxoc
 Wj+y9ZmAOSPHTBfRcawJ9TSJcIa9kmnZIlPxe5mU/fZc/rS6PK6TUHMc/LtX8mABO2WZ
 KxLDZ7qhZEOLrfDgGrfbLbFvfls83RorZGu9gq0VXbQuAXTMt/l32nkAzH/ZXd9/PT+h
 NIQ2rJ/4Itul9m9QXNOY4zHXMYwBeiX5fQxBCNYOcNyGvPsMMiTvUEoqZSCh1dCj/ELH
 23mg==
X-Gm-Message-State: ACgBeo3Y95xSdYEU56BRqfONOmAGBtQWbXDwJyWsan4wzeeB7NaKf7Q5
 gjSXODClwjUrNeN/IUg0TINrQTj8rp3rEg==
X-Google-Smtp-Source: AA6agR68NsfRFpb5xS0BHOO1HY6Uwqlcrg3tVT4COnmDNzLI/a7N9cOQWe/wCdDYUt/h1xTO2kSxMw==
X-Received: by 2002:a05:6a00:2392:b0:52e:b4fb:848 with SMTP id
 f18-20020a056a00239200b0052eb4fb0848mr5954277pfc.8.1660879600910; 
 Thu, 18 Aug 2022 20:26:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 21/21] target/riscv: Make translator stop before the end of
 a page
Date: Thu, 18 Aug 2022 20:26:15 -0700
Message-Id: <20220819032615.884847-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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


