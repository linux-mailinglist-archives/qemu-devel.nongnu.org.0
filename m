Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05058149D79
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 00:01:19 +0100 (CET)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivqu5-0004Bg-VW
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 18:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpz-00061G-89
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ivqpw-0000Z3-TM
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:03 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37953 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ivqpw-0000Pn-G6
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 17:57:00 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 504271A1DB3;
 Sun, 26 Jan 2020 23:56:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2F0471A1D62;
 Sun, 26 Jan 2020 23:56:04 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc3 15/30] target/avr: Add instruction disassembly function
Date: Sun, 26 Jan 2020 23:54:56 +0100
Message-Id: <1580079311-20447-16-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580079311-20447-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580079311-20447-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

Provide function disassembles executed instruction when `-d in_asm` is
provided

Example:
`./avr-softmmu/qemu-system-avr -bios free-rtos/Demo/AVR_ATMega2560_GCC/de=
mo.elf -d in_asm` will produce something like the following

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

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[rth: Fix spacing and const mnemonic arrays]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 target/avr/cpu.c       |   2 +-
 target/avr/cpu.h       |   1 +
 target/avr/disas.c     | 246 +++++++++++++++++++++++++++++++++++++++++++=
++++++
 target/avr/translate.c |  12 +++
 4 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 target/avr/disas.c

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index c74c510..fa51f77 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -84,7 +84,7 @@ static void avr_cpu_reset(CPUState *cs)
 static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info=
)
 {
     info->mach =3D bfd_arch_avr;
-    info->print_insn =3D NULL;
+    info->print_insn =3D avr_print_insn;
 }
=20
 static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index b74bcf0..af89b66 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -160,6 +160,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int int_re=
q);
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int avr_print_insn(bfd_vma addr, disassemble_info *info);
=20
 static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
 {
diff --git a/target/avr/disas.c b/target/avr/disas.c
new file mode 100644
index 0000000..23bd991
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
+    ctx->next_word_used =3D true;
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
+    DisasContext *pctx =3D &ctx;
+    bfd_byte buffer[4];
+    uint16_t insn;
+    int status;
+
+    ctx.info =3D info;
+
+    status =3D info->read_memory_func(addr, buffer, 4, info);
+    if (status !=3D 0) {
+        info->memory_error_func(status, addr, info);
+        return -1;
+    }
+    insn =3D bfd_getl16(buffer);
+    ctx.next_word =3D bfd_getl16(buffer + 2);
+    ctx.next_word_used =3D false;
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
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        =
\
+{                                                                       =
\
+    output(#opcode, format, ##__VA_ARGS__);                             =
\
+    return true;                                                        =
\
+}
+
+#define INSN_MNEMONIC(opcode, mnemonic, format, ...)                \
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        =
\
+{                                                                       =
\
+    output(mnemonic, format, ##__VA_ARGS__);                            =
\
+    return true;                                                        =
\
+}
+
+/*
+ *   C       Z       N       V       S       H       T       I
+ *   0       1       2       3       4       5       6       7
+ */
+static const char brbc[][5] =3D {
+    "BRCC", "BRNE", "BRPL", "BRVC", "BRGE", "BRHC", "BRTC", "BRID"
+};
+
+static const char brbs[][5] =3D {
+    "BRCS", "BREQ", "BRMI", "BRVS", "BRLT", "BRHS", "BRTS", "BRIE"
+};
+
+static const char bset[][4] =3D {
+    "SEC",  "SEZ",  "SEN",  "SEZ",  "SES",  "SEH",  "SET",  "SEI"
+};
+
+static const char bclr[][4] =3D {
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
index af88bb2..064eee0 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2976,6 +2976,18 @@ done_generating:
=20
     tb->size =3D (ctx.npc - pc_start) * 2;
     tb->icount =3D num_insns;
+
+#ifdef DEBUG_DISAS
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
+        && qemu_log_in_addr_range(tb->pc)) {
+        FILE *fd;
+        fd =3D qemu_log_lock();
+        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
+        log_target_disas(cs, tb->pc, tb->size);
+        qemu_log("\n");
+        qemu_log_unlock(fd);
+    }
+#endif
 }
=20
 void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
--=20
2.7.4


