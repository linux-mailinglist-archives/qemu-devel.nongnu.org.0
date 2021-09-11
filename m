Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83BD4079C2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:08:45 +0200 (CEST)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Ue-0007IQ-OF
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IY-0008Nq-IF
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IW-00037n-SM
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so3520689wms.2
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtJq3N+o/FB/vJogkj3xMiVffE8zdE5GfFgTZhZFv9U=;
 b=Jj3pZJubcki583hST9Ml4WiUPpALow/vOMXxn5XAYawBnV40NEe3Lbv3VO8WHQFoE0
 U3yjryoh43IJsIM/bS7c5s60L66lA2xuuSxJOjhaG0Uhkz5ZlTtubZETEanE2Yvh3EpZ
 9Y30oQCi4esU6I9Y91kjPwxw1NWEnKjdkQ62wv9pn6fwUgPGOH2WclrppGrdbsTSSLAP
 kNAqvkXsrDWh0gjy3NPMSo/rcdDA7IjepDbtLQ9ScW+P/uC4oOYDVSjiM8kO02FCjmOZ
 IGWBbDjJ+hV9BbuayjKnBM5097ECxZv24Bn2r2RpPQ4fOFTCoUVxd7S81aUy3xPD8mz7
 nVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UtJq3N+o/FB/vJogkj3xMiVffE8zdE5GfFgTZhZFv9U=;
 b=FvVuFiz1KalUsYU18oyAF8gAyDrVwz5+VJiRaRFvoqKKmI32jtpBybx21YuWQhzCEV
 ClIxzQ3ivhsdJ0xvow+9HL0e4IPYtju07k2osLhG97G+Y29Iq+VMLZ/jDmczwyFXclnq
 rh3gFMxS+wabLxeBfOsy396i7EUjWZs9difWq79DGPjGFrm1Riv7+sqXX5YioH5ni/KQ
 T++wozSGJp0lgLY5/+mYukqIF6YG4Us9XUoQr9SoBk0hk1uQFNrxnAhm77nZoEy2kvUR
 WKaKniUSFme+dmDLm/ca+AhhaDom7wWqbGuslMSVtuXpfbA/ObJjJdRWIdHRk/f1owtl
 8M4Q==
X-Gm-Message-State: AOAM531lKC1E2RBPvtpnbagJSrwUgi0Hrn7Vs2orWXP/kB0BGwZ+7rWz
 04aHd6yij05c61N4mG1IvF7cwT9Ecwg=
X-Google-Smtp-Source: ABdhPJzgG56PUPSFjtbFUA/91RlH06oMeAM8Tni8zC9INHsQ7Grgo4frnIz/HLxRar1Fxxlr5hamWQ==
X-Received: by 2002:a05:600c:4fc8:: with SMTP id
 o8mr3327597wmq.153.1631379371097; 
 Sat, 11 Sep 2021 09:56:11 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q128sm2415301wma.27.2021.09.11.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/24] target/sh4: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sat, 11 Sep 2021 18:54:29 +0200
Message-Id: <20210911165434.531552-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/cpu.h    | 4 ++--
 target/sh4/cpu.c    | 2 +-
 target/sh4/helper.c | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c43440822..017a7702140 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -204,8 +204,6 @@ struct SuperHCPU {
 };
 
 
-void superh_cpu_do_interrupt(CPUState *cpu);
-bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 void sh4_cpu_list(void);
 #if !defined(CONFIG_USER_ONLY)
+void superh_cpu_do_interrupt(CPUState *cpu);
+bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
 uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
                                        hwaddr addr);
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 83269229421..2047742d03c 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
     .io_recompile_replay_branch = superh_io_recompile_replay_branch,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 2d622081e85..53cb9c3b631 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -45,11 +45,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void superh_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
 int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
 {
     /* For user mode, only U0 area is cacheable. */
@@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
     return 0;
 }
 
-#endif
-
 bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.31.1


