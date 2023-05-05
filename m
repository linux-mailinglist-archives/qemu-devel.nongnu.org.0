Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AB6F7B27
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 04:38:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pulCD-0004o3-Pf; Thu, 04 May 2023 22:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pulCB-0004lT-BM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pulC6-0000FF-P2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 22:29:19 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxzOrsaVRk6vcEAA--.8111S3;
 Fri, 05 May 2023 10:29:00 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a+2aVRkNw9LAA--.7251S24; 
 Fri, 05 May 2023 10:28:59 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 22/45] target/loongarch: Implement vsll vsrl vsra vrotr
Date: Fri,  5 May 2023 10:27:43 +0800
Message-Id: <20230505022806.6082-23-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
References: <20230505022806.6082-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a+2aVRkNw9LAA--.7251S24
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuw13Zr48Gw4fur4ktw4fZrb_yoWxGFyUpr
 1jyrWUAr4kJry7Grna9ws8CwnxGF9rC3yY9w1ft3WrWFWUJF1DJa4kXrWqgFWjq3Z5ZFy0
 gF17CryUCr95tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bo8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0z
 RVWlkUUUUU=
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


