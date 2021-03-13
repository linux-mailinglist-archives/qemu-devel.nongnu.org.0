Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BA339AB8
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:10:00 +0100 (CET)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsn1-0001st-RZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKse6-0007OW-0j
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:46 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdz-0003Vn-Cv
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:45 -0500
Received: by mail-qt1-x834.google.com with SMTP id f12so5300641qtq.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vELE3YSpOk5r/uHFU87DvdYSf1TzMJkyUqmnTwvrjhM=;
 b=JhEEnnwLoeKGZdHB2F+Jb5u1CdemRhjFBtaAiqdY99guFJiwWz9vL2nv1bhSZFk/qA
 S7TaD/XSJWH79UdxkGwjjociw9CPhcIw/WWaU3JB90u2Gsq2I0X9g0GdYn5C/JeLE4pA
 aAeCbJ/zpp4u7i0mifZJXhqWV7JpYYxQJj5ud+jThAl3TPnciIvor9/sjSnUqCmbj5cN
 6sY96/wyIANvhoeWuvzlGUI9uzyhc95AuNTPtL0AKxsX6Bnpf9zn8XyOhuHrW/dlgVHr
 VDYargJJ0tMy7e//WEFD0ne6psRex0jzjx3iakmyFt5AwWzs1WLWBqGFuk4sz41h6LhZ
 zqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vELE3YSpOk5r/uHFU87DvdYSf1TzMJkyUqmnTwvrjhM=;
 b=eYDgWRNk7DXdktwM4hLJSlAq6RlvO3ZpLm/HrV9+MkaleMZHMN1MzkjQ4LR2+H9eze
 MNEUEw/XlJiL60wJJHLhmpz1apzBsZeu2aSU/GpQ5eFMSMxDAedmFOoIYiqFmr7kXFkx
 MVD5HYFpKu/8Xo03QUPTFBsUMnbOQGM1a0SeezjZZu7V9fcqMqln7+Hj/0Jl1VJlR5e/
 WTv23bGS1MIzDdkIFIWxk/70KI/lFm/makDaxixjpKKnKD2xUNRYZQrdiAabqI3d+pTI
 NLgO/28Oqbr0QNDojSwpixsrhgDv3ucoBmCeplh7uFYRMCTDkVrOyTNbFyhn7Jw4RyYt
 5Smg==
X-Gm-Message-State: AOAM530hMngZoemLG+4QZT9ZZUXkm6/XkQKb1in2ynw3aN8m2meYK4Lj
 7mQndu/LHaIffQ8hIgv7R1PlMCKqeBUVjui6
X-Google-Smtp-Source: ABdhPJy9td0gcUC9Dfz3S4/vh2TSGugwD5jueaNylriAx6Rz9Ps8y6kYN5zZ7C4rV5Z5gM69dureeQ==
X-Received: by 2002:ac8:4755:: with SMTP id k21mr14415395qtp.102.1615597238310; 
 Fri, 12 Mar 2021 17:00:38 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] hw/ppc: Use hreg_store_msr for msr updates
Date: Fri, 12 Mar 2021 19:00:17 -0600
Message-Id: <20210313010018.819153-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ivan@vmfacility.fr, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only one of the three places in hw/ppc that modify msr updated
hflags.  Even in that case, use the official interface instead
of a direct call to hreg_compute_hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Greg Kurz <groug@kaod.org>
---
 hw/ppc/pnv_core.c    | 3 ++-
 hw/ppc/spapr_hcall.c | 3 +--
 hw/ppc/spapr_rtas.c  | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index bd2bf2e044..31f041b9c7 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -29,6 +29,7 @@
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
+#include "helper_regs.h"
 
 static const char *pnv_core_cpu_typename(PnvCore *pc)
 {
@@ -54,7 +55,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
      */
     env->gpr[3] = PNV_FDT_ADDR;
     env->nip = 0x10;
-    env->msr |= MSR_HVB; /* Hypervisor mode */
+    hreg_store_msr(env, env->msr | MSR_HVB, true); /* Hypervisor mode */
 
     env->spr[SPR_HRMOR] = pc->hrmor;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..a4f7a09ba8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1055,8 +1055,7 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
     CPUState *cs = CPU(cpu);
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
 
-    env->msr |= (1ULL << MSR_EE);
-    hreg_compute_hflags(env);
+    hreg_store_msr(env, env->msr | (1ULL << MSR_EE), false);
 
     if (spapr_cpu->prod) {
         spapr_cpu->prod = false;
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8a79f9c628..b9a6b7ef30 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -51,6 +51,7 @@
 #include "target/ppc/mmu-hash64.h"
 #include "target/ppc/mmu-book3s-v3.h"
 #include "migration/blocker.h"
+#include "helper_regs.h"
 
 static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                    uint32_t token, uint32_t nargs,
@@ -162,7 +163,7 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
 
     cpu_synchronize_state(CPU(newcpu));
 
-    env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
+    hreg_store_msr(env, (1ULL << MSR_SF) | (1ULL << MSR_ME), true);
 
     /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
     lpcr = env->spr[SPR_LPCR];
-- 
2.25.1


