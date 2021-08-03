Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4493DE54C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:26:46 +0200 (CEST)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm0r-00018s-Su
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpf-0003Ls-03
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpd-0002HG-85
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:10 -0400
Received: by mail-pj1-x102c.google.com with SMTP id nh14so16303968pjb.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmXl9DvoFiIMYZO3Xai8Zh+D5bFlHeruBJIEw/zNnu0=;
 b=nPkG5Sv7LDK5qLRcmfb8lEYGfs86r1XfqXmg2/TfcuOxscsWgg0Cjx7+AlWPG3Al45
 c5Dmc5vVSFQAXL022wKVeRBrvbV1MVNGxRFfMamv8f7rIC4pFAu5BRI5vChcxHRWmGP2
 s3aRKOScTcK1mVLgkzFOspMKQ2Gjg9kvnpVNhQuh1Yh5NgtlZOuV2rUDZQQ89+rDx2ZD
 UKNqLmH2EUE7dG+9aKBnVv06c1aae4D6mTpMXCe6truq3fUsBXxVL3Zkg8M/oRSI0yLI
 Y52SjcIUB3eoS2MZHwklEf2DBQvmOs5zXqD734izkLw4rySTiXlLTSRQmKro3tDiMsCG
 pIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DmXl9DvoFiIMYZO3Xai8Zh+D5bFlHeruBJIEw/zNnu0=;
 b=r11suD+eahuDMWEqxit/3RJj7IsExGKGAiemSuF5cQYNZmE44qMPNG0X2COrmdUWFU
 z+i0Fs3f6FT4mf6UR3lSiIiudcWU3A7lwXrZ+XjsiBO9IptyY5Wy1rOz2K3PIZyt/2O/
 Hxudw7Ke/IbrLBKI2JCXFeh4UKVC4fxUGSwpKFobfpk92684t6shBKXCeVY+G9KrZnKe
 zwJDPqUGoLlAR50j1EM5paybBf2A0qX0FyY/Bxn9ISBQzfYtHaZapOP+K/jRJRRFLCL4
 Jr50CClOruZjl8zTTj+jq7v4vs1RQXL54NHZEPr/sEQeGjiRkC2/UUPfpnqKK8MwPbM4
 TGPQ==
X-Gm-Message-State: AOAM530X6LuRt61uKp85KOc5K2ZPngBI7Y4ViqCyD/eLuqVGO9VHpval
 G+A8PwIsavbmVA8mksA+Eh4fz44azCWLGg==
X-Google-Smtp-Source: ABdhPJwvYyBkD2xEHF8IowILMSqf63HVT3Cr2ffWYVwa3F0+ahDV/haTJMyi18SN6OoYumw7dgAGrQ==
X-Received: by 2002:a17:902:968a:b029:11d:6448:1352 with SMTP id
 n10-20020a170902968ab029011d64481352mr16689182plp.59.1627964107957; 
 Mon, 02 Aug 2021 21:15:07 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/55] target/xtensa: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:14:07 -1000
Message-Id: <20210803041443.55452-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c    |  2 +-
 target/xtensa/helper.c | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a0862..41816d91f6 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -195,11 +195,11 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
+    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
-    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index f18ab383fd..a5296399c5 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -242,6 +242,21 @@ void xtensa_cpu_list(void)
     }
 }
 
+void xtensa_cpu_do_unaligned_access(CPUState *cs,
+                                    vaddr addr, MMUAccessType access_type,
+                                    int mmu_idx, uintptr_t retaddr)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+    CPUXtensaState *env = &cpu->env;
+
+    assert(xtensa_option_enabled(env->config,
+                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
+    cpu_restore_state(CPU(cpu), retaddr, true);
+    HELPER(exception_cause_vaddr)(env,
+                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
+                                  addr);
+}
+
 #ifdef CONFIG_USER_ONLY
 
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -263,21 +278,6 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #else /* !CONFIG_USER_ONLY */
 
-void xtensa_cpu_do_unaligned_access(CPUState *cs,
-                                    vaddr addr, MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr)
-{
-    XtensaCPU *cpu = XTENSA_CPU(cs);
-    CPUXtensaState *env = &cpu->env;
-
-    assert(xtensa_option_enabled(env->config,
-                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
-    cpu_restore_state(CPU(cpu), retaddr, true);
-    HELPER(exception_cause_vaddr)(env,
-                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
-                                  addr);
-}
-
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.25.1


