Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7938817B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:37:39 +0200 (CEST)
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6TC-0000Wj-7n
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64n-0001P4-4a
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:25 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:44709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64b-0006O2-EB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:24 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so9748212otp.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=erERm2mmVaEtH9AdU8K/vbETws9BWMudx/m/0BInVk4=;
 b=z2rVvZiwb8ZckT2cEuGl5UKL1BX3fRF2reYEFJ1MSMiSMipThNLfx+LBejW2oyP8VL
 OOtVZcWIFq6/Rx9HrpUSsAw9oabWJ1A6mUASpyHm4SnZZYCaWviU51fwG1g/WdjbGBUT
 n84B4Z7SWab+FbXqeu1mWkduohJ0jddHC/GsD1R+/JyFcejLH+Nnv4tyqx/Sy9wOJBrj
 sLLnumnTu73jtQmAq1uiejGfLxHKPyPW1Nf+LrKPfYgcMO2b3e58k4EM5saPO8GDFOm0
 3Av2zmLHxikkmzOLLlFP9RRZW7FRgNu7JqEx29k2VPLwj+HNy3cROMndZm5DJS3JoMU2
 ESyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=erERm2mmVaEtH9AdU8K/vbETws9BWMudx/m/0BInVk4=;
 b=U/piN+FJ8FKhvIsiIYZh2rtG5bQQ2rp6OdXZZfgJr+9L85oky4SfLTEM/c5c3I0YXQ
 pFx6IO7odWhleF/Gqsjbs9Hcmfwjj549bd1fcPn6JlxOTmVEeYT4y/Tk3CZYKOHhNrJr
 LmTXLQUq1yEmQfKAySBrr+T/ELNjqf+MR9lPo4rFi3er4pGVZs3NK1Tp7+oYUXHPzNqD
 LM6gdLR+B11Kx95bqiztdf/1p4gIuBb9gBZbw1lWL4wrgujmOfjCWyfv/ugXFoouj2NT
 yARkNt8e6nJx5zqbVuM3BRZVifrSDFUWk9mJL5BO+yME2acDjvytAzs0FKGrDkRnps/E
 I/iA==
X-Gm-Message-State: AOAM532sh9mYu3Z6+v48n7tDC1Fwv6XOsCRvkHRdSWxoxM6k5w0Xt9OE
 c6Ozxsp1s84uMxp6BuR39/b/bYGCu+FBoVtC
X-Google-Smtp-Source: ABdhPJxlRgan+7KrSU9k8GqV8QoLIuOsdC9eWkk4/6GzaNeLVEtCnbtEIJ9KV9QJuYPOlMGImMMTKA==
X-Received: by 2002:a9d:664c:: with SMTP id q12mr5742668otm.76.1621368732204; 
 Tue, 18 May 2021 13:12:12 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/24] target/ppc: Restrict ppc_cpu_tlb_fill to TCG
Date: Tue, 18 May 2021 15:11:46 -0500
Message-Id: <20210518201146.794854-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is used by TCGCPUOps, and is thus TCG specific.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2535ea1836..78e6f7496b 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2964,6 +2964,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return -1;
 }
 
+#ifdef CONFIG_TCG
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
@@ -2984,3 +2985,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
     raise_exception_err_ra(&cpu->env, cs->exception_index,
                            cpu->env.error_code, retaddr);
 }
+#endif
-- 
2.25.1


