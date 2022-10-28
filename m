Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC36117DE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:45:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSY-0005Nf-8i; Fri, 28 Oct 2022 12:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRa-0007Fu-LM; Fri, 28 Oct 2022 12:42:58 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRY-0000Y1-RE; Fri, 28 Oct 2022 12:42:54 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-13be3ef361dso6847928fac.12; 
 Fri, 28 Oct 2022 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IE8ZDRUsEfLJ4Pv3eq+18gk7CiqMpzJtub7thmc+0lM=;
 b=OwOHbq6Q5JEplcwDUzae8AbFawPRKqW0eGtFxrYzVxoNZSemGIbP9NxRYh+LV+BFhx
 E+OzpM9iF9j9fWSFoHoW6z5QQ8M48IfYDOxTC37FcHDGZoDGIZprJIqULrxRtaYAuOdb
 PR49cc9xpOfCW0xXBPTf5c01aaAEOUbMvZ2DVFVp7NzEeti9DPT7KyDBak7u051Z//qz
 lmmLDrPQr3HqCpjVlo63TN6RIOzuIsZr3JOOJUGo7gneVX7ML821r6CFV382zG0Aq72E
 9bPqwpfFZl3jgZ+cQY2t5chu5EHEryZdJzocnZyHRUi5POvsUdBHGL/Y9ceTgCKOTtg8
 NHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IE8ZDRUsEfLJ4Pv3eq+18gk7CiqMpzJtub7thmc+0lM=;
 b=E3xpRtHaclAalwYYlpPJx8BYYajLA/ZkLddtIHFMIQ6elKIgn+TlrVRnhficEPtg1f
 SzRlm251Pi63p0XTky2ivl8O9YM+H+i/tKPa/7Y1eXCFApxwpqpVtz1DTiqXBSz+lXYh
 9ty21fOlCV1PSnN/MuQepoiGfnFo8D5E2ilzxIH7l+TPbU2ROc3JPs9IeFdU85w/KG4G
 AfLfBuZh14ORw2gN7h0MmBUcTy6Yzy3fmdYsWBE/6w1qGV/We2gIMV1GEsjuMkGpjyJe
 j2Qtq9wulUgSk0Bo9Q+pD5ZljahbNb4lcnZYT5+2IwukopgEmvMbLW+Erjn2jewfWrRu
 /bIQ==
X-Gm-Message-State: ACrzQf0MVJlmkB1fEKmEwxxJkGFX0g1Ay35dqNs12sAsXl6wilU8H5yC
 4OkL+jY1psniHUN/x7MdEgBB07Z5uwC1QA==
X-Google-Smtp-Source: AMsMyM6dAsx/8+CYLAZXt+yS0qqqXXa2a8fTumKJQnvpubKY3lIKz09gRrYYDEJnmbMbIhgWvnD23g==
X-Received: by 2002:a05:6870:612c:b0:132:a4d3:e0d8 with SMTP id
 s44-20020a056870612c00b00132a4d3e0d8mr17049oae.95.1666975369785; 
 Fri, 28 Oct 2022 09:42:49 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 39/62] target/ppc: create an interrupt deliver method for POWER7
Date: Fri, 28 Oct 2022 13:39:28 -0300
Message-Id: <20221028163951.810456-40-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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
Message-Id: <20221011204829.1641124-22-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 107 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 08db3a4658..5bb05016fd 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2045,6 +2045,110 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 }
 
 #if defined(TARGET_PPC64)
+static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
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
 static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -2304,6 +2408,9 @@ static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
 {
     switch (env->excp_model) {
 #if defined(TARGET_PPC64)
+    case POWERPC_EXCP_POWER7:
+        p7_deliver_interrupt(env, interrupt);
+        break;
     case POWERPC_EXCP_POWER8:
         p8_deliver_interrupt(env, interrupt);
         break;
-- 
2.37.3


