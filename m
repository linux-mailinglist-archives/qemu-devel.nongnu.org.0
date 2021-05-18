Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8747738814B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:21:56 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6Dz-0002ba-KD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64T-0000V4-VR
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:05 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64M-0006CD-Kf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:05 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so9802863oto.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpTZIbiP/0pzPjkmxIM6zBQYIsThwc1ZZvTr7Pkvn4Q=;
 b=BXLDH/HbTqD05Q3pYxHvGp6zX9AYlhapnIZmqVTKzF7t5o983EX1Mp7uk8J3f6gV3l
 2pXUODODDqbXLhAU1cQFBmNLxIMsASYnG/Su/rxBM6KM6BuzMJ0gsCQPnEqLqxDg5UBL
 F8O7PG9fjBI5QUezhemw1Clx85Dd6b7llPWNbCApegU8CeXajXL50jAdkKg2MYTQPY6L
 vEG1ShvaA6P8Q296CZ2y63ncj8tyFkRsAtdNg2/HlFB/EFK3FzL02YS7WKIHXu7t+i/f
 +op3pA7Qkp6YTcJRqSH1jDY3bkrzlJlAuSyXHbjC1dc1fi9Prw+oyWwEjRrB0awL0+Rc
 9Elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fpTZIbiP/0pzPjkmxIM6zBQYIsThwc1ZZvTr7Pkvn4Q=;
 b=IflovlhPPvSt8emv/IMRkFctsjFx37oKM1S4elCDzJIDobc3rSO51rtwow2OZdudbR
 +AJ8jqub+or2OC8X+AIawjE5lKwfhWOE5DQJaZD/DQEgjq8K7sKqWnwQc7QmWqbLraj8
 Kk97gS8sR08rbx1H3uqpMqs+pScc+dyc/V6pCUaju5BS5fPQTNPOuyOOjUFrXhMjGjm6
 50MllrnBaMZIGsEG6B6MSitjPj7o97USi81dXMdXhE8V0hMicK196bxYiSJ6CLVWmfiX
 52OaUTusgDTzUZBWMhZ7ESvtEGLc9qI6oR9W+rqUdRae1LYrLCfZPOkTG9mPaIJwS3Px
 YY/Q==
X-Gm-Message-State: AOAM533j2VoZtSbPwmKXGhbvABcH+Ddz5NY753vCfa7eJHtUw4G49LFo
 50eTSeJ61tEC0WqTLgnDWj+vx/tyIILq508Z
X-Google-Smtp-Source: ABdhPJzoFdzWMyXNSBST/5StMx/KBkss0S71TMqj9eUhVZzNmRo30ZF3l21vU+7F9yszP3OVALgz0w==
X-Received: by 2002:a05:6830:1d8e:: with SMTP id
 y14mr5737475oti.350.1621368717478; 
 Tue, 18 May 2021 13:11:57 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/24] target/ppc: Remove type argument from ppc6xx_tlb_check
Date: Tue, 18 May 2021 15:11:31 -0500
Message-Id: <20210518201146.794854-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can now use MMU_INST_FETCH from access_type for this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 197a75c9e3..506b0e4d90 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -288,8 +288,7 @@ static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
 }
 
 static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
-                            target_ulong eaddr,
-                            MMUAccessType access_type, int type)
+                            target_ulong eaddr, MMUAccessType access_type)
 {
     ppc6xx_tlb_t *tlb;
     int nr, best, way;
@@ -298,8 +297,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
     best = -1;
     ret = -1; /* No TLB found */
     for (way = 0; way < env->nb_ways; way++) {
-        nr = ppc6xx_tlb_getnum(env, eaddr, way,
-                               type == ACCESS_CODE ? 1 : 0);
+        nr = ppc6xx_tlb_getnum(env, eaddr, way, access_type == MMU_INST_FETCH);
         tlb = &env->tlb.tlb6[nr];
         /* This test "emulates" the PTE index match for hardware TLBs */
         if ((eaddr & TARGET_PAGE_MASK) != tlb->EPN) {
@@ -314,7 +312,7 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
                   pte_is_valid(tlb->pte0) ? "valid" : "inval",
                   tlb->EPN, eaddr, tlb->pte1,
                   access_type == MMU_DATA_STORE ? 'S' : 'L',
-                  type == ACCESS_CODE ? 'I' : 'D');
+                  access_type == MMU_INST_FETCH ? 'I' : 'D');
         switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
                                      0, access_type)) {
         case -3:
@@ -503,7 +501,7 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
             /* Initialize real address with an invalid value */
             ctx->raddr = (hwaddr)-1ULL;
             /* Software TLB search */
-            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type, type);
+            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type);
 #if defined(DUMP_PAGE_TABLES)
             if (qemu_loglevel_mask(CPU_LOG_MMU)) {
                 CPUState *cs = env_cpu(env);
-- 
2.25.1


