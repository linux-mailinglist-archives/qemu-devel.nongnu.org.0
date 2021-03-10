Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F6333460
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:29:49 +0100 (CET)
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqTk-0003M4-FX
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqBJ-0004GV-Pk; Tue, 09 Mar 2021 23:10:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55091 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqBH-0004FU-MY; Tue, 09 Mar 2021 23:10:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf3NNZz9sj0; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=MUfs4+JETeZLAXM9XzFlrhnaPX5y/Vtl3oI/tTgM+sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MpeWv7ee6r98bXNw+a2bQmkKFbW5AWRMwbRFVq1ArWL2je6+Kcf2PLmQEIon4Nm/t
 njU+DBDeX3nPvsbu/5sw0AjMnm9nXH30YtUU8plR4te4i/Ns4wIWwpoU2H0pHeqZPh
 FKVefwpJI88ZZz/rZ+i/QNaVDYs+cGsGG4m73Jsk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 20/20] spapr.c: send QAPI event when memory hotunplug fails
Date: Wed, 10 Mar 2021 15:10:02 +1100
Message-Id: <20210310041002.333813-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Recent changes allowed the pSeries machine to rollback the hotunplug
process for the DIMM when the guest kernel signals, via a
reconfiguration of the DR connector, that it's not going to release the
LMBs.

Let's also warn QAPI listerners about it. One place to do it would be
right after the unplug state is cleaned up,
spapr_clear_pending_dimm_unplug_state(). This would mean that the
function is now doing more than cleaning up the pending dimm state
though.

This patch does the following changes in spapr.c:

- send a QAPI event to inform that we experienced a failure in the
  hotunplug of the DIMM;

- rename spapr_clear_pending_dimm_unplug_state() to
  spapr_memory_unplug_rollback(). This is a better fit for what the
  function is now doing, and it makes callers care more about what the
  function goal is and less about spapr.c internals such as clearing
  the pending dimm unplug state.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210302141019.153729-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 13 +++++++++++--
 hw/ppc/spapr_drc.c     |  5 ++---
 include/hw/ppc/spapr.h |  3 +--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b579830832..d56418ca29 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -28,6 +28,7 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
+#include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/hostmem.h"
@@ -3575,14 +3576,14 @@ static SpaprDimmState *spapr_recover_pending_dimm_state(SpaprMachineState *ms,
     return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
 }
 
-void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
-                                           DeviceState *dev)
+void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
 {
     SpaprDimmState *ds;
     PCDIMMDevice *dimm;
     SpaprDrc *drc;
     uint32_t nr_lmbs;
     uint64_t size, addr_start, addr;
+    g_autofree char *qapi_error = NULL;
     int i;
 
     if (!dev) {
@@ -3616,6 +3617,14 @@ void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
         drc->unplug_requested = false;
         addr += SPAPR_MEMORY_BLOCK_SIZE;
     }
+
+    /*
+     * Tell QAPI that something happened and the memory
+     * hotunplug wasn't successful.
+     */
+    qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
+                                 "for device %s", dev->id);
+    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
 }
 
 /* Callback to be called during DRC release. */
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 98b626acf9..8a71b03800 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -1231,12 +1231,11 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
 
     /*
      * This indicates that the kernel is reconfiguring a LMB due to
-     * a failed hotunplug. Clear the pending unplug state for the whole
-     * DIMM.
+     * a failed hotunplug. Rollback the DIMM unplug process.
      */
     if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB &&
         drc->unplug_requested) {
-        spapr_clear_pending_dimm_unplug_state(spapr, drc->dev);
+        spapr_memory_unplug_rollback(spapr, drc->dev);
     }
 
     if (!drc->fdt) {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index d6edeaaaff..47cebaf3ac 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -847,8 +847,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
 int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **errp);
 void spapr_clear_pending_events(SpaprMachineState *spapr);
 void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
-void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
-                                           DeviceState *dev);
+void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev);
 int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
-- 
2.29.2


