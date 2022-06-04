Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C131653D8CA
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 01:12:54 +0200 (CEST)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxcwv-0001tv-Sl
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 19:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcv4-0008KZ-3W
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:58 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcuw-0004zj-3W
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id h192so3236919pgc.4
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WuXf3mRvUoBgdBHIfYWUJJXxwNA49V6B0JhTPyJnUA4=;
 b=Wa9FxM1AS4PiwwH6hzszou6dMI7pPJGKNICZXvdEbdo25BL0XugoJWHi/7rQ7Btiw6
 xn0vcYvyKVc55hEjU/xSDRtObHcUi4yB4PBqQb4Vm6SBdQT0XsiKxO0OiMqt+uCEoWMN
 EaotEqZpcdaYI6wBlw3DqBGHIks070z5ff587XYGnUZc+BDVV0yfkKW05Pryd4dnZSdj
 IzgbLy9xFGgv/UKZik86bgZiKfQqTOLPr5m+IdJwgHWxEbi1LVZ6ThINq6J+NVt8hvtE
 UjqrVYybI7D3tHBRnPcYDrY6Ws3slCLSeo7PqAogQK5QbSq+ZNlyOC4G0irqiRLZeD0N
 /vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuXf3mRvUoBgdBHIfYWUJJXxwNA49V6B0JhTPyJnUA4=;
 b=GvebBjDz7dj9gaCnO/o+2Q2RRQzU7+MQEIxTFnkmJ+zN7gIWSqAw4jakigjXv9qHaW
 65a79gCAW0wrdIbJTRpAoOOPGY5kx2yDwyOPVvfJASqfzruvWpy9LIRi+1UoX+P1s7nh
 puaxMjwVA5JvyaPC+YfEpBGn5sW9qsz+3sPfbhzN3RpHN6xDyVpHXQ2sazdvZe6z4ksD
 ZmGDv1bvL4knEyhWk1vM8EBi+v+gd/zuejO+erZWpVO2TxQTfdu0BZAt+w/njEA5vqiz
 3I61g1fxHqGlFTwceQJWWw8Snce2zhYEgzTRI/tx432VkbXfyTPKMsrAy4F1fX3Hvvrs
 0iKw==
X-Gm-Message-State: AOAM5318czprJYcCARaQd26Hk5d8fSNe2K1wg3BqSupH9ckJUYhgZpC/
 F5wyLTd0y93l9yOnjel6fYXQWywztqPlAA==
X-Google-Smtp-Source: ABdhPJzZjqaPRCa54zEGpVpkRzxQbSimW9DzbR7LDDEoq4aCd0jnUbfd7XXiU82EnZ4T56hSbbJQbg==
X-Received: by 2002:a05:6a00:16cf:b0:51b:5f55:9bc with SMTP id
 l15-20020a056a0016cf00b0051b5f5509bcmr16703314pfc.7.1654384206711; 
 Sat, 04 Jun 2022 16:10:06 -0700 (PDT)
Received: from bigtime.. ([2602:ae:1547:e101:250:b6ff:fe24:58ae])
 by smtp.gmail.com with ESMTPSA id
 184-20020a6302c1000000b003fcf1279c84sm5562151pgc.33.2022.06.04.16.10.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 16:10:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/riscv: Set env->bins in gen_exception_illegal
Date: Sat,  4 Jun 2022 23:10:02 +0000
Message-Id: <20220604231004.49990-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604231004.49990-1-richard.henderson@linaro.org>
References: <20220604231004.49990-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

While we set env->bins when unwinding for ILLEGAL_INST,
from e.g. csrrw, we weren't setting it for immediately
illegal instructions.

Add a testcase for mtval via both exception paths.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1060
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                  |  2 +
 tests/tcg/riscv64/Makefile.softmmu-target | 21 +++++++++
 tests/tcg/riscv64/issue1060.S             | 53 +++++++++++++++++++++++
 tests/tcg/riscv64/semihost.ld             | 21 +++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
 create mode 100644 tests/tcg/riscv64/issue1060.S
 create mode 100644 tests/tcg/riscv64/semihost.ld

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 55a4713af2..9196aa71db 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -238,6 +238,8 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
 
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
 
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
new file mode 100644
index 0000000000..d51ece7023
--- /dev/null
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -0,0 +1,21 @@
+#
+# Aarch64 system tests
+#
+
+TEST_SRC = $(SRC_PATH)/tests/tcg/riscv64
+VPATH += $(TEST_SRC)
+
+LINK_SCRIPT = $(TEST_SRC)/semihost.ld
+LDFLAGS = -T $(LINK_SCRIPT)
+CFLAGS += -g -Og
+
+%.o: %.S
+	$(CC) $(CFLAGS) $< -c -o $@
+%: %.o $(LINK_SCRIPT)
+	$(LD) $(LDFLAGS) $< -o $@
+
+QEMU_OPTS += -M virt -display none -semihosting -device loader,file=
+
+EXTRA_RUNS += run-issue1060
+run-issue1060: issue1060
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
diff --git a/tests/tcg/riscv64/issue1060.S b/tests/tcg/riscv64/issue1060.S
new file mode 100644
index 0000000000..17b7fe1be2
--- /dev/null
+++ b/tests/tcg/riscv64/issue1060.S
@@ -0,0 +1,53 @@
+	.option	norvc
+
+	.text
+	.global _start
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	# These are all illegal instructions
+	csrw	time, x0
+	.insn	i CUSTOM_0, 0, x0, x0, 0x321
+	csrw	time, x0
+	.insn	i CUSTOM_0, 0, x0, x0, 0x123
+	csrw	cycle, x0
+
+	# Success!
+	li	a0, 0
+	j	_exit
+
+trap:
+	# When an instruction traps, compare it to the insn in memory.
+	csrr	t0, mepc
+	csrr	t1, mtval
+	lwu	t2, 0(t0)
+	bne	t1, t2, fail
+
+	# Skip the insn and continue.
+	addi	t0, t0, 4
+	csrw	mepc, t0
+	mret
+
+fail:
+	li	a0, 1
+
+# Exit code in a0
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
+
+	# Semihosting call sequence
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
diff --git a/tests/tcg/riscv64/semihost.ld b/tests/tcg/riscv64/semihost.ld
new file mode 100644
index 0000000000..a59cc56b28
--- /dev/null
+++ b/tests/tcg/riscv64/semihost.ld
@@ -0,0 +1,21 @@
+ENTRY(_start)
+
+SECTIONS
+{
+    /* virt machine, RAM starts at 2gb */
+    . = 0x80000000;
+    .text : {
+        *(.text)
+    }
+    .rodata : {
+        *(.rodata)
+    }
+    /* align r/w section to next 2mb */
+    . = ALIGN(1 << 21);
+    .data : {
+        *(.data)
+    }
+    .bss : {
+        *(.bss)
+    }
+}
-- 
2.34.1


