Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D8641855
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 18:59:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Wls-0006xH-Jo; Sat, 03 Dec 2022 12:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1Wlr-0006vs-8v
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 12:57:51 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1Wlp-00061F-JX
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 12:57:51 -0500
Received: by mail-oi1-x22a.google.com with SMTP id q186so8547569oia.9
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 09:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x2tUJtrZjzSMGF7cLFs50dFYmcY5SifN0BJUMx7VetE=;
 b=jHTOwUvnjr64nLT20n3eEGGapPJ7zG7CApgZkR5XndvB5jYvSjIL9PbRscTGK2lLP5
 t1PzvIgpgjem2uIunT0XMLsZqgMMbraTXUseX5hWNVg91PlJ4U4ndAymVPv2HTY1WGBu
 kcPIGrvHLFPq3bNJZCkyMgM60xqAzduqouwyfZDgVrgkua0bhhnIo1LAZ3ZPSoQpNCY7
 J9ZfSYene+gvt6zgCjoLiOVh8pd0seJ9uw95fKlt2IwLgaK1UpwHSP8afuwqOqj1+8BJ
 dbt7piHVeEJ60gGhJsMAKwP81e2i2JGl4iZva3KoQWe+OYU86zaJSrgVioBmgqR4epiJ
 7WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2tUJtrZjzSMGF7cLFs50dFYmcY5SifN0BJUMx7VetE=;
 b=c6GGExyNQkCYH7P0eQ6Us8gRj1vLbajS4qayjiEtpRVLyIKt7bUxM9pDm2+hI0XKKJ
 MUYtkielfWdxAnaDTgqZhzX+yCEPdFnEh1BvTyyr27wFKe5iUs601+b9LMYs2XXofAgq
 /Gol81xALuaP9SiE0Y3vj8IfzcE/sZ/iEmNlr70rC5ep+3B3eOg8HOVTCSrU+mY2/ULU
 CFFcMJA658qQvCnTMLFjsGMqLAMrWtGZwQdr/EYrnqQM/sydderBkYQjMhtEhxS9RaH7
 LD45C6SRuGk1ZyObKDINO1RPkps1n0/naN4RgEg/pYXUQtFGhLgEHX3vhvGsnNJJhoDP
 teOQ==
X-Gm-Message-State: ANoB5pkvBXUkFvhFCKZkY0XkhRGlxKMQe9ltX0AVF9MNhk2/sDQUL6pM
 lnaKerxPzIiTqUy4FUHSeg9bl9VnpXTFjosgvXI=
X-Google-Smtp-Source: AA0mqf70NPOs/dGA0ri3LotlU9lxoqVyyWJgjFK1IV8hIC2wI+907AaxiRcsLdrE/lxAUbfPizw8dg==
X-Received: by 2002:a54:4606:0:b0:35a:220f:800e with SMTP id
 p6-20020a544606000000b0035a220f800emr39098653oip.257.1670090267956; 
 Sat, 03 Dec 2022 09:57:47 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:7079:1798:87ad:611d])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a05683014da00b0066cb9069e0bsm5091007otq.42.2022.12.03.09.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 09:57:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-stable@nongnu.org
Subject: [PATCH] target/riscv: Set pc_succ_insn for !rvc illegal insn
Date: Sat,  3 Dec 2022 11:57:44 -0600
Message-Id: <20221203175744.151365-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Failure to set pc_succ_insn may result in a TB covering zero bytes,
which triggers an assert within the code generator.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1224
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c          | 12 ++++--------
 tests/tcg/Makefile.target         |  2 ++
 tests/tcg/riscv64/Makefile.target |  5 +++++
 tests/tcg/riscv64/test-noc.S      | 32 +++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-noc.S

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db123da5ec..1ed4bb5ec3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1064,14 +1064,10 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 
     /* Check for compressed insn */
     if (insn_len(opcode) == 2) {
-        if (!has_ext(ctx, RVC)) {
-            gen_exception_illegal(ctx);
-        } else {
-            ctx->opcode = opcode;
-            ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            if (decode_insn16(ctx, opcode)) {
-                return;
-            }
+        ctx->opcode = opcode;
+        ctx->pc_succ_insn = ctx->base.pc_next + 2;
+        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
+            return;
         }
     } else {
         uint32_t opcode32 = opcode;
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 75257f2b29..14bc013181 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -117,6 +117,8 @@ endif
 
 %: %.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+%: %.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 else
 # For softmmu targets we include a different Makefile fragement as the
 # build options for bare programs are usually pretty different. They
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index b5b89dfb0e..9973ba3b5f 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,3 +4,8 @@
 VPATH += $(SRC_PATH)/tests/tcg/riscv64
 TESTS += test-div
 TESTS += noexec
+
+# Disable compressed instructions for test-noc
+TESTS += test-noc
+test-noc: LDFLAGS = -nostdlib -static
+run-test-noc: QEMU_OPTS += -cpu rv64,c=false
diff --git a/tests/tcg/riscv64/test-noc.S b/tests/tcg/riscv64/test-noc.S
new file mode 100644
index 0000000000..e29d60c8b3
--- /dev/null
+++ b/tests/tcg/riscv64/test-noc.S
@@ -0,0 +1,32 @@
+#include <asm/unistd.h>
+
+	.text
+	.globl _start
+_start:
+	.option	norvc
+	li	a0, 4		/* SIGILL */
+	la	a1, sa
+	li	a2, 0
+	li	a3, 8
+	li	a7, __NR_rt_sigaction
+	scall
+
+	.option	rvc
+	li	a0, 1
+	j	exit
+	.option	norvc
+
+pass:
+	li	a0, 0
+exit:
+	li	a7, __NR_exit
+	scall
+
+	.data
+	/* struct kernel_sigaction sa = { .sa_handler = pass }; */
+	.type	sa, @object
+	.size	sa, 32
+sa:
+	.dword	pass
+	.zero	24
+
-- 
2.34.1


