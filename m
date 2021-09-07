Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2E4021A6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:28:07 +0200 (CEST)
Received: from localhost ([::1]:37204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNOy6-0006cZ-Hk
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvn-0003rq-14; Mon, 06 Sep 2021 20:25:43 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvl-0005h7-9F; Mon, 06 Sep 2021 20:25:42 -0400
Received: by mail-qv1-xf34.google.com with SMTP id a5so4864381qvq.0;
 Mon, 06 Sep 2021 17:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewk+Cj943TQXjiQMHnCOouOqj0zsxj96uycEsJ7iacA=;
 b=hGxtgFR4QIt4a/c7no6t3I16GC6p4+o6thEPdvdVTmvuNdHoKTmyQK6vbS8YmC+V3M
 eq46biZVPmUwqh64PwI39dGYfDUNonUx/5t7zVaW4H+3YwnXEZUKt15ytTxlTJbTp9mN
 OtUr+oep73lWPSX0HnJ3fmPS3NkIUfPRf8Md5dV5T1Y0gan3U6YueTFydOop8oh0smHz
 WOHIdUH6Gx0sUbLatTvFQTDulgOe3pn/NY9996yDscVGTlGF/vM0w7w6IDUGMyIJr7bF
 ZrsSXZjEFPL/76m2Dk8/6oV1pZWeHsDbwrQQemHdMurhMIYTO6sTTUkpUYEHW6ojw7jX
 /nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewk+Cj943TQXjiQMHnCOouOqj0zsxj96uycEsJ7iacA=;
 b=IouIgTGPgXQwBlGvnkanWbGGKpAmtmsWHyDzPcitm5aVOtxBiBDOrEzYAEp7cyueWH
 4sbRY+djaIcDRaYFBBulbB2Xh58z75rm1F564iB/5g3ofr0f2DMjJQ4RK2AdBIEL1xhb
 lay1pTPNPQvQMUWjDbgMNfcyQ4obwh8xK90R7AWMsP2LFySZQkzEMwsc+/T4x8FMbacb
 dTsRzAJ66/qZhvS1cMUEDjAZcjh2+n+z8zoZM+ZSZ5LlFn4nEZoYRCD5HSiEAhSftx+h
 riyNvRcVL7GsjRoozYSnEXfLfhV31eWZAvQPBNjq2ubfKvJnRs6v5w3Hb9ORZH2DftqU
 dU7w==
X-Gm-Message-State: AOAM530D/Qq7enQ2J/DBmiJZLlCRa9BMtPmPG1iT6GbE4Zf5z3N3niin
 Dwd8reNctO1aJbfT765YR5prSJezaGc=
X-Google-Smtp-Source: ABdhPJwsXN3m36/ldZc2Cmjcj/F89RFm5Z3/EHjoY9OBVAM5WQEpR50IIDtlOymmQn0wWKUEdpd0dQ==
X-Received: by 2002:a05:6214:1142:: with SMTP id
 b2mr14792764qvt.0.1630974339955; 
 Mon, 06 Sep 2021 17:25:39 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id 207sm7892056qkh.45.2021.09.06.17.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:25:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] spapr: move NUMA associativity init to machine reset
Date: Mon,  6 Sep 2021 21:25:24 -0300
Message-Id: <20210907002527.412013-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907002527.412013-1-danielhb413@gmail.com>
References: <20210907002527.412013-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf34.google.com
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

At this moment we only support one form of NUMA affinity, FORM1. This
allows us to init the internal structures during machine_init(), and
given that NUMA distances won't change during the guest lifetime we
don't need to bother with that again.

We're about to introduce FORM2, a new NUMA affinity mode for pSeries
guests. This means that we'll only be certain about the affinity mode
being used after client architecture support. This also means that the
guest can switch affinity modes in machine reset.

Let's prepare the ground for the FORM2 support by moving the NUMA
internal data init from machine_init() to machine_reset(). Change the
name to spapr_numa_associativity_reset() to make it clearer that this is
a function that can be called multiple times during the guest lifecycle.
We're also simplifying its current API since this method will be called
during CAS time (do_client_architecture_support()) later on and there's no
MachineState pointer already solved there.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 6 +++---
 hw/ppc/spapr_numa.c         | 4 ++--
 include/hw/ppc/spapr_numa.h | 9 +--------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d39fd4e644..8e1ff6cd10 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1621,6 +1621,9 @@ static void spapr_machine_reset(MachineState *machine)
      */
     spapr_irq_reset(spapr, &error_fatal);
 
+    /* Reset numa_assoc_array */
+    spapr_numa_associativity_reset(spapr);
+
     /*
      * There is no CAS under qtest. Simulate one to please the code that
      * depends on spapr->ov5_cas. This is especially needed to test device
@@ -2808,9 +2811,6 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr->gpu_numa_id = spapr_numa_initial_nvgpu_numa_id(machine);
 
-    /* Init numa_assoc_array */
-    spapr_numa_associativity_init(spapr, machine);
-
     if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 779f18b994..9ee4b479fe 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -155,10 +155,10 @@ static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
 
 }
 
-void spapr_numa_associativity_init(SpaprMachineState *spapr,
-                                   MachineState *machine)
+void spapr_numa_associativity_reset(SpaprMachineState *spapr)
 {
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+    MachineState *machine = MACHINE(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int i, j, max_nodes_with_gpus;
     bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 6f9f02d3de..0e457bba57 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -16,14 +16,7 @@
 #include "hw/boards.h"
 #include "hw/ppc/spapr.h"
 
-/*
- * Having both SpaprMachineState and MachineState as arguments
- * feels odd, but it will spare a MACHINE() call inside the
- * function. spapr_machine_init() is the only caller for it, and
- * it has both pointers resolved already.
- */
-void spapr_numa_associativity_init(SpaprMachineState *spapr,
-                                   MachineState *machine);
+void spapr_numa_associativity_reset(SpaprMachineState *spapr);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
-- 
2.31.1


