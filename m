Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39DB40DEBA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:54:26 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtiT-00018x-MM
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLm-0001hr-9l
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:58 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0002cE-1B
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 lb1-20020a17090b4a4100b001993f863df2so5013293pjb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6Fp0tDii68JisdtRr/m4W+R/ln8amHARXVC+ekHe9o=;
 b=WTvC0Zu1HO26hOb/3VCLaOCMMhA1eibvJCwWN1PFp2f7DXcod18wNsNdRagrebcH2V
 j3+FmgYv69PJ5H1iJKYBQ+jAlTtRC10ZfxZLCd81zPyNysCoIHLWPwnxCBhxW9z9aTVV
 Ls1cCFJx88ZG7EVu/ON/sF0r47ZpSYJt2TJozbxBliQYqiFLs5w0NOCkoLDy2ubYPIJj
 j+5JMMtZ990cw8Ql88PfWySp0A/sIM5mVobPRU2txVm+yVY1i0ivzdx5awxPBhWav/jT
 3ZfLqpxhWnfsfBYLAOg4/x12Vscw/suxhHEcl/U8svSqcG2uDrQZQrHO80/VlpaKzJlh
 21YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6Fp0tDii68JisdtRr/m4W+R/ln8amHARXVC+ekHe9o=;
 b=bhT5IbBof7lG9NEReM9wgWDabqCia7Vrva94e49OYcp4sLCQT9CkTTfMa9s/zL+aud
 /GZjJKZzKsVxTm+rss4z058kTFPBwVvzvi8dlOnieXKa5bybwHLza8fuGWMUn/wx6yZt
 LqLr3Feluzf2zIgiXhiU+mTCpoDaCX5K5r7CvZlbuR8dwPefk/SE1IGB0eJBQ2O2iIFB
 T3WYF7qECnsjsGOS/T/TEuhiEPE79xg+3DYDoOb2YDRhF95FXPwQq4Z3421llw4gLYpw
 stFvGl0/V9OyjPm4a4rMuXJ4UzrO05rra7bsxsZukjIk/ZkBPTIxHTSkvZTxiiB33beE
 o3Rw==
X-Gm-Message-State: AOAM5336NTuvx5g2GKl9+gsEnQT3cDm7Be2mmGRiTR9SNmzVwqv5Nj9h
 LEZqpk6d1SjT9QDR8n9TNl+HoVoJ3FzOlQ==
X-Google-Smtp-Source: ABdhPJwMphJAwjQpz3jQwZTS9c/6yBRmKtk7fJbG9iw16vk+2gwS4XP2c90gx7lUqY1BhqEzq61PFQ==
X-Received: by 2002:a17:902:9a91:b0:138:efd5:7302 with SMTP id
 w17-20020a1709029a9100b00138efd57302mr5226284plp.35.1631806245799; 
 Thu, 16 Sep 2021 08:30:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/35] target/sparc: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:18 -0700
Message-Id: <20210916153025.1944763-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-28-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index e83e305aa9..4a63ed1264 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -702,6 +702,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.npc = tb->cs_base;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool sparc_cpu_has_work(CPUState *cs)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
@@ -710,6 +711,7 @@ static bool sparc_cpu_has_work(CPUState *cs)
     return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(env);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static char *sparc_cpu_type_name(const char *cpu_model)
 {
@@ -867,6 +869,7 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = sparc_cpu_has_work,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
@@ -888,7 +891,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-    cc->has_work = sparc_cpu_has_work;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
-- 
2.25.1


