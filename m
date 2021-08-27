Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4183F96F6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:28:29 +0200 (CEST)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJY9v-0001W3-J4
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6w-0004LT-2e; Fri, 27 Aug 2021 05:25:19 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6t-000285-Oi; Fri, 27 Aug 2021 05:25:17 -0400
Received: by mail-vs1-xe34.google.com with SMTP id f6so1493996vsr.3;
 Fri, 27 Aug 2021 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/RBuURFl7IIP03Fau1N3HbRXBUulZQwHVMl3hHQ/KLU=;
 b=CqohY6KL1WE0llmV/WIpC4k+wN+zhLOmg1PyaCzmhrRQ3ZfiY1+YbB89FYJCieHW3a
 JR/kLWGH7wJ628KTWgW+QKXEDjOrv6Kl60vBQ5AaQyZ5vfCrbDbgwbeiniRA437tjpeP
 KRrsJ5KAfifXKNnbsvpglcMa7tJRU+V7XyJqW7bJ/H6dBLz4xnGyL8fbdJyleZYiO2QT
 NkYzkBK29UEiSPXl09m2HMOivVXdCvj9RnDC9E5tjIns4PhjH74FxJ9EE/1KuQyEFXQj
 ZDjU2VVNLgP4aoy4APKyO7nXOeOx+u+WkcsE/NRJXpUSxrLfKmVQpg2/tJFA6RPDBTh0
 kgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RBuURFl7IIP03Fau1N3HbRXBUulZQwHVMl3hHQ/KLU=;
 b=TEO5Li+wnqLkJNmCYc0GxvqrzHFZe3OdR+/fykNhdNqkV9MX6b8AuCIOWjKmw6WH2n
 CedSjxLvorBDwMq2hoXVM+5CFNUl++ZlJEWtlTa/CWeU+6xXQn8I8fWM3b9QXrAsXXdg
 +jn8b7idLiGxr96cu6Uk8CbwiovV8DfW3UyVKo1GxjoZwaMSQ8fPWk3PqAzlVOf4tMJW
 yELfmj0Z5IqqS66cyNPUPlMXLGFS+yqKBL3P+8zt+qp98RNWKSvA9ibofAvOOYPPOHHr
 diJ1uZj3LXGg3Wc8RidVCjK5Q9uLFf3ITPXmFUjucMrYPQ6jWCDKdCmI3S5qNvLPhFBz
 JqXA==
X-Gm-Message-State: AOAM531he6L8mxPfowuW1HOytpj1ZDMkUdn3wqoCXneKlFBrcAO9XeL5
 i8+QN5E3dqHURyaJxhvB6Ws4LNDaMA0=
X-Google-Smtp-Source: ABdhPJyuo1PceZmcqgOajBY9YRBbf5A3Bi9RZPG9lsLXxdZ7n0ksJ1e0S+3cctcuK0GtNuOTW80drg==
X-Received: by 2002:a67:ee46:: with SMTP id g6mr5852765vsp.6.1630056314095;
 Fri, 27 Aug 2021 02:25:14 -0700 (PDT)
Received: from rekt.COMFAST ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id d17sm629180vsj.9.2021.08.27.02.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:25:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] spapr: simplify spapr_numa_associativity_init params
Date: Fri, 27 Aug 2021 06:24:54 -0300
Message-Id: <20210827092455.125411-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827092455.125411-1-danielhb413@gmail.com>
References: <20210827092455.125411-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe34.google.com
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
index a3eb33764d..63c4876415 100644
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
index 0a5fa8101e..2f261be9fd 100644
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


