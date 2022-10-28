Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B76117CD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:43:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSS0-0001ck-Tg; Fri, 28 Oct 2022 12:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRN-0004i9-6p; Fri, 28 Oct 2022 12:42:41 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRL-0000Ty-Fq; Fri, 28 Oct 2022 12:42:40 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13bef14ea06so6895308fac.3; 
 Fri, 28 Oct 2022 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMoGF5i1tJZT1zlxc/0QXO8meU72w5P3bCW326uxEso=;
 b=ZoI7A7s1Vm3siJaaMGGDJ1rPZ+c/eYzbVk2b/ntjhOXkCXhIOb0B6AooVeSuJ729rQ
 ULEGJJASF7UH+NX3beLV8W+W9UjFo1Uc2KggKmF7+FNJvoBIebP+f/x4UokxKzquoe1a
 WImNGXkDpkcvLYvLYuYBpE1QTx3wGxJVuxYquC/kOaBLCRHYB4oqJfPuAPd5I3jnvDH9
 B2//zjrjZ8A7cZytNx8nBMpPC1vvPRKR8AKlQsZMNJNtufk8mhNmjsDbVNt8+4HYUu0i
 OWIpUCFea1EUkDqxt01EiIX/aNLnMH318sn1EGsTtd0iuBBGzSXDFbQkRfAr4oMnY8UT
 E//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMoGF5i1tJZT1zlxc/0QXO8meU72w5P3bCW326uxEso=;
 b=67fKqRg2fFQGOF2DXV/zRMduvTZce2zCHd1wFuRiflMhoJcBmlI4GL0Y/3mb/gTRtc
 CdkWbe7u4Tj4HGGkkm9N7MVULlguHoBgWfq36iwx3xrlLeWL8a2eM6Sc/9ML24tH/chY
 XXarN67enBDNv+izGKabxWqhIiB2o2NGllfiK8O5T/KKhntNV40ULVa7v0m9Hu0nZDQZ
 wshABo5I4st/2OoCgCoYwwN2xM+RELNlecR4OWOsgGxH6oWBUFtdyBdbM7hNghu0BpW2
 Rw4yEHwxa+acy0RbFIikmHLeE8m6Edt+Ev+YxOfEXySORZrkGSnTTGaVwntuUkHcMB8k
 8c2Q==
X-Gm-Message-State: ACrzQf2uhgSgS2jEFL5eOgbqbU7eMja6f/bDPSsBbyk0X2ZjmK0ayfkj
 nE92CSsTF9Id/vMBgzOBw0k3EB7ql5yLYg==
X-Google-Smtp-Source: AMsMyM5etvuzJOPZxsAd1Cuuwq3FlCFtetd9wJR8Ybe6T6GWeIvee3a4ZJOE0m0gSELFiRZztSwaCg==
X-Received: by 2002:a05:6870:4798:b0:12c:989b:a3b7 with SMTP id
 c24-20020a056870479800b0012c989ba3b7mr9616966oaq.181.1666975357607; 
 Fri, 28 Oct 2022 09:42:37 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 36/62] target/ppc: add power-saving interrupt masking logic to
 p8_next_unmasked_interrupt
Date: Fri, 28 Oct 2022 13:39:25 -0300
Message-Id: <20221028163951.810456-37-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

Export p8_interrupt_powersave and use it in p8_next_unmasked_interrupt.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-19-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 24 ++++++++++++------------
 target/ppc/internal.h    |  1 +
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 922390b938..68ae22d1f4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6133,7 +6133,7 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-static int p8_interrupt_powersave(CPUPPCState *env)
+int p8_interrupt_powersave(CPUPPCState *env)
 {
     if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
         (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b4afdc81ca..9fa75c55c9 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1692,28 +1692,28 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 
 static int p8_next_unmasked_interrupt(CPUPPCState *env)
 {
-    bool async_deliver;
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+    /* Ignore MSR[EE] when coming out of some power management states */
+    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
 
     assert((env->pending_interrupts & P8_UNUSED_INTERRUPTS) == 0);
 
+    if (cs->halted) {
+        /* LPCR[PECE] controls which interrupts can exit power-saving mode */
+        return p8_interrupt_powersave(env);
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
@@ -1724,13 +1724,13 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
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
index 41e79adfdb..9069874adb 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -308,6 +308,7 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
 
 #if defined(TARGET_PPC64)
 int p9_interrupt_powersave(CPUPPCState *env);
+int p8_interrupt_powersave(CPUPPCState *env);
 #endif
 
 #endif /* PPC_INTERNAL_H */
-- 
2.37.3


