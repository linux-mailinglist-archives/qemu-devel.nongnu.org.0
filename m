Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C85A3F0BAF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:22:27 +0200 (CEST)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGR8s-0003BC-AM
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR69-0000AH-1l
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:37 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR64-0008MX-Ee
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:36 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k24so3304236pgh.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GrnFfe3XZWQ/v3xZFNHfdt/tJ293p7Ty8+O34eyaj8M=;
 b=zXIA/w/+TcC+kT2E1E8PsDbkB0DPRlcWiISwuoBSMkWT66Ag86iE66+JOwRYnnogGa
 RO6kBbF7ksJ2Eq2Zo/bvFYX5k5rlhcibfz+A1M+KZgOZ/UVj67YTZnHFMngamtmoswxp
 j7ykjnIoh8n9fxD7LRcOnRZaNocWHz1ya5le/pqXkBEjQl0lVUDiZ7N/L+Q6B8k5ewdZ
 BNXc/5npxAvSul3tKtb+NX207da1KR5jEbStKR9j9ui0GGPZ8H9JDriAqgFwY0ZIkq4e
 t/BB3D+F/Xq075AV6Vikcr37E81PkK8x/aBdO3XLUGOLJYN2C67N4qFtQiKvjdcrxqNt
 ncTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrnFfe3XZWQ/v3xZFNHfdt/tJ293p7Ty8+O34eyaj8M=;
 b=FITugldXNZXWZnvMyMXZU+kg0+b+voEx94Qtspcz1R8mYBAN4oTPYXxgTsSvVrdKlJ
 r3FRWjcbyX4aZXkt0TNvKs3CHjT9Tv4g5mun//EuIugFsX/E5aZQP9UpBuyCC4gCYUzS
 VsyvmvK2Yw5OpUrzpWA1xqxpS6bncq5r7irQp+RL2Tn9jWXtLdIaN+wgftLNdGFOavEJ
 WmUV7Ws+dlBXnu+HbJAGCQGSXfAXCbH7VZgk4dA9wne6G1RBx/1aMGX9F9e5Hz/PPxzH
 PdBUr9isN/xDsxSKP8HhJKO7d7vVAXC5ne7PQ4c8/VLnEFZrjNLRj3+ha5gNGzAMnyj8
 JOVQ==
X-Gm-Message-State: AOAM532SPcMNGhb2FEwA+FYocsjODNdg7W4zrGIen6cEukEe3lkERp6M
 wbtkABpLAV/OpdWYh279kPcp6lYdJiQdSA==
X-Google-Smtp-Source: ABdhPJz9no5QRJW1mdSvvGTWsLBEMCyLmPiLgpl5HE4W/KAFcdmBTqSbMpSUnht/HOCzrPl6WUJQDQ==
X-Received: by 2002:a63:4e65:: with SMTP id o37mr10304345pgl.202.1629314371119; 
 Wed, 18 Aug 2021 12:19:31 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/66] target/hppa: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:20 -1000
Message-Id: <20210818191920.390759-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 2 +-
 target/hppa/cpu.c          | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 82d8183821..5ce30fec8b 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -161,7 +161,7 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_UNALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
-            info.si_code = 0;
+            info.si_code = TARGET_BUS_ADRALN;
             info._sifields._sigfault._addr = env->cr[CR_IOR];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index c2c56e7635..91f149ed77 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -71,7 +71,6 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
     info->print_insn = print_insn_hppa;
 }
 
-#ifndef CONFIG_USER_ONLY
 static void QEMU_NORETURN
 hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                              MMUAccessType access_type, int mmu_idx,
@@ -81,15 +80,19 @@ hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUHPPAState *env = &cpu->env;
 
     cs->exception_index = EXCP_UNALIGN;
+#ifdef CONFIG_USER_ONLY
+    /* Recall that user-only always uses address space 0. */
+    env->cr[CR_IOR] = addr;
+#else
     if (env->psw & PSW_Q) {
         /* ??? Needs tweaking for hppa64.  */
         env->cr[CR_IOR] = addr;
         env->cr[CR_ISR] = addr >> 32;
     }
+#endif
 
     cpu_loop_exit_restore(cs, retaddr);
 }
-#endif /* CONFIG_USER_ONLY */
 
 static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -147,10 +150,10 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .tlb_fill = hppa_cpu_tlb_fill,
+    .do_unaligned_access = hppa_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = hppa_cpu_do_interrupt,
-    .do_unaligned_access = hppa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.25.1


