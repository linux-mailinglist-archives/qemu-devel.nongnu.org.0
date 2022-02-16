Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550B4B8618
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:43:47 +0100 (CET)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHmk-0000sd-2z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:43:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHWC-00014i-Lj; Wed, 16 Feb 2022 05:26:40 -0500
Received: from [2607:f8b0:4864:20::433] (port=42706
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHVu-0005Le-So; Wed, 16 Feb 2022 05:26:24 -0500
Received: by mail-pf1-x433.google.com with SMTP id i6so1769610pfc.9;
 Wed, 16 Feb 2022 02:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=prFXyExXRocVxCDwtIex6BP56Yse47yKFs426Ch3c9s=;
 b=HJBswebISRk71gOQGjoLfKjWDZBvXCTenPTzuhOvjq5a+nj8q3pNhrX63zGwVmkYeX
 PXfpoeCwEN/V1Zd+v2ESLdqIcRjIJSDuKltEt2cNuOfYlYhD+EQMbqz9axMFxvhB464a
 TLWqxLB0rMh3MdIqMPCm6h9ibUOLE3t1sWguvFEoyDxybLoLWQWVJLuP+2KYQ1eEcmTe
 jK5Mfkt0c9mPbMbjvtOyBWS7+h0o5fNQ8UuNdSr1n8PvyPO4V9o2dS/dHdpTwCMxjrm0
 f03KV8EhvjyQGJl6n4sfzauCfdaACWDOsKUuMfHHwM9YalAria8vo7Bxr9W55vUR58dE
 qeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=prFXyExXRocVxCDwtIex6BP56Yse47yKFs426Ch3c9s=;
 b=70TCKcEKeVNDarNRKamd0zbSMKdIKOHUwLQnX2Dj36H+S/y2mZUYEE1FdN+eCvYHUy
 AzLtpVwzfF/JgS0Io9wEJu7Pk8HPlF/IEnYdlRYxP8t1IAjfUg3FwmKWcR8BXlqmD1yQ
 m/Tpe9c8QeG1Eki3U1h64pPe5aQFOC7vviPWIABszH2Ji+yn7YvY9oqUo0ajNjwg3U/+
 z9xJktvLq6eGVIbabwZ8EjzaU90o4Z2w7Y/T6EME8kFJFcSptb0MTo8vQ37xHY8Qm2KN
 Wpge/0yHK/vEgsWMujpLr+zVPYylI5x88jB82Fi7PIcHSd2Dggz6ipkb5h4FFJ289c1C
 u0HQ==
X-Gm-Message-State: AOAM533NZtjR/RjSvovFPJ5yQmEqUJ3KDLyKp5mhZHA/J8127s8j3hPW
 19srV6PZBCT/V/z4ihB3QB1WW7lTRCA=
X-Google-Smtp-Source: ABdhPJyqzlvyr2HzR2csu3zmTvw0hgfD1JiHuXWN/9l0941iRY/EXBv2Fl9GU2KZTwGUIC7BKF7CUw==
X-Received: by 2002:a05:6a00:a26:b0:4c3:d3e:3667 with SMTP id
 p38-20020a056a000a2600b004c30d3e3667mr2190782pfh.69.1645007181226; 
 Wed, 16 Feb 2022 02:26:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 7/9] target/ppc: Add powerpc_reset_excp_state helper
Date: Wed, 16 Feb 2022 20:25:43 +1000
Message-Id: <20220216102545.1808018-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This moves the logic to reset the QEMU exception state into its own
function.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 41 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6b6ec71bc2..778eb4f3b0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -360,12 +360,20 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
 }
 #endif
 
-static void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ulong msr)
+static void powerpc_reset_excp_state(PowerPCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
+    /* Reset exception state */
+    cs->exception_index = POWERPC_EXCP_NONE;
+    env->error_code = 0;
+}
+
+static void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector, target_ulong msr)
+{
+    CPUPPCState *env = &cpu->env;
+
     assert((msr & env->msr_mask) == msr);
 
     /*
@@ -376,21 +384,20 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
      * will prevent setting of the HV bit which some exceptions might need
      * to do.
      */
+    env->nip = vector;
     env->msr = msr;
     hreg_compute_hflags(env);
-    env->nip = vector;
-    /* Reset exception state */
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
 
-    /* Reset the reservation */
-    env->reserve_addr = -1;
+    powerpc_reset_excp_state(cpu);
 
     /*
      * Any interrupt is context synchronizing, check if TCG TLB needs
      * a delayed flush on ppc64
      */
     check_tlb_flush(env, false);
+
+    /* Reset the reservation */
+    env->reserve_addr = -1;
 }
 
 static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
@@ -471,8 +478,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
             env->spr[SPR_40x_ESR] = ESR_FP;
@@ -609,8 +615,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
 
@@ -783,8 +788,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
 
@@ -969,8 +973,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
 
@@ -1168,8 +1171,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
 
@@ -1406,8 +1408,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
                 trace_ppc_excp_fp_ignore();
-                cs->exception_index = POWERPC_EXCP_NONE;
-                env->error_code = 0;
+                powerpc_reset_excp_state(cpu);
                 return;
             }
 
-- 
2.23.0


