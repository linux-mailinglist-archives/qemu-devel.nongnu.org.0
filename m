Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FA6F7A5A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujs2-0000At-9U; Thu, 04 May 2023 21:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrw-000060-42
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:22 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrt-0006zu-6t
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:19 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso16412912b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248655; x=1685840655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBiMHpEPdnTcenWskCHjcg196WEb91leQf83xrs3KaQ=;
 b=F/fULkHhquHG5XHnv4nqfP+O8/TVFENQCx6mI0wSTFDLuxNXlx84ICDpeiguFkal7C
 gC6W2bgvv00E45eGa1KUbfuAfsC20aNYPUDXAoUuE7azeSZ0p+mvRdMJZpll3/GCRRjb
 upzHVYIYtMg5ChY7Rkb7dn6QtvBY8gdAlOWQq8oryDw4KParUaBOm76AhnuUCOGHslf5
 Z/8AqkgttzSDkyV6VyTl1TrreZrkv8awtwS7kX5Ge5/WfLnUc2Bgy3x9umhSxC5G/ExH
 WVtbaARyjXt8KAFbPtKkJWgbZH+DsG855paqEkFPTYh5uMwyamRvzwG+2PNkgzUZaozN
 +ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248655; x=1685840655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBiMHpEPdnTcenWskCHjcg196WEb91leQf83xrs3KaQ=;
 b=gsACgqgJajXK7Vkqkba8oO5TDMjHCIeF4oD1qHz4TaSsmstaVJcDe9Gcc64cznjecb
 /awVCacruk5ft/eiBdILRvkjhrQkT2/aldov4DfITTgI2VM0Z2yZjTOulDyT5bAR9XMe
 3q7HlPM9ks7zxVtRU4TJIt3D4E6zKt3EOVJ7chpcgGoLUbHpeEkyqwHIRu5qpYSLP8hK
 vg0HPEGXr+CxBowpKDB/umSpKQHI4yeR8zWChfY8OCe1ZDl0tdMGgR2PtJyz4/1U9VK4
 n48v2JGcJ9EzEEbWEOqUZhrJluwuSHddZvkW3ePUVpS5s/rNdBxqo5cw2Tp57UrgzoXe
 Swrg==
X-Gm-Message-State: AC+VfDwKpURI3Yn7gHyhjOCrYAUMmXqtGrQKz5o2n3+sI0ks+fSLIrdd
 /V1ELHsG99nsh1VvUSp4reIkoUY2kfpslg==
X-Google-Smtp-Source: ACHHUZ7JEvIK9Nld2A4ZhM8GNdst3Im08K9Mkmy5DKCPf+vG3Imz47GWCWtTE5vj43wCKz0YtDV4bQ==
X-Received: by 2002:a17:902:f68c:b0:1ac:2bd0:1d9d with SMTP id
 l12-20020a170902f68c00b001ac2bd01d9dmr4938623plg.1.1683248654641; 
 Thu, 04 May 2023 18:04:14 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:14 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/89] disas/riscv.c: add disasm support for Zc*
Date: Fri,  5 May 2023 11:01:29 +1000
Message-Id: <20230505010241.21812-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Zcmp/Zcmt instructions will override disasm for c.fld*/c.fsd*
instructions currently.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-10-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 228 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d6b0fbe5e8..e61bda5674 100644
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
@@ -1071,6 +1099,10 @@ static const char rv_vreg_name_sym[32][4] = {
 #define rv_fmt_vd_vm                  "O\tDm"
 #define rv_fmt_vsetvli                "O\t0,1,v"
 #define rv_fmt_vsetivli               "O\t0,u,v"
+#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
+#define rv_fmt_push_rlist             "O\tx,-i"
+#define rv_fmt_pop_rlist              "O\tx,i"
+#define rv_fmt_zcmt_index             "O\ti"
 
 /* pseudo-instruction constraints */
 
@@ -2066,7 +2098,27 @@ const rv_opcode_data opcode_data[] = {
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
@@ -2085,6 +2137,7 @@ static const char *csr_name(int csrno)
     case 0x000a: return "vxrm";
     case 0x000f: return "vcsr";
     case 0x0015: return "seed";
+    case 0x0017: return "jvt";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
     case 0x0042: return "ucause";
@@ -2307,6 +2360,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -2363,6 +2434,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -2418,6 +2500,46 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -3662,6 +3784,21 @@ static uint32_t operand_crs2q(rv_inst inst)
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
@@ -3884,6 +4021,46 @@ static uint32_t operand_vm(rv_inst inst)
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
@@ -4200,6 +4377,34 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
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
 
@@ -4359,6 +4564,9 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
         case ')':
             append(buf, ")", buflen);
             break;
+        case '-':
+            append(buf, "-", buflen);
+            break;
         case 'b':
             snprintf(tmp, sizeof(tmp), "%d", dec->bs);
             append(buf, tmp, buflen);
@@ -4542,6 +4750,24 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
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
2.40.0


