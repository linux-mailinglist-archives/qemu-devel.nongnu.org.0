Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDF44AF7FF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:23:58 +0100 (CET)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqhC-0000xC-1a
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNU-00061k-UJ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:37 -0500
Received: from rev.ng ([5.9.113.41]:53719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNR-0004Xt-I1
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3dpSL2UUiwMA47K/5LP6yWKATrdsEIXcY5ttraYvJFo=; b=Z0b+1alzO7VYkUCYZoxXshXYHH
 aZ/4z6lqcnBdig+jOQp2AhhYdkRrxCCrcdHi1CwbICqUgFiybpinCyoc+8EDWRwQXgtEiQrF6wgVB
 f/D4UiNkGpwGQ7Eyr1h1AlVI8tWdQaYDH1wmNDRpN1poTulSvCus4KRnCR2ta+jWi7uE=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v8 06/12] target/hexagon: expose next PC in DisasContext
Date: Wed,  9 Feb 2022 18:03:06 +0100
Message-Id: <20220209170312.30662-7-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-1-anjo@rev.ng>
References: <20220209170312.30662-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/translate.c | 3 ++-
 target/hexagon/translate.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index b6f541ecb2..d4d4bcf3b2 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -741,11 +741,12 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
     if (decode_packet(nwords, words, &pkt, false) > 0) {
         HEX_DEBUG_PRINT_PKT(&pkt);
         gen_start_packet(ctx, &pkt);
+        ctx->npc = ctx->base.pc_next + pkt.encod_pkt_size_in_bytes;
         for (i = 0; i < pkt.num_insns; i++) {
             gen_insn(env, ctx, &pkt.insn[i], &pkt);
         }
         gen_commit_packet(env, ctx, &pkt);
-        ctx->base.pc_next += pkt.encod_pkt_size_in_bytes;
+        ctx->base.pc_next = ctx->npc;
     } else {
         gen_exception_end_tb(ctx, HEX_EXCP_INVALID_PACKET);
     }
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index fccfb94340..0eb96b9621 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -52,6 +52,7 @@ typedef struct DisasContext {
     bool qreg_is_predicated[NUM_QREGS];
     int qreg_log_idx;
     bool pre_commit;
+    uint32_t npc;
 } DisasContext;
 
 static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
-- 
2.34.1


