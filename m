Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD14B61B9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:35:20 +0100 (CET)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJocZ-0007DE-68
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:35:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoL3-00076p-Q8; Mon, 14 Feb 2022 22:17:14 -0500
Received: from [2607:f8b0:4864:20::102d] (port=40694
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoL1-0002hA-PX; Mon, 14 Feb 2022 22:17:13 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so1278375pjv.5; 
 Mon, 14 Feb 2022 19:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cH3SQ7niuuU1pNO4LQehyTSIjnYNSP5iUZ9YjmqDV9Q=;
 b=F2f0n4mXnyjlMMijxMHzT7mpbKr3ne70UMg0xyq4nI5ZbJR3/CM8iVCfryO5u1jDmE
 oGTrgYKpwyLUVVHZbsRZ3REHvER/flzfuEvbuhYYsxPD+PK/XbQyIWZHz4yrfpfzWIsq
 y2Oj9LCvxzWyryYl+8iRPDFJpPKjTptZCA9r0Gb8oQI/VTgqptfWZgVcEyZw+S+Vb9rX
 KRt3I7odmv+PkmZbypSNja8lK7MaFVCtx+aq62sSu6hL9m6RMc/ZeI4CniMlZRBOoZjO
 FFnQ625ggjxRMK14oeLRy/YZvt1ehdR1EG64+y2TKEFM6S6NWLaWisbwFgKu46k111f5
 qYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cH3SQ7niuuU1pNO4LQehyTSIjnYNSP5iUZ9YjmqDV9Q=;
 b=ASoDf5+UUrWI+vc/vtXvuDkmxxjhlwuf+lPNUefGLgLFAHEq6m+/222dnYH8FA8+Au
 5sibIP2yFavPF/feqOZHnndlfohBJQWOWb4p7J8ipBVJgunk0ikLBUgR32DG5hqoGrEd
 Q3yzHNqmajaMEgfJcLE/NIlBLStCA1IJNw97EVMc1QOBO9oBbtkcgAmLQzCHFT3PtBZ/
 21vb5b8odTh0ac40HGLOgNesiQhXOeqiq80c/lMAKnznAqFuoNaZDCvZK9m9jQc9LxyM
 8uvHgf8B1Tmw/rw6g/TpeyX9kAGVe00WCwGPopXB7cGE6L4KVRILAsUPBbrgqPetiShq
 ouzQ==
X-Gm-Message-State: AOAM532+ki7n6t5k0TYseFwguKeg12bJZLxvJL3XJe5mDC266zWU+Xih
 l1SRyv4KD4Lgoo3OVMXpmBXYjYRCldE=
X-Google-Smtp-Source: ABdhPJwCAgQD0ujr07FG/83apUS9E1h7mgqRklwuSb+i/N1DPuvs4Z1YWTNRXViZVMkaHKnEMxAalQ==
X-Received: by 2002:a17:90b:2251:b0:1b9:4d5b:5da3 with SMTP id
 hk17-20020a17090b225100b001b94d5b5da3mr2161998pjb.92.1644895030079; 
 Mon, 14 Feb 2022 19:17:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:17:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 7/9] target/ppc: Add powerpc_reset_excp_state helper
Date: Tue, 15 Feb 2022 13:16:40 +1000
Message-Id: <20220215031642.1691873-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This moves the logic to reset the QEMU exception state into its own
function.

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


