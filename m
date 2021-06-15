Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D13A7365
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:39:31 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy38-0001Ec-UO
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxc-0000HN-QL; Mon, 14 Jun 2021 21:33:48 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxa-0002ZK-VH; Mon, 14 Jun 2021 21:33:48 -0400
Received: by mail-qk1-x72c.google.com with SMTP id g19so7673841qkk.2;
 Mon, 14 Jun 2021 18:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYGtZHRoFpB+hNiVeJI9fya+wJI+iK+132NMdUE4Zt0=;
 b=Atu5l02QMnsCVTEL7zVMthUoqeen9P/Bqms3Gxgwa/6d4gpsoh4+7kp9o2rL2Y9n5Z
 R6yct0NCsywxJgefN89qdnChOs0CjTXTF+f+jUckkr2+PPDbO4OcsLb2PE74rgpAq3jH
 zVcqR9H86yIeTKO7MiogDAijQlOidYo/gU4Zn1RXoH8EJXi825JeH5F62tzfTZoypvl+
 eeuqKdZtnSl+Nn5Cffm8yD0MT2Es9PCZscPHFav3XsqC6piZTHlHiwnBpFxG+z2t4O6C
 xTd2Ln8hV9Q16jXEoPM0deUGUNiJu6FhyETy1kZQltGkWfDryI2T1yH1XeJGjxIBngPD
 DZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYGtZHRoFpB+hNiVeJI9fya+wJI+iK+132NMdUE4Zt0=;
 b=gFdQiQYNwirgTvpLdfX0Zx0P42u3ihazIZqzulPtZKmRmDqUyc7M4HM2pT50wNw5e6
 RkCIDRDj3fbjHba2Hhy0kxIjxjPGvRuBp6S1jSp9nNtQSYOU5X2cZ7pj9/TzPMLpMrez
 BhRbCL0pAYTqwpb20vpFhxyNVrDMQ46NVKEkt+1KD+BxIZFHNP/nKlIcQ6ajLQh+JJxL
 s2p+wP4ss6xDLv737O7l8NQNS2LQNzqrQN5JZVPjki2tzJKMUWN0wEurYiQAx9iCsKkw
 mVaTCMAaS8kNz0VkzRVR0MQzX26+SvqGIzblm0H5uLUqk2rte+jJMcK4gbIjo3aWd9+c
 ocyA==
X-Gm-Message-State: AOAM532UR1sMhwr5zJduZeRi7OQeS5uwy9iLF5z0YaoEG0rFNyIb9lqT
 Tv5A0d6LG5PrZt8NC7fUaracDmn+WMqmUQ==
X-Google-Smtp-Source: ABdhPJyOAP7KL3/GnzJN55nOMDFIq/ZW7TFuGMHeXcfn91C5VGR98VOArDv9qzLlIou/kAJ2lkLedg==
X-Received: by 2002:a37:9d93:: with SMTP id g141mr666948qke.350.1623720825502; 
 Mon, 14 Jun 2021 18:33:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/8] spapr: simplify spapr_numa_associativity_init params
Date: Mon, 14 Jun 2021 22:33:06 -0300
Message-Id: <20210615013309.2833323-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615013309.2833323-1-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When spapr_numa_associativity_init() was introduced it was being
called from spapr_machine_init(), where we have pointers to a
SpaprMachineState and a MachineState. Having both being passed
as params spared us from calling a macro to get the MachineState.

Previous patches moved the function away from spapr_machine_init(),
and the new locations doesn't have a pointer to MachineState ready.
This resulted in  MACHINE(spapr) macro calls as the second parameter
in both callers.

Simplify the function by folding the 'MACHINE(spapr)' macro into the
function body, which can now receive only a pointer to
SpaprMachineState.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 2 +-
 hw/ppc/spapr_hcall.c        | 2 +-
 hw/ppc/spapr_numa.c         | 4 ++--
 include/hw/ppc/spapr_numa.h | 3 +--
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c6def3690a..c70b8b2f44 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1784,7 +1784,7 @@ static int spapr_post_load(void *opaque, int version_id)
      * initialized and hotplug operations won't fail in both before
      * and after CAS migration cases.
      */
-     spapr_numa_associativity_init(spapr, MACHINE(spapr));
+     spapr_numa_associativity_init(spapr);
 
     return err;
 }
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 6d6ffcc92b..73aca0aed6 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1199,7 +1199,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr_ovec_cleanup(ov1_guest);
 
     /* Init numa_assoc_array */
-    spapr_numa_associativity_init(spapr, MACHINE(spapr));
+    spapr_numa_associativity_init(spapr);
 
     /*
      * Ensure the guest asks for an interrupt mode we support;
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index c8fd66b53a..b14dd543c8 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -181,9 +181,9 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     spapr_numa_define_associativity_domains(spapr);
 }
 
-void spapr_numa_associativity_init(SpaprMachineState *spapr,
-                                   MachineState *machine)
+void spapr_numa_associativity_init(SpaprMachineState *spapr)
 {
+    MachineState *machine = MACHINE(spapr);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int i, j, max_nodes_with_gpus;
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 6f9f02d3de..adaec8e163 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -22,8 +22,7 @@
  * function. spapr_machine_init() is the only caller for it, and
  * it has both pointers resolved already.
  */
-void spapr_numa_associativity_init(SpaprMachineState *spapr,
-                                   MachineState *machine);
+void spapr_numa_associativity_init(SpaprMachineState *spapr);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
-- 
2.31.1


