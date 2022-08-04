Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E240589B84
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:14:28 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZkB-0007nM-Aa
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oJZSU-0000Ot-Fc
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:56:10 -0400
Received: from rev.ng ([5.9.113.41]:46397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1oJZST-0004aR-0Q
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VwPXCdlI6j0RnMJqfnhiaJ2BA8uproQwgXyfhBuntmo=; b=lwOrGHgvJ3BfnSyohtqVnrFZzq
 3tLn5un2T4a6tnS22Z4rr4+3GGqCDE75T4D4EY2E1XP7ZsGsgKkN2d0WQu9v6OHjMrzlxNmia8geg
 8z8CUOyTlp6xtj8WhY2StItvIFxUNLj0k47bYnTTjQgunRf2astMyZ1yzHYhZaH3QIqU=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, anjo@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v11 06/15] target/hexagon: expose next PC in DisasContext
Date: Thu,  4 Aug 2022 13:55:39 +0200
Message-Id: <20220804115548.13024-7-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-1-anjo@rev.ng>
References: <20220804115548.13024-1-anjo@rev.ng>
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
index d4fc92f7e9..e3e250fd4f 100644
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
index a245172827..494471548e 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -53,6 +53,7 @@ typedef struct DisasContext {
     bool qreg_is_predicated[NUM_QREGS];
     int qreg_log_idx;
     bool pre_commit;
+    uint32_t npc;
 } DisasContext;
 
 static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
-- 
2.37.0


