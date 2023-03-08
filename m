Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35D6B0FC7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxDb-00034Y-09; Wed, 08 Mar 2023 12:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pZxDX-0002uL-Bg
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:04:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pZxDU-0005XP-0q
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:04:41 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7CAEA400BC;
 Wed,  8 Mar 2023 19:58:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 0944A1FD;
 Wed,  8 Mar 2023 19:58:17 +0300 (MSK)
Received: (nullmailer pid 2098266 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 07/47] target/riscv: Set pc_succ_insn for !rvc illegal insn
Date: Wed,  8 Mar 2023 19:57:10 +0300
Message-Id: <20230308165815.2098148-7-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Failure to set pc_succ_insn may result in a TB covering zero bytes,
which triggers an assert within the code generator.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1224
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221203175744.151365-1-richard.henderson@linaro.org>
[ Changes by AF:
 - Add missing run-plugin-test-noc-% line
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
(cherry picked from commit ec2918b467228e7634f1dd5f35033ad3021b6ef7)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/riscv/translate.c          | 12 ++++--------
 tests/tcg/Makefile.target         |  2 ++
 tests/tcg/riscv64/Makefile.target |  6 ++++++
 tests/tcg/riscv64/test-noc.S      | 32 +++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 8 deletions(-)
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
index b5b89dfb0e..cc3ed65ffd 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,3 +4,9 @@
 VPATH += $(SRC_PATH)/tests/tcg/riscv64
 TESTS += test-div
 TESTS += noexec
+
+# Disable compressed instructions for test-noc
+TESTS += test-noc
+test-noc: LDFLAGS = -nostdlib -static
+run-test-noc: QEMU_OPTS += -cpu rv64,c=false
+run-plugin-test-noc-%: QEMU_OPTS += -cpu rv64,c=false
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
2.30.2


