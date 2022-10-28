Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FBD6117F0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSe-0008U0-4S; Fri, 28 Oct 2022 12:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRq-0000XT-6l; Fri, 28 Oct 2022 12:43:10 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRo-0000QM-I4; Fri, 28 Oct 2022 12:43:09 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322d768ba7so6895317fac.5; 
 Fri, 28 Oct 2022 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYgVxYkkxGAqeFzTYsLiBahRC2yjDI9EnIVkK5tQL0Q=;
 b=Cjbs9wM0Fx8dTdwREDxREN1DyMoiMURQPvvXm3nhkVJHMIgRt7iKc9Pqm98FYVXlQG
 Ugws8oWZ92mVcteKZZs6mlMBVaL2j4g9H3tOEu4d5tu1gc+4W34Jd/jLV1zI4EEjns5v
 gyUkubgATg8jUzCqy/ZUoqz0IqNa8Aw2eryBc/zSHTvp+u6TjaXbqUebCh9dOfDF479E
 WOj0aT0MvFkxOaWzFf9Ilg5IPrD7RurLJxptJC1sxNNswoAnujdyR9d9YBUYzaQsdRyY
 jiFGxiWwsnnPqDxF08ogAz8sOnaeNdxtrMBZilEkivgpNdZaobN39tg/sAFtX7Pz0Zhj
 7sOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RYgVxYkkxGAqeFzTYsLiBahRC2yjDI9EnIVkK5tQL0Q=;
 b=O12DLqoVWrYQWyNFxRiGaSIvj0IONh26vlbJNgq1p7Z1UL0Yra9k41F5PccBKmqRCt
 6tNk45273LskypDRuAG7iI91Fe8S8nfaGhKYKVhNfZ9jn3xfTGQFo6iDorS4W8Su206P
 qshjYFvwftWGXBQALUImWikvKV+j6dDufZPi7klWl651UzCn3KEgSLuCRk0ydQ6p3JWW
 7MTelNJTyYpFcprX5A8I9DjKSHqR6sCQv9ddv/FHsoA7iUnBXOn/3Y4jPg1DuOjhJ/GP
 dDZcHffFESD6AJqo3lG/LSCPbNXxGX7G7+6rpniWRDkCyq9FMrT4ZoHe2r7beUqbF09l
 Lfcg==
X-Gm-Message-State: ACrzQf1bCNn93A2iujJb/D+6YNDw76DH3j9NC4i3MORkJ0/JpgxjjKgr
 yHUpjfaxdr52P4qqCY08+BvSgqkbK5jCnw==
X-Google-Smtp-Source: AMsMyM76XLE1UyD7TC2bCt8ARQiRheg9ui8wMJtckoe5ecgqWcdjj9uic5g30blYJZTbPIStz9cfug==
X-Received: by 2002:a05:6870:fb86:b0:13a:dffa:e4ae with SMTP id
 kv6-20020a056870fb8600b0013adffae4aemr9853668oab.245.1666975387114; 
 Fri, 28 Oct 2022 09:43:07 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 43/62] target/ppc: add power-saving interrupt masking logic to
 p7_next_unmasked_interrupt
Date: Fri, 28 Oct 2022 13:39:32 -0300
Message-Id: <20221028163951.810456-44-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

Export p7_interrupt_powersave and use it in p7_next_unmasked_interrupt.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-26-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 24 ++++++++++++------------
 target/ppc/internal.h    |  1 +
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0c5ada7826..5238229cd6 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5960,7 +5960,7 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-static int p7_interrupt_powersave(CPUPPCState *env)
+int p7_interrupt_powersave(CPUPPCState *env)
 {
     if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
         (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 9164dc2e0f..14bec2490f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1693,28 +1693,28 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 
 static int p7_next_unmasked_interrupt(CPUPPCState *env)
 {
-    bool async_deliver;
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+    /* Ignore MSR[EE] when coming out of some power management states */
+    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
 
     assert((env->pending_interrupts & P7_UNUSED_INTERRUPTS) == 0);
 
+    if (cs->halted) {
+        /* LPCR[PECE] controls which interrupts can exit power-saving mode */
+        return p7_interrupt_powersave(env);
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
@@ -1725,13 +1725,13 @@ static int p7_next_unmasked_interrupt(CPUPPCState *env)
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
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 9069874adb..25827ebf6f 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -309,6 +309,7 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
 #if defined(TARGET_PPC64)
 int p9_interrupt_powersave(CPUPPCState *env);
 int p8_interrupt_powersave(CPUPPCState *env);
+int p7_interrupt_powersave(CPUPPCState *env);
 #endif
 
 #endif /* PPC_INTERNAL_H */
-- 
2.37.3


