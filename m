Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE96C5A56
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:29:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7TK-0000YT-Kh; Wed, 22 Mar 2023 19:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pf7TI-0000YD-56
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:02:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pf7TE-0005CZ-6v
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:02:18 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MKR2n3020322; Wed, 22 Mar 2023 21:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=X1hzFvwN0C4xESwDBPdNNqxzFvFJgUe3kgAMaTgml0Y=;
 b=ZUhvqxNzPtlwAbwpd3AtXpPTrdjouoXMmk6JNRQRFZ0ku/gV/xuWK98D/4TxbAcfFsT1
 1FsenPJoYDnUa9pKpzQTejIAMF1CQMZoFRlIAlC6ogA1pYYmkuu4WOrxQmcxl3UTf60E
 PU7Cku+t6sGJFVZjXdEH7sIFGdZ4vI/fCcZJk50q/QoGWXV169GTIiuXR0WIeSs4p0Yr
 RelMkQ5gfWGUsX9GenbZfMjgLcgtoa/pjBnb4yaAO5CjmVuXkSZM/UzcKUC5g+YO2R4f
 FOHBkNI2fJ89xo2yniJDALSUCbp4u2FliEHlJXZYj/fS5BtI2qaruB7Q9Lu9XmWTZYjc GA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pg3c991kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 21:17:14 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 32MLF6Kf012428; 
 Wed, 22 Mar 2023 21:17:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3pd6cm9mgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 21:17:13 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32MLHDl1015982;
 Wed, 22 Mar 2023 21:17:13 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 32MLHCv5015974
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 21:17:13 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id AE5896901; Wed, 22 Mar 2023 18:17:12 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, anjo@rev.ng
Subject: [PATCH] Hexagon (translate.c): avoid redundant PC updates on COF
Date: Wed, 22 Mar 2023 18:17:10 -0300
Message-Id: <fc059153c3f0526d97b7f13450c02b276b0908e1.1679519341.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ImPcYZqh8s5n_JQUgHZW2zPFAFSEW66w
X-Proofpoint-ORIG-GUID: ImPcYZqh8s5n_JQUgHZW2zPFAFSEW66w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_18,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=797 bulkscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220151
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When there is a conditional change of flow or an endloop instruction, we
preload HEX_REG_PC with ctx->next_PC at gen_start_packet(). Nonetheless,
we still generate TCG code to do this update again at gen_goto_tb() when
the condition for the COF is not met, thus producing redundant
instructions. This can be seen with the following packet:

 0x004002e4:  0x5c20d000 {       if (!P0) jump:t PC+0 }

Which generates this TCG code:

   ---- 004002e4
-> mov_i32 pc,$0x4002e8
   and_i32 loc9,p0,$0x1
   mov_i32 branch_taken,loc9
   add_i32 pkt_cnt,pkt_cnt,$0x2
   add_i32 insn_cnt,insn_cnt,$0x2
   brcond_i32 branch_taken,$0x0,ne,$L1
   goto_tb $0x0
   mov_i32 pc,$0x4002e4
   exit_tb $0x7fb0c36e5200
   set_label $L1
   goto_tb $0x1
-> mov_i32 pc,$0x4002e8
   exit_tb $0x7fb0c36e5201
   set_label $L0
   exit_tb $0x7fb0c36e5203

Note that even after optimizations, the redundant PC update is still
present:

   ---- 004002e4
-> mov_i32 pc,$0x4002e8                     sync: 0  dead: 0 1  pref=0xffff
   mov_i32 branch_taken,$0x1                sync: 0  dead: 0 1  pref=0xffff
   add_i32 pkt_cnt,pkt_cnt,$0x2             sync: 0  dead: 0 1  pref=0xffff
   add_i32 insn_cnt,insn_cnt,$0x2           sync: 0  dead: 0 1 2  pref=0xffff
   goto_tb $0x1
-> mov_i32 pc,$0x4002e8                     sync: 0  dead: 0 1  pref=0xffff
   exit_tb $0x7fb0c36e5201
   set_label $L0
   exit_tb $0x7fb0c36e5203

With this patch, the second redundant update is properly discarded.

Note that we need the additional "move_to_pc" flag instead of just
avoiding the update whenever `dest == ctx->next_PC`, as that could
potentially skip updates from a COF with met condition, whose
ctx->branch_dest just happens to be equal to ctx->next_PC.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/translate.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git target/hexagon/translate.c target/hexagon/translate.c
index 665476ab48..58d638f734 100644
--- target/hexagon/translate.c
+++ target/hexagon/translate.c
@@ -128,14 +128,19 @@ static bool use_goto_tb(DisasContext *ctx, target_ulong dest)
     return translator_use_goto_tb(&ctx->base, dest);
 }
 
-static void gen_goto_tb(DisasContext *ctx, int idx, target_ulong dest)
+static void gen_goto_tb(DisasContext *ctx, int idx, target_ulong dest, bool
+                        move_to_pc)
 {
     if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(idx);
-        tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], dest);
+        if (move_to_pc) {
+            tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], dest);
+        }
         tcg_gen_exit_tb(ctx->base.tb, idx);
     } else {
-        tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], dest);
+        if (move_to_pc) {
+            tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], dest);
+        }
         tcg_gen_lookup_and_goto_ptr();
     }
 }
@@ -150,11 +155,11 @@ static void gen_end_tb(DisasContext *ctx)
         if (ctx->branch_cond != TCG_COND_ALWAYS) {
             TCGLabel *skip = gen_new_label();
             tcg_gen_brcondi_tl(ctx->branch_cond, hex_branch_taken, 0, skip);
-            gen_goto_tb(ctx, 0, ctx->branch_dest);
+            gen_goto_tb(ctx, 0, ctx->branch_dest, true);
             gen_set_label(skip);
-            gen_goto_tb(ctx, 1, ctx->next_PC);
+            gen_goto_tb(ctx, 1, ctx->next_PC, false);
         } else {
-            gen_goto_tb(ctx, 0, ctx->branch_dest);
+            gen_goto_tb(ctx, 0, ctx->branch_dest, true);
         }
     } else if (ctx->is_tight_loop &&
                pkt->insn[pkt->num_insns - 1].opcode == J2_endloop0) {
@@ -165,9 +170,9 @@ static void gen_end_tb(DisasContext *ctx)
         TCGLabel *skip = gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_LEU, hex_gpr[HEX_REG_LC0], 1, skip);
         tcg_gen_subi_tl(hex_gpr[HEX_REG_LC0], hex_gpr[HEX_REG_LC0], 1);
-        gen_goto_tb(ctx, 0, ctx->base.tb->pc);
+        gen_goto_tb(ctx, 0, ctx->base.tb->pc, true);
         gen_set_label(skip);
-        gen_goto_tb(ctx, 1, ctx->next_PC);
+        gen_goto_tb(ctx, 1, ctx->next_PC, false);
     } else {
         tcg_gen_lookup_and_goto_ptr();
     }
-- 
2.37.2


