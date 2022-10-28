Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD2611801
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:48:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRU-00060i-CQ; Fri, 28 Oct 2022 12:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQt-00084J-FA; Fri, 28 Oct 2022 12:42:11 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQr-0000JM-6e; Fri, 28 Oct 2022 12:42:10 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 r76-20020a4a374f000000b004988a70de2eso116399oor.2; 
 Fri, 28 Oct 2022 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQU2NZAkL2rlALcztaSCXKZOQ5f9Zwmv0jWjXGtFlxc=;
 b=YQqsmCSEZNnwztXLN994ofzhVWIRoqx9F9eHFiNzM/Hn4mw3LPYXouE91tvh+PDt7s
 to4TjbV9rpvilPZzS/AI3DGDrZR6ngMWMT5z+nbIR2R6faWFMBZfHzvXkAmNF+oBoLlD
 R3C6W0zTxwiB46s5/q7elnvsMHd4E4p3vKgVjioymWuqjc51JSE9JAJ9CQAgu+ANvjZ6
 3+CLOyru48QXQxvMxP+nVjF1CWCEw7OqboluX7TjI3faN9cdwePZe3wFCes3xPTQHjk5
 YCvtEs9rmz+h5KX1ikrESzU9L59ze9ik/UfeQBghGzo5BR0x5rRlZVo+Z+kv7NyvzvTy
 CAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQU2NZAkL2rlALcztaSCXKZOQ5f9Zwmv0jWjXGtFlxc=;
 b=A80sIquXa3wObm40xl6smD8DM7mooJOT2KqfUZIbFU2TCQy1pcVnwZlyyx5nuuxXKb
 HE350ni20N5yggvpvltyIW+cofz90lRbBg4rrIMpaZdPxROh3ATRtZLgGE5hkuB+lp1Q
 b7dNLxFk8FMP954dQvPJDPoKwhfTA8zaEARhN7ZXAsHRvSWdMAsl9BmEJuy5tB3NkJkF
 1lTw7Ksl5WnR7EgyV16PhhY+aBZCFkotfpkLHTOxKiEeVZw4huzqypwYVUWbLbcYoIc1
 73WyTNWthmLRStJK9sKaJIC6dtSdIeQwRpa5D/yOYGk9l0iYpp1sZEm++SvsrWmWFM24
 hn1A==
X-Gm-Message-State: ACrzQf2EfKu++TgfOYTqiaPzK2qHXT1n+3Vt8n1rKv3i1TfQrWp1JySH
 q4YNwWeacZ+6GlNOtdD0E5Krceg5p2/C/A==
X-Google-Smtp-Source: AMsMyM6EMkNac0d+b+Vat/Xn+LVUfkQipcm1xgLZcIcYrvb/CfUT182u9unLXUNJjxobWmKSqnK//Q==
X-Received: by 2002:a4a:b447:0:b0:480:9c98:46a3 with SMTP id
 h7-20020a4ab447000000b004809c9846a3mr202385ooo.14.1666975327157; 
 Fri, 28 Oct 2022 09:42:07 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 29/62] target/ppc: add power-saving interrupt masking logic to
 p9_next_unmasked_interrupt
Date: Fri, 28 Oct 2022 13:39:18 -0300
Message-Id: <20221028163951.810456-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc32.google.com
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

Export p9_interrupt_powersave and use it in p9_next_unmasked_interrupt.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-12-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 46 ++++++++++++++++++++++++++++------------
 target/ppc/internal.h    |  4 ++++
 3 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9ecea10b48..423d99d8d3 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6351,7 +6351,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return false;
 }
 
-static int p9_interrupt_powersave(CPUPPCState *env)
+int p9_interrupt_powersave(CPUPPCState *env)
 {
     /* External Exception */
     if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 238ce78235..836c90b9a8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1692,28 +1692,39 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 
 static int p9_next_unmasked_interrupt(CPUPPCState *env)
 {
-    bool async_deliver;
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+    /* Ignore MSR[EE] when coming out of some power management states */
+    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
 
     assert((env->pending_interrupts & P9_UNUSED_INTERRUPTS) == 0);
 
+    if (cs->halted) {
+        if (env->spr[SPR_PSSCR] & PSSCR_EC) {
+            /*
+             * When PSSCR[EC] is set, LPCR[PECE] controls which interrupts can
+             * wakeup the processor
+             */
+            return p9_interrupt_powersave(env);
+        } else {
+            /*
+             * When it's clear, any system-caused exception exits power-saving
+             * mode, even the ones that gate on MSR[EE].
+             */
+            msr_ee = true;
+        }
+    }
+
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
         return PPC_INTERRUPT_MCK;
     }
 
-    /*
-     * For interrupts that gate on MSR:EE, we need to do something a
-     * bit more subtle, as we need to let them through even when EE is
-     * clear when coming out of some power management states (in order
-     * for them to become a 0x100).
-     */
-    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
-
     /* Hypervisor decrementer exception */
     if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
         /* LPCR will be clear when not supported so this will work */
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
-        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
+        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
             return PPC_INTERRUPT_HDECR;
         }
@@ -1723,7 +1734,7 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
-        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
+        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hvice) {
             return PPC_INTERRUPT_HVIRT;
         }
     }
@@ -1733,13 +1744,13 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
-        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
+        if ((msr_ee && !(heic && FIELD_EX64_HV(env->msr) &&
             !FIELD_EX64(env->msr, MSR, PR))) ||
             (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
             return PPC_INTERRUPT_EXT;
         }
     }
-    if (async_deliver != 0) {
+    if (msr_ee != 0) {
         /* Decrementer exception */
         if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
             return PPC_INTERRUPT_DECR;
@@ -1901,6 +1912,15 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
     PowerPCCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
 
+    if (cs->halted && !(env->spr[SPR_PSSCR] & PSSCR_EC) &&
+        !FIELD_EX64(env->msr, MSR, EE)) {
+        /*
+         * A pending interrupt took us out of power-saving, but MSR[EE] says
+         * that we should return to NIP+4 instead of delivering it.
+         */
+        return;
+    }
+
     switch (interrupt) {
     case PPC_INTERRUPT_MCK: /* Machine check exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 337a362205..41e79adfdb 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -306,4 +306,8 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
     return msk;
 }
 
+#if defined(TARGET_PPC64)
+int p9_interrupt_powersave(CPUPPCState *env);
+#endif
+
 #endif /* PPC_INTERNAL_H */
-- 
2.37.3


