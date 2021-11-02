Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9498442D48
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:55:34 +0100 (CET)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsO5-0001vY-QS
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhC-0001WY-Js
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:14 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhA-0001yy-IE
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:14 -0400
Received: by mail-qk1-x730.google.com with SMTP id bm28so4109950qkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2Pwh8dMK2GW2V5gEng3hQsybzKfwzmJDjUzbvltEB4=;
 b=KII20b0pklCDDjD92u60TiexbynYMZ1rJ567JVBsIMO3qgR9eNIoYa3pIxI2E+8Cy/
 xOX3xlScbAGmR1XFsx2+KeJc577MRi2gchH3SCxiXdCXlyPlrOfZak3z/ov7xIl1GxMN
 QHo2tR+A4vPuGky7BGMjLeY0dnqiSGAIqiNLMSxpQIAAPYmYjiWBIl838DLTx+aJ6VuA
 0PRHLEYHadH5u5IGndZ9/qwRilDajhqxQbRHzgOo2JkglBjLtc+ZerN2cXXauZCbgALt
 zqegLreuRW2GW4ZBuaMV2jiki4Q2lp1OFSKfLrachFLEmcifwC7NBuCTOXKRFhxwU+cd
 wyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2Pwh8dMK2GW2V5gEng3hQsybzKfwzmJDjUzbvltEB4=;
 b=Kp7xHMbUa4X9tb40oHVF6s/p+MP3MsB6OAtEj/eiNmyvtz8sefxY744raKNMaXzu4U
 Fm0oyLxf1QaRFPGaMsxeLfUznmJ4kCPomD6iVukIiB8zN13vWqtO2cFAxUzEz7/Kiypu
 zPnoNMIax1XHqv5AZtu3VpbZ3Nqou++5Tg0K7Ysu7LxzEV2ULh8jVRMHYVE2pAci2ccL
 7TwLc4C9kcCwKTe9UY91uSNDjaW0VmeP6w2XO8uDE101BOg73E1koVxE6SmB2wc/VYXd
 fzFSONxwixrUQW0FG4IWHVbXwzAaCHU3TTx/UkEcaLfIjFhQaud2ZNmrK8ozdxH3OjhL
 ajSg==
X-Gm-Message-State: AOAM531YVfpLyUIDAH1m9KFqYzAAUtqRLelHj537RVGkgnWo3Qoi4STW
 jENIIi34oOl5xtw1JUC/zG1Z1h8YlOt/0A==
X-Google-Smtp-Source: ABdhPJyjtI+oH1eWqAYedfrPz6+vAx4nGHt+apGROHEfpv+WC+zyM+tLeI+DhzXJXbIp6Wy/hvdONw==
X-Received: by 2002:ae9:f405:: with SMTP id y5mr442152qkl.233.1635851471394;
 Tue, 02 Nov 2021 04:11:11 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/60] target/ppc: Restrict ppc_cpu_do_unaligned_access to
 sysemu
Date: Tue,  2 Nov 2021 07:07:30 -0400
Message-Id: <20211102110740.215699-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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


