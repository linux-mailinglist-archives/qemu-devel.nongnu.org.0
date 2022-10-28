Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CC6117E9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSj-00016p-G8; Fri, 28 Oct 2022 12:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSS8-0003fR-Fz; Fri, 28 Oct 2022 12:43:30 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSS6-0000gc-OS; Fri, 28 Oct 2022 12:43:28 -0400
Received: by mail-oi1-x22e.google.com with SMTP id l5so6703413oif.7;
 Fri, 28 Oct 2022 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJJzyadKpcWW4PIGFMTYf+Agiu7/dhHlDhFZPtlxgb0=;
 b=UD0eyX7JaN1Xy74XG38Ow5YmdPh1nn4cA+OfX2DkPLrl8Mr2j+h1GjsAqmE2cDOtD4
 CjaVtmYvo1FldQnukUPp68ls2hwqlkgS4ZN9k5oJqaWIvt/AWnCjeel+Vkx/xgUkI7RT
 InYBvZO+2O8N/IIVhaMHK/Mlghukhcr1JWxLK/e9ALZgCczFj6uKPVQ9FW8Onod81C3R
 By4v3YsYJw8bTzLvtVWqABRbQNPB/DfCrpxTz9K/w4OK02i+9m3GreKL0AhmC3oKxGLK
 gaDeHDrEFy1tYPOxsG7EepFDTGrtIJqSv/wxhISZhOAzQh9dQolz75Dfa3gHAfy9YU/X
 nyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJJzyadKpcWW4PIGFMTYf+Agiu7/dhHlDhFZPtlxgb0=;
 b=2vifVHil7Fvggu3YXaJT6VAh8nl261Fcu12hHru8sK8Dy8mt4N+H5VLpIpfUV3UJgg
 0rNjR6rBuf2uencmo0qcoRnA2XZzlduii3Hm1CMPPbzWdaiEu6SzZZB2sZcnLLKSJylG
 oGY34NHOgZmuoDhX6+Lj1gCvcrQNX1E0hA28cZ7k6okHdErD1OXAvyP+74sRqgqN9sG2
 /EH0+b+ruzAFnwHl/MPARAojQ8t8V6ftzES0zTnDe8Fc40Kc8lZpfYUa+QIVc6kjLB3W
 tkg/383kK8AF5H6QTX1K8MUzDczf2frxByuP34DygELHL59CWZdbobNLe4WwAu2fn8XZ
 sygA==
X-Gm-Message-State: ACrzQf23LZ0JGoIKdpEX0zrUOhog26yH7klaGzs3omTVpBMU6Bu6vK24
 gRv40zL2iOP+nKQBFCZ0E9vz253WezufnA==
X-Google-Smtp-Source: AMsMyM4sghuBOAqYeos/9Ozm3A4n8+lg3AOx1XiQqYsOM6Mr5sJLoaY7+0p03WMZvRdkH+C61vGWDA==
X-Received: by 2002:a05:6808:1205:b0:354:2815:4f3c with SMTP id
 a5-20020a056808120500b0035428154f3cmr8702887oil.26.1666975405102; 
 Fri, 28 Oct 2022 09:43:25 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 46/62] target/ppc: unify cpu->has_work based on
 cs->interrupt_request
Date: Fri, 28 Oct 2022 13:39:35 -0300
Message-Id: <20221028163951.810456-47-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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

Now that cs->interrupt_request indicates if there is any unmasked
interrupt, checking if the CPU has work to do can be simplified to a
single check that works for all CPU models.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20221021142156.4134411-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 94 +------------------------------------------
 1 file changed, 1 insertion(+), 93 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5238229cd6..b14905547c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5984,27 +5984,10 @@ int p7_interrupt_powersave(CPUPPCState *env)
     return 0;
 }
 
-static bool cpu_has_work_POWER7(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-        return p7_interrupt_powersave(env) != 0;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER7";
     dc->desc = "POWER7";
@@ -6013,7 +5996,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6170,27 +6152,10 @@ int p8_interrupt_powersave(CPUPPCState *env)
     return 0;
 }
 
-static bool cpu_has_work_POWER8(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-        return p8_interrupt_powersave(env) != 0;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER8";
     dc->desc = "POWER8";
@@ -6199,7 +6164,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6407,35 +6371,10 @@ int p9_interrupt_powersave(CPUPPCState *env)
     return 0;
 }
 
-static bool cpu_has_work_POWER9(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        uint64_t psscr = env->spr[SPR_PSSCR];
-
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-
-        /* If EC is clear, just return true on any pending interrupt */
-        if (!(psscr & PSSCR_EC)) {
-            return true;
-        }
-
-        return p9_interrupt_powersave(env) != 0;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER9";
     dc->desc = "POWER9";
@@ -6445,7 +6384,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -6604,35 +6542,10 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return false;
 }
 
-static bool cpu_has_work_POWER10(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    if (cs->halted) {
-        uint64_t psscr = env->spr[SPR_PSSCR];
-
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-
-        /* If EC is clear, just return true on any pending interrupt */
-        if (!(psscr & PSSCR_EC)) {
-            return true;
-        }
-
-        return p9_interrupt_powersave(env) != 0;
-    } else {
-        return FIELD_EX64(env->msr, MSR, EE) &&
-               (cs->interrupt_request & CPU_INTERRUPT_HARD);
-    }
-}
-
 POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
 
     dc->fw_name = "PowerPC,POWER10";
     dc->desc = "POWER10";
@@ -6643,7 +6556,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    cc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7216,11 +7128,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
 
 static bool ppc_cpu_has_work(CPUState *cs)
 {
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-
-    return FIELD_EX64(env->msr, MSR, EE) &&
-           (cs->interrupt_request & CPU_INTERRUPT_HARD);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void ppc_cpu_reset(DeviceState *dev)
-- 
2.37.3


