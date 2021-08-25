Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1E3F778E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:41:18 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu5d-0001Y4-2f
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4P-0007ii-NK; Wed, 25 Aug 2021 10:40:01 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4N-00073g-UF; Wed, 25 Aug 2021 10:40:01 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bk29so21626448qkb.8;
 Wed, 25 Aug 2021 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yOSCA/HZ/SuuAau7Y9wbZ/0p1CppJhBCkxM31XBlSf0=;
 b=UgjJEISimTZzathTN/ha772kQ9GXvAAGPMdmdH4amFHd4pQkeCZWKSa3Tnj4wsdL/o
 gGzwnN2ArraKIKnCsaxOnGi1WATh0DWkS41BEbp3JQeLczkfdjF5jSd+7uXFVacAPZzo
 qXhYPOSzph5EsItI6kOVSJsbyY2qiZNnLDeLS94ZcN14TIFj4qWXUVvIUpNTT2C0tyEW
 siz9euikdRt7arknSMddvxU9v8FtFH82EAZArYvG/atrF8Wupf3JkJzd9dOFips+hI77
 crlQYH1vVJLkYPdYtH2pOd7x842qR6qlCn5JTIExPenixDAB2D6qt8wEgsS6knQVAFrc
 byMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOSCA/HZ/SuuAau7Y9wbZ/0p1CppJhBCkxM31XBlSf0=;
 b=MjfLPgLHhm07tr5clJMN25DX1PQvgR1aTUpWjHDTjNNyecHaFL6SIWn7moOumq2a6H
 OhHw7BrE8tWRg6PYF6YfTON+dnHH5KzXC0kJMnEJXjUX28JLHom3iKL67f1We4h5zFbt
 IcgI4XwUMor1oOyqEb9xdzyl6XQU79tb0Cwawgbd0w2wfypDP/ZAtMibrzFDAmo645ap
 TymCeocTfrZpRGjaK/JwyCJ2sgwdZQMfoRRITKfRfAMZa6cS1llQ1+RCaLm7lfqepL+5
 tgjzXYr1tJG1yQF70jp20Vdc+sxHBSSp2AVytXpzaozP8CrfBSvPMkwCkJnzZRHWu1c8
 Q7lw==
X-Gm-Message-State: AOAM533GFEcmHSQszU5DW9W/0d0mWHZb7G22JpD90tP/8bC9uUyK7L3F
 rmf9hewDGy1TOqMoSQMrO5x3uhISpgM=
X-Google-Smtp-Source: ABdhPJz1N69JHD8X4Z6XmEdS30dYxwz9sz+c8ezJCMyRacuGWRYEQOOZUHxRPJs1X63WWOb+7VdJKw==
X-Received: by 2002:a37:2754:: with SMTP id n81mr31736711qkn.297.1629902398407; 
 Wed, 25 Aug 2021 07:39:58 -0700 (PDT)
Received: from rekt.ihost.com ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id 69sm129819qke.55.2021.08.25.07.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:39:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v3 2/5] spapr: move NUMA data init to post-CAS
Date: Wed, 25 Aug 2021 11:39:40 -0300
Message-Id: <20210825143943.529733-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825143943.529733-1-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pSeries machine will support a new NUMA affinity form, FORM2.
This new FORM will be negotiated via ibm,architecture-vec5 during
CAS. All artifacts and assumptions that are currently on use for
FORM1 affinity will be deprecated in a guest that chooses to use
FORM2. This means that we're going to wait until CAS to determine
whether we're going to use FORM1 and FORM2.

This patch does that by moving all NUMA data init functions to post-CAS
time. spapr_numa_associativity_init() is moved from spapr_machine_init()
to do_client_architecture_support(). Straightforward change since the
initialization of spapr->numa_assoc_array is transparent to the guest.

spapr_numa_write_rtas_dt() is more complex. The function is called from
spapr_dt_rtas(), which in turned is called by spapr_build_fdt().
spapr_build_fdt() is called in two places: spapr_machine_reset() and
do_client_architecture_support(). This means that we're writing RTAS
nodes with NUMA artifacts without going through CAS first, and then
writing it again post CAS. This is not an issue because, at this moment,
we always write the same FORM1 NUMA affinity properties in the DT.
With the upcoming FORM2 support, we're now reliant on guest choice to
decide what to write.

The proposed solution is to change spapr_numa_write_rtas_dt() to not
write the DT until we're post-CAS. This is a benign guest visible change
(a well behaved guest wouldn't bother to read NUMA properties before CAs),
but to be on the safe side, let's wrap it with a machine class flag to skip
this logic unless we're running with the latest machine type. This also
means that FORM2 support will not be available for older machine types.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         |  6 +++---
 hw/ppc/spapr_hcall.c   |  4 ++++
 hw/ppc/spapr_numa.c    | 11 +++++++++++
 include/hw/ppc/spapr.h |  1 +
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 5459f9a7e9..d8363bda88 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2809,9 +2809,6 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr->gpu_numa_id = spapr_numa_initial_nvgpu_numa_id(machine);
 
-    /* Init numa_assoc_array */
-    spapr_numa_associativity_init(spapr, machine);
-
     if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
@@ -4709,8 +4706,11 @@ DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
  */
 static void spapr_machine_6_0_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
+
     spapr_machine_6_1_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    smc->pre_6_1_numa_affinity = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_0, "6.0", false);
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e40..1cc88716c1 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -11,6 +11,7 @@
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
+#include "hw/ppc/spapr_numa.h"
 #include "mmu-hash64.h"
 #include "cpu-models.h"
 #include "trace.h"
@@ -1197,6 +1198,9 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
+    /* Init numa_assoc_array */
+    spapr_numa_associativity_init(spapr, MACHINE(spapr));
+
     /*
      * Ensure the guest asks for an interrupt mode we support;
      * otherwise terminate the boot.
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 04a86f9b5b..b0bd056546 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -379,6 +379,17 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
  */
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
 {
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+
+    /*
+     * pre-6.1 machine types were writing RTAS information before
+     * CAS. Check if that's case before changing their existing
+     * behavior.
+     */
+    if (spapr_ovec_empty(spapr->ov5_cas) && !smc->pre_6_1_numa_affinity) {
+        return;
+    }
+
     spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
 }
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 637652ad16..068a29535a 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -145,6 +145,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_1_numa_affinity;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,
-- 
2.31.1


