Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B868965593A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ziq-0006L4-UA; Sat, 24 Dec 2022 03:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziP-0006Bj-SU
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:09 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziK-0001bY-Ej
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:09 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxM_BztaZjWUkIAA--.18499S3;
 Sat, 24 Dec 2022 16:16:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S38; 
 Sat, 24 Dec 2022 16:16:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 36/43] target/loongarch: Implement vseq vsle vslt
Date: Sat, 24 Dec 2022 16:16:26 +0800
Message-Id: <20221224081633.4185445-37-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S38
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3tr4rWFWDWr1fGFWDtr1DWrg_yoW8Ww15Go
 WkJw15Jr48G34xKr9Fka4Durn7tas2yw1DKF909w4DJFWrAr1akr90g34rA3ySyF4rtw17
 CrsrAFWYv3WrXr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VSEQ[I].{B/H/W/D};
- VSLE[I].{B/H/W/D}[U];
- VSLT[I].{B/H/W/D/}[U].

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  43 +++
 target/loongarch/helper.h                   |  43 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  43 +++
 target/loongarch/insns.decode               |  43 +++
 target/loongarch/lsx_helper.c               | 278 ++++++++++++++++++++
 5 files changed, 450 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 489980a0fa..c854742f6d 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1375,3 +1375,46 @@ INSN_LSX(vffint_d_lu,      vv)
 INSN_LSX(vffintl_d_w,      vv)
 INSN_LSX(vffinth_d_w,      vv)
 INSN_LSX(vffint_s_l,       vvv)
+
+INSN_LSX(vseq_b,           vvv)
+INSN_LSX(vseq_h,           vvv)
+INSN_LSX(vseq_w,           vvv)
+INSN_LSX(vseq_d,           vvv)
+INSN_LSX(vseqi_b,          vv_i)
+INSN_LSX(vseqi_h,          vv_i)
+INSN_LSX(vseqi_w,          vv_i)
+INSN_LSX(vseqi_d,          vv_i)
+
+INSN_LSX(vsle_b,           vvv)
+INSN_LSX(vsle_h,           vvv)
+INSN_LSX(vsle_w,           vvv)
+INSN_LSX(vsle_d,           vvv)
+INSN_LSX(vslei_b,          vv_i)
+INSN_LSX(vslei_h,          vv_i)
+INSN_LSX(vslei_w,          vv_i)
+INSN_LSX(vslei_d,          vv_i)
+INSN_LSX(vsle_bu,          vvv)
+INSN_LSX(vsle_hu,          vvv)
+INSN_LSX(vsle_wu,          vvv)
+INSN_LSX(vsle_du,          vvv)
+INSN_LSX(vslei_bu,         vv_i)
+INSN_LSX(vslei_hu,         vv_i)
+INSN_LSX(vslei_wu,         vv_i)
+INSN_LSX(vslei_du,         vv_i)
+
+INSN_LSX(vslt_b,           vvv)
+INSN_LSX(vslt_h,           vvv)
+INSN_LSX(vslt_w,           vvv)
+INSN_LSX(vslt_d,           vvv)
+INSN_LSX(vslti_b,          vv_i)
+INSN_LSX(vslti_h,          vv_i)
+INSN_LSX(vslti_w,          vv_i)
+INSN_LSX(vslti_d,          vv_i)
+INSN_LSX(vslt_bu,          vvv)
+INSN_LSX(vslt_hu,          vvv)
+INSN_LSX(vslt_wu,          vvv)
+INSN_LSX(vslt_du,          vvv)
+INSN_LSX(vslti_bu,         vv_i)
+INSN_LSX(vslti_hu,         vv_i)
+INSN_LSX(vslti_wu,         vv_i)
+INSN_LSX(vslti_du,         vv_i)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 59d94fd055..b8f22a2601 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -725,3 +725,46 @@ DEF_HELPER_3(vffint_d_lu, void, env, i32, i32)
 DEF_HELPER_3(vffintl_d_w, void, env, i32, i32)
 DEF_HELPER_3(vffinth_d_w, void, env, i32, i32)
 DEF_HELPER_4(vffint_s_l, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vseq_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vseq_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vseq_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vseq_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vseqi_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vseqi_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vseqi_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vseqi_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vsle_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsle_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslei_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vslt_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslt_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vslti_du, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index cb318a726b..90b3e88229 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -655,3 +655,46 @@ TRANS(vffint_d_lu, gen_vv, gen_helper_vffint_d_lu)
 TRANS(vffintl_d_w, gen_vv, gen_helper_vffintl_d_w)
 TRANS(vffinth_d_w, gen_vv, gen_helper_vffinth_d_w)
 TRANS(vffint_s_l, gen_vvv, gen_helper_vffint_s_l)
+
+TRANS(vseq_b, gen_vvv, gen_helper_vseq_b)
+TRANS(vseq_h, gen_vvv, gen_helper_vseq_h)
+TRANS(vseq_w, gen_vvv, gen_helper_vseq_w)
+TRANS(vseq_d, gen_vvv, gen_helper_vseq_d)
+TRANS(vseqi_b, gen_vv_i, gen_helper_vseqi_b)
+TRANS(vseqi_h, gen_vv_i, gen_helper_vseqi_h)
+TRANS(vseqi_w, gen_vv_i, gen_helper_vseqi_w)
+TRANS(vseqi_d, gen_vv_i, gen_helper_vseqi_d)
+
+TRANS(vsle_b, gen_vvv, gen_helper_vsle_b)
+TRANS(vsle_h, gen_vvv, gen_helper_vsle_h)
+TRANS(vsle_w, gen_vvv, gen_helper_vsle_w)
+TRANS(vsle_d, gen_vvv, gen_helper_vsle_d)
+TRANS(vslei_b, gen_vv_i, gen_helper_vslei_b)
+TRANS(vslei_h, gen_vv_i, gen_helper_vslei_h)
+TRANS(vslei_w, gen_vv_i, gen_helper_vslei_w)
+TRANS(vslei_d, gen_vv_i, gen_helper_vslei_d)
+TRANS(vsle_bu, gen_vvv, gen_helper_vsle_bu)
+TRANS(vsle_hu, gen_vvv, gen_helper_vsle_hu)
+TRANS(vsle_wu, gen_vvv, gen_helper_vsle_wu)
+TRANS(vsle_du, gen_vvv, gen_helper_vsle_du)
+TRANS(vslei_bu, gen_vv_i, gen_helper_vslei_bu)
+TRANS(vslei_hu, gen_vv_i, gen_helper_vslei_hu)
+TRANS(vslei_wu, gen_vv_i, gen_helper_vslei_wu)
+TRANS(vslei_du, gen_vv_i, gen_helper_vslei_du)
+
+TRANS(vslt_b, gen_vvv, gen_helper_vslt_b)
+TRANS(vslt_h, gen_vvv, gen_helper_vslt_h)
+TRANS(vslt_w, gen_vvv, gen_helper_vslt_w)
+TRANS(vslt_d, gen_vvv, gen_helper_vslt_d)
+TRANS(vslti_b, gen_vv_i, gen_helper_vslti_b)
+TRANS(vslti_h, gen_vv_i, gen_helper_vslti_h)
+TRANS(vslti_w, gen_vv_i, gen_helper_vslti_w)
+TRANS(vslti_d, gen_vv_i, gen_helper_vslti_d)
+TRANS(vslt_bu, gen_vvv, gen_helper_vslt_bu)
+TRANS(vslt_hu, gen_vvv, gen_helper_vslt_hu)
+TRANS(vslt_wu, gen_vvv, gen_helper_vslt_wu)
+TRANS(vslt_du, gen_vvv, gen_helper_vslt_du)
+TRANS(vslti_bu, gen_vv_i, gen_helper_vslti_bu)
+TRANS(vslti_hu, gen_vv_i, gen_helper_vslti_hu)
+TRANS(vslti_wu, gen_vv_i, gen_helper_vslti_wu)
+TRANS(vslti_du, gen_vv_i, gen_helper_vslti_du)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 26f82d5712..965ee486e1 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -1101,3 +1101,46 @@ vffint_d_lu      0111 00101001 11100 00011 ..... .....    @vv
 vffintl_d_w      0111 00101001 11100 00100 ..... .....    @vv
 vffinth_d_w      0111 00101001 11100 00101 ..... .....    @vv
 vffint_s_l       0111 00010100 10000 ..... ..... .....    @vvv
+
+vseq_b           0111 00000000 00000 ..... ..... .....    @vvv
+vseq_h           0111 00000000 00001 ..... ..... .....    @vvv
+vseq_w           0111 00000000 00010 ..... ..... .....    @vvv
+vseq_d           0111 00000000 00011 ..... ..... .....    @vvv
+vseqi_b          0111 00101000 00000 ..... ..... .....    @vv_i5
+vseqi_h          0111 00101000 00001 ..... ..... .....    @vv_i5
+vseqi_w          0111 00101000 00010 ..... ..... .....    @vv_i5
+vseqi_d          0111 00101000 00011 ..... ..... .....    @vv_i5
+
+vsle_b           0111 00000000 00100 ..... ..... .....    @vvv
+vsle_h           0111 00000000 00101 ..... ..... .....    @vvv
+vsle_w           0111 00000000 00110 ..... ..... .....    @vvv
+vsle_d           0111 00000000 00111 ..... ..... .....    @vvv
+vslei_b          0111 00101000 00100 ..... ..... .....    @vv_i5
+vslei_h          0111 00101000 00101 ..... ..... .....    @vv_i5
+vslei_w          0111 00101000 00110 ..... ..... .....    @vv_i5
+vslei_d          0111 00101000 00111 ..... ..... .....    @vv_i5
+vsle_bu          0111 00000000 01000 ..... ..... .....    @vvv
+vsle_hu          0111 00000000 01001 ..... ..... .....    @vvv
+vsle_wu          0111 00000000 01010 ..... ..... .....    @vvv
+vsle_du          0111 00000000 01011 ..... ..... .....    @vvv
+vslei_bu         0111 00101000 01000 ..... ..... .....    @vv_ui5
+vslei_hu         0111 00101000 01001 ..... ..... .....    @vv_ui5
+vslei_wu         0111 00101000 01010 ..... ..... .....    @vv_ui5
+vslei_du         0111 00101000 01011 ..... ..... .....    @vv_ui5
+
+vslt_b           0111 00000000 01100 ..... ..... .....    @vvv
+vslt_h           0111 00000000 01101 ..... ..... .....    @vvv
+vslt_w           0111 00000000 01110 ..... ..... .....    @vvv
+vslt_d           0111 00000000 01111 ..... ..... .....    @vvv
+vslti_b          0111 00101000 01100 ..... ..... .....    @vv_i5
+vslti_h          0111 00101000 01101 ..... ..... .....    @vv_i5
+vslti_w          0111 00101000 01110 ..... ..... .....    @vv_i5
+vslti_d          0111 00101000 01111 ..... ..... .....    @vv_i5
+vslt_bu          0111 00000000 10000 ..... ..... .....    @vvv
+vslt_hu          0111 00000000 10001 ..... ..... .....    @vvv
+vslt_wu          0111 00000000 10010 ..... ..... .....    @vvv
+vslt_du          0111 00000000 10011 ..... ..... .....    @vvv
+vslti_bu         0111 00101000 10000 ..... ..... .....    @vv_ui5
+vslti_hu         0111 00101000 10001 ..... ..... .....    @vv_ui5
+vslti_wu         0111 00101000 10010 ..... ..... .....    @vv_ui5
+vslti_du         0111 00101000 10011 ..... ..... .....    @vv_ui5
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 29c0592d0c..977a095e79 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -3959,3 +3959,281 @@ DO_HELPER_VV(vffint_s_wu, 32, helper_vv_f, do_vffint_u)
 DO_HELPER_VV(vffint_d_lu, 64, helper_vv_f, do_vffint_u)
 DO_HELPER_VV(vffintl_d_w, 64, helper_vv_f, do_vffintl_d_w)
 DO_HELPER_VV(vffinth_d_w, 64, helper_vv_f, do_vffinth_d_w)
+
+static int64_t vseq(int64_t s1, int64_t s2)
+{
+    return s1 == s2 ? -1: 0;
+}
+
+static void do_vseq(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vseq(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vseq(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vseq(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vseq(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vseqi(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vseq(Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = vseq(Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = vseq(Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = vseq(Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vseq_b, 8, helper_vvv, do_vseq)
+DO_HELPER_VVV(vseq_h, 16, helper_vvv, do_vseq)
+DO_HELPER_VVV(vseq_w, 32, helper_vvv, do_vseq)
+DO_HELPER_VVV(vseq_d, 64, helper_vvv, do_vseq)
+DO_HELPER_VVV(vseqi_b, 8, helper_vv_i, do_vseqi)
+DO_HELPER_VVV(vseqi_h, 16, helper_vv_i, do_vseqi)
+DO_HELPER_VVV(vseqi_w, 32, helper_vv_i, do_vseqi)
+DO_HELPER_VVV(vseqi_d, 64, helper_vv_i, do_vseqi)
+
+static int64_t vsle_s(int64_t s1, int64_t s2)
+{
+    return s1 <= s2 ? -1 : 0;
+}
+
+static void do_vsle_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsle_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vsle_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vsle_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vsle_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vslei_s(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsle_s(Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = vsle_s(Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = vsle_s(Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = vsle_s(Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsle_b, 8, helper_vvv, do_vsle_s)
+DO_HELPER_VVV(vsle_h, 16, helper_vvv, do_vsle_s)
+DO_HELPER_VVV(vsle_w, 32, helper_vvv, do_vsle_s)
+DO_HELPER_VVV(vsle_d, 64, helper_vvv, do_vsle_s)
+DO_HELPER_VVV(vslei_b, 8, helper_vv_i, do_vslei_s)
+DO_HELPER_VVV(vslei_h, 16, helper_vv_i, do_vslei_s)
+DO_HELPER_VVV(vslei_w, 32, helper_vv_i, do_vslei_s)
+DO_HELPER_VVV(vslei_d, 64, helper_vv_i, do_vslei_s)
+
+static int64_t vsle_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return u1 <= u2 ? -1 : 0;
+}
+
+static void do_vsle_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int  bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsle_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vsle_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vsle_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vsle_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vslei_u(vec_t *Vd, vec_t *Vj, uint32_t imm, int  bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vsle_u(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vsle_u(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vsle_u(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vsle_u(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vsle_bu, 8, helper_vvv, do_vsle_u)
+DO_HELPER_VVV(vsle_hu, 16, helper_vvv, do_vsle_u)
+DO_HELPER_VVV(vsle_wu, 32, helper_vvv, do_vsle_u)
+DO_HELPER_VVV(vsle_du, 64, helper_vvv, do_vsle_u)
+DO_HELPER_VVV(vslei_bu, 8, helper_vv_i, do_vslei_u)
+DO_HELPER_VVV(vslei_hu, 16, helper_vv_i, do_vslei_u)
+DO_HELPER_VVV(vslei_wu, 32, helper_vv_i, do_vslei_u)
+DO_HELPER_VVV(vslei_du, 64, helper_vv_i, do_vslei_u)
+
+static int64_t vslt_s(int64_t s1, int64_t s2)
+{
+    return s1 < s2 ? -1 : 0;
+}
+
+static void do_vslt_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vslt_s(Vj->B[n], Vk->B[n]);
+        break;
+    case 16:
+        Vd->H[n] = vslt_s(Vj->H[n], Vk->H[n]);
+        break;
+    case 32:
+        Vd->W[n] = vslt_s(Vj->W[n], Vk->W[n]);
+        break;
+    case 64:
+        Vd->D[n] = vslt_s(Vj->D[n], Vk->D[n]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vslti_s(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vslt_s(Vj->B[n], imm);
+        break;
+    case 16:
+        Vd->H[n] = vslt_s(Vj->H[n], imm);
+        break;
+    case 32:
+        Vd->W[n] = vslt_s(Vj->W[n], imm);
+        break;
+    case 64:
+        Vd->D[n] = vslt_s(Vj->D[n], imm);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vslt_b, 8, helper_vvv, do_vslt_s)
+DO_HELPER_VVV(vslt_h, 16, helper_vvv, do_vslt_s)
+DO_HELPER_VVV(vslt_w, 32, helper_vvv, do_vslt_s)
+DO_HELPER_VVV(vslt_d, 64, helper_vvv, do_vslt_s)
+DO_HELPER_VVV(vslti_b, 8, helper_vv_i, do_vslti_s)
+DO_HELPER_VVV(vslti_h, 16, helper_vv_i, do_vslti_s)
+DO_HELPER_VVV(vslti_w, 32, helper_vv_i, do_vslti_s)
+DO_HELPER_VVV(vslti_d, 64, helper_vv_i, do_vslti_s)
+
+static int64_t vslt_u(int64_t s1, int64_t s2, int bit)
+{
+    uint64_t umax = MAKE_64BIT_MASK(0, bit);
+    uint64_t u1 = s1 & umax;
+    uint64_t u2 = s2 & umax;
+
+    return u1 < u2 ? -1 : 0;
+}
+
+static void do_vslt_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int  bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vslt_u(Vj->B[n], Vk->B[n], bit);
+        break;
+    case 16:
+        Vd->H[n] = vslt_u(Vj->H[n], Vk->H[n], bit);
+        break;
+    case 32:
+        Vd->W[n] = vslt_u(Vj->W[n], Vk->W[n], bit);
+        break;
+    case 64:
+        Vd->D[n] = vslt_u(Vj->D[n], Vk->D[n], bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vslti_u(vec_t *Vd, vec_t *Vj, uint32_t imm, int  bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = vslt_u(Vj->B[n], imm, bit);
+        break;
+    case 16:
+        Vd->H[n] = vslt_u(Vj->H[n], imm, bit);
+        break;
+    case 32:
+        Vd->W[n] = vslt_u(Vj->W[n], imm, bit);
+        break;
+    case 64:
+        Vd->D[n] = vslt_u(Vj->D[n], imm, bit);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vslt_bu, 8, helper_vvv, do_vslt_u)
+DO_HELPER_VVV(vslt_hu, 16, helper_vvv, do_vslt_u)
+DO_HELPER_VVV(vslt_wu, 32, helper_vvv, do_vslt_u)
+DO_HELPER_VVV(vslt_du, 64, helper_vvv, do_vslt_u)
+DO_HELPER_VVV(vslti_bu, 8, helper_vv_i, do_vslti_u)
+DO_HELPER_VVV(vslti_hu, 16, helper_vv_i, do_vslti_u)
+DO_HELPER_VVV(vslti_wu, 32, helper_vv_i, do_vslti_u)
+DO_HELPER_VVV(vslti_du, 64, helper_vv_i, do_vslti_u)
-- 
2.31.1


