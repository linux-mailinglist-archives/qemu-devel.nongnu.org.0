Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983A214CF1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 16:09:04 +0200 (CEST)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1js5KJ-0000kt-3x
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1js5FB-0007X7-2P
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 10:03:45 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:45123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1js5F8-0008KC-Ub
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 10:03:44 -0400
Received: by mail-ed1-f53.google.com with SMTP id d16so25615076edz.12
 for <qemu-devel@nongnu.org>; Sun, 05 Jul 2020 07:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i319DJB2uoT4OyBGoq088zxTvwXowLChSeliubrFvBA=;
 b=t1bFylEeomfRV3ZVTMOQKnZEQmBe3+jmwDFpus+jelA3BkSFmm9lKhuB8/2rpMnm++
 pUwTsMAolQFErykHQDMIjLrDakrm0gcZZeWzGJOqlfN4OwUS2E1091zbVFQe5D8+Dvls
 A0xBwCRIfYZfcm7CAHjT27TBLc6f9welta7GXG0pVUqD3cKYq4VoVfR8P6r8DYJd72hC
 jQWPpImv2L3scqZjle3986VnHR3bewLb1tTKaQS7IMNdSakEq2o6eKjqVjQO2BXe7Jac
 WFcAtu5HSfkxggl5UYC0sf1ETZ0lJLFhrrc9kle8CpbiqxgAblDWC5mjCsdY6j4JXIP1
 /CQw==
X-Gm-Message-State: AOAM533foYzphewt2LDt9fd1QS6hwGCM+n56DphPWH/ySVg9kRo/mDWt
 hbGV/fhTXWdOZRi9zlq4jSaIpayA
X-Google-Smtp-Source: ABdhPJyFTVbsoF/9SkYcz8GJmI1mEDmEDClgbaQ9q/uF26X2QMYEnaCsG3aKmpUEJ5jDq6CbQ0E0NA==
X-Received: by 2002:a50:a881:: with SMTP id k1mr49485669edc.12.1593957821282; 
 Sun, 05 Jul 2020 07:03:41 -0700 (PDT)
Received: from thl530.multi.box (pd9e83654.dip0.t-ipconnect.de.
 [217.232.54.84])
 by smtp.gmail.com with ESMTPSA id bq8sm10941776ejb.103.2020.07.05.07.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 07:03:41 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <rth@twiddle.net>
Subject: [PATCH rc6 18/30] target/avr: Add support for disassembling via
 option '-d in_asm'
Date: Sun,  5 Jul 2020 16:03:03 +0200
Message-Id: <20200705140315.260514-19-huth@tuxfamily.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200705140315.260514-1-huth@tuxfamily.org>
References: <20200705140315.260514-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.53; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f53.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 10:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=1,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

Provide function disassembles executed instruction when `-d in_asm` is
provided

Example:
`./avr-softmmu/qemu-system-avr -bios free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf -d in_asm` will produce something like the following

```
    ...
    IN:
    0x0000014a:  CALL      0x3808

    IN: main
    0x00003808:  CALL      0x4b4

    IN: vParTestInitialise
    0x000004b4:  LDI       r24, 255
    0x000004b6:  STS       r24, 0
    0x000004b8:  MULS      r16, r20
    0x000004ba:  OUT       $1, r24
    0x000004bc:  LDS       r24, 0
    0x000004be:  MULS      r16, r20
    0x000004c0:  OUT       $2, r24
    0x000004c2:  RET
    ...
```

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
[rth: Fix spacing and const mnemonic arrays]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 target/avr/cpu.c       |   2 +-
 target/avr/cpu.h       |   1 +
 target/avr/disas.c     | 246 +++++++++++++++++++++++++++++++++++++++++
 target/avr/translate.c |  12 ++
 4 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 target/avr/disas.c

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index b7b2c21533..4e4dd4f6aa 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -85,7 +85,7 @@ static void avr_cpu_reset(DeviceState *ds)
 static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_arch_avr;
-    info->print_insn = NULL;
+    info->print_insn = avr_print_insn;
 }
 
 static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a7318632c5..929b576ccd 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -161,6 +161,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int avr_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int avr_print_insn(bfd_vma addr, disassemble_info *info);
 
 static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
 {
diff --git a/target/avr/disas.c b/target/avr/disas.c
new file mode 100644
index 0000000000..23bd9919ed
--- /dev/null
+++ b/target/avr/disas.c
@@ -0,0 +1,246 @@
+/*
+ * AVR disassembler
+ *
+ * Copyright (c) 2019 Richard Henderson <rth@twiddle.net>
+ * Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+typedef struct {
+    disassemble_info *info;
+    uint16_t next_word;
+    bool next_word_used;
+} DisasContext;
+
+static int to_regs_16_31_by_one(DisasContext *ctx, int indx)
+{
+    return 16 + (indx % 16);
+}
+
+static int to_regs_16_23_by_one(DisasContext *ctx, int indx)
+{
+    return 16 + (indx % 8);
+}
+
+static int to_regs_24_30_by_two(DisasContext *ctx, int indx)
+{
+    return 24 + (indx % 4) * 2;
+}
+
+static int to_regs_00_30_by_two(DisasContext *ctx, int indx)
+{
+    return (indx % 16) * 2;
+}
+
+static uint16_t next_word(DisasContext *ctx)
+{
+    ctx->next_word_used = true;
+    return ctx->next_word;
+}
+
+static int append_16(DisasContext *ctx, int x)
+{
+    return x << 16 | next_word(ctx);
+}
+
+
+/* Include the auto-generated decoder.  */
+static bool decode_insn(DisasContext *ctx, uint16_t insn);
+#include "decode_insn.inc.c"
+
+#define output(mnemonic, format, ...) \
+    (pctx->info->fprintf_func(pctx->info->stream, "%-9s " format, \
+                        mnemonic, ##__VA_ARGS__))
+
+int avr_print_insn(bfd_vma addr, disassemble_info *info)
+{
+    DisasContext ctx;
+    DisasContext *pctx = &ctx;
+    bfd_byte buffer[4];
+    uint16_t insn;
+    int status;
+
+    ctx.info = info;
+
+    status = info->read_memory_func(addr, buffer, 4, info);
+    if (status != 0) {
+        info->memory_error_func(status, addr, info);
+        return -1;
+    }
+    insn = bfd_getl16(buffer);
+    ctx.next_word = bfd_getl16(buffer + 2);
+    ctx.next_word_used = false;
+
+    if (!decode_insn(&ctx, insn)) {
+        output(".db", "0x%02x, 0x%02x", buffer[0], buffer[1]);
+    }
+
+    return ctx.next_word_used ? 4 : 2;
+}
+
+
+#define INSN(opcode, format, ...)                                   \
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        \
+{                                                                       \
+    output(#opcode, format, ##__VA_ARGS__);                             \
+    return true;                                                        \
+}
+
+#define INSN_MNEMONIC(opcode, mnemonic, format, ...)                \
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        \
+{                                                                       \
+    output(mnemonic, format, ##__VA_ARGS__);                            \
+    return true;                                                        \
+}
+
+/*
+ *   C       Z       N       V       S       H       T       I
+ *   0       1       2       3       4       5       6       7
+ */
+static const char brbc[][5] = {
+    "BRCC", "BRNE", "BRPL", "BRVC", "BRGE", "BRHC", "BRTC", "BRID"
+};
+
+static const char brbs[][5] = {
+    "BRCS", "BREQ", "BRMI", "BRVS", "BRLT", "BRHS", "BRTS", "BRIE"
+};
+
+static const char bset[][4] = {
+    "SEC",  "SEZ",  "SEN",  "SEZ",  "SES",  "SEH",  "SET",  "SEI"
+};
+
+static const char bclr[][4] = {
+    "CLC",  "CLZ",  "CLN",  "CLZ",  "CLS",  "CLH",  "CLT",  "CLI"
+};
+
+/*
+ * Arithmetic Instructions
+ */
+INSN(ADD,    "r%d, r%d", a->rd, a->rr)
+INSN(ADC,    "r%d, r%d", a->rd, a->rr)
+INSN(ADIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
+INSN(SUB,    "r%d, r%d", a->rd, a->rr)
+INSN(SUBI,   "r%d, %d", a->rd, a->imm)
+INSN(SBC,    "r%d, r%d", a->rd, a->rr)
+INSN(SBCI,   "r%d, %d", a->rd, a->imm)
+INSN(SBIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
+INSN(AND,    "r%d, r%d", a->rd, a->rr)
+INSN(ANDI,   "r%d, %d", a->rd, a->imm)
+INSN(OR,     "r%d, r%d", a->rd, a->rr)
+INSN(ORI,    "r%d, %d", a->rd, a->imm)
+INSN(EOR,    "r%d, r%d", a->rd, a->rr)
+INSN(COM,    "r%d", a->rd)
+INSN(NEG,    "r%d", a->rd)
+INSN(INC,    "r%d", a->rd)
+INSN(DEC,    "r%d", a->rd)
+INSN(MUL,    "r%d, r%d", a->rd, a->rr)
+INSN(MULS,   "r%d, r%d", a->rd, a->rr)
+INSN(MULSU,  "r%d, r%d", a->rd, a->rr)
+INSN(FMUL,   "r%d, r%d", a->rd, a->rr)
+INSN(FMULS,  "r%d, r%d", a->rd, a->rr)
+INSN(FMULSU, "r%d, r%d", a->rd, a->rr)
+INSN(DES,    "%d", a->imm)
+
+/*
+ * Branch Instructions
+ */
+INSN(RJMP,   ".%+d", a->imm * 2)
+INSN(IJMP,   "")
+INSN(EIJMP,  "")
+INSN(JMP,    "0x%x", a->imm * 2)
+INSN(RCALL,  ".%+d", a->imm * 2)
+INSN(ICALL,  "")
+INSN(EICALL, "")
+INSN(CALL,   "0x%x", a->imm * 2)
+INSN(RET,    "")
+INSN(RETI,   "")
+INSN(CPSE,   "r%d, r%d", a->rd, a->rr)
+INSN(CP,     "r%d, r%d", a->rd, a->rr)
+INSN(CPC,    "r%d, r%d", a->rd, a->rr)
+INSN(CPI,    "r%d, %d", a->rd, a->imm)
+INSN(SBRC,   "r%d, %d", a->rr, a->bit)
+INSN(SBRS,   "r%d, %d", a->rr, a->bit)
+INSN(SBIC,   "$%d, %d", a->reg, a->bit)
+INSN(SBIS,   "$%d, %d", a->reg, a->bit)
+INSN_MNEMONIC(BRBS,  brbs[a->bit], ".%+d", a->imm * 2)
+INSN_MNEMONIC(BRBC,  brbc[a->bit], ".%+d", a->imm * 2)
+
+/*
+ * Data Transfer Instructions
+ */
+INSN(MOV,    "r%d, r%d", a->rd, a->rr)
+INSN(MOVW,   "r%d:r%d, r%d:r%d", a->rd + 1, a->rd, a->rr + 1, a->rr)
+INSN(LDI,    "r%d, %d", a->rd, a->imm)
+INSN(LDS,    "r%d, %d", a->rd, a->imm)
+INSN(LDX1,   "r%d, X", a->rd)
+INSN(LDX2,   "r%d, X+", a->rd)
+INSN(LDX3,   "r%d, -X", a->rd)
+INSN(LDY2,   "r%d, Y+", a->rd)
+INSN(LDY3,   "r%d, -Y", a->rd)
+INSN(LDZ2,   "r%d, Z+", a->rd)
+INSN(LDZ3,   "r%d, -Z", a->rd)
+INSN(LDDY,   "r%d, Y+%d", a->rd, a->imm)
+INSN(LDDZ,   "r%d, Z+%d", a->rd, a->imm)
+INSN(STS,    "r%d, %d", a->rd, a->imm)
+INSN(STX1,   "r%d, X", a->rr)
+INSN(STX2,   "r%d, X+", a->rr)
+INSN(STX3,   "r%d, -X", a->rr)
+INSN(STY2,   "r%d, Y+", a->rd)
+INSN(STY3,   "r%d, -Y", a->rd)
+INSN(STZ2,   "r%d, Z+", a->rd)
+INSN(STZ3,   "r%d, -Z", a->rd)
+INSN(STDY,   "r%d, Y+%d", a->rd, a->imm)
+INSN(STDZ,   "r%d, Z+%d", a->rd, a->imm)
+INSN(LPM1,   "")
+INSN(LPM2,   "r%d, Z", a->rd)
+INSN(LPMX,   "r%d, Z+", a->rd)
+INSN(ELPM1,  "")
+INSN(ELPM2,  "r%d, Z", a->rd)
+INSN(ELPMX,  "r%d, Z+", a->rd)
+INSN(SPM,    "")
+INSN(SPMX,   "Z+")
+INSN(IN,     "r%d, $%d", a->rd, a->imm)
+INSN(OUT,    "$%d, r%d", a->imm, a->rd)
+INSN(PUSH,   "r%d", a->rd)
+INSN(POP,    "r%d", a->rd)
+INSN(XCH,    "Z, r%d", a->rd)
+INSN(LAC,    "Z, r%d", a->rd)
+INSN(LAS,    "Z, r%d", a->rd)
+INSN(LAT,    "Z, r%d", a->rd)
+
+/*
+ * Bit and Bit-test Instructions
+ */
+INSN(LSR,    "r%d", a->rd)
+INSN(ROR,    "r%d", a->rd)
+INSN(ASR,    "r%d", a->rd)
+INSN(SWAP,   "r%d", a->rd)
+INSN(SBI,    "$%d, %d", a->reg, a->bit)
+INSN(CBI,    "%d, %d", a->reg, a->bit)
+INSN(BST,    "r%d, %d", a->rd, a->bit)
+INSN(BLD,    "r%d, %d", a->rd, a->bit)
+INSN_MNEMONIC(BSET,  bset[a->bit], "")
+INSN_MNEMONIC(BCLR,  bclr[a->bit], "")
+
+/*
+ * MCU Control Instructions
+ */
+INSN(BREAK,  "")
+INSN(NOP,    "")
+INSN(SLEEP,  "")
+INSN(WDR,    "")
diff --git a/target/avr/translate.c b/target/avr/translate.c
index becf096c12..fe03e676df 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3052,6 +3052,18 @@ done_generating:
 
     tb->size = (ctx.npc - pc_start) * 2;
     tb->icount = num_insns;
+
+#ifdef DEBUG_DISAS
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
+        && qemu_log_in_addr_range(tb->pc)) {
+        FILE *fd;
+        fd = qemu_log_lock();
+        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
+        log_target_disas(cs, tb->pc, tb->size);
+        qemu_log("\n");
+        qemu_log_unlock(fd);
+    }
+#endif
 }
 
 void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
-- 
2.26.2


