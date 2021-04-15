Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65136111D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:28:43 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5nF-0006E6-Ip
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xZ-0004G9-L4
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:17 -0400
Received: from rev.ng ([5.9.113.41]:55811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lX4xU-0006g3-RA
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dKS566l2tmz6OK9atm1kzL5ZHx1yC4keQWD0Ja+UupI=; b=RBQmfb8+v8AF6mo6qjUNXhTzVA
 046ahiCLFDrJc8Ymdd+OR3kNeBsLYGYvbMaoxggEA67RLJ5M1FY8Z0qPvwytflHMUsOLlIRlnpeBh
 nxhfb9Mrmx9kZ0u6j8+GMhh1te4SqXfMhIb5DdAa8IPQCAjC6F3ACgRiI+HAdp+yBO+c=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v4 07/12] target/hexagon: expose next PC in DisasContext
Date: Thu, 15 Apr 2021 18:34:50 +0200
Message-Id: <20210415163455.3839169-8-ale.qemu@rev.ng>
In-Reply-To: <20210415163455.3839169-1-ale.qemu@rev.ng>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
---
 target/hexagon/translate.c | 3 ++-
 target/hexagon/translate.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index eeaad5f8ba..30ff3c5d51 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -503,11 +503,12 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
     if (decode_packet(nwords, words, &pkt, false) > 0) {
         HEX_DEBUG_PRINT_PKT(&pkt);
         gen_start_packet(ctx, &pkt);
+        ctx->npc = ctx->base.pc_next + pkt.encod_pkt_size_in_bytes;
         for (i = 0; i < pkt.num_insns; i++) {
             gen_insn(env, ctx, &pkt.insn[i], &pkt);
         }
         gen_commit_packet(ctx, &pkt);
-        ctx->base.pc_next += pkt.encod_pkt_size_in_bytes;
+        ctx->base.pc_next = ctx->npc;
     } else {
         gen_exception(HEX_EXCP_INVALID_PACKET);
         ctx->base.is_jmp = DISAS_NORETURN;
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 938f7fbb9f..2195e20f4b 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -36,6 +36,7 @@ typedef struct DisasContext {
     int preg_log_idx;
     uint8_t store_width[STORES_MAX];
     uint8_t s1_store_processed;
+    uint32_t npc;
 } DisasContext;
 
 static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
-- 
2.31.1


