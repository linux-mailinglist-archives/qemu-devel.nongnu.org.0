Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0CC3DE4FE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:20:24 +0200 (CEST)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAluh-0008SH-Uo
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpV-0002sM-EY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:01 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpS-000279-T1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id a8so5028374pjk.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTIVNXrj+6ZFES39V3xoSjwTXUTWsIJ8Fp1D3zgJaAU=;
 b=GAD64bG0DYpXtVwLAKRNYg2ewxf/7LmApnIeFkdVinp/Jvef0hCb9O4SDPwN6FZZYd
 ISw5TIOKQ1Cx/k99Ac7uUksDVTVbAxu6Og3nm23RgXFKzC3pacF8uGJO7mbH66WBAifl
 tKXev5YQGWg/8an3ZWESXDIHD/Z1lR5hEeCp0hfsbQZw3Pg3UwN3kalQnOUOvHwVOD/K
 fXbkVKBSP/n87FBcm850HzEoyMfEEUwdxP8mpfhMRkIMqhUyWP3oN0ZjQlP6CydlCs7x
 /kqNKSkx2tLCF4AAkIpRSuEpEufI8JuKuOEXxe/v4zRsfasdPIAHgYyq5smCWhCnlTYg
 x3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTIVNXrj+6ZFES39V3xoSjwTXUTWsIJ8Fp1D3zgJaAU=;
 b=HMTiNE1ebr5EMbSgLpZfcALCdpqTZsqlR9EcWz0bqkKB63K0ZcNCuE/0s01WiWkfUB
 EtInmbzJ/CFCvlnUw7KIa3oKkBryxbC9Gm1MeAgCvxT15A+GfftIBwV0SMrpcjFEc0E3
 cGzBMRDOpq/6Ik+eJ5CnkNEFa1NInCSt5hd1iT8ZLzRcXwIyYH/9pgq2dQ9Yo9lkj4FG
 W1+u72Dp2SqcYV/KlHNqXa0PyGKVWVBeA9xCg7YjJuzyijBqpEdCJXTQtjHHQKQD3Rie
 8emcdv6sK0SMhbOMbv1p9zWvVHv+gOC69tmttferwZbSNtoNdGKftt2vbSo7nwBtKfAP
 5fog==
X-Gm-Message-State: AOAM533WQSsp0ufW4XHRDKQBiFr4omVYdFe7VNc50OibDcRu4B6Q3NmC
 wPj4+rCLSgCmQTcBvpwGMQMu/bEPTSj1XA==
X-Google-Smtp-Source: ABdhPJz3M9RXiZ2xuxx9+UIbvhuJDGF1pedAijqUdpQl/yrWtSCwlPRY2d+ovbnHcDnzMPIqZVnUww==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr2371779pjt.136.1627964097611; 
 Mon, 02 Aug 2021 21:14:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/55] target/ppc: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:13:58 -1000
Message-Id: <20210803041443.55452-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For simplicity on the linux-user side, always use SPR_DAR.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 2 +-
 target/ppc/cpu_init.c     | 2 +-
 target/ppc/excp_helper.c  | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed..d72d30248b 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -165,7 +165,7 @@ void cpu_loop(CPUPPCState *env)
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
             info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
+            info._sifields._sigfault._addr = env->spr[SPR_DAR];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 505a0ed6ac..84fb6bbb83 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,12 +9014,12 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
   .cpu_exec_exit = ppc_cpu_exec_exit,
-  .do_unaligned_access = ppc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d7743704ac..08cc474340 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1505,6 +1505,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     CPUPPCState *env = cs->env_ptr;
 
     switch (env->mmu_model) {
+#ifndef CONFIG_USER_ONLY
     case POWERPC_MMU_SOFT_4xx:
     case POWERPC_MMU_SOFT_4xx_Z:
         env->spr[SPR_40x_DEAR] = vaddr;
@@ -1513,6 +1514,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     case POWERPC_MMU_BOOKE206:
         env->spr[SPR_BOOKE_DEAR] = vaddr;
         break;
+#endif
     default:
         env->spr[SPR_DAR] = vaddr;
         break;
-- 
2.25.1


