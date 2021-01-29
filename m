Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76253308804
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:03:01 +0100 (CET)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RYK-0006Bg-Ep
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW0-0004Go-FQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVk-0006rg-3k
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m1so3541710wml.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eJCw4eHH3Spgo4adrfmSpNJj4lzDDpBeLfEpC7k+CtQ=;
 b=x83nVstFTMr6K88yH4jY3hzVQ6OWcnbXkPSLCr/2kh6VDwZ90cea2A2EBHAye5DQ1o
 RUD6YVwz/530t6rTrW/4Rj8GhrKBRWT7sbfi6pJAKYPJFhE3OoZKxoUGuVEzUsGS5NLt
 ZSQEkIY2AsK9cYfpAeHKGyNWsy8J17uLylIUajWeE+Aw9J9bDmbvnBufsu91d6XH6d0i
 POTFUqKzLReNw4BztLw6SoZQuKy3ugR6ATCG3rp0TC0sndavrSu+MkAz1G1GkCOTifCs
 kV3ZKXafTSM9g45v8sivm1Oecaf5mixmFhdodt7l8b35P+P2AEC/trYJTzUArdvHGQDN
 IqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eJCw4eHH3Spgo4adrfmSpNJj4lzDDpBeLfEpC7k+CtQ=;
 b=gHmaYtmH6vI+e30CBXqEK6rRN4V1zmNJDNBA32MaTwXiBj0YtXtuBC/Eex0j//gkrh
 +jUzlDullPn5PrW0XZ+tbZ2HwVr1LgqBeHKvitZc0P4xq3pTIaifJ5CbkE2sT+/qZLqa
 ARXxakQc3EwY9OwgruUwBs796RgZuWrAAaRp+46b7XB49cbW9FL9G4uqxEEjcb3yZKq0
 8C8V2yh2DR+DfNHINkOhdgYN6ktzSC5y8nDcE5pu17l8n5yZ9BDPDTJK71uSR2zIZGfB
 tYQLv71qW4YCy5lFTzaoqmBTzzCJKM0batjEDKKY/gjx7rcV/KHJm///CZOJeaRKbk4J
 Ls5Q==
X-Gm-Message-State: AOAM532n5TYkjEZVn/7bWPMcMVcjr8QBfGgsJvGc2zAv5p268rS2ZTa3
 cxFdPX0OD3v8QHefXiyXkXv6NNIV2aioVg==
X-Google-Smtp-Source: ABdhPJznmbMnHLbAIjObmMJTrkJI30almyl2qq6uMJYJncL4FK+/elPoFE/XIHKGgXbV2SfjdY4weQ==
X-Received: by 2002:a05:600c:354b:: with SMTP id
 i11mr3228660wmq.72.1611918017048; 
 Fri, 29 Jan 2021 03:00:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/46] target/arm: Conditionalize DBGDIDR
Date: Fri, 29 Jan 2021 10:59:28 +0000
Message-Id: <20210129110012.8660-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Only define the register if it exists for the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210120031656.737646-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 417777d4bed..677a4aa79e7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6567,11 +6567,21 @@ static void define_debug_regs(ARMCPU *cpu)
      */
     int i;
     int wrps, brps, ctx_cmps;
-    ARMCPRegInfo dbgdidr = {
-        .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
-        .access = PL0_R, .accessfn = access_tda,
-        .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdidr,
-    };
+
+    /*
+     * The Arm ARM says DBGDIDR is optional and deprecated if EL1 cannot
+     * use AArch32.  Given that bit 15 is RES1, if the value is 0 then
+     * the register must not exist for this cpu.
+     */
+    if (cpu->isar.dbgdidr != 0) {
+        ARMCPRegInfo dbgdidr = {
+            .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0,
+            .opc1 = 0, .opc2 = 0,
+            .access = PL0_R, .accessfn = access_tda,
+            .type = ARM_CP_CONST, .resetvalue = cpu->isar.dbgdidr,
+        };
+        define_one_arm_cp_reg(cpu, &dbgdidr);
+    }
 
     /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
@@ -6580,7 +6590,6 @@ static void define_debug_regs(ARMCPU *cpu)
 
     assert(ctx_cmps <= brps);
 
-    define_one_arm_cp_reg(cpu, &dbgdidr);
     define_arm_cp_regs(cpu, debug_cp_reginfo);
 
     if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
-- 
2.20.1


