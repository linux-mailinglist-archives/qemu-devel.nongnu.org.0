Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436C50D5C6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:32:56 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikml-000466-FE
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUH-00039c-AK
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:49 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUF-0002wg-D7
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:49 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJC-0001ea-7c; Sun, 24 Apr 2022 23:02:22 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 36/42] i386: Implement VINSERT128/VEXTRACT128
Date: Sun, 24 Apr 2022 23:01:58 +0100
Message-Id: <20220424220204.2493824-37-paul@nowt.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

128-bit vinsert/vextract instructions. The integer and loating point variants
have the same semantics.

This is where we encounter an instruction encoded with VEX.L == 1 and
a 128 bit (xmm) destination operand.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/tcg/translate.c | 78 +++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5a11d3c083..4072fa28d3 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2814,6 +2814,24 @@ static inline void gen_op_movo_ymmh(DisasContext *s, int d_offset, int s_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
 }
 
+static inline void gen_op_movo_ymm_l2h(DisasContext *s,
+                                       int d_offset, int s_offset)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(1)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(3)));
+}
+
+static inline void gen_op_movo_ymm_h2l(DisasContext *s,
+                                       int d_offset, int s_offset)
+{
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(2)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(0)));
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(3)));
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
+}
+
 static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
 {
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset);
@@ -3353,9 +3371,13 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
     [0x15] = SPECIAL_OP(SSE41), /* pextrw */
     [0x16] = SPECIAL_OP(SSE41), /* pextrd/pextrq */
     [0x17] = SPECIAL_OP(SSE41), /* extractps */
+    [0x18] = SPECIAL_OP(AVX), /* vinsertf128 */
+    [0x19] = SPECIAL_OP(AVX), /* vextractf128 */
     [0x20] = SPECIAL_OP(SSE41), /* pinsrb */
     [0x21] = SPECIAL_OP(SSE41), /* insertps */
     [0x22] = SPECIAL_OP(SSE41), /* pinsrd/pinsrq */
+    [0x38] = SPECIAL_OP(AVX), /* vinserti128 */
+    [0x39] = SPECIAL_OP(AVX), /* vextracti128 */
     [0x40] = BINARY_OP(dpps, SSE41, 0),
 #define gen_helper_dppd_ymm NULL
     [0x41] = BINARY_OP(dppd, SSE41, 0),
@@ -5145,6 +5167,62 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                     gen_clear_ymmh(s, reg);
                     break;
+                case 0x38: /* vinserti128 */
+                    CHECK_AVX2_256(s);
+                    /* fall through */
+                case 0x18: /* vinsertf128 */
+                    CHECK_AVX(s);
+                    if ((s->prefix & PREFIX_VEX) == 0 || s->vex_l == 0) {
+                        goto illegal_op;
+                    }
+                    if (mod == 3) {
+                        if (val & 1) {
+                            gen_op_movo_ymm_l2h(s, ZMM_OFFSET(reg),
+                                                ZMM_OFFSET(rm));
+                        } else {
+                            gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(rm));
+                        }
+                    } else {
+                        if (val & 1) {
+                            gen_ldo_env_A0_ymmh(s, ZMM_OFFSET(reg));
+                        } else {
+                            gen_ldo_env_A0(s, ZMM_OFFSET(reg));
+                        }
+                    }
+                    if (reg != reg_v) {
+                        if (val & 1) {
+                            gen_op_movo(s, ZMM_OFFSET(reg), ZMM_OFFSET(reg_v));
+                        } else {
+                            gen_op_movo_ymmh(s, ZMM_OFFSET(reg),
+                                             ZMM_OFFSET(reg_v));
+                        }
+                    }
+                    break;
+                case 0x39: /* vextracti128 */
+                    CHECK_AVX2_256(s);
+                    /* fall through */
+                case 0x19: /* vextractf128 */
+                    CHECK_AVX_V0(s);
+                    if ((s->prefix & PREFIX_VEX) == 0 || s->vex_l == 0) {
+                        goto illegal_op;
+                    }
+                    if (mod == 3) {
+                        op1_offset = ZMM_OFFSET(rm);
+                        if (val & 1) {
+                            gen_op_movo_ymm_h2l(s, ZMM_OFFSET(rm),
+                                                ZMM_OFFSET(reg));
+                        } else {
+                            gen_op_movo(s, ZMM_OFFSET(rm), ZMM_OFFSET(reg));
+                        }
+                        gen_clear_ymmh(s, rm);
+                    } else{
+                        if (val & 1) {
+                            gen_sto_env_A0_ymmh(s, ZMM_OFFSET(reg));
+                        } else {
+                            gen_sto_env_A0(s, ZMM_OFFSET(reg));
+                        }
+                    }
+                    break;
                 }
                 return;
             }
-- 
2.36.0


