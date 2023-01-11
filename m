Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B0665935
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFYWo-0003ol-Fj; Wed, 11 Jan 2023 05:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pFYWR-0003lj-Ts; Wed, 11 Jan 2023 05:39:55 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pFYWN-0007kq-4U; Wed, 11 Jan 2023 05:39:55 -0500
Received: from localhost.localdomain (unknown [61.165.33.198])
 by APP-01 (Coremail) with SMTP id qwCowABHTTXskb5jCcUADA--.29173S11;
 Wed, 11 Jan 2023 18:39:47 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v10 9/9] disas/riscv.c: add disasm support for Zc*
Date: Wed, 11 Jan 2023 18:39:36 +0800
Message-Id: <20230111103936.129269-10-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111103936.129269-1-liweiwei@iscas.ac.cn>
References: <20230111103936.129269-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABHTTXskb5jCcUADA--.29173S11
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4DGw47WrWDXFyUuFW7Arb_yoWfZF1fpF
 1rG343trWjka4fX3WfAFWUAas8trWUXr4xJaySy3Z3Casru343CF1jq3yavFykG3yrKr47
 uFsxWa1jg3Z7JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-Originating-IP: [61.165.33.198]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Zcmp/Zcmt instructions will override disasm for c.fld*/c.fsd*
instructions currently

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 228 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d216b9c39b..f75da98540 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -163,6 +163,13 @@ typedef enum {
     rv_codec_v_i,
     rv_codec_vsetvli,
     rv_codec_vsetivli,
+    rv_codec_zcb_ext,
+    rv_codec_zcb_mul,
+    rv_codec_zcb_lb,
+    rv_codec_zcb_lh,
+    rv_codec_zcmp_cm_pushpop,
+    rv_codec_zcmp_cm_mv,
+    rv_codec_zcmt_jt,
 } rv_codec;
 
 typedef enum {
@@ -935,6 +942,26 @@ typedef enum {
     rv_op_vsetvli = 766,
     rv_op_vsetivli = 767,
     rv_op_vsetvl = 768,
+    rv_op_c_zext_b = 769,
+    rv_op_c_sext_b = 770,
+    rv_op_c_zext_h = 771,
+    rv_op_c_sext_h = 772,
+    rv_op_c_zext_w = 773,
+    rv_op_c_not = 774,
+    rv_op_c_mul = 775,
+    rv_op_c_lbu = 776,
+    rv_op_c_lhu = 777,
+    rv_op_c_lh = 778,
+    rv_op_c_sb = 779,
+    rv_op_c_sh = 780,
+    rv_op_cm_push = 781,
+    rv_op_cm_pop = 782,
+    rv_op_cm_popret = 783,
+    rv_op_cm_popretz = 784,
+    rv_op_cm_mva01s = 785,
+    rv_op_cm_mvsa01 = 786,
+    rv_op_cm_jt = 787,
+    rv_op_cm_jalt = 788,
 } rv_op;
 
 /* structures */
@@ -958,6 +985,7 @@ typedef struct {
     uint8_t   rnum;
     uint8_t   vm;
     uint32_t  vzimm;
+    uint8_t   rlist;
 } rv_decode;
 
 typedef struct {
@@ -1070,6 +1098,10 @@ static const char rv_vreg_name_sym[32][4] = {
 #define rv_fmt_vd_vm                  "O\tDm"
 #define rv_fmt_vsetvli                "O\t0,1,v"
 #define rv_fmt_vsetivli               "O\t0,u,v"
+#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
+#define rv_fmt_push_rlist             "O\tx,-i"
+#define rv_fmt_pop_rlist              "O\tx,i"
+#define rv_fmt_zcmt_index             "O\ti"
 
 /* pseudo-instruction constraints */
 
@@ -2065,7 +2097,27 @@ const rv_opcode_data opcode_data[] = {
     { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
     { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
     { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
-    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
+    { "c.zext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
+    { "c.sext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
+    { "c.zext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
+    { "c.sext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
+    { "c.zext.w", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
+    { "c.not", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
+    { "c.mul", rv_codec_zcb_mul, rv_fmt_rd_rs2, NULL, 0, 0 },
+    { "c.lbu", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
+    { "c.lhu", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
+    { "c.lh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
+    { "c.sb", rv_codec_zcb_lb, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
+    { "c.sh", rv_codec_zcb_lh, rv_fmt_rs1_rs2_zce_ldst, NULL, 0, 0, 0 },
+    { "cm.push", rv_codec_zcmp_cm_pushpop, rv_fmt_push_rlist, NULL, 0, 0 },
+    { "cm.pop", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
+    { "cm.popret", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0, 0 },
+    { "cm.popretz", rv_codec_zcmp_cm_pushpop, rv_fmt_pop_rlist, NULL, 0, 0 },
+    { "cm.mva01s", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
+    { "cm.mvsa01", rv_codec_zcmp_cm_mv, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
+    { "cm.jt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
+    { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
 };
 
 /* CSR names */
@@ -2084,6 +2136,7 @@ static const char *csr_name(int csrno)
     case 0x000a: return "vxrm";
     case 0x000f: return "vcsr";
     case 0x0015: return "seed";
+    case 0x0017: return "jvt";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
     case 0x0042: return "ucause";
@@ -2306,6 +2359,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 op = rv_op_c_ld;
             }
             break;
+        case 4:
+            switch ((inst >> 10) & 0b111) {
+            case 0: op = rv_op_c_lbu; break;
+            case 1:
+                if (((inst >> 6) & 1) == 0) {
+                    op = rv_op_c_lhu;
+                } else {
+                    op = rv_op_c_lh;
+                }
+                break;
+            case 2: op = rv_op_c_sb; break;
+            case 3:
+                if (((inst >> 6) & 1) == 0) {
+                    op = rv_op_c_sh;
+                }
+                break;
+            }
+            break;
         case 5:
             if (isa == rv128) {
                 op = rv_op_c_sq;
@@ -2362,6 +2433,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 3: op = rv_op_c_and; break;
                 case 4: op = rv_op_c_subw; break;
                 case 5: op = rv_op_c_addw; break;
+                case 6: op = rv_op_c_mul; break;
+                case 7:
+                    switch ((inst >> 2) & 0b111) {
+                    case 0: op = rv_op_c_zext_b; break;
+                    case 1: op = rv_op_c_sext_b; break;
+                    case 2: op = rv_op_c_zext_h; break;
+                    case 3: op = rv_op_c_sext_h; break;
+                    case 4: op = rv_op_c_zext_w; break;
+                    case 5: op = rv_op_c_not; break;
+                    }
+                    break;
                 }
                 break;
             }
@@ -2417,6 +2499,46 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 op = rv_op_c_sqsp;
             } else {
                 op = rv_op_c_fsdsp;
+                if (((inst >> 12) & 0b01)) {
+                    switch ((inst >> 8) & 0b01111) {
+                    case 8:
+                        if (((inst >> 4) & 0b01111) >= 4) {
+                            op = rv_op_cm_push;
+                        }
+                        break;
+                    case 10:
+                        if (((inst >> 4) & 0b01111) >= 4) {
+                            op = rv_op_cm_pop;
+                        }
+                        break;
+                    case 12:
+                        if (((inst >> 4) & 0b01111) >= 4) {
+                            op = rv_op_cm_popretz;
+                        }
+                        break;
+                    case 14:
+                        if (((inst >> 4) & 0b01111) >= 4) {
+                            op = rv_op_cm_popret;
+                        }
+                        break;
+                    }
+                } else {
+                    switch ((inst >> 10) & 0b011) {
+                    case 0:
+                        if (((inst >> 2) & 0xFF) >= 32) {
+                            op = rv_op_cm_jalt;
+                        } else {
+                            op = rv_op_cm_jt;
+                        }
+                        break;
+                    case 3:
+                        switch ((inst >> 5) & 0b011) {
+                        case 1: op = rv_op_cm_mvsa01; break;
+                        case 3: op = rv_op_cm_mva01s; break;
+                        }
+                        break;
+                    }
+                }
             }
             break;
         case 6: op = rv_op_c_swsp; break;
@@ -3661,6 +3783,21 @@ static uint32_t operand_crs2q(rv_inst inst)
     return (inst << 59) >> 61;
 }
 
+static uint32_t calculate_xreg(uint32_t sreg)
+{
+    return sreg < 2 ? sreg + 8 : sreg + 16;
+}
+
+static uint32_t operand_sreg1(rv_inst inst)
+{
+    return calculate_xreg((inst << 54) >> 61);
+}
+
+static uint32_t operand_sreg2(rv_inst inst)
+{
+    return calculate_xreg((inst << 59) >> 61);
+}
+
 static uint32_t operand_crd(rv_inst inst)
 {
     return (inst << 52) >> 59;
@@ -3883,6 +4020,46 @@ static uint32_t operand_vm(rv_inst inst)
     return (inst << 38) >> 63;
 }
 
+static uint32_t operand_uimm_c_lb(rv_inst inst)
+{
+    return (((inst << 58) >> 63) << 1) |
+        ((inst << 57) >> 63);
+}
+
+static uint32_t operand_uimm_c_lh(rv_inst inst)
+{
+    return (((inst << 58) >> 63) << 1);
+}
+
+static uint32_t operand_zcmp_spimm(rv_inst inst)
+{
+    return ((inst << 60) >> 62) << 4;
+}
+
+static uint32_t operand_zcmp_rlist(rv_inst inst)
+{
+    return ((inst << 56) >> 60);
+}
+
+static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
+{
+    int xlen_bytes_log2 = isa == rv64 ? 3 : 2;
+    int regs = rlist == 15 ? 13 : rlist - 3;
+    uint32_t stack_adj_base = ROUND_UP(regs << xlen_bytes_log2, 16);
+    return stack_adj_base + spimm;
+}
+
+static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
+{
+    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
+                               operand_zcmp_spimm(inst));
+}
+
+static uint32_t operand_tbl_index(rv_inst inst)
+{
+    return ((inst << 54) >> 56);
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
@@ -4199,6 +4376,34 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         dec->imm = operand_vimm(inst);
         dec->vzimm = operand_vzimm10(inst);
         break;
+    case rv_codec_zcb_lb:
+        dec->rs1 = operand_crs1q(inst) + 8;
+        dec->rs2 = operand_crs2q(inst) + 8;
+        dec->imm = operand_uimm_c_lb(inst);
+        break;
+    case rv_codec_zcb_lh:
+        dec->rs1 = operand_crs1q(inst) + 8;
+        dec->rs2 = operand_crs2q(inst) + 8;
+        dec->imm = operand_uimm_c_lh(inst);
+        break;
+    case rv_codec_zcb_ext:
+        dec->rd = operand_crs1q(inst) + 8;
+        break;
+    case rv_codec_zcb_mul:
+        dec->rd = operand_crs1rdq(inst) + 8;
+        dec->rs2 = operand_crs2q(inst) + 8;
+        break;
+    case rv_codec_zcmp_cm_pushpop:
+        dec->imm = operand_zcmp_stack_adj(inst, isa);
+        dec->rlist = operand_zcmp_rlist(inst);
+        break;
+    case rv_codec_zcmp_cm_mv:
+        dec->rd = operand_sreg1(inst);
+        dec->rs2 = operand_sreg2(inst);
+        break;
+    case rv_codec_zcmt_jt:
+        dec->imm = operand_tbl_index(inst);
+        break;
     };
 }
 
@@ -4358,6 +4563,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
         case ')':
             append(buf, ")", buflen);
             break;
+        case '-':
+            append(buf, "-", buflen);
+            break;
         case 'b':
             snprintf(tmp, sizeof(tmp), "%d", dec->bs);
             append(buf, tmp, buflen);
@@ -4541,6 +4749,24 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             append(buf, vma, buflen);
             break;
         }
+        case 'x': {
+            switch (dec->rlist) {
+            case 4:
+                snprintf(tmp, sizeof(tmp), "{ra}");
+                break;
+            case 5:
+                snprintf(tmp, sizeof(tmp), "{ra, s0}");
+                break;
+            case 15:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s11}");
+                break;
+            default:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s%d}", dec->rlist - 5);
+                break;
+            }
+            append(buf, tmp, buflen);
+            break;
+        }
         default:
             break;
         }
-- 
2.25.1


