Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27F352672
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 07:41:26 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSCYf-0006wx-8R
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 01:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCV6-0004VQ-1q
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:37:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCUw-0004TF-U6
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:37:43 -0400
Received: by mail-pf1-x432.google.com with SMTP id c17so2955136pfn.6
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=bm476dv5KmFGLLJFdhch7hk+g9TYdW9A5BNUlZCiZ7+UHaOOtAHBDEEIiVGTuLGGcz
 O0pRBis38KND8+hNcrMayxBpZlM/2Kz1mnkL7u9xVrdWwm/hVnFPVHFS0H5K5s7TNNP3
 iNEPErcyhIf36QI2DEzOZnmzWoEvHuCtO80DfVEWaVPg0dX8ziXn+FIegAXRUR2NJzLb
 tG5glWzkA27S5gdw2bGvKUFOiuGFxL/Eo015HhSe9q5OttJvlCS/Atlj9FgNeyQf0ec5
 DlousngIrrPdER0XSqMTRonJeTLnKnE9GurDQbIqS/mPhJ4+yU1ARu0ywZFQAft+RU2b
 ksnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=YQ66rOn3BUCgLtstQK7S4F0ZKHtPbpVKQ3lU4nmfNuxS4c0NSSXRZd4VznBWhzwUlw
 qGKwaUr6LWj5PObPa0O3HToo+BXljYvghyGT3Ag6sWqLkK9FTKAtyrYKiFkep3TP//On
 EueyzSIE8W9iYlqO82LKMU73/zsgF7GdYVtP/8/nJovdqBcLWMNS4cj49T5Jhzgi8g08
 W3zetyRP+M5/Hi0950t5WlAArdtI6/5T8+hS3dMzVf0AColbrz8903t8yG5LOslrmB2M
 4lfqs7w+tjGdTiGt4Lp9Svofdbg/NxGk5bfJK7eN5Z1ePvFJuFrppn+0PD//EYan0SVY
 CyKA==
X-Gm-Message-State: AOAM531FjF7xrKgCe26Mo1Y7ZbGignl+2hEGFjfrCpMRJdPBMiZUSeRa
 e9aXtXlnWYOvpDTInYSM/ac1vyPvRq2xjw==
X-Google-Smtp-Source: ABdhPJy7sbg7K1v/FL1HrKspl9gyUCi6C6tDHX9kJf+5e5EcL5lCIN3I7i+HoevdKePA6XYPTZ6Pig==
X-Received: by 2002:a63:f247:: with SMTP id d7mr10250009pgk.112.1617341853100; 
 Thu, 01 Apr 2021 22:37:33 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g10sm6908074pgh.36.2021.04.01.22.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 22:37:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Thu,  1 Apr 2021 22:37:27 -0700
Message-Id: <20210402053728.265173-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402053728.265173-1-richard.henderson@linaro.org>
References: <20210402053728.265173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can remove PAGE_WRITE when (internally) marking a page
read-only because it contains translated code.

This can be triggered by tests/tcg/aarch64/bti-2, after
having serviced SIGILL trampolines on the stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 0bbb9ec346..8be17e1b70 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -83,7 +83,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uint8_t *tags;
     uintptr_t index;
 
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
         /* SIGSEGV */
         arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
                          ptr_mmu_idx, false, ra);
-- 
2.25.1


