Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B75A9060
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:34:04 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeiB-0002lZ-3F
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4p-0006g3-Vs
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4n-0003Ri-U6
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so775051wmk.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=duBeBoFX8QNETCcok0dytuQZN74JHxnbRDKrjktEj6Y=;
 b=E3xi7DIDKw9nc4rOehbH/66Efs8TlBTl9m6PAUpicrgA7WDwcyDTXcu/V2o1x8SBjR
 4VrQQaRv0vgJuNiTSTw+1UcFn54S/3rfghKj5s3oi1p3NrBN2tg5ZZHeb6/1alLBCy3E
 yzPvv3QQz3RcYhGo2ULgPpBt1c/Ba4my7ExdFil/Wtzpb/JIO2GslRzcXbGRcAE71vGH
 NbNucE7XLyLO1Hi2er30z683CCt5wp/xjR4UpUCCA2lwhHU2xOW/ZnaGmxmiCIOPqF7O
 Txz9apjEXneeo7v4vHhLzRJaK9IwHX8ZPLfa3hUr5RRim2suLvcAT9Iz9TOEotzRAV00
 +B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=duBeBoFX8QNETCcok0dytuQZN74JHxnbRDKrjktEj6Y=;
 b=gF9ZwPxFJMmOnaHYBFHHUwUItbOF41GM02Jmb45TmnF0Aq7IiVYoidUNuY527n0XJ2
 VYpwAEkZFce6lNcmkjTWIAYzPlXUqTDaFC5+dqdEFB8Y6OaIVq5OnVTZ5ULL+phOWAG2
 J3D0pwDbR1qh8gbYgL780BxybngJ49y2Mpw2VN4ZlFCFISFKSX+ChLXYvEPV2exoeHeS
 WjI8qUyhe5WPX6YgC77RRPeqdnqqCAbuDRP7a+W6A+j+5zFKgaaibIjVUkN4bE9q+rBC
 GEqcLC3ZDmDW2jXI0FsbRXI9qGkAFbzo8FUcazxcb5D/P25SL1H7vShyMG7JhcCyABfB
 3iRw==
X-Gm-Message-State: ACgBeo32Vd4jQ8u64WR4p6Kc16MxUmMVxMLDLDW2/VZ8la2n7mebMzcw
 DAw+14MZzhF14fxzYR+cCf96MgDNeWDEq9GD
X-Google-Smtp-Source: AA6agR5UJ8aXvm2spR+kv//UMC+3gSO6agCneg0rRODFhwMGQGgtaIoEJ4mr4uf9EKJXwf7/Oy1YTA==
X-Received: by 2002:a05:600c:22d2:b0:3a8:3e8c:d914 with SMTP id
 18-20020a05600c22d200b003a83e8cd914mr4057106wmg.128.1662015200334; 
 Wed, 31 Aug 2022 23:53:20 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 20/20] target/riscv: Make translator stop before the end of a
 page
Date: Thu,  1 Sep 2022 07:52:10 +0100
Message-Id: <20220901065210.117081-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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


