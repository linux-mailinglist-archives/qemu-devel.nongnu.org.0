Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C23443C1D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:09:24 +0100 (CET)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7aV-0006Kd-NR
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VI-00057a-2e
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:00 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VF-0000ty-3e
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:59 -0400
Received: by mail-qk1-x735.google.com with SMTP id i9so1140039qki.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKojDLUB4PcjfS7SRPDbZQq3hYacmhCQrpop1lkMtjQ=;
 b=ToJypVBwDgdrteKyrxJuynqLXboRww/m45VLq3kBP2w2v8+kW7KFCyM71Xg/H+KW+i
 tCX0WviznXbI1lwupGc9WRFeSWYVjRL/LpsWpzjrojOxK4ush+uGHNVe8mQjWt/c0MHw
 uY9hOB8fkNbpEy9vvbAvF1s7QTRLoQXoH7GZgh0saw3ITSgvYQfV272Am1T21x6qapae
 F2Bgfl/rOVSUHG0IY69MNQkaEwhIddS8EuqHH5/1YIo+wCLFuPbK2Qv9a4aNYN46Q0Q6
 G+wfZES2R767pRKCCaJ8b49pUfX+K8ZqqTy0X8XShqz8Pvaw9X+intoL4Q2r9DA3TjFl
 xIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKojDLUB4PcjfS7SRPDbZQq3hYacmhCQrpop1lkMtjQ=;
 b=zNJPl0hszcvi7524ZMJJNFKE2QLK4SXVD9ALUe1Bagt1VMOU1XjXUI7Z412M9rfyST
 6BBGrJrWgnPWJ89YMXK0d3ggmSJ5Re49qhIGhrzEcrn04wM5MF3EskvRa5kNLlB61kt9
 jmDtymLWUJJ9j6DySng/KTZ2bRqKaksURaGOar8fMn9U3N1uJjVV09UZ6eSQiyL/pVFZ
 4MKoY+L+PYFF1R0iXBf7Id4I5u4PRy9JCh10LIuNzi0kaXWKK0yuEhCsutQgTACV//OW
 ViVAqm7UcOEwSGV64bUKZYXCwtfTCw1RQHm4clWn2BN7OFnGAF/HRJOofe6spupLDIhd
 ATzA==
X-Gm-Message-State: AOAM530JtWtwvX8E+wyPH8MZ66T82EywjPHve+/Sh67TgI4YAVzqBjy2
 A5LNVGh5tNJd0TpV7OqNHByrBXVM5OXNzw==
X-Google-Smtp-Source: ABdhPJy/9CkQ+uvsYl4FC2IDH1tYblRc/7xUQ7opRzjnQGhDa4B2qh1W9SQpqSdEYGgd1rZ9L5BrZw==
X-Received: by 2002:a05:620a:408:: with SMTP id
 8mr4294199qkp.116.1635912236141; 
 Tue, 02 Nov 2021 21:03:56 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/10] target/arm: Hoist pc_next to a local variable in
 thumb_tr_translate_insn
Date: Wed,  3 Nov 2021 00:03:45 -0400
Message-Id: <20211103040352.373688-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ead77e9006..a39456ea98 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9629,25 +9629,25 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     uint32_t insn;
     bool is_16bit;
 
     if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 2;
+        dc->base.pc_next = pc + 2;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_lduw_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
+    dc->pc_curr = pc;
+    insn = arm_lduw_code(env, &dc->base, pc, dc->sctlr_b);
     is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
-    dc->base.pc_next += 2;
+    pc += 2;
     if (!is_16bit) {
-        uint32_t insn2 = arm_lduw_code(env, &dc->base, dc->base.pc_next,
-                                       dc->sctlr_b);
-
+        uint32_t insn2 = arm_lduw_code(env, &dc->base, pc, dc->sctlr_b);
         insn = insn << 16 | insn2;
-        dc->base.pc_next += 2;
+        pc += 2;
     }
+    dc->base.pc_next = pc;
     dc->insn = insn;
 
     if (dc->pstate_il) {
-- 
2.25.1


