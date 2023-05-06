Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418606F8F42
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:38:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBWo-0005tE-27; Sat, 06 May 2023 02:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvBWk-0005qd-Is
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:18 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvBWh-0004Ke-6E
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:36:18 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxlfBS9VVkHKUFAA--.9389S3;
 Sat, 06 May 2023 14:36:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxDbM89VVkhCNNAA--.9773S36; 
 Sat, 06 May 2023 14:36:01 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL v2 34/45] target/loongarch: Implement LSX fpu fcvt instructions
Date: Sat,  6 May 2023 14:35:29 +0800
Message-Id: <20230506063540.178794-35-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
References: <20230506063540.178794-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxDbM89VVkhCNNAA--.9773S36
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfZw1DZFykCFyfArW7uw1UGFg_yoW5Jw1xXo
 Z7Ca45XF48GryrCryDK3WvqF1xt34Syw1kJFZ8Zr4qga4fAr12gr4Fvr95JayrArWagry3
 W3yDZwn8Ar43Xr9xn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUql1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VFCVT{L/H}.{S.H/D.S};
- VFCVT.{H.S/S.D};
- VFRINT[{RNE/RZ/RP/RM}].{S/D};
- VFTINT[{RNE/RZ/RP/RM}].{W.S/L.D};
- VFTINT[RZ].{WU.S/LU.D};
- VFTINT[{RNE/RZ/RP/RM}].W.D;
- VFTINT[{RNE/RZ/RP/RM}]{L/H}.L.S;
- VFFINT.{S.W/D.L}[U];
- VFFINT.S.L, VFFINT{L/H}.D.W.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230504122810.4094787-35-gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  56 +++
 target/loongarch/helper.h                   |  56 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  56 +++
 target/loongarch/insns.decode               |  56 +++
 target/loongarch/lsx_helper.c               | 376 ++++++++++++++++++++
 5 files changed, 600 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index b57b284e49..c04271081f 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -1348,3 +1348,59 @@ INSN_LSX(vfrecip_s,        vv)
 INSN_LSX(vfrecip_d,        vv)
 INSN_LSX(vfrsqrt_s,        vv)
 INSN_LSX(vfrsqrt_d,        vv)
+
+INSN_LSX(vfcvtl_s_h,       vv)
+INSN_LSX(vfcvth_s_h,       vv)
+INSN_LSX(vfcvtl_d_s,       vv)
+INSN_LSX(vfcvth_d_s,       vv)
+INSN_LSX(vfcvt_h_s,        vvv)
+INSN_LSX(vfcvt_s_d,        vvv)
+
+INSN_LSX(vfrint_s,         vv)
+INSN_LSX(vfrint_d,         vv)
+INSN_LSX(vfrintrm_s,       vv)
+INSN_LSX(vfrintrm_d,       vv)
+INSN_LSX(vfrintrp_s,       vv)
+INSN_LSX(vfrintrp_d,       vv)
+INSN_LSX(vfrintrz_s,       vv)
+INSN_LSX(vfrintrz_d,       vv)
+INSN_LSX(vfrintrne_s,      vv)
+INSN_LSX(vfrintrne_d,      vv)
+
+INSN_LSX(vftint_w_s,       vv)
+INSN_LSX(vftint_l_d,       vv)
+INSN_LSX(vftintrm_w_s,     vv)
+INSN_LSX(vftintrm_l_d,     vv)
+INSN_LSX(vftintrp_w_s,     vv)
+INSN_LSX(vftintrp_l_d,     vv)
+INSN_LSX(vftintrz_w_s,     vv)
+INSN_LSX(vftintrz_l_d,     vv)
+INSN_LSX(vftintrne_w_s,    vv)
+INSN_LSX(vftintrne_l_d,    vv)
+INSN_LSX(vftint_wu_s,      vv)
+INSN_LSX(vftint_lu_d,      vv)
+INSN_LSX(vftintrz_wu_s,    vv)
+INSN_LSX(vftintrz_lu_d,    vv)
+INSN_LSX(vftint_w_d,       vvv)
+INSN_LSX(vftintrm_w_d,     vvv)
+INSN_LSX(vftintrp_w_d,     vvv)
+INSN_LSX(vftintrz_w_d,     vvv)
+INSN_LSX(vftintrne_w_d,    vvv)
+INSN_LSX(vftintl_l_s,      vv)
+INSN_LSX(vftinth_l_s,      vv)
+INSN_LSX(vftintrml_l_s,    vv)
+INSN_LSX(vftintrmh_l_s,    vv)
+INSN_LSX(vftintrpl_l_s,    vv)
+INSN_LSX(vftintrph_l_s,    vv)
+INSN_LSX(vftintrzl_l_s,    vv)
+INSN_LSX(vftintrzh_l_s,    vv)
+INSN_LSX(vftintrnel_l_s,   vv)
+INSN_LSX(vftintrneh_l_s,   vv)
+
+INSN_LSX(vffint_s_w,       vv)
+INSN_LSX(vffint_s_wu,      vv)
+INSN_LSX(vffint_d_l,       vv)
+INSN_LSX(vffint_d_lu,      vv)
+INSN_LSX(vffintl_d_w,      vv)
+INSN_LSX(vffinth_d_w,      vv)
+INSN_LSX(vffint_s_l,       vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index a0c9de271d..f32235aa97 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -558,3 +558,59 @@ DEF_HELPER_3(vfrecip_s, void, env, i32, i32)
 DEF_HELPER_3(vfrecip_d, void, env, i32, i32)
 DEF_HELPER_3(vfrsqrt_s, void, env, i32, i32)
 DEF_HELPER_3(vfrsqrt_d, void, env, i32, i32)
+
+DEF_HELPER_3(vfcvtl_s_h, void, env, i32, i32)
+DEF_HELPER_3(vfcvth_s_h, void, env, i32, i32)
+DEF_HELPER_3(vfcvtl_d_s, void, env, i32, i32)
+DEF_HELPER_3(vfcvth_d_s, void, env, i32, i32)
+DEF_HELPER_4(vfcvt_h_s, void, env, i32, i32, i32)
+DEF_HELPER_4(vfcvt_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vfrintrne_s, void, env, i32, i32)
+DEF_HELPER_3(vfrintrne_d, void, env, i32, i32)
+DEF_HELPER_3(vfrintrz_s, void, env, i32, i32)
+DEF_HELPER_3(vfrintrz_d, void, env, i32, i32)
+DEF_HELPER_3(vfrintrp_s, void, env, i32, i32)
+DEF_HELPER_3(vfrintrp_d, void, env, i32, i32)
+DEF_HELPER_3(vfrintrm_s, void, env, i32, i32)
+DEF_HELPER_3(vfrintrm_d, void, env, i32, i32)
+DEF_HELPER_3(vfrint_s, void, env, i32, i32)
+DEF_HELPER_3(vfrint_d, void, env, i32, i32)
+
+DEF_HELPER_3(vftintrne_w_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrne_l_d, void, env, i32, i32)
+DEF_HELPER_3(vftintrz_w_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrz_l_d, void, env, i32, i32)
+DEF_HELPER_3(vftintrp_w_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrp_l_d, void, env, i32, i32)
+DEF_HELPER_3(vftintrm_w_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrm_l_d, void, env, i32, i32)
+DEF_HELPER_3(vftint_w_s, void, env, i32, i32)
+DEF_HELPER_3(vftint_l_d, void, env, i32, i32)
+DEF_HELPER_3(vftintrz_wu_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrz_lu_d, void, env, i32, i32)
+DEF_HELPER_3(vftint_wu_s, void, env, i32, i32)
+DEF_HELPER_3(vftint_lu_d, void, env, i32, i32)
+DEF_HELPER_4(vftintrne_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vftintrz_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vftintrp_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vftintrm_w_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vftint_w_d, void, env, i32, i32, i32)
+DEF_HELPER_3(vftintrnel_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrneh_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrzl_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrzh_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrpl_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrph_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrml_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintrmh_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftintl_l_s, void, env, i32, i32)
+DEF_HELPER_3(vftinth_l_s, void, env, i32, i32)
+
+DEF_HELPER_3(vffint_s_w, void, env, i32, i32)
+DEF_HELPER_3(vffint_d_l, void, env, i32, i32)
+DEF_HELPER_3(vffint_s_wu, void, env, i32, i32)
+DEF_HELPER_3(vffint_d_lu, void, env, i32, i32)
+DEF_HELPER_3(vffintl_d_w, void, env, i32, i32)
+DEF_HELPER_3(vffinth_d_w, void, env, i32, i32)
+DEF_HELPER_4(vffint_s_l, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 99a17ac200..e0c72c6bff 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3476,3 +3476,59 @@ TRANS(vfrecip_s, gen_vv, gen_helper_vfrecip_s)
 TRANS(vfrecip_d, gen_vv, gen_helper_vfrecip_d)
 TRANS(vfrsqrt_s, gen_vv, gen_helper_vfrsqrt_s)
 TRANS(vfrsqrt_d, gen_vv, gen_helper_vfrsqrt_d)
+
+TRANS(vfcvtl_s_h, gen_vv, gen_helper_vfcvtl_s_h)
+TRANS(vfcvth_s_h, gen_vv, gen_helper_vfcvth_s_h)
+TRANS(vfcvtl_d_s, gen_vv, gen_helper_vfcvtl_d_s)
+TRANS(vfcvth_d_s, gen_vv, gen_helper_vfcvth_d_s)
+TRANS(vfcvt_h_s, gen_vvv, gen_helper_vfcvt_h_s)
+TRANS(vfcvt_s_d, gen_vvv, gen_helper_vfcvt_s_d)
+
+TRANS(vfrintrne_s, gen_vv, gen_helper_vfrintrne_s)
+TRANS(vfrintrne_d, gen_vv, gen_helper_vfrintrne_d)
+TRANS(vfrintrz_s, gen_vv, gen_helper_vfrintrz_s)
+TRANS(vfrintrz_d, gen_vv, gen_helper_vfrintrz_d)
+TRANS(vfrintrp_s, gen_vv, gen_helper_vfrintrp_s)
+TRANS(vfrintrp_d, gen_vv, gen_helper_vfrintrp_d)
+TRANS(vfrintrm_s, gen_vv, gen_helper_vfrintrm_s)
+TRANS(vfrintrm_d, gen_vv, gen_helper_vfrintrm_d)
+TRANS(vfrint_s, gen_vv, gen_helper_vfrint_s)
+TRANS(vfrint_d, gen_vv, gen_helper_vfrint_d)
+
+TRANS(vftintrne_w_s, gen_vv, gen_helper_vftintrne_w_s)
+TRANS(vftintrne_l_d, gen_vv, gen_helper_vftintrne_l_d)
+TRANS(vftintrz_w_s, gen_vv, gen_helper_vftintrz_w_s)
+TRANS(vftintrz_l_d, gen_vv, gen_helper_vftintrz_l_d)
+TRANS(vftintrp_w_s, gen_vv, gen_helper_vftintrp_w_s)
+TRANS(vftintrp_l_d, gen_vv, gen_helper_vftintrp_l_d)
+TRANS(vftintrm_w_s, gen_vv, gen_helper_vftintrm_w_s)
+TRANS(vftintrm_l_d, gen_vv, gen_helper_vftintrm_l_d)
+TRANS(vftint_w_s, gen_vv, gen_helper_vftint_w_s)
+TRANS(vftint_l_d, gen_vv, gen_helper_vftint_l_d)
+TRANS(vftintrz_wu_s, gen_vv, gen_helper_vftintrz_wu_s)
+TRANS(vftintrz_lu_d, gen_vv, gen_helper_vftintrz_lu_d)
+TRANS(vftint_wu_s, gen_vv, gen_helper_vftint_wu_s)
+TRANS(vftint_lu_d, gen_vv, gen_helper_vftint_lu_d)
+TRANS(vftintrne_w_d, gen_vvv, gen_helper_vftintrne_w_d)
+TRANS(vftintrz_w_d, gen_vvv, gen_helper_vftintrz_w_d)
+TRANS(vftintrp_w_d, gen_vvv, gen_helper_vftintrp_w_d)
+TRANS(vftintrm_w_d, gen_vvv, gen_helper_vftintrm_w_d)
+TRANS(vftint_w_d, gen_vvv, gen_helper_vftint_w_d)
+TRANS(vftintrnel_l_s, gen_vv, gen_helper_vftintrnel_l_s)
+TRANS(vftintrneh_l_s, gen_vv, gen_helper_vftintrneh_l_s)
+TRANS(vftintrzl_l_s, gen_vv, gen_helper_vftintrzl_l_s)
+TRANS(vftintrzh_l_s, gen_vv, gen_helper_vftintrzh_l_s)
+TRANS(vftintrpl_l_s, gen_vv, gen_helper_vftintrpl_l_s)
+TRANS(vftintrph_l_s, gen_vv, gen_helper_vftintrph_l_s)
+TRANS(vftintrml_l_s, gen_vv, gen_helper_vftintrml_l_s)
+TRANS(vftintrmh_l_s, gen_vv, gen_helper_vftintrmh_l_s)
+TRANS(vftintl_l_s, gen_vv, gen_helper_vftintl_l_s)
+TRANS(vftinth_l_s, gen_vv, gen_helper_vftinth_l_s)
+
+TRANS(vffint_s_w, gen_vv, gen_helper_vffint_s_w)
+TRANS(vffint_d_l, gen_vv, gen_helper_vffint_d_l)
+TRANS(vffint_s_wu, gen_vv, gen_helper_vffint_s_wu)
+TRANS(vffint_d_lu, gen_vv, gen_helper_vffint_d_lu)
+TRANS(vffintl_d_w, gen_vv, gen_helper_vffintl_d_w)
+TRANS(vffinth_d_w, gen_vv, gen_helper_vffinth_d_w)
+TRANS(vffint_s_l, gen_vvv, gen_helper_vffint_s_l)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index bcc531dd25..2ef0f73018 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -1046,3 +1046,59 @@ vfrecip_s        0111 00101001 11001 11101 ..... .....    @vv
 vfrecip_d        0111 00101001 11001 11110 ..... .....    @vv
 vfrsqrt_s        0111 00101001 11010 00001 ..... .....    @vv
 vfrsqrt_d        0111 00101001 11010 00010 ..... .....    @vv
+
+vfcvtl_s_h       0111 00101001 11011 11010 ..... .....    @vv
+vfcvth_s_h       0111 00101001 11011 11011 ..... .....    @vv
+vfcvtl_d_s       0111 00101001 11011 11100 ..... .....    @vv
+vfcvth_d_s       0111 00101001 11011 11101 ..... .....    @vv
+vfcvt_h_s        0111 00010100 01100 ..... ..... .....    @vvv
+vfcvt_s_d        0111 00010100 01101 ..... ..... .....    @vvv
+
+vfrint_s         0111 00101001 11010 01101 ..... .....    @vv
+vfrint_d         0111 00101001 11010 01110 ..... .....    @vv
+vfrintrm_s       0111 00101001 11010 10001 ..... .....    @vv
+vfrintrm_d       0111 00101001 11010 10010 ..... .....    @vv
+vfrintrp_s       0111 00101001 11010 10101 ..... .....    @vv
+vfrintrp_d       0111 00101001 11010 10110 ..... .....    @vv
+vfrintrz_s       0111 00101001 11010 11001 ..... .....    @vv
+vfrintrz_d       0111 00101001 11010 11010 ..... .....    @vv
+vfrintrne_s      0111 00101001 11010 11101 ..... .....    @vv
+vfrintrne_d      0111 00101001 11010 11110 ..... .....    @vv
+
+vftint_w_s       0111 00101001 11100 01100 ..... .....    @vv
+vftint_l_d       0111 00101001 11100 01101 ..... .....    @vv
+vftintrm_w_s     0111 00101001 11100 01110 ..... .....    @vv
+vftintrm_l_d     0111 00101001 11100 01111 ..... .....    @vv
+vftintrp_w_s     0111 00101001 11100 10000 ..... .....    @vv
+vftintrp_l_d     0111 00101001 11100 10001 ..... .....    @vv
+vftintrz_w_s     0111 00101001 11100 10010 ..... .....    @vv
+vftintrz_l_d     0111 00101001 11100 10011 ..... .....    @vv
+vftintrne_w_s    0111 00101001 11100 10100 ..... .....    @vv
+vftintrne_l_d    0111 00101001 11100 10101 ..... .....    @vv
+vftint_wu_s      0111 00101001 11100 10110 ..... .....    @vv
+vftint_lu_d      0111 00101001 11100 10111 ..... .....    @vv
+vftintrz_wu_s    0111 00101001 11100 11100 ..... .....    @vv
+vftintrz_lu_d    0111 00101001 11100 11101 ..... .....    @vv
+vftint_w_d       0111 00010100 10011 ..... ..... .....    @vvv
+vftintrm_w_d     0111 00010100 10100 ..... ..... .....    @vvv
+vftintrp_w_d     0111 00010100 10101 ..... ..... .....    @vvv
+vftintrz_w_d     0111 00010100 10110 ..... ..... .....    @vvv
+vftintrne_w_d    0111 00010100 10111 ..... ..... .....    @vvv
+vftintl_l_s      0111 00101001 11101 00000 ..... .....    @vv
+vftinth_l_s      0111 00101001 11101 00001 ..... .....    @vv
+vftintrml_l_s    0111 00101001 11101 00010 ..... .....    @vv
+vftintrmh_l_s    0111 00101001 11101 00011 ..... .....    @vv
+vftintrpl_l_s    0111 00101001 11101 00100 ..... .....    @vv
+vftintrph_l_s    0111 00101001 11101 00101 ..... .....    @vv
+vftintrzl_l_s    0111 00101001 11101 00110 ..... .....    @vv
+vftintrzh_l_s    0111 00101001 11101 00111 ..... .....    @vv
+vftintrnel_l_s   0111 00101001 11101 01000 ..... .....    @vv
+vftintrneh_l_s   0111 00101001 11101 01001 ..... .....    @vv
+
+vffint_s_w       0111 00101001 11100 00000 ..... .....    @vv
+vffint_s_wu      0111 00101001 11100 00001 ..... .....    @vv
+vffint_d_l       0111 00101001 11100 00010 ..... .....    @vv
+vffint_d_lu      0111 00101001 11100 00011 ..... .....    @vv
+vffintl_d_w      0111 00101001 11100 00100 ..... .....    @vv
+vffinth_d_w      0111 00101001 11100 00101 ..... .....    @vv
+vffint_s_l       0111 00010100 10000 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index d954f9e3cd..82e484c878 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2246,3 +2246,379 @@ DO_2OP_F(vfrecip_s, 32, UW, do_frecip_32)
 DO_2OP_F(vfrecip_d, 64, UD, do_frecip_64)
 DO_2OP_F(vfrsqrt_s, 32, UW, do_frsqrt_32)
 DO_2OP_F(vfrsqrt_d, 64, UD, do_frsqrt_64)
+
+static uint32_t float16_cvt_float32(uint16_t h, float_status *status)
+{
+    return float16_to_float32(h, true, status);
+}
+static uint64_t float32_cvt_float64(uint32_t s, float_status *status)
+{
+    return float32_to_float64(s, status);
+}
+
+static uint16_t float32_cvt_float16(uint32_t s, float_status *status)
+{
+    return float32_to_float16(s, true, status);
+}
+static uint32_t float64_cvt_float32(uint64_t d, float_status *status)
+{
+    return float64_to_float32(d, status);
+}
+
+void HELPER(vfcvtl_s_h)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < LSX_LEN/32; i++) {
+        temp.UW(i) = float16_cvt_float32(Vj->UH(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vfcvtl_d_s)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < LSX_LEN/64; i++) {
+        temp.UD(i) = float32_cvt_float64(Vj->UW(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vfcvth_s_h)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < LSX_LEN/32; i++) {
+        temp.UW(i) = float16_cvt_float32(Vj->UH(i + 4), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vfcvth_d_s)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < LSX_LEN/64; i++) {
+        temp.UD(i) = float32_cvt_float64(Vj->UW(i + 2), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vfcvt_h_s)(CPULoongArchState *env,
+                       uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    vec_clear_cause(env);
+    for(i = 0; i < LSX_LEN/32; i++) {
+        temp.UH(i + 4) = float32_cvt_float16(Vj->UW(i), &env->fp_status);
+        temp.UH(i)  = float32_cvt_float16(Vk->UW(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vfcvt_s_d)(CPULoongArchState *env,
+                       uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    vec_clear_cause(env);
+    for(i = 0; i < LSX_LEN/64; i++) {
+        temp.UW(i + 2) = float64_cvt_float32(Vj->UD(i), &env->fp_status);
+        temp.UW(i)  = float64_cvt_float32(Vk->UD(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vfrint_s)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < 4; i++) {
+        Vd->W(i) = float32_round_to_int(Vj->UW(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+}
+
+void HELPER(vfrint_d)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < 2; i++) {
+        Vd->D(i) = float64_round_to_int(Vj->UD(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+}
+
+#define FCVT_2OP(NAME, BIT, E, MODE)                                        \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj)         \
+{                                                                           \
+    int i;                                                                  \
+    VReg *Vd = &(env->fpr[vd].vreg);                                        \
+    VReg *Vj = &(env->fpr[vj].vreg);                                        \
+                                                                            \
+    vec_clear_cause(env);                                                   \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                                     \
+        FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status); \
+        set_float_rounding_mode(MODE, &env->fp_status);                     \
+        Vd->E(i) = float## BIT ## _round_to_int(Vj->E(i), &env->fp_status); \
+        set_float_rounding_mode(old_mode, &env->fp_status);                 \
+        vec_update_fcsr0(env, GETPC());                                     \
+    }                                                                       \
+}
+
+FCVT_2OP(vfrintrne_s, 32, UW, float_round_nearest_even)
+FCVT_2OP(vfrintrne_d, 64, UD, float_round_nearest_even)
+FCVT_2OP(vfrintrz_s, 32, UW, float_round_to_zero)
+FCVT_2OP(vfrintrz_d, 64, UD, float_round_to_zero)
+FCVT_2OP(vfrintrp_s, 32, UW, float_round_up)
+FCVT_2OP(vfrintrp_d, 64, UD, float_round_up)
+FCVT_2OP(vfrintrm_s, 32, UW, float_round_down)
+FCVT_2OP(vfrintrm_d, 64, UD, float_round_down)
+
+#define FTINT(NAME, FMT1, FMT2, T1, T2,  MODE)                          \
+static T2 do_ftint ## NAME(CPULoongArchState *env, T1 fj)               \
+{                                                                       \
+    T2 fd;                                                              \
+    FloatRoundMode old_mode = get_float_rounding_mode(&env->fp_status); \
+                                                                        \
+    set_float_rounding_mode(MODE, &env->fp_status);                     \
+    fd = do_## FMT1 ##_to_## FMT2(env, fj);                             \
+    set_float_rounding_mode(old_mode, &env->fp_status);                 \
+    return fd;                                                          \
+}
+
+#define DO_FTINT(FMT1, FMT2, T1, T2)                                         \
+static T2 do_## FMT1 ##_to_## FMT2(CPULoongArchState *env, T1 fj)            \
+{                                                                            \
+    T2 fd;                                                                   \
+                                                                             \
+    fd = FMT1 ##_to_## FMT2(fj, &env->fp_status);                            \
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) { \
+        if (FMT1 ##_is_any_nan(fj)) {                                        \
+            fd = 0;                                                          \
+        }                                                                    \
+    }                                                                        \
+    vec_update_fcsr0(env, GETPC());                                          \
+    return fd;                                                               \
+}
+
+DO_FTINT(float32, int32, uint32_t, uint32_t)
+DO_FTINT(float64, int64, uint64_t, uint64_t)
+DO_FTINT(float32, uint32, uint32_t, uint32_t)
+DO_FTINT(float64, uint64, uint64_t, uint64_t)
+DO_FTINT(float64, int32, uint64_t, uint32_t)
+DO_FTINT(float32, int64, uint32_t, uint64_t)
+
+FTINT(rne_w_s, float32, int32, uint32_t, uint32_t, float_round_nearest_even)
+FTINT(rne_l_d, float64, int64, uint64_t, uint64_t, float_round_nearest_even)
+FTINT(rp_w_s, float32, int32, uint32_t, uint32_t, float_round_up)
+FTINT(rp_l_d, float64, int64, uint64_t, uint64_t, float_round_up)
+FTINT(rz_w_s, float32, int32, uint32_t, uint32_t, float_round_to_zero)
+FTINT(rz_l_d, float64, int64, uint64_t, uint64_t, float_round_to_zero)
+FTINT(rm_w_s, float32, int32, uint32_t, uint32_t, float_round_down)
+FTINT(rm_l_d, float64, int64, uint64_t, uint64_t, float_round_down)
+
+DO_2OP_F(vftintrne_w_s, 32, UW, do_ftintrne_w_s)
+DO_2OP_F(vftintrne_l_d, 64, UD, do_ftintrne_l_d)
+DO_2OP_F(vftintrp_w_s, 32, UW, do_ftintrp_w_s)
+DO_2OP_F(vftintrp_l_d, 64, UD, do_ftintrp_l_d)
+DO_2OP_F(vftintrz_w_s, 32, UW, do_ftintrz_w_s)
+DO_2OP_F(vftintrz_l_d, 64, UD, do_ftintrz_l_d)
+DO_2OP_F(vftintrm_w_s, 32, UW, do_ftintrm_w_s)
+DO_2OP_F(vftintrm_l_d, 64, UD, do_ftintrm_l_d)
+DO_2OP_F(vftint_w_s, 32, UW, do_float32_to_int32)
+DO_2OP_F(vftint_l_d, 64, UD, do_float64_to_int64)
+
+FTINT(rz_wu_s, float32, uint32, uint32_t, uint32_t, float_round_to_zero)
+FTINT(rz_lu_d, float64, uint64, uint64_t, uint64_t, float_round_to_zero)
+
+DO_2OP_F(vftintrz_wu_s, 32, UW, do_ftintrz_wu_s)
+DO_2OP_F(vftintrz_lu_d, 64, UD, do_ftintrz_lu_d)
+DO_2OP_F(vftint_wu_s, 32, UW, do_float32_to_uint32)
+DO_2OP_F(vftint_lu_d, 64, UD, do_float64_to_uint64)
+
+FTINT(rm_w_d, float64, int32, uint64_t, uint32_t, float_round_down)
+FTINT(rp_w_d, float64, int32, uint64_t, uint32_t, float_round_up)
+FTINT(rz_w_d, float64, int32, uint64_t, uint32_t, float_round_to_zero)
+FTINT(rne_w_d, float64, int32, uint64_t, uint32_t, float_round_nearest_even)
+
+#define FTINT_W_D(NAME, FN)                              \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    vec_clear_cause(env);                                \
+    for (i = 0; i < 2; i++) {                            \
+        temp.W(i + 2) = FN(env, Vj->UD(i));              \
+        temp.W(i) = FN(env, Vk->UD(i));                  \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+FTINT_W_D(vftint_w_d, do_float64_to_int32)
+FTINT_W_D(vftintrm_w_d, do_ftintrm_w_d)
+FTINT_W_D(vftintrp_w_d, do_ftintrp_w_d)
+FTINT_W_D(vftintrz_w_d, do_ftintrz_w_d)
+FTINT_W_D(vftintrne_w_d, do_ftintrne_w_d)
+
+FTINT(rml_l_s, float32, int64, uint32_t, uint64_t, float_round_down)
+FTINT(rpl_l_s, float32, int64, uint32_t, uint64_t, float_round_up)
+FTINT(rzl_l_s, float32, int64, uint32_t, uint64_t, float_round_to_zero)
+FTINT(rnel_l_s, float32, int64, uint32_t, uint64_t, float_round_nearest_even)
+FTINT(rmh_l_s, float32, int64, uint32_t, uint64_t, float_round_down)
+FTINT(rph_l_s, float32, int64, uint32_t, uint64_t, float_round_up)
+FTINT(rzh_l_s, float32, int64, uint32_t, uint64_t, float_round_to_zero)
+FTINT(rneh_l_s, float32, int64, uint32_t, uint64_t, float_round_nearest_even)
+
+#define FTINTL_L_S(NAME, FN)                                        \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg temp;                                                      \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    vec_clear_cause(env);                                           \
+    for (i = 0; i < 2; i++) {                                       \
+        temp.D(i) = FN(env, Vj->UW(i));                             \
+    }                                                               \
+    *Vd = temp;                                                     \
+}
+
+FTINTL_L_S(vftintl_l_s, do_float32_to_int64)
+FTINTL_L_S(vftintrml_l_s, do_ftintrml_l_s)
+FTINTL_L_S(vftintrpl_l_s, do_ftintrpl_l_s)
+FTINTL_L_S(vftintrzl_l_s, do_ftintrzl_l_s)
+FTINTL_L_S(vftintrnel_l_s, do_ftintrnel_l_s)
+
+#define FTINTH_L_S(NAME, FN)                                        \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg temp;                                                      \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    vec_clear_cause(env);                                           \
+    for (i = 0; i < 2; i++) {                                       \
+        temp.D(i) = FN(env, Vj->UW(i + 2));                         \
+    }                                                               \
+    *Vd = temp;                                                     \
+}
+
+FTINTH_L_S(vftinth_l_s, do_float32_to_int64)
+FTINTH_L_S(vftintrmh_l_s, do_ftintrmh_l_s)
+FTINTH_L_S(vftintrph_l_s, do_ftintrph_l_s)
+FTINTH_L_S(vftintrzh_l_s, do_ftintrzh_l_s)
+FTINTH_L_S(vftintrneh_l_s, do_ftintrneh_l_s)
+
+#define FFINT(NAME, FMT1, FMT2, T1, T2)                    \
+static T2 do_ffint_ ## NAME(CPULoongArchState *env, T1 fj) \
+{                                                          \
+    T2 fd;                                                 \
+                                                           \
+    fd = FMT1 ##_to_## FMT2(fj, &env->fp_status);          \
+    vec_update_fcsr0(env, GETPC());                        \
+    return fd;                                             \
+}
+
+FFINT(s_w, int32, float32, int32_t, uint32_t)
+FFINT(d_l, int64, float64, int64_t, uint64_t)
+FFINT(s_wu, uint32, float32, uint32_t, uint32_t)
+FFINT(d_lu, uint64, float64, uint64_t, uint64_t)
+
+DO_2OP_F(vffint_s_w, 32, W, do_ffint_s_w)
+DO_2OP_F(vffint_d_l, 64, D, do_ffint_d_l)
+DO_2OP_F(vffint_s_wu, 32, UW, do_ffint_s_wu)
+DO_2OP_F(vffint_d_lu, 64, UD, do_ffint_d_lu)
+
+void HELPER(vffintl_d_w)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < 2; i++) {
+        temp.D(i) = int32_to_float64(Vj->W(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vffinth_d_w)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < 2; i++) {
+        temp.D(i) = int32_to_float64(Vj->W(i + 2), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
+
+void HELPER(vffint_s_l)(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t vk)
+{
+    int i;
+    VReg temp;
+    VReg *Vd = &(env->fpr[vd].vreg);
+    VReg *Vj = &(env->fpr[vj].vreg);
+    VReg *Vk = &(env->fpr[vk].vreg);
+
+    vec_clear_cause(env);
+    for (i = 0; i < 2; i++) {
+        temp.W(i + 2) = int64_to_float32(Vj->D(i), &env->fp_status);
+        temp.W(i) = int64_to_float32(Vk->D(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    *Vd = temp;
+}
-- 
2.31.1


