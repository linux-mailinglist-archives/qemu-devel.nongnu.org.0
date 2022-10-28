Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AF6117D5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:44:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRv-00016B-21; Fri, 28 Oct 2022 12:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRI-0003oF-UC; Fri, 28 Oct 2022 12:42:36 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRH-0000Sc-5C; Fri, 28 Oct 2022 12:42:36 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 v40-20020a056830092800b00661e37421c2so3280042ott.3; 
 Fri, 28 Oct 2022 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhZH9eEhK/LK0yiGNchDlHoTfbzpWkh+jphA3Cd29DM=;
 b=UfO5IXK0oAuE23fk1CLUPDrPWd/bwwZ5VGaZ6Q7WEi+GgNoGQ6gOih8C8APxFCkR2X
 ZJ2I1olEGxXDai0JQVfwASTLflolUUWCqZsN4O02bJRVo8rPWwhlzxLPdv5DaZ+Qpu0y
 AiEDr8sRlkhRffug3WWTggdXYO/AUl+SPD4Li0afDy1/l1RvAePlvf8ax0re9fqpEjc6
 +XVw0+xOH98wTR7MNZDaonzaQq4totrCHFlhRzq+pq8LvpF8ApZ2JdAB5Cr3z7K9cN5B
 jMlnX19SWVhKavAxJBUEovzRgYNjPdX7EqfAABUGJWG7sOmUdMQ9K0doPGxhaSzptvsT
 X1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhZH9eEhK/LK0yiGNchDlHoTfbzpWkh+jphA3Cd29DM=;
 b=Znnfn9XPbt/cB3ggbnngLbl5IjKmpAVrDfLp7fOC8zOdaOUeo64D81DPDLgQyilvAa
 6NarQd/8hzpbPe/eaWsQGqWkn5YX3vKr+XYQPDrCLT+y6VIjocWvxnvnzOS4fBguwf4Z
 afFRAhrgWDb2L3Fnpe1QP/Kabn5FCo8n+K2RYaKOoK9+dWOYidBZd2JELqsZe3A4TnHG
 7lgUglWbcYFofqbp9eaoCyA3nWe4kGOfv76qL4lF2j/S0HVRbxdmj4a1TZ7dXuEf/tpf
 QLYAjCgr8VNAIHgxCOxUg1j6b59jEQVqBBbfXNCuVBAEph+yroFOcxbtkbmyKzTAAJvz
 DmBg==
X-Gm-Message-State: ACrzQf1Dw5JdJnqtiSa2e07EgRlrCT77NxIscmLy6u9a/qe0c0BLtkLe
 +cnLwYEDgWvZEQmO+u3cFa/6wJ3JBnYwdg==
X-Google-Smtp-Source: AMsMyM4GURqSzsMDQOmGKQM/rkFNPcBPef5munOYoo0Tmng+fPc+otOzwS6wk/eY0T7yZNEYsuvCTA==
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr102956otg.237.1666975353313; 
 Fri, 28 Oct 2022 09:42:33 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 35/62] target/ppc: move power-saving interrupt masking out of
 cpu_has_work_POWER8
Date: Fri, 28 Oct 2022 13:39:24 -0300
Message-Id: <20221028163951.810456-36-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
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

Move the interrupt masking logic out of cpu_has_work_POWER8 in a new
method, p8_interrupt_powersave, that only returns an interrupt if it can
wake the processor from power-saving mode.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-18-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 61 +++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 423d99d8d3..922390b938 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6133,6 +6133,38 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
+static int p8_interrupt_powersave(CPUPPCState *env)
+{
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
+        return PPC_INTERRUPT_EXT;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return PPC_INTERRUPT_MCK;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return PPC_INTERRUPT_HMI;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
+        return PPC_INTERRUPT_DOORBELL;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
+        return PPC_INTERRUPT_HDOORBELL;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static bool cpu_has_work_POWER8(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -6142,34 +6174,7 @@ static bool cpu_has_work_POWER8(CPUState *cs)
         if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
             return false;
         }
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
+        return p8_interrupt_powersave(env) != 0;
     } else {
         return FIELD_EX64(env->msr, MSR, EE) &&
                (cs->interrupt_request & CPU_INTERRUPT_HARD);
-- 
2.37.3


