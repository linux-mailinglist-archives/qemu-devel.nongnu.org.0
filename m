Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215056117CC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:43:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRh-0006ph-C1; Fri, 28 Oct 2022 12:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSR7-0001il-Hk; Fri, 28 Oct 2022 12:42:25 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSR4-0000Ne-8c; Fri, 28 Oct 2022 12:42:24 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so6919251fac.1; 
 Fri, 28 Oct 2022 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiYxq7eoyIQnNoKUnf45tLHZeCmNvjCBnqLGh5QS7zQ=;
 b=JdQ2MKegyyLnbNIfumtNMiRRrwlW2U6zdmB2KKmohLshEwpU9OqcysKxmjBg+fWVRG
 4xBkStGquBe4T9b9C5cHLYx4tbcjXuTRn+HkoLgfU1/C+7gqS6JBJFY/qX5ThR1Nw19e
 DTvpcxVgWo4SFRge2fXSDzyj2hyHyjD+GX5mpzeP5AuD+phnBuJl9MYhe92VWp7eZ+Uv
 VaRKqM4W5tDO+tZNOIW9xMyRaDH2sbqzKfyAQdyOMHC8XWJbRQoX/hWPxH0cS+9SksZW
 YnUbqPvKdZQZiXyEeKEldHWu/WGjnSeWdGrMKULiQc1lOTB+7OsUD7+n8mfMXMp9gYGY
 WlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wiYxq7eoyIQnNoKUnf45tLHZeCmNvjCBnqLGh5QS7zQ=;
 b=g5TVyabvI0MPpz8FGAx+fCiOWklpJQ7PJNBckI7g9/IQBND8P9+27HXI+tEFPpEuGw
 /TBZYOPnupNBpZUd76GV7eoG+He6V/qUZtT3NLkZZatOToCFJV5jF2IEhF9zYaCbABQC
 uyZqRND/7VuKvjFIORISrT1nc8wxNC+hI+RgNQI+YhTWT3KloMH7Jnb6A1WqgP4TztD6
 Bq3WMAD7Jfi4r0Oxnv6Gy8M2alazUfVFcxxkGm+ZpDhrcwxARWfHdcZqN6zKcQhkQTj5
 GNxzOUEpXIG1CLAVlasepzSKuhZknEpDu6psLy0fYk4W3i5K/rm2oOey+bzBp74/diHo
 qn6Q==
X-Gm-Message-State: ACrzQf3atOGB0RYs/3SP2zLfkyW8JNGVEjOJ/MpaCQ4AeiXNjrCgmaoT
 mW1zOVTntlzCRA5oN9f6pBjDjZcFDRe+Og==
X-Google-Smtp-Source: AMsMyM7yw6paBbTMoe/e9C7oRzEgzTc9DDCdGu/2VsBaCoxaMW1UrKQt97BXo/f3HEY+BvRwdQaBmg==
X-Received: by 2002:a05:6870:e88a:b0:13b:6e13:a9a5 with SMTP id
 q10-20020a056870e88a00b0013b6e13a9a5mr26559oan.264.1666975340208; 
 Fri, 28 Oct 2022 09:42:20 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 32/62] target/ppc: create an interrupt deliver method for POWER8
Date: Fri, 28 Oct 2022 13:39:21 -0300
Message-Id: <20221028163951.810456-33-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The new method is identical to ppc_deliver_interrupt, processor-specific
code will be added/removed in the following patches.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-15-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 107 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2bb636a439..c2ebb5280f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1984,6 +1984,110 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 }
 
 #if defined(TARGET_PPC64)
+static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    switch (interrupt) {
+    case PPC_INTERRUPT_RESET: /* External reset */
+        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
+        powerpc_excp(cpu, POWERPC_EXCP_RESET);
+        break;
+    case PPC_INTERRUPT_MCK: /* Machine check exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
+        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
+        break;
+
+    case PPC_INTERRUPT_HDECR: /* Hypervisor decrementer exception */
+        /* HDEC clears on delivery */
+        env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
+        powerpc_excp(cpu, POWERPC_EXCP_HDECR);
+        break;
+    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
+        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+        break;
+
+    case PPC_INTERRUPT_EXT:
+        if (books_vhyp_promotes_external_to_hvirt(cpu)) {
+            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+        } else {
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+        }
+        break;
+    case PPC_INTERRUPT_CEXT: /* External critical interrupt */
+        powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
+        break;
+
+    case PPC_INTERRUPT_WDT: /* Watchdog timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
+        powerpc_excp(cpu, POWERPC_EXCP_WDT);
+        break;
+    case PPC_INTERRUPT_CDOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
+        powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
+        break;
+    case PPC_INTERRUPT_FIT: /* Fixed interval timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
+        powerpc_excp(cpu, POWERPC_EXCP_FIT);
+        break;
+    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded ppc */
+        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
+        powerpc_excp(cpu, POWERPC_EXCP_PIT);
+        break;
+    case PPC_INTERRUPT_DECR: /* Decrementer exception */
+        if (ppc_decr_clear_on_delivery(env)) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
+        }
+        powerpc_excp(cpu, POWERPC_EXCP_DECR);
+        break;
+    case PPC_INTERRUPT_DOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
+        if (is_book3s_arch2x(env)) {
+            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
+        } else {
+            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
+        }
+        break;
+    case PPC_INTERRUPT_HDOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
+        powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
+        break;
+    case PPC_INTERRUPT_PERFM:
+        env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
+        powerpc_excp(cpu, POWERPC_EXCP_PERFM);
+        break;
+    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
+        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
+        powerpc_excp(cpu, POWERPC_EXCP_THERM);
+        break;
+    case PPC_INTERRUPT_EBB: /* EBB exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
+        if (env->spr[SPR_BESCR] & BESCR_PMEO) {
+            powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
+        } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
+        }
+        break;
+    case 0:
+        /*
+         * This is a bug ! It means that has_work took us out of halt without
+         * anything to deliver while in a PM state that requires getting
+         * out via a 0x100
+         *
+         * This means we will incorrectly execute past the power management
+         * instruction instead of triggering a reset.
+         *
+         * It generally means a discrepancy between the wakeup conditions in the
+         * processor has_work implementation and the logic in this function.
+         */
+        assert(!env->resume_as_sreset);
+        break;
+    default:
+        cpu_abort(cs, "Invalid PowerPC interrupt %d. Aborting\n", interrupt);
+    }
+}
+
 static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -2172,6 +2276,9 @@ static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
 {
     switch (env->excp_model) {
 #if defined(TARGET_PPC64)
+    case POWERPC_EXCP_POWER8:
+        p8_deliver_interrupt(env, interrupt);
+        break;
     case POWERPC_EXCP_POWER9:
     case POWERPC_EXCP_POWER10:
         p9_deliver_interrupt(env, interrupt);
-- 
2.37.3


