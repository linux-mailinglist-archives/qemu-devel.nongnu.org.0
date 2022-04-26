Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F165103A8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:37:13 +0200 (CEST)
Received: from localhost ([::1]:42512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOBc-0005zv-AO
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Y-0002vj-Hz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5T-0003ly-Rv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id b12so15947505plg.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d6D3pyx1DCMBlw0QHVOtWOZM5rgwOC/SMC0Uj796DwU=;
 b=tYdEVbJmSEEeLPZMSQCVxYzC1yiA/94isaMKhS0jAnt8k8oTjuLn2YaBsz7SNUKIUs
 RqJSPXU4z3sT+tlGOAPyaFaqxmsy+hgdRIFB5B2PJ4NJ/6MMCvsYEoWGXL1C/DfK3fb7
 60GstGhmlgDYV1nPYkRF7K3CXamMLizM2gdgp96hahwikVfuRFAQhNqNVTcAXbS3T140
 6qLVOM0acitKKX5nDIzaRWIbZWYlbTV4enRIyRX/UPg5FbDzkXgZed1WQULUt+ZySknP
 CtNQYqWD0xNNcbW18XUV309VLg1iP6RUe2DM5fy2GxgPe8qs3k9DHM9rTyY6LPOwcWnE
 l5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d6D3pyx1DCMBlw0QHVOtWOZM5rgwOC/SMC0Uj796DwU=;
 b=YxpYQWcH3xeB7dBgXuJ6K0mYni4M+M/4RNUZqQ0jtlKhHthmUcEkjJ1DUtHywVCgRS
 xjh+JcYvbui5viNCuocBqIbkiFM/tPJKSuSkC9bXU0Ikm9KiJW5+BJww6yjYQCiBkAjY
 hXxOgnmbx2ThDJ2CBOisFCWwsncUBf+Odz3TWzs9L1RN1MxfF/VfRDz1+NaPJCu2J9vM
 mY2xpfj667oJ5SsX0PJ9CPBJ9a43d7b5pCwNl/wsOrwOErnjGsUd90H/lAqf/Vjx7sou
 pj/eB/4K5cjSLM4PPC3mT9qa3rp65XyeZzJJMsQSyRagRqQgeQ0Ztj+ZNFL/MESEEYgy
 lOEQ==
X-Gm-Message-State: AOAM533V71ge18bmx4GfADsaVjND7TKcPWzmK73QUBhkaEmmSZl39Tk3
 3JGPpcQgGk3DIhI+yMzL/lapx0LdC+xjpQ==
X-Google-Smtp-Source: ABdhPJxVut0AwKrH46SwPzhZ8oSAKy9KdCHXvtIquUvCKVxwoOZR/oJ3s4t0TI4P1IrjQp7xcyM9Ng==
X-Received: by 2002:a17:902:7088:b0:156:1aa9:79eb with SMTP id
 z8-20020a170902708800b001561aa979ebmr24006486plk.71.1650990649878; 
 Tue, 26 Apr 2022 09:30:49 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/47] target/arm: Use tcg_constant in handle_msr_i
Date: Tue, 26 Apr 2022 09:30:01 -0700
Message-Id: <20220426163043.100432-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 target/arm/translate-a64.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5c0fd897d6..ec4765362b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1615,7 +1615,6 @@ static void gen_axflag(void)
 static void handle_msr_i(DisasContext *s, uint32_t insn,
                          unsigned int op1, unsigned int op2, unsigned int crm)
 {
-    TCGv_i32 t1;
     int op = op1 << 3 | op2;
 
     /* End the TB by default, chaining is ok.  */
@@ -1674,9 +1673,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         if (s->current_el == 0) {
             goto do_unallocated;
         }
-        t1 = tcg_const_i32(crm & PSTATE_SP);
-        gen_helper_msr_i_spsel(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_spsel(cpu_env, tcg_constant_i32(crm & PSTATE_SP));
         break;
 
     case 0x19: /* SSBS */
@@ -1704,15 +1701,11 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         break;
 
     case 0x1e: /* DAIFSet */
-        t1 = tcg_const_i32(crm);
-        gen_helper_msr_i_daifset(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_daifset(cpu_env, tcg_constant_i32(crm));
         break;
 
     case 0x1f: /* DAIFClear */
-        t1 = tcg_const_i32(crm);
-        gen_helper_msr_i_daifclear(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_daifclear(cpu_env, tcg_constant_i32(crm));
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
         s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
-- 
2.34.1


