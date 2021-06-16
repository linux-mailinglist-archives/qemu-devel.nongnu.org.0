Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D223A8E6C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:33:48 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKR9-0007yv-9H
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDy-0003am-UU; Tue, 15 Jun 2021 21:20:10 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDw-0004JA-Ua; Tue, 15 Jun 2021 21:20:10 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id e18so740021qvm.10;
 Tue, 15 Jun 2021 18:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2AxgRPQ+y0q+DrPNTDfWMYzC9qLv0yalxAo5OxvugA=;
 b=UZibSLqsuK86RoXygrsu1SFy4KuzXufxkdpSjcm+voyGi+ImDpUbYTBwTDMIeCF9pV
 NFmAv4feM1S2KUWKIJ4pZVBvRmQ2Nxfdd3fJcvlJB2gjbxNGqXwhM1b7t5VveaV/qiDo
 w/Y5snHMYp0DKGwGQhTEZ8RLZTQy5eXxP8tLCLilnihDWSmzr9nNcexUzCmBzjYUUSAg
 SAsJbtjneIacsv8Dn1xX1LhOnRTXfdQP/nvTxyC4tN1wlHEzbFBu2UWbglLgshQajLmg
 HLkv2LiIOtjiAehK48Sg1SpGkr6let+KeCFs0LR7q+aezF5jOS+qtPowJ2m6LQYjHSlc
 Ft+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2AxgRPQ+y0q+DrPNTDfWMYzC9qLv0yalxAo5OxvugA=;
 b=Mg4SaIyDqNh6gHPmS9M9FvS4MPPif9j1CpMTHeLeo2SqeHRC/j7Wt6lCULFAp8Knne
 qt6hHSYZc1+zEHBTsflDOaFB7yZmcBY41nEIFZqU8TIAKFhUmlBLxJERN69qxDmVRZIN
 cddOV2XmKfltZ9fR/iCf6sPSqBAyN+ZuOpGt2IU/EH9w0SBZXhBrvjD+uiuv1p0K/A7b
 MkAECcb+tIAw9saRtl8zlpQfMPhQEqKmCvujFaI01dfFYofLkmSRn5zwoS/Nj2B520n7
 abFYjj8SY/ulZ7bRJSReezdWHDJOM0A6BpG1cTbO85lLGbXq1nNJlhqJM3LBa/amQi7/
 mnUg==
X-Gm-Message-State: AOAM532UyvbQ1NeZWhmLKQUSo3TdWc7LCQyuF3d/GPPwWMGLV2VFRONq
 mOjIbgtTWnfo/IMs+TK4XooHC/hp31E=
X-Google-Smtp-Source: ABdhPJySKQzLtmGonH0wy9gtaQQtn4yRfYMi6iDheZDSGEkutTwXO+Yp2/iY2+RQCtfib+yxBc1wVQ==
X-Received: by 2002:a05:6214:258c:: with SMTP id
 fq12mr8394499qvb.30.1623806407309; 
 Tue, 15 Jun 2021 18:20:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:20:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/7] spapr: simplify spapr_numa_associativity_init
 params
Date: Tue, 15 Jun 2021 22:19:41 -0300
Message-Id: <20210616011944.2996399-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
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
index 3f655d5084..b6b822a065 100644
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
index 4298a4ecdb..8678ff4272 100644
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


