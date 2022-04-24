Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21A50D59F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:15:44 +0200 (CEST)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikW7-0004IZ-O4
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSO-0001RR-HC
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:52 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSM-0002o7-VD
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:11:52 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJC-0001ea-Dq; Sun, 24 Apr 2022 23:02:22 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 37/42] i386: Implement VBLENDV
Date: Sun, 24 Apr 2022 23:01:59 +0100
Message-Id: <20220424220204.2493824-38-paul@nowt.org>
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

The AVX variants of the BLENDV instructions use a different opcode prefix
to support the additional operands. We already modified the helper functions
in anticipation of this.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/tcg/translate.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4072fa28d3..95ecdea8fe 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3384,6 +3384,9 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
     [0x42] = BINARY_OP(mpsadbw, SSE41, SSE_OPF_MMX),
     [0x44] = BINARY_OP(pclmulqdq, PCLMULQDQ, 0),
     [0x46] = BINARY_OP(vpermdq, AVX, SSE_OPF_AVX2), /* vperm2i128 */
+    [0x4a] = BLENDV_OP(blendvps, AVX, 0),
+    [0x4b] = BLENDV_OP(blendvpd, AVX, 0),
+    [0x4c] = BLENDV_OP(pblendvb, AVX, SSE_OPF_MMX),
 #define gen_helper_pcmpestrm_ymm NULL
     [0x60] = CMP_OP(pcmpestrm, SSE42),
 #define gen_helper_pcmpestri_ymm NULL
@@ -5268,6 +5271,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
 
             /* SSE */
+            if (op7.flags & SSE_OPF_BLENDV && !(s->prefix & PREFIX_VEX)) {
+                /* Only VEX encodings are valid for these blendv opcodes */
+                goto illegal_op;
+            }
             op1_offset = ZMM_OFFSET(reg);
             if (mod == 3) {
                 op2_offset = ZMM_OFFSET(rm | REX_B(s));
@@ -5316,8 +5323,15 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 op7.fn[b1].op1(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
             } else {
                 tcg_gen_addi_ptr(s->ptr2, cpu_env, v_offset);
-                op7.fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
-                               tcg_const_i32(val));
+                if (op7.flags & SSE_OPF_BLENDV) {
+                    TCGv_ptr mask = tcg_temp_new_ptr();
+                    tcg_gen_addi_ptr(mask, cpu_env, ZMM_OFFSET(val >> 4));
+                    op7.fn[b1].op3(cpu_env, s->ptr0, s->ptr2, s->ptr1, mask);
+                    tcg_temp_free_ptr(mask);
+                } else {
+                    op7.fn[b1].op2(cpu_env, s->ptr0, s->ptr2, s->ptr1,
+                                   tcg_const_i32(val));
+                }
             }
             if ((op7.flags & SSE_OPF_CMP) == 0 && s->vex_l == 0) {
                 gen_clear_ymmh(s, reg);
-- 
2.36.0


