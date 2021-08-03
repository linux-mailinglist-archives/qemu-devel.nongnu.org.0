Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837753DE4FF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:20:26 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAluj-00008l-JA
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpO-0002Ul-KY
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:54 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpM-00021v-Vc
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id t3so20040681plg.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GrnFfe3XZWQ/v3xZFNHfdt/tJ293p7Ty8+O34eyaj8M=;
 b=fOd/uIDMZ+Qibk9XR40SBhFgpMV6pNghPYt5XOLScSuy5aDeNkswheNO00dhcKoiOF
 23vayA8Dno6iUlWuA0x3TRgV7qjmM5BPcyGG/jrmWJ6XFEI13w57qPbcS3RqhlBfs8M0
 0tK61Mqr14/gFM00ntGPQ9zIfn+zCp8Jrr1OV7mayQI6SytyH10kyAAukQJL0tjK04qA
 WqK2Enwj9F0IA4tPREX3k65dUD1MaRdb0YSCC68VO5vVGU33010ZsW6Rt+5gkA/Lqaw9
 xi2LegKQdIxrghtP5WKh1MfjDMQbw/fGsZAcy5kKt2sg7coB5wWKf1JYDuZx5BGvGEl2
 /fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrnFfe3XZWQ/v3xZFNHfdt/tJ293p7Ty8+O34eyaj8M=;
 b=pg/VpoVPM37AlWSweyR++HAxqoQmvSDC6D/PSoBh5odiSBKerDzNl5XCsrdhWa7nGv
 7Uwkq7gjdGNaeP0ZWNgpMaUTkFCyyR4omidsIsYzPR0VGTG4gGhAMNaatu/ZyNHNcu5/
 MW3Met0P9BZBSTg2CiDyqdWYXFvhap/PAdieiGGY6wWqiZDvyprPmqumdYpJeJIEgd6b
 SGzpOA+AvilHZwnonmvgHYujGUMpmqdFAPAdzIFogJQkGpdlsdSSEaXliaweDg19AdG/
 8fkTB1N0ZXyiQHGfRYZTPpPM2q2vLi3ViKfucuftNSOuwDaTbiDfwfd6qcTtraqaZI3A
 +/MQ==
X-Gm-Message-State: AOAM531da1F+md8yoxIWnCovtXPopOiWxLRZ52HPAF1P0Sr4PxyA9w4a
 iE+3O8CZEZq6I5S64zGzzMBGuiPepyBQgA==
X-Google-Smtp-Source: ABdhPJwNImWCYindhtO/0TweYCjNNHwXkhX2H/jilEJV97nDOAyFA/wQ9gWWQ7MNRIDndSrb8UiAuA==
X-Received: by 2002:a63:7405:: with SMTP id p5mr616pgc.426.1627964091761;
 Mon, 02 Aug 2021 21:14:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/55] target/hppa: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:13:53 -1000
Message-Id: <20210803041443.55452-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


