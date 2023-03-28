Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4956CB484
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:09:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzhk-0005oD-2i; Mon, 27 Mar 2023 23:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzhh-0005ZV-OZ
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:57 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzhd-0003KO-Ln
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:08:57 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxIk7NWSJkjtoSAA--.28643S3;
 Tue, 28 Mar 2023 11:06:53 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S37; 
 Tue, 28 Mar 2023 11:06:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 35/44] target/loongarch: Implement LSX fpu fcvt
 instructions
Date: Tue, 28 Mar 2023 11:06:22 +0800
Message-Id: <20230328030631.3117129-36-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S37
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfuw4DCF15GF4UKw4xCw13CFg_yoW5ZF1rJo
 WxC345AF48G34fCryDG3Z2qF1xt34aywn5Ja98Zr4Yga4fArW2gF4Fvr95JayrArW5Xry7
 Xrs3Z3W5Arnxt343n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
- VFCVT{L/H}.{S.H/D.S};
- VFCVT.{H.S/S.D};
- VFRINT[{RNE/RZ/RP/RM}].{S/D};
- VFTINT[{RNE/RZ/RP/RM}].{W.S/L.D};
- VFTINT[RZ].{WU.S/LU.D};
- VFTINT[{RNE/RZ/RP/RM}].W.D;
- VFTINT[{RNE/RZ/RP/RM}]{L/H}.L.S;
- VFFINT.{S.W/D.L}[U];
- VFFINT.S.L, VFFINT{L/H}.D.W.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 fpu/softfloat.c                             |  55 +++
 include/fpu/softfloat.h                     |  27 ++
 target/loongarch/disas.c                    |  56 +++
 target/loongarch/helper.h                   |  56 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  56 +++
 target/loongarch/insns.decode               |  56 +++
 target/loongarch/lsx_helper.c               | 369 ++++++++++++++++++++
 7 files changed, 675 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7454c3eb1..79975c6b01 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2988,6 +2988,25 @@ float64 float64_round_to_int(float64 a, float_status *s)
     return float64_round_pack_canonical(&p, s);
 }
 
+#define FRINT_RM(rm, rmode, bits)                             \
+float ## bits float ## bits ## _round_to_int_ ## rm(          \
+                         float ## bits a, float_status *s)    \
+{                                                             \
+    FloatParts64 pa;   \
+    float ## bits ## _unpack_canonical(&pa, a, s); \
+    parts_round_to_int(&pa, rmode, 0, s, &float64_params);    \
+    return float ## bits ## _round_pack_canonical(&pa, s);    \
+}
+FRINT_RM(rne, float_round_nearest_even, 32)
+FRINT_RM(rm,  float_round_down,         32)
+FRINT_RM(rp,  float_round_up,           32)
+FRINT_RM(rz,  float_round_to_zero,      32)
+FRINT_RM(rne, float_round_nearest_even, 64)
+FRINT_RM(rm,  float_round_down,         64)
+FRINT_RM(rp,  float_round_up,           64)
+FRINT_RM(rz,  float_round_to_zero,      64)
+#undef FRINT_RM
+
 bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 {
     FloatParts64 p;
@@ -3349,6 +3368,42 @@ int32_t float64_to_int32_round_to_zero(float64 a, float_status *s)
     return float64_to_int32_scalbn(a, float_round_to_zero, 0, s);
 }
 
+#define FTINT_RM(rm, rmode, sbits, dbits)                                 \
+int ## dbits ## _t float ## sbits ## _to_int ## dbits ## _ ## rm(         \
+                         float ## sbits a, float_status *s)               \
+{                                                                         \
+    return float ## sbits ## _to_int ## dbits ## _scalbn(a, rmode, 0, s); \
+}
+FTINT_RM(rne, float_round_nearest_even, 32, 32)
+FTINT_RM(rm,  float_round_down,         32, 32)
+FTINT_RM(rp,  float_round_up,           32, 32)
+FTINT_RM(rz,  float_round_to_zero,      32, 32)
+FTINT_RM(rne, float_round_nearest_even, 64, 64)
+FTINT_RM(rm,  float_round_down,         64, 64)
+FTINT_RM(rp,  float_round_up,           64, 64)
+FTINT_RM(rz,  float_round_to_zero,      64, 64)
+
+FTINT_RM(rne, float_round_nearest_even, 32, 64)
+FTINT_RM(rm,  float_round_down,         32, 64)
+FTINT_RM(rp,  float_round_up,           32, 64)
+FTINT_RM(rz,  float_round_to_zero,      32, 64)
+#undef FTINT_RM
+
+int32_t float64_to_int32_round_up(float64 a, float_status *s)
+{
+    return float64_to_int32_scalbn(a, float_round_up, 0, s);
+}
+
+int32_t float64_to_int32_round_down(float64 a, float_status *s)
+{
+    return float64_to_int32_scalbn(a, float_round_down, 0, s);
+}
+
+int32_t float64_to_int32_round_nearest_even(float64 a, float_status *s)
+{
+    return float64_to_int32_scalbn(a, float_round_nearest_even, 0, s);
+}
+
 int64_t float64_to_int64_round_to_zero(float64 a, float_status *s)
 {
     return float64_to_int64_scalbn(a, float_round_to_zero, 0, s);
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 3dcf20e3a2..ebdbaa4ac8 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -559,6 +559,16 @@ int16_t float32_to_int16_round_to_zero(float32, float_status *status);
 int32_t float32_to_int32_round_to_zero(float32, float_status *status);
 int64_t float32_to_int64_round_to_zero(float32, float_status *status);
 
+int64_t float32_to_int64_rm(float32, float_status *status);
+int64_t float32_to_int64_rp(float32, float_status *status);
+int64_t float32_to_int64_rz(float32, float_status *status);
+int64_t float32_to_int64_rne(float32, float_status *status);
+
+int32_t float32_to_int32_rm(float32, float_status *status);
+int32_t float32_to_int32_rp(float32, float_status *status);
+int32_t float32_to_int32_rz(float32, float_status *status);
+int32_t float32_to_int32_rne(float32, float_status *status);
+
 uint16_t float32_to_uint16_scalbn(float32, FloatRoundMode, int, float_status *);
 uint32_t float32_to_uint32_scalbn(float32, FloatRoundMode, int, float_status *);
 uint64_t float32_to_uint64_scalbn(float32, FloatRoundMode, int, float_status *);
@@ -579,6 +589,10 @@ float128 float32_to_float128(float32, float_status *status);
 | Software IEC/IEEE single-precision operations.
 *----------------------------------------------------------------------------*/
 float32 float32_round_to_int(float32, float_status *status);
+float32 float32_round_to_int_rm(float32, float_status *status);
+float32 float32_round_to_int_rp(float32, float_status *status);
+float32 float32_round_to_int_rz(float32, float_status *status);
+float32 float32_round_to_int_rne(float32, float_status *status);
 float32 float32_add(float32, float32, float_status *status);
 float32 float32_sub(float32, float32, float_status *status);
 float32 float32_mul(float32, float32, float_status *status);
@@ -751,6 +765,15 @@ int16_t float64_to_int16_round_to_zero(float64, float_status *status);
 int32_t float64_to_int32_round_to_zero(float64, float_status *status);
 int64_t float64_to_int64_round_to_zero(float64, float_status *status);
 
+int64_t float64_to_int64_rm(float64, float_status *status);
+int64_t float64_to_int64_rp(float64, float_status *status);
+int64_t float64_to_int64_rz(float64, float_status *status);
+int64_t float64_to_int64_rne(float64, float_status *status);
+
+int32_t float64_to_int32_round_up(float64, float_status *status);
+int32_t float64_to_int32_round_down(float64, float_status *status);
+int32_t float64_to_int32_round_nearest_even(float64, float_status *status);
+
 uint16_t float64_to_uint16_scalbn(float64, FloatRoundMode, int, float_status *);
 uint32_t float64_to_uint32_scalbn(float64, FloatRoundMode, int, float_status *);
 uint64_t float64_to_uint64_scalbn(float64, FloatRoundMode, int, float_status *);
@@ -771,6 +794,10 @@ float128 float64_to_float128(float64, float_status *status);
 | Software IEC/IEEE double-precision operations.
 *----------------------------------------------------------------------------*/
 float64 float64_round_to_int(float64, float_status *status);
+float64 float64_round_to_int_rm(float64, float_status *status);
+float64 float64_round_to_int_rp(float64, float_status *status);
+float64 float64_round_to_int_rz(float64, float_status *status);
+float64 float64_round_to_int_rne(float64, float_status *status);
 float64 float64_add(float64, float64, float_status *status);
 float64 float64_sub(float64, float64, float_status *status);
 float64 float64_mul(float64, float64, float_status *status);
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
index 2c59fb09c0..b2cc1a6ddb 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -571,3 +571,59 @@ DEF_HELPER_3(vfrecip_s, void, env, i32, i32)
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
index 34a272ce00..ee3817dd31 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -2884,3 +2884,59 @@ TRANS(vfrecip_s, gen_vv, gen_helper_vfrecip_s)
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
index b66a896a28..0a03971cbe 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2516,3 +2516,372 @@ DO_2OP_F(vfrecip_s, 32, uint32_t, W, do_frecip_32)
 DO_2OP_F(vfrecip_d, 64, uint64_t, D, do_frecip_64)
 DO_2OP_F(vfrsqrt_s, 32, uint32_t, W, do_frsqrt_32)
 DO_2OP_F(vfrsqrt_d, 64, uint64_t, D, do_frsqrt_64)
+
+static uint32_t float16_cvt_float32(int16_t h, float_status *status)
+{
+    uint32_t t;
+    t = float16_to_float32((uint16_t)h, true, status);
+    return  h < 0 ? (t | (1 << 31)) : t;
+}
+static uint64_t float32_cvt_float64(int32_t s, float_status *status)
+{
+    uint64_t t;
+    t = float32_to_float64((uint32_t)s, status);
+    return s < 0 ? (t | (1ULL << 63)) : t;
+}
+
+static uint16_t float32_cvt_float16(int32_t s, float_status *status)
+{
+    uint16_t t;
+    t = float32_to_float16((uint32_t)s, true, status);
+    return s < 0 ? (t | (1 << 15)) : t;
+}
+static uint32_t float64_cvt_float32(int64_t d, float_status *status)
+{
+    uint32_t t;
+    t = float64_to_float32((uint64_t)d, status);
+    return d < 0 ? (t | (1ULL << 63)) : t;
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
+        temp.W(i) = float16_cvt_float32(Vj->H(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+        temp.D(i) = float32_cvt_float64(Vj->W(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+        temp.W(i) = float16_cvt_float32(Vj->H(i + 4), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+        temp.D(i) = float32_cvt_float64(Vj->W(i + 2), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+        temp.H(i + 4) = float32_cvt_float16(Vj->W(i), &env->fp_status);
+        temp.H(i)  = float32_cvt_float16(Vk->W(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+        temp.W(i + 2) = float64_cvt_float32(Vj->D(i), &env->fp_status);
+        temp.W(i)  = float64_cvt_float32(Vk->D(i), &env->fp_status);
+        vec_update_fcsr0(env, GETPC());
+    }
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
+}
+
+#define FCVT_2OP(NAME, BIT, T, E, FN)                               \
+void HELPER(NAME)(CPULoongArchState *env, uint32_t vd, uint32_t vj) \
+{                                                                   \
+    int i;                                                          \
+    VReg *Vd = &(env->fpr[vd].vreg);                                \
+    VReg *Vj = &(env->fpr[vj].vreg);                                \
+                                                                    \
+    vec_clear_cause(env);                                           \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                             \
+        Vd->E(i) = FN((T)Vj->E(i), &env->fp_status);                \
+        vec_update_fcsr0(env, GETPC());                             \
+    }                                                               \
+}
+
+FCVT_2OP(vfrint_s, 32, uint32_t, W, float32_round_to_int)
+FCVT_2OP(vfrint_d, 64, uint64_t, D, float64_round_to_int)
+FCVT_2OP(vfrintrne_s, 32, uint32_t, W, float32_round_to_int_rne)
+FCVT_2OP(vfrintrne_d, 64, uint64_t, D, float64_round_to_int_rne)
+FCVT_2OP(vfrintrz_s, 32, uint32_t, W, float32_round_to_int_rz)
+FCVT_2OP(vfrintrz_d, 64, uint64_t, D, float64_round_to_int_rz)
+FCVT_2OP(vfrintrp_s, 32, uint32_t, W, float32_round_to_int_rp)
+FCVT_2OP(vfrintrp_d, 64, uint64_t, D, float64_round_to_int_rp)
+FCVT_2OP(vfrintrm_s, 32, uint32_t, W, float32_round_to_int_rm)
+FCVT_2OP(vfrintrm_d, 64, uint64_t, D, float64_round_to_int_rm)
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
+DO_2OP_F(vftintrne_w_s, 32, uint32_t, W, do_ftintrne_w_s)
+DO_2OP_F(vftintrne_l_d, 64, uint64_t, D, do_ftintrne_l_d)
+DO_2OP_F(vftintrp_w_s, 32, uint32_t, W, do_ftintrp_w_s)
+DO_2OP_F(vftintrp_l_d, 64, uint64_t, D, do_ftintrp_l_d)
+DO_2OP_F(vftintrz_w_s, 32, uint32_t, W, do_ftintrz_w_s)
+DO_2OP_F(vftintrz_l_d, 64, uint64_t, D, do_ftintrz_l_d)
+DO_2OP_F(vftintrm_w_s, 32, uint32_t, W, do_ftintrm_w_s)
+DO_2OP_F(vftintrm_l_d, 64, uint64_t, D, do_ftintrm_l_d)
+DO_2OP_F(vftint_w_s, 32, uint32_t, W, do_float32_to_int32)
+DO_2OP_F(vftint_l_d, 64, uint64_t, D, do_float64_to_int64)
+
+FTINT(rz_wu_s, float32, uint32, uint32_t, uint32_t, float_round_to_zero)
+FTINT(rz_lu_d, float64, uint64, uint64_t, uint64_t, float_round_to_zero)
+
+DO_2OP_F(vftintrz_wu_s, 32, uint32_t, W, do_ftintrz_wu_s)
+DO_2OP_F(vftintrz_lu_d, 64, uint64_t, D, do_ftintrz_lu_d)
+DO_2OP_F(vftint_wu_s, 32, uint32_t, W, do_float32_to_uint32)
+DO_2OP_F(vftint_lu_d, 64, uint64_t, D, do_float64_to_uint64)
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
+        temp.W(i + 2) = FN(env, (uint64_t)Vj->D(i));     \
+        temp.W(i) = FN(env, (uint64_t)Vk->D(i));         \
+    }                                                    \
+    Vd->D(0) = temp.D(0);                                \
+    Vd->D(1) = temp.D(1);                                \
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
+        temp.D(i) = FN(env, (uint32_t)Vj->W(i));                    \
+    }                                                               \
+    Vd->D(0) = temp.D(0);                                           \
+    Vd->D(1) = temp.D(1);                                           \
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
+        temp.D(i) = FN(env, (uint32_t)Vj->W(i + 2));                \
+    }                                                               \
+    Vd->D(0) = temp.D(0);                                           \
+    Vd->D(1) = temp.D(1);                                           \
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
+DO_2OP_F(vffint_s_w, 32, int32_t, W, do_ffint_s_w)
+DO_2OP_F(vffint_d_l, 64, int64_t, D, do_ffint_d_l)
+DO_2OP_F(vffint_s_wu, 32, uint32_t, W, do_ffint_s_wu)
+DO_2OP_F(vffint_d_lu, 64, uint64_t, D, do_ffint_d_lu)
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
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
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
+    Vd->D(0) = temp.D(0);
+    Vd->D(1) = temp.D(1);
+}
-- 
2.31.1


