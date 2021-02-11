Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FA319590
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:06:56 +0100 (CET)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK6x-00036v-V2
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrx-0006c9-JJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:25 -0500
Received: from rev.ng ([5.9.113.41]:36149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrh-00011E-Qi
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=am0ybNwo7vAtEERkxQmFfcjHWEGA7eCb6KiFnpQ2u6g=; b=JiefvjjowgM+/kucj/zea49gc5
 nbFuDW9cZpg8VcElWxR58K8BytRCQ7uHdF27a4pXkZRVSNK0bAhjYUSqcTCByaxo7jmXHpescQh/+
 +vsSUgGQYqiVfOm7yC09o0r3KyTsMGNc6qbO0rLvX6Y4L9WJXT0kJq/eQeh4mLm1zfFU=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Subject: [RFC PATCH 05/10] target/hexagon: expose next PC in DisasContext
Date: Thu, 11 Feb 2021 22:50:46 +0100
Message-Id: <20210211215051.2102435-6-ale.qemu@rev.ng>
In-Reply-To: <20210211215051.2102435-1-ale.qemu@rev.ng>
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
---
 target/hexagon/translate.c | 4 +++-
 target/hexagon/translate.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index eeaad5f8ba..a59db485a3 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -503,11 +503,13 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
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
+        ctx->npc = 0;
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
2.30.0


