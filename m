Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49EF6F522B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:47:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6to-0005JC-31; Wed, 03 May 2023 03:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0004PW-UQ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tR-0005bn-0l
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso872635f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098836; x=1685690836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOi9gtk6KXDfIe8VH2DgkX1Z9AQ37ZzD4xifhpb6EwU=;
 b=J6HJnOOo0q/QMg/M7h0v/Qe8Efq7O0WqJ6yPo5Q4tPZaQIf/kvogPtcmAU8YES8x6a
 1xQuWKzkvWv04wwxbqEPfFCL1PTn6dvRT+6kTHKY5I3FcYcSKGvnGmsjvkTFyXIRj0lk
 ZzZNDJqx+bW7GCccPpzasTFEDJ9sFwlgAwfP7y0pQ6jzWb1tUJt4tJxibRXxJ68GDvhm
 wa+P+b4iCkaBSYWikPelWWUtf0njbF8D2RmdHMM7lCeDghZNo3Nw2LxEBLynBSxsVHEa
 VMeA9uPnEM7idHxzaTqdrzuyHvzclpdTl13REU44T9KQR9O7CxNfZNKPib0V0bLvGJsI
 G5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098836; x=1685690836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOi9gtk6KXDfIe8VH2DgkX1Z9AQ37ZzD4xifhpb6EwU=;
 b=awEQrIyvd4SS4vtojgcg/R2lcY7Be/6hYs8epCuAkCxWMke7oa0v7ToJZf71uyOPgf
 Z+p6CPlDhkSphNBCPwWWndXDvJIo/WVe+VdW1dEBmVDRAd52DF3n7iYj5zZNgUzucZq+
 Lp9D2rwSXFLJ9meiXXYCMWK53tNBBtmmDLVduip9i3Q/SYK7D8ZWBbh3iUzdEsKQGfK6
 lj8SxJzohu0uCxPetPAQrLsVZj0/AfP9zEIEQH0Vwd7vUWfVYIcHk6UWBiHeuTGvXQZA
 v4BK6DdeY7MLrqAc7kKtQ8W8LdFSIjtMw4XgPifPd7YSyJnnLW4wIeRGnR/q5vvqV+IL
 77UQ==
X-Gm-Message-State: AC+VfDzRxiLYr11KC3z7Gu6kQOKSYf1TWb+peqFcWeTZUthNNESt2l7A
 bREAmULUmFjEKPORO0M8xRKP3oYqI1mFHEVMfvEPHg==
X-Google-Smtp-Source: ACHHUZ7xCPxCDYs7j+Yswag5U0hzG2Qn5YiO5OgKAY5P0mUeF6Yrr+icV1WGmtn7qicXor6fmg8HcA==
X-Received: by 2002:adf:f984:0:b0:306:2b83:2d32 with SMTP id
 f4-20020adff984000000b003062b832d32mr7535402wrr.43.1683098836061; 
 Wed, 03 May 2023 00:27:16 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 58/84] tcg: Remove NO_CPU_IO_DEFS
Date: Wed,  3 May 2023 08:23:05 +0100
Message-Id: <20230503072331.1747057-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From this remove, it's no longer clear what this is attempting
to protect.  The last time a use of this define was added to
the source tree, as opposed to merely moved around, was 2008.
There have been many cleanups since that time and this is
no longer required for the build to succeed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h          | 2 --
 target/sparc/cpu.h        | 2 --
 accel/tcg/translate-all.c | 1 -
 tcg/tcg.c                 | 6 ------
 4 files changed, 11 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..395b1c1cdf 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1395,7 +1395,6 @@ void ppc_store_msr(CPUPPCState *env, target_ulong value);
 void ppc_cpu_list(void);
 
 /* Time-base and decrementer management */
-#ifndef NO_CPU_IO_DEFS
 uint64_t cpu_ppc_load_tbl(CPUPPCState *env);
 uint32_t cpu_ppc_load_tbu(CPUPPCState *env);
 void cpu_ppc_store_tbu(CPUPPCState *env, uint32_t value);
@@ -1436,7 +1435,6 @@ int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
 hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
                                         ppcmas_tlb_t *tlb);
 #endif
-#endif
 
 void ppc_store_fpscr(CPUPPCState *env, target_ulong val);
 void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index fb98843dad..3d090e8278 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -581,7 +581,6 @@ G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                               uintptr_t retaddr);
 G_NORETURN void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t);
 
-#ifndef NO_CPU_IO_DEFS
 /* cpu_init.c */
 void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu);
 void sparc_cpu_list(void);
@@ -637,7 +636,6 @@ static inline int tlb_compare_context(const SparcTLBEntry *tlb,
     return compare_masked(context, tlb->tag, MMU_CONTEXT_MASK);
 }
 
-#endif
 #endif
 
 /* cpu-exec.c */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 181f276b18..347768b979 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 
-#define NO_CPU_IO_DEFS
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 53540e4237..916c143323 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -37,12 +37,6 @@
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
 #include "qemu/timer.h"
-
-/* Note: the long term plan is to reduce the dependencies on the QEMU
-   CPU definitions. Currently they are used for qemu_ld/st
-   instructions */
-#define NO_CPU_IO_DEFS
-
 #include "exec/exec-all.h"
 #include "exec/tlb-common.h"
 #include "tcg/tcg-op-common.h"
-- 
2.34.1


