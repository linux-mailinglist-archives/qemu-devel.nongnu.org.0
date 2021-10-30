Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070A440AF7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:24:26 +0200 (CEST)
Received: from localhost ([::1]:36120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgt1k-00052i-A2
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1s-0001UX-6O
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:28 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1o-0002CG-3k
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:26 -0400
Received: by mail-pf1-x433.google.com with SMTP id m26so12324323pff.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2Pwh8dMK2GW2V5gEng3hQsybzKfwzmJDjUzbvltEB4=;
 b=nqrF955v9kb7EQxVqymq9d1/c8X+v7cVJQSpwUXgu73Vozq4D+PfC+T9P/SktMWf94
 sHeDyWGYE045aJO3JpAmQCp8MAOC/4UzfxdHZFHrHmeemht8Uf6+bGYFI5H4aNMJV10E
 tt3vazMguDgzRXwByvw2u5wcGgNoA9GmYMNRPNjuFiLXclBrgGFj1CoAIeD66R9kj2Df
 zT2bWBvgBdJAui1IJet3KUDjN47Pkh10Te3lHu9yL9SLfd+0UDMxF8FUb/sA13NK8q7K
 CBYvUOPzCxAdHRfZBqmmAY6APfXIfC/qoiMbCT1/+XA7GUJWghXrNNlyBc4I0bvCcCsZ
 wTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2Pwh8dMK2GW2V5gEng3hQsybzKfwzmJDjUzbvltEB4=;
 b=K+CRg1wrDKQr+haatITe1CrQ8EDNRHVC12Sn4GProODGTBC56jRBdIvUC7t8ZG7n5Z
 HlSO50zFkfCa/GxjygXt6CVkZfsoTPefyECltiMNm51Onohsz5/CEq4OaPgif8eQGYo0
 332Pfb9CEHZXJHt3eoFjPdt0pbVImgwGQVVdpW7PuPxKQA1+C8XZh9RkrlKReu3bpS81
 Qe2+xUVUrB1mHTuq7+oWCIWEYy4wbY269wWfCiCel8Cb1aX1w01bTaSl+D94yojrcsLv
 fhIxsjef9lJC5RqH1yXbbVmdjs0YS9+VPUDG0A2bD1PtUAxKAJt7ga4p3mBnCwe8BUcV
 GF3g==
X-Gm-Message-State: AOAM533Sy3d7GTgMK+Cw2SPExVSxzKRjN3ZlUlzZYCzG2xHnmgUkRiV2
 Me6t8aOXJ6Hpe8526I4aBbD2M7ofMJ+KiA==
X-Google-Smtp-Source: ABdhPJxzjWx7hiKOGnVuE6bUVBsTA2Q/WpwedKbN7Ix9wE1wqetW8a3SYpwwiRdsMSxQflrkOyvSJg==
X-Received: by 2002:a63:b519:: with SMTP id y25mr13535863pge.237.1635614422858; 
 Sat, 30 Oct 2021 10:20:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 50/66] target/ppc: Restrict ppc_cpu_do_unaligned_access to
 sysemu
Date: Sat, 30 Oct 2021 10:16:19 -0700
Message-Id: <20211030171635.1689530-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not used by, nor required by, user-only.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


