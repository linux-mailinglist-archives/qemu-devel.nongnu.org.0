Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A16F8F39
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:37:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWh-0005mo-9a; Sat, 06 May 2023 02:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWd-0005l7-Sh
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:12 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWb-0004FP-77
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:11 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bxb+tM9VVk_6QFAA--.9185S3;
 Sat, 06 May 2023 14:35:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S24; 
 Sat, 06 May 2023 14:35:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 22/45] target/loongarch: Implement vsll vsrl vsra vrotr
Date: Sat,  6 May 2023 14:35:17 +0800
Message-Id: <20230506063540.178794-23-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S24
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuw13Zr48Gw4fur4ktw4fZrb_yoWxGFyUpr
 1jyrWUAr4kJry7Grna9ws8CwnxGF9rC3yY9w1ft3WrWFWUJF1DJa4kXrWqgFWjq3Z5ZFy0
 gF17CryUCr95tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch includes:
- VSLL[I].{B/H/W/D};
- VSRL[I].{B/H/W/D};
- VSRA[I].{B/H/W/D};
- VROTR[I].{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-23-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    | 36 +++++++++++++++++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 36 +++++++++++++++++++++
 target/loongarch/insns.decode               | 36 +++++++++++++++++++++
 3 files changed, 108 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index eca0a4bb7b..f7d0fb4441 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1103,3 +1103,39 @@ INSN_LSX(vandi_b,          vv_i)
 INSN_LSX(vori_b,           vv_i)
 INSN_LSX(vxori_b,          vv_i)
 INSN_LSX(vnori_b,          vv_i)
+
+INSN_LSX(vsll_b,           vvv)
+INSN_LSX(vsll_h,           vvv)
+INSN_LSX(vsll_w,           vvv)
+INSN_LSX(vsll_d,           vvv)
+INSN_LSX(vslli_b,          vv_i)
+INSN_LSX(vslli_h,          vv_i)
+INSN_LSX(vslli_w,          vv_i)
+INSN_LSX(vslli_d,          vv_i)
+
+INSN_LSX(vsrl_b,           vvv)
+INSN_LSX(vsrl_h,           vvv)
+INSN_LSX(vsrl_w,           vvv)
+INSN_LSX(vsrl_d,           vvv)
+INSN_LSX(vsrli_b,          vv_i)
+INSN_LSX(vsrli_h,          vv_i)
+INSN_LSX(vsrli_w,          vv_i)
+INSN_LSX(vsrli_d,          vv_i)
+
+INSN_LSX(vsra_b,           vvv)
+INSN_LSX(vsra_h,           vvv)
+INSN_LSX(vsra_w,           vvv)
+INSN_LSX(vsra_d,           vvv)
+INSN_LSX(vsrai_b,          vv_i)
+INSN_LSX(vsrai_h,          vv_i)
+INSN_LSX(vsrai_w,          vv_i)
+INSN_LSX(vsrai_d,          vv_i)
+
+INSN_LSX(vrotr_b,          vvv)
+INSN_LSX(vrotr_h,          vvv)
+INSN_LSX(vrotr_w,          vvv)
+INSN_LSX(vrotr_d,          vvv)
+INSN_LSX(vrotri_b,         vv_i)
+INSN_LSX(vrotri_h,         vv_i)
+INSN_LSX(vrotri_w,         vv_i)
+INSN_LSX(vrotri_d,         vv_i)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index e5e194106b..ad8f32ed18 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2930,3 +2930,39 @@ static void do_vnori_b(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
 }
 
 TRANS(vnori_b, gvec_vv_i, MO_8, do_vnori_b)
+
+TRANS(vsll_b, gvec_vvv, MO_8, tcg_gen_gvec_shlv)
+TRANS(vsll_h, gvec_vvv, MO_16, tcg_gen_gvec_shlv)
+TRANS(vsll_w, gvec_vvv, MO_32, tcg_gen_gvec_shlv)
+TRANS(vsll_d, gvec_vvv, MO_64, tcg_gen_gvec_shlv)
+TRANS(vslli_b, gvec_vv_i, MO_8, tcg_gen_gvec_shli)
+TRANS(vslli_h, gvec_vv_i, MO_16, tcg_gen_gvec_shli)
+TRANS(vslli_w, gvec_vv_i, MO_32, tcg_gen_gvec_shli)
+TRANS(vslli_d, gvec_vv_i, MO_64, tcg_gen_gvec_shli)
+
+TRANS(vsrl_b, gvec_vvv, MO_8, tcg_gen_gvec_shrv)
+TRANS(vsrl_h, gvec_vvv, MO_16, tcg_gen_gvec_shrv)
+TRANS(vsrl_w, gvec_vvv, MO_32, tcg_gen_gvec_shrv)
+TRANS(vsrl_d, gvec_vvv, MO_64, tcg_gen_gvec_shrv)
+TRANS(vsrli_b, gvec_vv_i, MO_8, tcg_gen_gvec_shri)
+TRANS(vsrli_h, gvec_vv_i, MO_16, tcg_gen_gvec_shri)
+TRANS(vsrli_w, gvec_vv_i, MO_32, tcg_gen_gvec_shri)
+TRANS(vsrli_d, gvec_vv_i, MO_64, tcg_gen_gvec_shri)
+
+TRANS(vsra_b, gvec_vvv, MO_8, tcg_gen_gvec_sarv)
+TRANS(vsra_h, gvec_vvv, MO_16, tcg_gen_gvec_sarv)
+TRANS(vsra_w, gvec_vvv, MO_32, tcg_gen_gvec_sarv)
+TRANS(vsra_d, gvec_vvv, MO_64, tcg_gen_gvec_sarv)
+TRANS(vsrai_b, gvec_vv_i, MO_8, tcg_gen_gvec_sari)
+TRANS(vsrai_h, gvec_vv_i, MO_16, tcg_gen_gvec_sari)
+TRANS(vsrai_w, gvec_vv_i, MO_32, tcg_gen_gvec_sari)
+TRANS(vsrai_d, gvec_vv_i, MO_64, tcg_gen_gvec_sari)
+
+TRANS(vrotr_b, gvec_vvv, MO_8, tcg_gen_gvec_rotrv)
+TRANS(vrotr_h, gvec_vvv, MO_16, tcg_gen_gvec_rotrv)
+TRANS(vrotr_w, gvec_vvv, MO_32, tcg_gen_gvec_rotrv)
+TRANS(vrotr_d, gvec_vvv, MO_64, tcg_gen_gvec_rotrv)
+TRANS(vrotri_b, gvec_vv_i, MO_8, tcg_gen_gvec_rotri)
+TRANS(vrotri_h, gvec_vv_i, MO_16, tcg_gen_gvec_rotri)
+TRANS(vrotri_w, gvec_vv_i, MO_32, tcg_gen_gvec_rotri)
+TRANS(vrotri_d, gvec_vv_i, MO_64, tcg_gen_gvec_rotri)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 6309683be9..7c0b0c4ac8 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -803,3 +803,39 @@ vandi_b          0111 00111101 00 ........ ..... .....    @vv_ui8
 vori_b           0111 00111101 01 ........ ..... .....    @vv_ui8
 vxori_b          0111 00111101 10 ........ ..... .....    @vv_ui8
 vnori_b          0111 00111101 11 ........ ..... .....    @vv_ui8
+
+vsll_b           0111 00001110 10000 ..... ..... .....    @vvv
+vsll_h           0111 00001110 10001 ..... ..... .....    @vvv
+vsll_w           0111 00001110 10010 ..... ..... .....    @vvv
+vsll_d           0111 00001110 10011 ..... ..... .....    @vvv
+vslli_b          0111 00110010 11000 01 ... ..... .....   @vv_ui3
+vslli_h          0111 00110010 11000 1 .... ..... .....   @vv_ui4
+vslli_w          0111 00110010 11001 ..... ..... .....    @vv_ui5
+vslli_d          0111 00110010 1101 ...... ..... .....    @vv_ui6
+
+vsrl_b           0111 00001110 10100 ..... ..... .....    @vvv
+vsrl_h           0111 00001110 10101 ..... ..... .....    @vvv
+vsrl_w           0111 00001110 10110 ..... ..... .....    @vvv
+vsrl_d           0111 00001110 10111 ..... ..... .....    @vvv
+vsrli_b          0111 00110011 00000 01 ... ..... .....   @vv_ui3
+vsrli_h          0111 00110011 00000 1 .... ..... .....   @vv_ui4
+vsrli_w          0111 00110011 00001 ..... ..... .....    @vv_ui5
+vsrli_d          0111 00110011 0001 ...... ..... .....    @vv_ui6
+
+vsra_b           0111 00001110 11000 ..... ..... .....    @vvv
+vsra_h           0111 00001110 11001 ..... ..... .....    @vvv
+vsra_w           0111 00001110 11010 ..... ..... .....    @vvv
+vsra_d           0111 00001110 11011 ..... ..... .....    @vvv
+vsrai_b          0111 00110011 01000 01 ... ..... .....   @vv_ui3
+vsrai_h          0111 00110011 01000 1 .... ..... .....   @vv_ui4
+vsrai_w          0111 00110011 01001 ..... ..... .....    @vv_ui5
+vsrai_d          0111 00110011 0101 ...... ..... .....    @vv_ui6
+
+vrotr_b          0111 00001110 11100 ..... ..... .....    @vvv
+vrotr_h          0111 00001110 11101 ..... ..... .....    @vvv
+vrotr_w          0111 00001110 11110 ..... ..... .....    @vvv
+vrotr_d          0111 00001110 11111 ..... ..... .....    @vvv
+vrotri_b         0111 00101010 00000 01 ... ..... .....   @vv_ui3
+vrotri_h         0111 00101010 00000 1 .... ..... .....   @vv_ui4
+vrotri_w         0111 00101010 00001 ..... ..... .....    @vv_ui5
+vrotri_d         0111 00101010 0001 ...... ..... .....    @vv_ui6
-- 
2.31.1


