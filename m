Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA535F023B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 03:27:55 +0200 (CEST)
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe4ok-0006za-5f
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 21:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4lc-0001pq-M9; Thu, 29 Sep 2022 21:24:40 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39538 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4lZ-00081C-9P; Thu, 29 Sep 2022 21:24:40 -0400
Received: from localhost.localdomain (unknown [139.227.114.201])
 by APP-05 (Coremail) with SMTP id zQCowABHOHVJRTZjaraNAg--.3616S10;
 Fri, 30 Sep 2022 09:24:31 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 8/8] disas/riscv.c: add disasm support for Zc*
Date: Fri, 30 Sep 2022 09:23:45 +0800
Message-Id: <20220930012345.5248-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHOHVJRTZjaraNAg--.3616S10
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4DJrykZr4DCryrtFyUAwb_yoWDGFyUpF
 yrG343trWjga4Iq3WfAFW8AasxtrW5Wr47JaySy3Z3uasrZ34furyjv3yavFykG3y0kr47
 uFsxWF4jg3ZrJwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Zcmp/Zcmt instructions will override disasm for c.fld*/c.fsd*
instructions currently

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 disas/riscv.c | 287 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 286 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index f107d94c4c..9368cc185c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -158,6 +158,13 @@ typedef enum {
     rv_codec_css_sqsp,
     rv_codec_k_bs,
     rv_codec_k_rnum,
+    rv_codec_zcb_ext,
+    rv_codec_zcb_mul,
+    rv_codec_zcb_lb,
+    rv_codec_zcb_lh,
+    rv_codec_zcmp_cm_pushpop,
+    rv_codec_zcmp_cm_mv,
+    rv_codec_zcmt_jt,
 } rv_codec;
 
 typedef enum {
@@ -560,6 +567,26 @@ typedef enum {
     rv_op_zip = 396,
     rv_op_xperm4 = 397,
     rv_op_xperm8 = 398,
+    rv_op_c_zext_b = 399,
+    rv_op_c_sext_b = 400,
+    rv_op_c_zext_h = 401,
+    rv_op_c_sext_h = 402,
+    rv_op_c_zext_w = 403,
+    rv_op_c_not = 404,
+    rv_op_c_mul = 405,
+    rv_op_c_lbu = 406,
+    rv_op_c_lhu = 407,
+    rv_op_c_lh = 408,
+    rv_op_c_sb = 409,
+    rv_op_c_sh = 410,
+    rv_op_cm_push = 411,
+    rv_op_cm_pop = 412,
+    rv_op_cm_popret = 413,
+    rv_op_cm_popretz = 414,
+    rv_op_cm_mva01s = 415,
+    rv_op_cm_mvsa01 = 416,
+    rv_op_cm_jt = 417,
+    rv_op_cm_jalt = 418,
 } rv_op;
 
 /* structures */
@@ -581,6 +608,7 @@ typedef struct {
     uint8_t   rl;
     uint8_t   bs;
     uint8_t   rnum;
+    uint8_t   rlist;
 } rv_decode;
 
 typedef struct {
@@ -658,6 +686,10 @@ static const char rv_freg_name_sym[32][5] = {
 #define rv_fmt_rs2_offset             "O\t2,o"
 #define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
 #define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
+#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
+#define rv_fmt_push_rlist             "O\tl,-i"
+#define rv_fmt_pop_rlist              "O\tl,i"
+#define rv_fmt_zcmt_index             "O\ti"
 
 /* pseudo-instruction constraints */
 
@@ -1283,7 +1315,27 @@ const rv_opcode_data opcode_data[] = {
     { "unzip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
+    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
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
@@ -1298,6 +1350,7 @@ static const char *csr_name(int csrno)
     case 0x0004: return "uie";
     case 0x0005: return "utvec";
     case 0x0015: return "seed";
+    case 0x0017: return "jvt";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
     case 0x0042: return "ucause";
@@ -1517,6 +1570,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -1573,6 +1644,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -1628,6 +1710,30 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 op = rv_op_c_sqsp;
             } else {
                 op = rv_op_c_fsdsp;
+                if (((inst >> 12) & 0b01)) {
+                    switch ((inst >> 8) & 0b01111) {
+                    case 8: op = rv_op_cm_push; break;
+                    case 10: op = rv_op_cm_pop; break;
+                    case 12: op = rv_op_cm_popretz; break;
+                    case 14: op = rv_op_cm_popret; break;
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
@@ -2338,6 +2444,21 @@ static uint32_t operand_crs2q(rv_inst inst)
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
@@ -2540,6 +2661,97 @@ static uint32_t operand_rnum(rv_inst inst)
     return (inst << 40) >> 60;
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
+    uint32_t stack_adj_base = 0;
+    if (isa == rv64) {
+        switch (rlist) {
+        case 15:
+            stack_adj_base = 112;
+            break;
+        case 14:
+            stack_adj_base = 96;
+            break;
+        case 13:
+        case 12:
+            stack_adj_base = 80;
+            break;
+        case 11:
+        case 10:
+            stack_adj_base = 64;
+            break;
+        case 9:
+        case 8:
+            stack_adj_base = 48;
+            break;
+        case 7:
+        case 6:
+            stack_adj_base = 32;
+            break;
+        case 5:
+        case 4:
+            stack_adj_base = 16;
+            break;
+        }
+    } else {
+        switch (rlist) {
+        case 15:
+            stack_adj_base = 64;
+            break;
+        case 14:
+        case 13:
+        case 12:
+            stack_adj_base = 48;
+            break;
+        case 11:
+        case 10:
+        case 9:
+        case 8:
+            stack_adj_base = 32;
+            break;
+        case 7:
+        case 6:
+        case 5:
+        case 4:
+            stack_adj_base = 16;
+            break;
+        }
+    }
+    return stack_adj_base + spimm;
+}
+
+static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
+{
+    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
+                              operand_zcmp_spimm(inst));
+}
+
+static uint32_t operand_tbl_index(rv_inst inst)
+{
+    return ((inst << 54) >> 56);
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
@@ -2829,6 +3041,34 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         dec->rs1 = operand_rs1(inst);
         dec->rnum = operand_rnum(inst);
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
 
@@ -2988,6 +3228,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
         case ')':
             append(buf, ")", buflen);
             break;
+        case '-':
+            append(buf, "-", buflen);
+            break;
         case 'b':
             snprintf(tmp, sizeof(tmp), "%d", dec->bs);
             append(buf, tmp, buflen);
@@ -3113,6 +3356,48 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
                 append(buf, ".rl", buflen);
             }
             break;
+        case 'l': {
+            switch(dec->rlist) {
+            case 4:
+                snprintf(tmp, sizeof(tmp), "{ra}");
+                break;
+            case 5:
+                snprintf(tmp, sizeof(tmp), "{ra, s0}");
+                break;
+            case 6:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s1}");
+                break;
+            case 7:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s2}");
+                break;
+            case 8:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s3}");
+                break;
+            case 9:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s4}");
+                break;
+            case 10:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s5}");
+                break;
+            case 11:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s6}");
+                break;
+            case 12:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s7}");
+                break;
+            case 13:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s8}");
+                break;
+            case 14:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s9}");
+                break;
+            case 15:
+                snprintf(tmp, sizeof(tmp), "{ra, s0-s11}");
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


