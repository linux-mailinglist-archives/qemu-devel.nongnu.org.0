Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9678513721
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:42:41 +0200 (CEST)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Ls-0008PY-Ab
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JU-000554-Sn
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JT-0006E1-EN
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i5so7047202wrc.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EeFLZ/V0/JOBTSNAJLm7+MRWGPviysoPcLoMqfST1AQ=;
 b=eLNplD47llVri5MY7I3nAOVXlARzTqgjIjvk5o+nBl6ubcyOW9XwBTwCtvbyfdncHB
 YiRn4jldFYUZ0Qt3Z2tntP4lo3qH+MnXUYayLxRn7lza0KuK37efbA8EB4H4E0WxQsxq
 UInVkfsqLSMJG001Dn48HRMi/c3l3s3sEOm3+c0/rZnOmogzFOAWJi8teS8kPHPk31Y3
 BtYgOsA309bHzENQwk4ctakYffa9/NKsZzuVxopruJ/k7UVwpPibFRjyIFMjaY5k8riO
 wPMvWlm2nlUBqKlNFcaTwTFHt9YCPnRRSJrrm0+c+pQ5WqGKLMiQfpzfW5QNqFNA5xFE
 9jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeFLZ/V0/JOBTSNAJLm7+MRWGPviysoPcLoMqfST1AQ=;
 b=vDnbZ/x2UqhfgFfxdG+WmkXfyqE48W2VsrQoherjq3MruO4hVvqmG//AeICkO61qNF
 EvPf+hRg0L2Nvb//gWQNrzZvOItL8Qx80+Zd1nqZFALD9jZJ7r/SkdP95Yxkcd4kGhnE
 PLW2jxmsgEmoFyW8k/yHHslOPgyyw9TziioxSY/HOJAgBccQKBgfOYCcOQYsD3G6Xb0Y
 RYmQD/fjlusKoFCI7tfWXWwndJrS19TWHky8vV6LbSvb5MSU4YwHzConvsEIw6qLGdVc
 5GMmtrjWYjZbcXEcqWa5ANDVq63UnnypMk7LUOFSF7u1ZpgdfxSeoJDqZ+GQwKIXSbIE
 Z88g==
X-Gm-Message-State: AOAM530BmOtHdd95/xajmm6Q2rdgQDyRa4hB+Oq7zDGob8u6ECq+5ynM
 wZR81UTUvJLM0hFg14G48CdGWUONgSCtrQ==
X-Google-Smtp-Source: ABdhPJyWr1hxL7/nHNgnp6HU4lBPnL0YB82UAqf25zH2LU0OTo2GmS1q7cljaqSsiIPRFUrLv7COnQ==
X-Received: by 2002:a5d:6d89:0:b0:20a:9beb:9477 with SMTP id
 l9-20020a5d6d89000000b0020a9beb9477mr26263958wrs.142.1651156810086; 
 Thu, 28 Apr 2022 07:40:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/54] target/arm: Use tcg_constant in disas_exc
Date: Thu, 28 Apr 2022 15:39:11 +0100
Message-Id: <20220428143958.2451229-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5d1bccaf469..68e3b5c1f80 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2015,7 +2015,6 @@ static void disas_exc(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 21, 3);
     int op2_ll = extract32(insn, 0, 5);
     int imm16 = extract32(insn, 5, 16);
-    TCGv_i32 tmp;
 
     switch (opc) {
     case 0:
@@ -2050,9 +2049,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
             gen_a64_set_pc_im(s->pc_curr);
-            tmp = tcg_const_i32(syn_aa64_smc(imm16));
-            gen_helper_pre_smc(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
+            gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
             gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
                                syn_aa64_smc(imm16), 3);
-- 
2.25.1


