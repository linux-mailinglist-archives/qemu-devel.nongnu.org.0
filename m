Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC133F7796
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:42:55 +0200 (CEST)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu7C-00064y-Lr
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4U-0007zW-1M; Wed, 25 Aug 2021 10:40:06 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4S-00076Q-93; Wed, 25 Aug 2021 10:40:05 -0400
Received: by mail-qk1-x72e.google.com with SMTP id a10so18493331qka.12;
 Wed, 25 Aug 2021 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jajBmL3t0iOiGu48aSFaJh0GfM64YIjgMN3vMvlSCrM=;
 b=uAw+FcT6HFCAoANBZ3DWRuE/g6xobCwbCEUNwEmGdzI5OoFJxGCTMym2OPNPAbDgcb
 Xly34JxyWfegZXdNyJhNE+/5WaL5+8+TtHPklniaHoR0FZTolJLQiRTWQ4oDJ/qDna31
 yARK3a3071eICkF6bzECGXrKr4SuU5/yxT7ai+woCCoUfmw55jpLAMjv1KLzRy4VGRk6
 CRQl9BmLOkxcpySsoUn+OR35iiVhFcxoWZQIWId6Jw3DNoSEX55iBGUtuX/fvq5IB2rf
 pbc0QxJPJclPJWib1k6EhP2RyN2hORreRDjoY0FXlSDUFyG43qC30oLkttvwqAV//5oD
 A6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jajBmL3t0iOiGu48aSFaJh0GfM64YIjgMN3vMvlSCrM=;
 b=jiQH/Z7BkY6yM0197CWeUSjmh90SfDB025f9u85BfD/B3meudKv/O145mIluFaLyAU
 XdNY9yw2SZyyXvSh6+tm1x6WLDG6tQ++RyHm7nN+yE9gk/toc0rKNi/mkRSTtixFYNq/
 bKlrsOzd+/aqugX2mxBeW29FGhOn34Izjs/8McE97lKgu30YOoDluq9BjZuQDVQs44X7
 hxC/bvW71EpIwLi5xTShuDcXLcvXc9Ld9k9svPF8iyDlpRcNd0ZwoW1ThxgYJa/pfry+
 a46Suwege/a0dfOrNk3O2xzd5kebDtUwEXwZTNS+ffDXHPBO0hx3wPmwTKLyzHo2XL8j
 9Lig==
X-Gm-Message-State: AOAM531IDsw0/CuH6K2b0zkKpLzYcreEbioqKXfs7Yq0GUvvHypEaqav
 NJhGS+lf/GYfzIPI4yX5CMxWHBRSdIU=
X-Google-Smtp-Source: ABdhPJyAyvUnFlTxmnECslHlWs+Cw793unHPrtmYInE7IR56NKn4FyBfTYD6gntE/4sLqZDyieiB3A==
X-Received: by 2002:a05:620a:1379:: with SMTP id
 d25mr32653014qkl.238.1629902402703; 
 Wed, 25 Aug 2021 07:40:02 -0700 (PDT)
Received: from rekt.ihost.com ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id 69sm129819qke.55.2021.08.25.07.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:40:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v3 4/5] spapr: simplify spapr_numa_associativity_init
 params
Date: Wed, 25 Aug 2021 11:39:42 -0300
Message-Id: <20210825143943.529733-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825143943.529733-1-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
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
index 69c7239c48..7ea7605abf 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1801,7 +1801,7 @@ static int spapr_post_load(void *opaque, int version_id)
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


