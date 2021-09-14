Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A040A1E4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:27:18 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwIA-00056d-0b
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6X-0001mo-QZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:22 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6R-0007hp-VF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:17 -0400
Received: by mail-pl1-x634.google.com with SMTP id d18so6970141pll.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7H3s9naaE5Pm4o1Tcyi1dehPa7k9YSZMkc4DsTx2LCk=;
 b=RO5Uw6tdnNDFAVhOIAe0wkHWAaCIreZGXcgWZzOc6iolZSkqp9ddu1j3+Z03Ojt5Oh
 o/X5QTWtKMKzf3eQWzsSNWbH0pdxJ9h0n4/ABztoL8zzggXon14W5TSUOhcgnNncXSoZ
 ZzmhfgLXXF25Ukn4w6w02tPDh5Sp9P4rcXLl/BNtXJHNfxSvQ0NuEx01A1GN3CLJY7y8
 92sYLszucCzjJKJ3SclVrTRRLzPzeBOJsqzc33K+TBBSxPE1fPzSvK1ZXg0fHW32j6lC
 EhMhCMpCj4tiCKn1qgiUBKOuWFDMS/p1GcXryjvDPIbtzazG91fQHqXkISrNxJzzsRNP
 B71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7H3s9naaE5Pm4o1Tcyi1dehPa7k9YSZMkc4DsTx2LCk=;
 b=uijooDGafNM4m7jgXBG4ZIGpsWcOl6lPt6xnHKroQAb8grC1YWRGcc/7qYcPAS0qXD
 d2iAK0eIzstwDpKOCZLwVGl5yreo8Vh2PtSZc76ODwB55DduKjNjyON1p9An4jFA0k43
 ZT7t4wbtyksEH7frrFmf4nA5k9ltE8nBJUt0xB8JllRGUB/+rNC0fing5s3zl0u92qZ4
 LfWN584DgRg6kLgSs5EoZt9ucsZmTqszN8KJBN2v99bxoC6tUk1G4psc/KQui/1sQP5r
 RjhQgjmiyOHjlETJlIokkGL9P3hNRyHLLN/tk6cZbdOslzqNYDqQ/PIZNRPOiZGgbRq5
 HthQ==
X-Gm-Message-State: AOAM531fdRb8OB0XHuZwIIEg5pAja6yzJCB3qfPAAaDbP6qvQnpHrnxk
 z42cvORFnYBB11Kv9ig6utGRYe9qxTWuQg==
X-Google-Smtp-Source: ABdhPJwQDonKtdc1KUlQCdKIjNcjsjAxwf04ElIy5SeSeT4MQtauBO37ycqZgOZRQEEb0JZZCuzdLQ==
X-Received: by 2002:a17:90a:1a50:: with SMTP id
 16mr2401278pjl.164.1631578510691; 
 Mon, 13 Sep 2021 17:15:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/44] target/hppa: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:29 -0700
Message-Id: <20210914001456.793490-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-10-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        | 4 ++--
 target/hppa/cpu.c        | 2 +-
 target/hppa/int_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 748270bfa3..7854675b90 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -325,13 +325,13 @@ int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void hppa_cpu_do_interrupt(CPUState *cpu);
-bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 #ifndef CONFIG_USER_ONLY
+void hppa_cpu_do_interrupt(CPUState *cpu);
+bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
                               int type, hwaddr *pphys, int *pprot);
 extern const MemoryRegionOps hppa_io_eir_ops;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 2eace4ee12..e8edd189bf 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -144,10 +144,10 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 349495d361..13073ae2bd 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -88,7 +88,6 @@ void HELPER(write_eiem)(CPUHPPAState *env, target_ureg val)
     eval_interrupt(env_archcpu(env));
     qemu_mutex_unlock_iothread();
 }
-#endif /* !CONFIG_USER_ONLY */
 
 void hppa_cpu_do_interrupt(CPUState *cs)
 {
@@ -100,7 +99,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     uint64_t iasq_f = env->iasq_f;
     uint64_t iasq_b = env->iasq_b;
 
-#ifndef CONFIG_USER_ONLY
     target_ureg old_psw;
 
     /* As documented in pa2.0 -- interruption handling.  */
@@ -187,7 +185,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     env->iaoq_b = env->iaoq_f + 4;
     env->iasq_f = 0;
     env->iasq_b = 0;
-#endif
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static const char * const names[] = {
@@ -248,7 +245,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
 bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-#ifndef CONFIG_USER_ONLY
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
 
@@ -258,6 +254,7 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         hppa_cpu_do_interrupt(cs);
         return true;
     }
-#endif
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


