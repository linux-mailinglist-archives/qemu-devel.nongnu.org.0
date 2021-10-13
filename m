Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3642B2EB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:52:56 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUNz-0002ap-CE
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHe-0004JA-4w
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHc-0004pl-EH
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so1111692pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=edXkrbkqOm07djX1rJHm1DMaa+Lm/qwNrJ4BGEQSsuM=;
 b=LdpsrxsUcEBh5MddBiZ905TonRBRUc+uMkvAYos9/VsyB8cvnYeUuL6wDmecfSPBBk
 ocK8ZejOhq8iG7bBZfoV6HGg0z7ldf3ln2arZRFEVZVFAMCrAR/oiox+vTrklcEt13XI
 bQ/vbdwlwWWw+5ZT5sOzac7c/r4H5oddw4q0R5Z7qZr3U0oESPqcpvvXUVGeEewCYcSU
 l7QNcLIK1YQkXOkWtkq8vC/DzDV7aASZEJVoRdPalcUhQsKT650VwoYqPqLGlUYvXo1w
 MfHlOcdxXc+ImFzVEIaoER1mqSwwZ/LkqXFPZb2wDSi6FCVmETuxEUepmMaEjku8otFP
 nD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edXkrbkqOm07djX1rJHm1DMaa+Lm/qwNrJ4BGEQSsuM=;
 b=krK78xp0+mRQIgkIW1+70nS44xqZLYomO0EKc5KeB9G+cnCQdfZI4MYciKs+HV5hPi
 7PGZ0HIn5HUiyrO1BCpd/Gswr3ZvC5D6SMlFDxsqbRWQERY6pbCf8RL1SdRB6fMkFW0Q
 JEU9vpuVw3Hy1LElmzV/LMu/556l2buxBmcZlu6aUta7Wfl2NJUGjhoV3ePMJnRieF7B
 AqgQLYE4s2Lw9AC2ZVVSBbD13uAjcysyCOsRbTPWww2nthRR55raAVJ0GkrOZxwDT0t7
 vi+kPBEGgXHx7PfepNPavW68jF2ILkb/ZozjkcDMtTkU/dDEa8bonQIIjZsxWORxYIey
 wdHg==
X-Gm-Message-State: AOAM533/3wP20OljJRmJtWIB9bifCdsFmcYeBCj/7JgcedcQ9V91fi2L
 bo7jfaudiYc7Vugk09BaqIg9LCpwKjHabA==
X-Google-Smtp-Source: ABdhPJwUpkeF4FazX1w7Cv2wfjissgUfk6wptOLcLLNu+AiQ05Q25Yepa6DVwY1kxbk1L8lXubBOQg==
X-Received: by 2002:a17:90a:c081:: with SMTP id
 o1mr10643717pjs.24.1634093178858; 
 Tue, 12 Oct 2021 19:46:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/48] target/ppc: Restrict ppc_cpu_do_unaligned_access to
 sysemu
Date: Tue, 12 Oct 2021 19:45:28 -0700
Message-Id: <20211013024607.731881-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not used by, nor required by, user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/internal.h    | 8 +++-----
 target/ppc/excp_helper.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 339974b7d8..6aa9484f34 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -211,11 +211,6 @@ void helper_compute_fprf_float16(CPUPPCState *env, float16 arg);
 void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);
 void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
 
-/* Raise a data fault alignment exception for the specified virtual address */
-void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                 MMUAccessType access_type, int mmu_idx,
-                                 uintptr_t retaddr) QEMU_NORETURN;
-
 /* translate.c */
 
 int ppc_fixup_cpu(PowerPCCPU *cpu);
@@ -291,6 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
+void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                 MMUAccessType access_type, int mmu_idx,
+                                 uintptr_t retaddr) QEMU_NORETURN;
 #endif
 
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e568a54536..17607adbe4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1454,11 +1454,8 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
 
     book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
 }
-#endif
-#endif /* CONFIG_TCG */
-#endif
+#endif /* TARGET_PPC64 */
 
-#ifdef CONFIG_TCG
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr)
@@ -1483,4 +1480,5 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     env->error_code = 0;
     cpu_loop_exit_restore(cs, retaddr);
 }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


