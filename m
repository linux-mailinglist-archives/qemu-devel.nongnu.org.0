Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28107307972
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:20:39 +0100 (CET)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5966-0003gX-3U
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593e-0001GW-3u; Thu, 28 Jan 2021 10:18:06 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l593S-0003TA-Ms; Thu, 28 Jan 2021 10:18:05 -0500
Received: by mail-qt1-x82e.google.com with SMTP id h16so3183054qth.11;
 Thu, 28 Jan 2021 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/s7AFYY3ob+DDHZCiZzxMY5KJpsEqCyeH2D7K+jx/V0=;
 b=HjZ2Qm7IaPqdcVYV1uFGHzW+ynV+WcU7SDNKP5+wYdJKeMvJKBDCs29ybERuRPoyW7
 epvyaJzMWMgvafgVNizbVk8ci/ORq6Lt4oMlAC0YfETVGse1pgejStf3qKhECFAfc6/z
 jZpyYAjomDcG84OzzHOdBr85kAvl/b1WgwMfEcHuO6nhMuImvD1hW9swjkJo3h+fILNG
 CbGOxSIGL+p2vUxHkzhQuug9lYub8pW7GT9qt15U0ZKmeVCgCAwad0wtF4eNNX/3xape
 Y5kDQoSOUM5bs6G3gBoJu+nwhBjoU7FqmoB+bXhS5eqXnGD8mAA3fg61H7V0fJQgy0c/
 thsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/s7AFYY3ob+DDHZCiZzxMY5KJpsEqCyeH2D7K+jx/V0=;
 b=QnDewRBg1hnWsFsGgYYEWvbNcpBHTD+KaGlRzCgLUlL5Hadi5BufmlK+qDR3nNFwEF
 z5Z0gFrHDUttsOe6XjdDS6U2+GAYzebdIEigQ43KprpqscF9Pe/RLdcfkMjLEApfL3DL
 Ki+TvTjb9yiBbVPp4I6a8c5R5h4Y6UrvqjhpLxMqSDgveRmmIiGt/XVzXSiEJRMflgAs
 HSdPCyaCXMqUkHYKGNKKMwBmxrHDecSyFvb90yTOoHPbRwvN89Sht6t4Pjjzht2lftNS
 1XKJ+qimvTs9C17wNwu6WtqLRDGcvw2+WU0FCd89YomLC2KjuQ1COeuREOewCKhh8LzJ
 F8FA==
X-Gm-Message-State: AOAM531fwCL1nz/laN1fScsWf7rG8bQ9th0+R07tg+3UaLzsiHxFpojs
 bofC2GDuAAwyWwX2UM6uBgH+wDffbt451A==
X-Google-Smtp-Source: ABdhPJwAEsr+gtu3VOcXwyS9oQsPNaD0fdi4UEUT6abNjWPtOgTUGeF/gKOBfqSfwntEtHtqA8vYhg==
X-Received: by 2002:ac8:39e6:: with SMTP id v93mr14893067qte.139.1611847070962; 
 Thu, 28 Jan 2021 07:17:50 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6df1:6267:881f:cc79:a1f7])
 by smtp.gmail.com with ESMTPSA id g131sm810855qkb.91.2021.01.28.07.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:17:50 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] spapr_numa.c: create spapr_numa_initial_nvgpu_NUMA_id()
 helper
Date: Thu, 28 Jan 2021 12:17:30 -0300
Message-Id: <20210128151731.1333664-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128151731.1333664-1-danielhb413@gmail.com>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll need to check the initial value given to spapr->gpu_numa_id when
building the rtas DT, so put it in a helper for easier access and to
avoid repetition.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 12 ++----------
 hw/ppc/spapr_numa.c         | 14 ++++++++++++++
 include/hw/ppc/spapr_numa.h |  1 +
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2d60c6f594..c2b74cbfdf 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2765,16 +2765,8 @@ static void spapr_machine_init(MachineState *machine)
 
     }
 
-    /*
-     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
-     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
-     * called from vPHB reset handler so we initialize the counter here.
-     * If no NUMA is configured from the QEMU side, we start from 1 as GPU RAM
-     * must be equally distant from any other node.
-     * The final value of spapr->gpu_numa_id is going to be written to
-     * max-associativity-domains in spapr_build_fdt().
-     */
-    spapr->gpu_numa_id = MAX(1, machine->numa_state->num_nodes);
+    /* Init gpu_numa_id */
+    spapr->gpu_numa_id = spapr_numa_initial_nvgpu_NUMA_id(machine);
 
     /* Init numa_assoc_array */
     spapr_numa_associativity_init(spapr, machine);
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 261810525b..f71105c783 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -46,6 +46,20 @@ static bool spapr_numa_is_symmetrical(MachineState *ms)
     return true;
 }
 
+/*
+ * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
+ * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
+ * called from vPHB reset handler so we initialize the counter here.
+ * If no NUMA is configured from the QEMU side, we start from 1 as GPU RAM
+ * must be equally distant from any other node.
+ * The final value of spapr->gpu_numa_id is going to be written to
+ * max-associativity-domains in spapr_build_fdt().
+ */
+unsigned int spapr_numa_initial_nvgpu_NUMA_id(MachineState *machine)
+{
+    return MAX(1, machine->numa_state->num_nodes);
+}
+
 /*
  * This function will translate the user distances into
  * what the kernel understand as possible values: 10
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index b3fd950634..6655bcf281 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -31,5 +31,6 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
                             int offset, PowerPCCPU *cpu);
 int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
                                          int offset);
+unsigned int spapr_numa_initial_nvgpu_NUMA_id(MachineState *machine);
 
 #endif /* HW_SPAPR_NUMA_H */
-- 
2.26.2


