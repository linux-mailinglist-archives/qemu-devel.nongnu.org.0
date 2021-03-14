Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6F33A756
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:13:01 +0100 (CET)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVEa-0003vz-9e
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1c-0002YO-TR
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:36 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:39748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1S-0002Ci-TX
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:36 -0400
Received: by mail-qv1-xf29.google.com with SMTP id q9so1269127qvm.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vELE3YSpOk5r/uHFU87DvdYSf1TzMJkyUqmnTwvrjhM=;
 b=V/ewIlIiEb8AM3Tcbm2hIUnxaKqRzk2I8Mkk3JNO9WD7T/t7zKP0mFTP+OZWXmVsyQ
 l7RNsfB0AeZUQw4k3GK288StYpgC9NZoOcULPOT2enJGrH1CuU9kYgoYEbc3WQVbsSoA
 O09qlVrSXKZ0W8kbC+MKbVxvKxfnBwPAZnPV1LdkeyOWq2IZ9jiVkZA14uQnM4+b0RyP
 Njj8Lt7098Ee6cy+ztl4iiXQk3prH+vj07l29P8qlqOPhlG0AtUkCu289Zuez/kay8Hg
 hSwcG3pVkb+BJzLE/JFoGnzyBTQ3XalkqDOfEn1SrqzBLTaGkVzbzcf/XHB/HymgKK/w
 VsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vELE3YSpOk5r/uHFU87DvdYSf1TzMJkyUqmnTwvrjhM=;
 b=t7vGTJgvTMs4UM2JBGLKhUVKA/qL2s698bnasiwOlyYUSSei0AMm01JS9Ve4mGF7xl
 qwkWBTEMwHwIlG0fbdGhKzIcE+GKFL4hU4Ku7Aux30Stg8OpDzCanqLn+reAFmJhSZSo
 BLEIb5p8dwofBFMJlNifUcv6Th+Zb7bEipl/MhoO5l791NX4R/F13Vqzqgh8Acp6LlwO
 EIBjMl2fvthhrFfWRuqfWJfC6O/OyCibMXg+pIxPSCjahBUAT+jyYuRwNhiVsZfTG3TE
 O2TBT6Ldexf5sGu/TieNCun1BRs37LVGs51kzeR1qDIjEc/SsEy3FKqDxiNxoHHiEacw
 duFA==
X-Gm-Message-State: AOAM53000yrJJbtHIF6Ov+7hGZktWa8YVPyF4OGe0np9FkF4xpqfSjh6
 9Py8phEJjVUMAINNNA+AtRzFuyzseRysuqQ7
X-Google-Smtp-Source: ABdhPJzsQITYMBcoY+arfXgZCCe2S+m3q9kztvj+UEJA/oi9UfHhbPjfBL2K61wWty6jFD2yLRnsQg==
X-Received: by 2002:a0c:b59f:: with SMTP id g31mr7369877qve.28.1615744765054; 
 Sun, 14 Mar 2021 10:59:25 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] hw/ppc: Use hreg_store_msr for msr updates
Date: Sun, 14 Mar 2021 11:59:04 -0600
Message-Id: <20210314175906.1733746-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


