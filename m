Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8D4079B2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:02:46 +0200 (CEST)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Or-0002la-LG
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Ha-0006qN-9f
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HY-0002Pu-MC
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id u15so1436278wru.6
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7zq9ygHOST6Surc7M7Rd7Muo9vEZYb0xO5KQYL2Z9g=;
 b=XzyRMGklhJv/3jO2rzP+eHd7rg/GI3/pbHRLE+S+PseXqg5y00obXvD/QPi4ENd+s6
 Le2N8XGN/D14V92gY9UiYmS2cOghgkOke+o44m/TMNSkOQ6WuzhGdj2xVb8CaJbrvbR9
 9JkALCvyv0HpnXrNVZ0olnyQsvrh9t9LW32uWkQ/S9JjGh7zSER99mkpnthRQsrPhPJU
 fCwrOS8ndhAkIeXJDxDTCc81PvFEDTsotXY7F00T6ou153C/PHOharqlBF3i/c4FCC1X
 bYu0/dSlisP/pmT13gPglbSZap70cn13vdfI6UMdW5qboGuAXFp7uoTDoBhzTvogYVfh
 PV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V7zq9ygHOST6Surc7M7Rd7Muo9vEZYb0xO5KQYL2Z9g=;
 b=wl1WsPLSTctYjjHO/jpvDAq6cqJBlPweV62ytTSSH1088kuoXWq+6jj3fhe/ZKUjWu
 yJng38AQHIxy4XDhtt7StkniD+X/wRLWAZBTRdY8DKi515PKXbwSfXPzysYUIZtlFV8g
 SW+PbMsYoRMXRA8hpADPvB5G6A1fashS3R20tks+M3PUbAU9sWviSVHs9A/ALiDC6gWw
 ltgL941QxxXMW4/VCdrwVqnlRA07Gd8R5EwFxPMV/ydfIrL/nFDOBYSllVn3gRCdy6TU
 b3n3SeJ8+Xl+ECfY3bKdbgjhfUmKPyY9NgkdV7os8yj3W+SNbr57r6uXOgq4niArTwSw
 kcoA==
X-Gm-Message-State: AOAM530TvYOLDW9GRJn0+uhBqTiv1xCnV8NlVoO1Ng+A+5LAWzdCzxqS
 BgP2m2Ty1+YhjfK0edfT5mYKmGvD7ZM=
X-Google-Smtp-Source: ABdhPJxqMlQ9bijBVciVwcZ6hXF4FqTXXJwnpstopv8oQqaisHACNDccDRg+tvRDSW9i631NpbeHiQ==
X-Received: by 2002:a5d:65d0:: with SMTP id e16mr3930572wrw.182.1631379311159; 
 Sat, 11 Sep 2021 09:55:11 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u13sm2185968wrg.68.2021.09.11.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/24] target/arm: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sat, 11 Sep 2021 18:54:17 +0200
Message-Id: <20210911165434.531552-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 target/arm/cpu.h     | 3 +--
 target/arm/cpu.c     | 7 +++++--
 target/arm/cpu_tcg.c | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e41..cfd755cff99 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1040,11 +1040,10 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
-#endif
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d631c4683c4..ba0741b20e4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -440,6 +440,8 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
                                      unsigned int cur_el, bool secure,
@@ -556,7 +558,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     return unmasked || pstate_unmasked;
 }
 
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
@@ -608,6 +610,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
@@ -2010,11 +2013,11 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
 static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 33cc75af57d..0d5adccf1a7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -22,7 +22,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -46,7 +46,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -898,11 +898,11 @@ static void pxa270c5_initfn(Object *obj)
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
-- 
2.31.1


