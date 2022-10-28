Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB8611834
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:53:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQu-0007n0-2c; Fri, 28 Oct 2022 12:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQG-0002YY-Hh; Fri, 28 Oct 2022 12:41:32 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQC-0008OU-1p; Fri, 28 Oct 2022 12:41:32 -0400
Received: by mail-oi1-x230.google.com with SMTP id s206so6721684oie.3;
 Fri, 28 Oct 2022 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shfp/ul/SbRl9tJeOw47WP6vvR8ncB9UHRn3Wy75kJc=;
 b=Ck5KcSBFUZfpk6cxPh7rtspxMCe/O5eoKU8yrnZgBjLRRcw3PxiXR/oYX5X5iuNfQw
 mHDfmX8Gp4PlfaNpJeCScA0W2/cGey1KCyPHLGZ/SEtGSiG9zItK4ZiRUIGWGxgolDA4
 +1t8sHmC22Nfu0QekM8TykRbsTKd5eXPYS4+hsouqMMke8z59LuB24GICLQBENQCIglR
 gNWZD4wUOEjFMlRyW+jthkGTpxkBIPBP6AuOt+P8AC19VpYzkswKKi4LA2ArIiV4ZztH
 A/Z06Rpd3JaMGKcvfuf6XwphS/ZtEpc7TDUyLzxIEjiTSizRkVi5feT9uhozMHjUYAIS
 4WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=shfp/ul/SbRl9tJeOw47WP6vvR8ncB9UHRn3Wy75kJc=;
 b=yxF09NI2pv9C9oOYjkL+q4dsycxSasdEssEiL29six520vaGRzNqKmlu5M2vN43oky
 ED8cJeCb4FVBJb9JuPjNmbzGnn6qZ3kR1aRk41sAu233C+JH0qZErMIiK0qqL9OV/jyq
 ClYo9mPfBqBf4LV6lxNBez78r+8oGYKOTwPtt8t/74jTnSUA/O/jtRWC4VR1kuTCVAd5
 rojslmgmi0ZwR465uxAMaz7bQ1GqV+821rNjQZzqAb2eSgSN+32SiSn4BXzDmwGBx+5a
 ZjN5O05hf+ElZG8zFt3b2YMNOwIefy+/MDU9pK9/7Yd8xYI5ZlcPa4PicprTAc45p2ru
 uZmQ==
X-Gm-Message-State: ACrzQf37Obo3xED0I09MER0jQIjSSAp93x16ORKdZaocrl1kA2xsQ82y
 MnQzmFgYi6XmLzm+hTQI0mzZV1xBRJbaRg==
X-Google-Smtp-Source: AMsMyM6gHK3mZov/UBj0tx+3XpOVe3/Hsyjj8u91ETQFy5VibfxbFTZV3ORdDj5wJ3zDkCAzM/80Qg==
X-Received: by 2002:a54:4196:0:b0:355:15ff:b43 with SMTP id
 22-20020a544196000000b0035515ff0b43mr8932134oiy.200.1666975285538; 
 Fri, 28 Oct 2022 09:41:25 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 20/62] target/ppc: always use ppc_set_irq to set
 env->pending_interrupts
Date: Fri, 28 Oct 2022 13:39:09 -0300
Message-Id: <20221028163951.810456-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

Use ppc_set_irq to raise/clear interrupts to ensure CPU_INTERRUPT_HARD
will be set/reset accordingly.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20221011204829.1641124-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 17 +++++++----------
 target/ppc/misc_helper.c |  9 ++-------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d168789fc0..37d352619b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "internal.h"
 #include "helper_regs.h"
+#include "hw/ppc/ppc.h"
 
 #include "trace.h"
 
@@ -2086,7 +2087,6 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
 static void do_ebb(CPUPPCState *env, int ebb_excp)
 {
     PowerPCCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
 
     /*
      * FSCR_EBB and FSCR_IC_EBB are the same bits used with
@@ -2104,8 +2104,7 @@ static void do_ebb(CPUPPCState *env, int ebb_excp)
     if (FIELD_EX64(env->msr, MSR, PR)) {
         powerpc_excp(cpu, ebb_excp);
     } else {
-        env->pending_interrupts |= PPC_INTERRUPT_EBB;
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        ppc_set_irq(cpu, PPC_INTERRUPT_EBB, 1);
     }
 }
 
@@ -2298,7 +2297,7 @@ void helper_msgclr(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~irq;
+    ppc_set_irq(env_archcpu(env), irq, 0);
 }
 
 void helper_msgsnd(target_ulong rb)
@@ -2317,8 +2316,7 @@ void helper_msgsnd(target_ulong rb)
         CPUPPCState *cenv = &cpu->env;
 
         if ((rb & DBELL_BRDCAST) || (cenv->spr[SPR_BOOKE_PIR] == pir)) {
-            cenv->pending_interrupts |= irq;
-            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+            ppc_set_irq(cpu, irq, 1);
         }
     }
     qemu_mutex_unlock_iothread();
@@ -2342,7 +2340,7 @@ void helper_book3s_msgclr(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
+    ppc_set_irq(env_archcpu(env), PPC_INTERRUPT_HDOORBELL, 0);
 }
 
 static void book3s_msgsnd_common(int pir, int irq)
@@ -2356,8 +2354,7 @@ static void book3s_msgsnd_common(int pir, int irq)
 
         /* TODO: broadcast message to all threads of the same  processor */
         if (cenv->spr_cb[SPR_PIR].default_value == pir) {
-            cenv->pending_interrupts |= irq;
-            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+            ppc_set_irq(cpu, irq, 1);
         }
     }
     qemu_mutex_unlock_iothread();
@@ -2383,7 +2380,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
         return;
     }
 
-    env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
+    ppc_set_irq(env_archcpu(env), PPC_INTERRUPT_HDOORBELL, 0);
 }
 
 /*
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 05e35572bc..a9bc1522e2 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "mmu-book3s-v3.h"
+#include "hw/ppc/ppc.h"
 
 #include "helper_regs.h"
 
@@ -173,7 +174,6 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
 void helper_store_dpdes(CPUPPCState *env, target_ulong val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
 
     helper_hfscr_facility_check(env, HFSCR_MSGP, "store DPDES", HFSCR_IC_MSGP);
 
@@ -184,12 +184,7 @@ void helper_store_dpdes(CPUPPCState *env, target_ulong val)
         return;
     }
 
-    if (val & 0x1) {
-        env->pending_interrupts |= PPC_INTERRUPT_DOORBELL;
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
-    }
+    ppc_set_irq(cpu, PPC_INTERRUPT_DOORBELL, val & 0x1);
 }
 #endif /* defined(TARGET_PPC64) */
 
-- 
2.37.3


