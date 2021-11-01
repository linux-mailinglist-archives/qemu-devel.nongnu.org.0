Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1C441FE5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:19:22 +0100 (CET)
Received: from localhost ([::1]:57258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbtx-0006ZI-9e
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9D-000815-S1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:03 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9B-0001DC-Ku
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:03 -0400
Received: by mail-qt1-x829.google.com with SMTP id t40so16520287qtc.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2Pwh8dMK2GW2V5gEng3hQsybzKfwzmJDjUzbvltEB4=;
 b=Gr+Wnx8CrjT/aQVQwdaRjnwHO2QJkZAeGv7ZDZkm8KceV2rYdMfV9ydG/Dw3gg5gGs
 9cerUNKSDelv2h7lK3xlPQwsh80WEUfecmG1tZiWPI1jFs6bry6k5s6IuhbVGg4tFrgk
 9QYE00dY5QUtzfTsl8O6h98rTipO7agk4sSQa8aJGJK+vWMbIOWWD2qJ3gWj7a2uegl6
 qZaKWxpKK6tFjqegv3nW0A9S//4BnnDsh+lIZgek/POOdSLbGVqXq5QKs8kwS+G1j2VW
 9sSGJ9xdYa7OLgiL18zX4Y+yo2Dm+05GywGNqh1DqnlmiiYhE1rfETLVNirv4TUeTdq6
 ejHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2Pwh8dMK2GW2V5gEng3hQsybzKfwzmJDjUzbvltEB4=;
 b=m4RJ6MCUpscf8R4hqzC8RRIXxV6NQ1dsd+7xifDwHn71C/3816WjxagOVT8j1ArijJ
 8e9H5PTmcxGXmgZsOTJ/TAlwKHsP8m36HkJ0Ndy+kJVOmr9RdNaMJUJiIPVHJSrDwjzb
 A6o1U4haq4YoBFG/jxBnIHNRj5hf6A015eyjhSIJMvDOyzg9eWAzlbx8WYbF3nad7rcN
 rDwvMst3aqY1q/im2UvFsYRa6Ltw3GKO8FR4kLYtUywtfPX4yFJM6/5HiE2G7Wpvk0u7
 5SSGxnc6BOEj7BRKocIS/PYLbBBY6i3Uw2ouVcoUwrwvNYahkm8I0IpcunJm8m76g1Ce
 QdXA==
X-Gm-Message-State: AOAM533iNlOzlwlzHNVY0O37swa4kqleuXEqOMCcpFT1FVAFP7tkQLAO
 HjOnw47z9N8mYfPWEwAtP8EAd/8C1Hxq4A==
X-Google-Smtp-Source: ABdhPJxxyT4GC2suEnn3JsQL5kTNhIFoGC3+QHK/vpgpzusWyyfheqW8esyAOF+s/CgmIZe6cVDnmQ==
X-Received: by 2002:a05:622a:1342:: with SMTP id
 w2mr30549547qtk.39.1635787860720; 
 Mon, 01 Nov 2021 10:31:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 50/60] target/ppc: Restrict ppc_cpu_do_unaligned_access to
 sysemu
Date: Mon,  1 Nov 2021 13:27:19 -0400
Message-Id: <20211101172729.23149-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
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


