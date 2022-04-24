Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A7E50D5C8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:33:23 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niknC-00054s-9N
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUD-00037M-Ex
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:45 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUB-0002wM-Cr
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:44 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJA-0001ea-3U; Sun, 24 Apr 2022 23:02:20 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 26/42] i386: Utility function for 128 bit AVX
Date: Sun, 24 Apr 2022 23:01:48 +0100
Message-Id: <20220424220204.2493824-27-paul@nowt.org>
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

VEX encoded instructions that write to a (128 bit) xmm register clear the
rest (upper half) of the corresonding (256 bit) ymm register.
When legacy SSE encodings are used the rest of the ymm register is left
unchanged.

Add a utility fuction so that we don't have to keep duplicating this logic.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/tcg/translate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d148a2319d..278ed8ed1c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2780,6 +2780,18 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
 
 #define ZMM_OFFSET(reg) offsetof(CPUX86State, xmm_regs[reg])
 
+/*
+ * Clear the top half of the ymm register after a VEX.128 instruction
+ * This could be optimized by tracking this in env->hflags
+ */
+static void gen_clear_ymmh(DisasContext *s, int reg)
+{
+    if (s->prefix & PREFIX_VEX) {
+        gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(2)));
+        gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(3)));
+    }
+}
+
 typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
 typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
-- 
2.36.0


