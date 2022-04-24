Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA250D5D1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:37:04 +0200 (CEST)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikql-0004bG-UJ
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikV2-0004Kg-UR
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:14:36 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikUg-0002xm-Pu
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:14:28 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJB-0001ea-Cp; Sun, 24 Apr 2022 23:02:21 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 32/42] i386: Implement VTEST
Date: Sun, 24 Apr 2022 23:01:54 +0100
Message-Id: <20220424220204.2493824-33-paul@nowt.org>
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

Noting special here

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 28 ++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h |  2 ++
 target/i386/tcg/translate.c  |  2 ++
 3 files changed, 32 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 8f2bd48394..edf14a25d7 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -3212,6 +3212,34 @@ SSE_HELPER_Q(helper_vpsrlvq, FPSRLVQ)
 SSE_HELPER_Q(helper_vpsravq, FPSRAVQ)
 SSE_HELPER_Q(helper_vpsllvq, FPSLLVQ)
 
+void glue(helper_vtestps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint32_t zf = (s->L(0) &  d->L(0)) | (s->L(1) &  d->L(1));
+    uint32_t cf = (s->L(0) & ~d->L(0)) | (s->L(1) & ~d->L(1));
+
+    zf |= (s->L(2) &  d->L(2)) | (s->L(3) &  d->L(3));
+    cf |= (s->L(2) & ~d->L(2)) | (s->L(3) & ~d->L(3));
+#if SHIFT == 2
+    zf |= (s->L(4) &  d->L(4)) | (s->L(5) &  d->L(5));
+    cf |= (s->L(4) & ~d->L(4)) | (s->L(5) & ~d->L(5));
+    zf |= (s->L(6) &  d->L(6)) | (s->L(7) &  d->L(7));
+    cf |= (s->L(6) & ~d->L(6)) | (s->L(7) & ~d->L(7));
+#endif
+    CC_SRC = ((zf >> 31) ? 0 : CC_Z) | ((cf >> 31) ? 0 : CC_C);
+}
+
+void glue(helper_vtestpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    uint64_t zf = (s->Q(0) &  d->Q(0)) | (s->Q(1) &  d->Q(1));
+    uint64_t cf = (s->Q(0) & ~d->Q(0)) | (s->Q(1) & ~d->Q(1));
+
+#if SHIFT == 2
+    zf |= (s->Q(2) &  d->Q(2)) | (s->Q(3) &  d->Q(3));
+    cf |= (s->Q(2) & ~d->Q(2)) | (s->Q(3) & ~d->Q(3));
+#endif
+    CC_SRC = ((zf >> 63) ? 0 : CC_Z) | ((cf >> 63) ? 0 : CC_C);
+}
+
 #if SHIFT == 2
 void glue(helper_vbroadcastdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 20db6c4240..8b93b8e6d6 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -427,6 +427,8 @@ DEF_HELPER_4(glue(vpsllvd, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpsrlvq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpsravq, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(vpsllvq, SUFFIX), void, env, Reg, Reg, Reg)
+DEF_HELPER_3(glue(vtestps, SUFFIX), void, env, Reg, Reg)
+DEF_HELPER_3(glue(vtestpd, SUFFIX), void, env, Reg, Reg)
 #if SHIFT == 2
 DEF_HELPER_3(glue(vbroadcastdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_1(vzeroall, void, env)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4990470083..2fbb7bfcad 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3253,6 +3253,8 @@ static const struct SSEOpHelper_table6 sse_op_table6[256] = {
     [0x0b] = BINARY_OP_MMX(pmulhrsw, SSSE3),
     [0x0c] = BINARY_OP(vpermilps, AVX, 0),
     [0x0d] = BINARY_OP(vpermilpd, AVX, 0),
+    [0x0e] = CMP_OP(vtestps, AVX),
+    [0x0f] = CMP_OP(vtestpd, AVX),
     [0x10] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
     [0x14] = BLENDV_OP(blendvps, SSE41, 0),
     [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
-- 
2.36.0


