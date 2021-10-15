Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DA42E7FD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:43:32 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF47-0000ZB-7c
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcA-0006me-Gj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:38 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc8-0002ry-R0
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so2155610pjd.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=edXkrbkqOm07djX1rJHm1DMaa+Lm/qwNrJ4BGEQSsuM=;
 b=DcsIbhOXtOpJQ3sIQFiwPPcqKUYVCuprF4dE7U9AHVOCI0PEqoTiq9cI+fRA7VRPyL
 erZXJaGP56aDLBtw6xdo2/v5dfF4eB9WSzVnWlj/VBhPbm7ghWg3FhUdZQmWr7EzPVV8
 z5r/va21f+jI8T73I+Y4V1VdW8CWbeCo9Pw2cjdpTUMJ/2pPRh35olV3FE/0Mcd0NM3A
 ObaSCOvxmKVR4afzm63HbzDqNx7iYxkGYNU8JhpgH4mrV6sQEdNt7iEkJ+dQD1Mej0xL
 t1tSs4YhfLLPt/exgiAbnp6YCN9RvkXRIt3yGd3LKKxOtRDjm9rMh5/vymJsUvId/TMs
 cJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edXkrbkqOm07djX1rJHm1DMaa+Lm/qwNrJ4BGEQSsuM=;
 b=a9BQpWG2MDTUw9dzITvCKO+xZ3sNII+dVkyka6kVPbAplu1czfT4wUgtqkadFesFVK
 0O0h/shO0LDJLSm4S6i+kaAK1X3z371hDSUofx+DxWlH01/X9+TmHtv79cJoMK6vqo8I
 PI3AOvDJY6sZ/XueyqO0GwyWaweTYoWrxlcBpzuueFij7Tuuvqqn2PT6Oj2deL8eEwXx
 4zIVDx/RC9TKL7+qai+qORwOgibseNk22cpr8RV7gEVpLwqBfukEAiQDJehFDZTQd+mn
 URIHuoxNDtttKAIyQwQaMwUbBQAtcBv1lZ0ixh4QffsyMiAPSQcQzHA8b5u3Mb6xCYtk
 RdYw==
X-Gm-Message-State: AOAM530yYgbx4gL+TOL3exiHSDrRFUHedmRBrw0o4Krn3GSM6YPZc8vJ
 JRYvMBuL2LhEoJqqdxpAG3CTRYByXqxecg==
X-Google-Smtp-Source: ABdhPJxROBuU8cAY4qr9jjynrs0CUoqv6kqMdXHCSQ0HV6Ijr+gR9FfImjtVXxfuv2mY1zEDwQOU1Q==
X-Received: by 2002:a17:90a:fa91:: with SMTP id
 cu17mr8127896pjb.91.1634271275654; 
 Thu, 14 Oct 2021 21:14:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 51/67] target/ppc: Restrict ppc_cpu_do_unaligned_access to
 sysemu
Date: Thu, 14 Oct 2021 21:10:37 -0700
Message-Id: <20211015041053.2769193-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
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


