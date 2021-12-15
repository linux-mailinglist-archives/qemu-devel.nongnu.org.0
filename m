Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BB4757B1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:23:43 +0100 (CET)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSNq-0005TQ-4U
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRib-0006xD-W5
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:06 -0500
Received: from [2a00:1450:4864:20::435] (port=40637
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiX-0008QH-QQ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id t9so37375733wrx.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dUOHsQLorVT3Jc1OzDLRWuNIwMw2lM0/Ici6Robi+sY=;
 b=XwUf2hd9EaPm50lM6yWjWxUea2gKO/cF4YUkdgswCtnxzmLpngyok+Ny5hqw6cntBF
 Lt2K/fC1tNAyujCoFwdj5lkNHboV74ju3SdTOWZ7R/lJQ0DmlXBICznttRhNBICwGjBe
 yHq3g6H+uOpMHHNsju2cXfBOcLsG/y2lAE8ZFKETZ856jZTyPzc/6PhNdl3oEHoqTo5G
 62c2wn09qWkYs1eqTF7FXga56hK0+n0ARzF5xCAl7pktm3oHqH1sfDIZYI7xMK7cR/lF
 jJVffSTcc0otyHcGS1cXtQLAQHbyJr3M8n86tWyT8qltEBBKQDLRFuAYN2y38Z80FTHO
 iKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUOHsQLorVT3Jc1OzDLRWuNIwMw2lM0/Ici6Robi+sY=;
 b=MBEvah7fhSDeftiflO+veriAl/9XeieIHHp/GfPDSldKovrv45oYkT55vmAGCaxCUk
 XCfCQBWl+61FTh3GDtLOWOIE1UmH1jW7Vog9GtPgUrPBvvi8FoADGvqB7uelkcwJ2YWA
 +F5bBOYEeWw+w+Cr6CFgBPloXUZ1uUPaeEl1GEhzBo7LXaSLYY3kXTOdKBPST+/eyqLM
 YBOE2BVfeVTr6kVJL1q21CvvGuawIZyiavoFS3SvGXeG5tMDyjSMH6PToDXViNohyeYt
 Q2CWl7RNSEi6Y8rcDsjKodzCZtJPrfrmb5FI6sSxKakGkguBRjBPfWwADNeDPUq8AfEU
 vuhg==
X-Gm-Message-State: AOAM533mgDSPuM9ZIA3wf92p8nvYjxs5p4/pGcnqY5O9j6Ki6Zm6b2rr
 kUhgpGJB/YuuPWOlNw7mtDgiSofVh26mWA==
X-Google-Smtp-Source: ABdhPJx4GWaQbFUo4fUBk4bIN+c24WGwX/n4h6w+BvxAEJPmXO4ereZo1B9UtVlBzMx63uBBw+tN2w==
X-Received: by 2002:adf:b1cc:: with SMTP id r12mr2745780wra.385.1639564856065; 
 Wed, 15 Dec 2021 02:40:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] target/arm: Hoist pc_next to a local variable in
 aarch64_tr_translate_insn
Date: Wed, 15 Dec 2021 10:40:25 +0000
Message-Id: <20211215104049.2030475-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cec672f2296..9c4258ccac2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14750,6 +14750,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *s = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
     if (s->ss_active && !s->pstate_ss) {
@@ -14769,10 +14770,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         return;
     }
 
-    s->pc_curr = s->base.pc_next;
-    insn = arm_ldl_code(env, &s->base, s->base.pc_next, s->sctlr_b);
+    s->pc_curr = pc;
+    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
     s->insn = insn;
-    s->base.pc_next += 4;
+    s->base.pc_next = pc + 4;
 
     s->fp_access_checked = false;
     s->sve_access_checked = false;
-- 
2.25.1


