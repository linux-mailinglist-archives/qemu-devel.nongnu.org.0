Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE936117F1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSc-0007yX-Dv; Fri, 28 Oct 2022 12:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRl-0008LP-8m; Fri, 28 Oct 2022 12:43:06 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRj-0000bA-Nd; Fri, 28 Oct 2022 12:43:05 -0400
Received: by mail-oi1-x234.google.com with SMTP id y67so6723703oiy.1;
 Fri, 28 Oct 2022 09:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XzX0Zy2ZQKvZsgRH0Jkkp6FmIW/wCuAVl3Iv0Xh6wRI=;
 b=G0DRqnR3tJ8AvD6Z0YE46Ea9zhooidebl3kLZzuTb0ku3AKnqnjG3dZ8qOA/me8p0U
 Ej1oF2WidxuhlhF8Z5FH37YvIcuYTUPXapKklajm7ZEmDWlClhcPMmGg40aQGBj3D/5y
 RzVT0PlHgdgs6KyX0d8HM1IcpJinSfoDRiM5Wc7f44BhoBKQMeRcbfGNKAF0OhOskRu5
 5T4Ktr3hunEUmGHMsMaxO/vCjRTZHLl0v3moetQ5t+VnSwtp3exXa0neZ/ORq7ZjrKUs
 o5WxTeCgbTDteQTE9i/KOyvN1SBYIgvCFqX/cJoWmHo+HE3cpvYLbJwZUtW4M69lDdJ/
 CyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XzX0Zy2ZQKvZsgRH0Jkkp6FmIW/wCuAVl3Iv0Xh6wRI=;
 b=NS+Wim7fARWpmwDOa8AjdfOpI8GRweq16fG76vQKPUqjATqO9HXW1RD86EvNQm+oU+
 ccMJwtGtQariupSnUqIzo5rcrel2qRdIVTHqvPFo/5PdLFNykLVwR9ePElnwK8u4+atF
 xhzLhuzqD4IF6nT+tuWd1a5sAFrtP2JPp432nKuD9wxidk7CblvgCmArcR6feHLydEB2
 IjCEZ1QDvlz6N0+Li2sgN0oJn2mMznDjEKHBFfcgru00gwO2yz1+AmTcb8px5ha1HH0G
 XpbZ3kHh34UP7UhlKKCN3UeqO1uDkDb37qDcUS2Rb/uBFDN/pZllu2JZ5dZ/+TgizefM
 SdLA==
X-Gm-Message-State: ACrzQf3UVvOHCRFof4zShrZZ3ETPFN+7O9a7cFSyPhikAU5evoXICRRJ
 CIZUR9UHzIpIytAMtsR9SAI0iEwFvWkrDg==
X-Google-Smtp-Source: AMsMyM4UIl7SYvVP/AzFRkBqfwPUy+eQVAwynnXjfg61cCHiygN86OEX1Gr3SUStJCHNHmR05105Gg==
X-Received: by 2002:aca:f0c2:0:b0:34f:df0b:2de9 with SMTP id
 o185-20020acaf0c2000000b0034fdf0b2de9mr8691943oih.245.1666975381930; 
 Fri, 28 Oct 2022 09:43:01 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 42/62] target/ppc: move power-saving interrupt masking out of
 cpu_has_work_POWER7
Date: Fri, 28 Oct 2022 13:39:31 -0300
Message-Id: <20221028163951.810456-43-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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

Move the interrupt masking logic out of cpu_has_work_POWER7 in a new
method, p7_interrupt_powersave, that only returns an interrupt if it can
wake the processor from power-saving mode.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-25-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 45 ++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 68ae22d1f4..0c5ada7826 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5960,6 +5960,30 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
+static int p7_interrupt_powersave(CPUPPCState *env)
+{
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
+        return PPC_INTERRUPT_EXT;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return PPC_INTERRUPT_MCK;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return PPC_INTERRUPT_HMI;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static bool cpu_has_work_POWER7(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -5969,26 +5993,7 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
             return false;
         }
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
+        return p7_interrupt_powersave(env) != 0;
     } else {
         return FIELD_EX64(env->msr, MSR, EE) &&
                (cs->interrupt_request & CPU_INTERRUPT_HARD);
-- 
2.37.3


