Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC64399C82
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:25:40 +0200 (CEST)
Received: from localhost ([::1]:46346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loifa-0001UQ-W9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid0-0006Bg-3Y; Thu, 03 Jun 2021 04:22:58 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37263 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicw-0008Sp-K0; Thu, 03 Jun 2021 04:22:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l3mPsz9sWQ; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=GuuWT+AZB91HvaEk+6OnldMA9W+8/0jQEHwPTYN/pJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SBcXWk4HFqmXB1tpQqAP0gGWK4OmYnEHP+BOgX3/ySwD174Qpdn3jv/wYOElFEbuW
 WxeMOyWPIY8nhihg31MKeoodWhLG84/dHJyoSsYfibw8n/0Win6sAro0NBGBo+9mC7
 YwNnnVQQRjhvH3nWKnWVH7gr6m3yxKL3DZ+pYmjs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/42] spapr: Don't hijack current_machine->boot_order
Date: Thu,  3 Jun 2021 18:21:54 +1000
Message-Id: <20210603082231.601214-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

QEMU 6.0 moved all the -boot variables to the machine. Especially, the
removal of the boot_order static changed the handling of '-boot once'
from:

    if (boot_once) {
        qemu_boot_set(boot_once, &error_fatal);
        qemu_register_reset(restore_boot_order, g_strdup(boot_order));
    }

to

    if (current_machine->boot_once) {
        qemu_boot_set(current_machine->boot_once, &error_fatal);
        qemu_register_reset(restore_boot_order,
                            g_strdup(current_machine->boot_order));
    }

This means that we now register as subsequent boot order a copy
of current_machine->boot_once that was just set with the previous
call to qemu_boot_set(), i.e. we never transition away from the
once boot order.

It is certainly fragile^Wwrong for the spapr code to hijack a
field of the base machine type object like that. The boot order
rework simply turned this software boundary violation into an
actual bug.

Have the spapr code to handle that with its own field in
SpaprMachineState. Also kfree() the initial boot device
string when "once" was used.

Fixes: 4b7acd2ac821 ("vl: clean up -boot variables")
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1960119
Cc: pbonzini@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210521160735.1901914-1-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 8 +++++---
 include/hw/ppc/spapr.h | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c23bcc4490..4dd90b75cc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1005,7 +1005,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
     _FDT(chosen = fdt_add_subnode(fdt, 0, "chosen"));
 
     if (reset) {
-        const char *boot_device = machine->boot_order;
+        const char *boot_device = spapr->boot_device;
         char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
         size_t cb = 0;
         char *bootlist = get_boot_devices_list(&cb);
@@ -2376,8 +2376,10 @@ static SaveVMHandlers savevm_htab_handlers = {
 static void spapr_boot_set(void *opaque, const char *boot_device,
                            Error **errp)
 {
-    MachineState *machine = MACHINE(opaque);
-    machine->boot_order = g_strdup(boot_device);
+    SpaprMachineState *spapr = SPAPR_MACHINE(opaque);
+
+    g_free(spapr->boot_device);
+    spapr->boot_device = g_strdup(boot_device);
 }
 
 static void spapr_create_lmb_dr_connectors(SpaprMachineState *spapr)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bbf817af46..f05219f75e 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -223,6 +223,9 @@ struct SpaprMachineState {
     int fwnmi_machine_check_interlock;
     QemuCond fwnmi_machine_check_interlock_cond;
 
+    /* Set by -boot */
+    char *boot_device;
+
     /*< public >*/
     char *kvm_type;
     char *host_model;
-- 
2.31.1


