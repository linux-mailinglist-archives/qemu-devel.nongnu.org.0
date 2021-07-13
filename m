Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EBD3C7766
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:44:07 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OK6-0007ro-Ny
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OHD-0000t1-La; Tue, 13 Jul 2021 15:41:07 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OHB-0006Sy-54; Tue, 13 Jul 2021 15:41:07 -0400
Received: by mail-pg1-x536.google.com with SMTP id y4so20001667pgl.10;
 Tue, 13 Jul 2021 12:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2k+CaPOOV81A+TC8lkent/ZTVe10msUzKY0Lu+Jglxg=;
 b=WNGLDOd04y8XA5UsXAtWMNQSSXwgkudwMP7x8D/tOkWmyl07+0xRHYT9XuYQjyCwLW
 HU2arC8y/9/pk5/hLdnBqHjCsbch2qiOu0cXpXnKiWphFTd5W9DvVQYu3yzyVvCUCUs7
 rcfQAlwcqhBeD17iP3kkFpG5R0ge0zPYfbaYYxDE0YYsJA1VRcmGmFlcLxEHvg+qaIDv
 rhG6LXrtQglp8/yClCs3AY1kvwmCzw3RxW7X7o23obFo6Pa1BNyvvJcqfCkuOqjjzQgz
 oTMVk92p79HhgMavdwpRNoJj6gmMOx44PxPFctjcIWU7aPFXsqU11ViwGuPdBlYCNj+u
 hepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2k+CaPOOV81A+TC8lkent/ZTVe10msUzKY0Lu+Jglxg=;
 b=I+NXYu0vjc9REv2zGwvHNKf/WnGvz6UjJcAtSVWD01BVyLvY1WQtnynWmZPFBozJcU
 LykqeLuZmFlqQ/fIBhwQBHTeTv23z5wCa51YAVqr1aCdXjAOG0VzRb8EAE5SCtpXrfh1
 Y/9P62ZPglmzCEbER/fdWSBbqWuusna4H137qWUDGwUq5s7eOH9Po1KBUG2zp9H1WDsg
 o62bumHEyDyf8bjQhUcPrn92x3DqL/h3PjqPJDkPskvQ7K2dDsLuFsmvHVkusXO5QgTF
 XfhWH8NSxEwFz5EPIDFw3ybigELOqsLLOQwC2VUjqEw9HFg0pd5KGHC2VQ56GqmbIze9
 zkww==
X-Gm-Message-State: AOAM530gWQ4jObJqgb98FnMAI0u9f1RiLM+nOz/dM7eEaot0i+exmNRe
 5fh35w8HQfEGDDOSSPCeQ4uuni9OnGj4vBVfpLQ=
X-Google-Smtp-Source: ABdhPJzfNS9yMDv71L+FVdg2K7IQosTfORCag5QvePrhbJGCWKCN08CNBBrWKkt6aMKbvi6TznkhCQ==
X-Received: by 2002:aa7:8148:0:b029:31b:10b4:f391 with SMTP id
 d8-20020aa781480000b029031b10b4f391mr5911171pfn.69.1626205263426; 
 Tue, 13 Jul 2021 12:41:03 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id o72sm20077506pfg.44.2021.07.13.12.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 12:41:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 4/5] spapr: simplify spapr_numa_associativity_init
 params
Date: Tue, 13 Jul 2021 16:40:44 -0300
Message-Id: <20210713194045.916263-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713194045.916263-1-danielhb413@gmail.com>
References: <20210713194045.916263-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x536.google.com
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
index 1b7f706996..76f1637959 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1800,7 +1800,7 @@ static int spapr_post_load(void *opaque, int version_id)
      * initialized and hotplug operations won't fail in both before
      * and after CAS migration cases.
      */
-     spapr_numa_associativity_init(spapr, MACHINE(spapr));
+     spapr_numa_associativity_init(spapr);
 
     return err;
 }
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 1cc88716c1..a721d3edce 100644
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
index 1c894bf877..bba5a984e4 100644
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


