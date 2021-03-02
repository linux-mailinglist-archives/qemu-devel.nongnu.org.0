Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA932A1EA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:13:46 +0100 (CET)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5mT-0006C5-O7
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH5jR-0002XL-Na; Tue, 02 Mar 2021 09:10:37 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH5jQ-0007Ar-1e; Tue, 02 Mar 2021 09:10:37 -0500
Received: by mail-qt1-x82b.google.com with SMTP id d11so14062587qtx.9;
 Tue, 02 Mar 2021 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9fwOsf4h4Zxs4SDJYLpTerj4S9PMfTXqWrjqx6FH30=;
 b=hGVeu3tx6NcID/A2LZD79wD+UAReMncjHsHVq8Yzis9cNxjnbs9yiO+YHWLiPmFpuG
 ZEEKO+UNxsy49hCqdoFv/+KVdar8rEBLs+a4rSSVozlENU6abYUUmHLfpsMujVLllak9
 iFhE/D4jh5BVDHdwuWBhWqb7Ffn+ZKj5at0z+FzZnp6S8TIaA7KNtxN9Btb1QPrDHaj8
 5mSA+syEo/XA8zk31Cdq1MwpQZ1f9dU8Au5ux+X7zca24VDXGjdgqtMXzrQa+J4gY+fi
 Ja1H7Dlx44HV1OLKQ63AYTq3IxR//ERbq0PqPYfuESj2QM3iqW/I4ZssAjxHEz7LIWXe
 PBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9fwOsf4h4Zxs4SDJYLpTerj4S9PMfTXqWrjqx6FH30=;
 b=HGZo+np45SJezYJXP3ZaXv8kZLCvz+moiJfXgjpFcYaIGdzQB63DtbI73DEfstoFLt
 r48JfTsOAYVz4uIQGV63hwCXR7zDtBjg++voSfFxqarwAb5FruoDDCg9dAmK+4PUGVnl
 4uGTnzuoeuS5le+pHX5nydxs834KGeaztuWdmWiXeWHRPEUcY1cBRdAJayJ2Qteuj1gO
 Xm/CNpJgpJ4o4XOxYu4q0ahElc4ZCGV9kix4jU81MqY8tHtSnszbT4DrAzGTlvxM3rQ5
 JJYXJicwiT0JRrHSaVKJNkpyUyVlgbiawLqdz4QVqI61gfuEzN9M8RpwQK+oDf70MzrJ
 wcig==
X-Gm-Message-State: AOAM530oYdV3fyFU5QIFyEYtk4Dd/J9D6DBsLkKH2Yc6TD8yye0ewcI2
 n7rVemldEqY5h4dWVhdnWmc7f5QguGmmnw==
X-Google-Smtp-Source: ABdhPJyKFepowodl5tYqpApRuxL5TS7a6aI1Ul27KxR57b1exdTdKQz6H+tjcwD2luVWbZWCl7nNag==
X-Received: by 2002:ac8:5a86:: with SMTP id c6mr9476620qtc.88.1614694234335;
 Tue, 02 Mar 2021 06:10:34 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id n5sm9376504qkp.133.2021.03.02.06.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:10:33 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] spapr.c: send QAPI event when memory hotunplug fails
Date: Tue,  2 Mar 2021 11:10:19 -0300
Message-Id: <20210302141019.153729-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302141019.153729-1-danielhb413@gmail.com>
References: <20210302141019.153729-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
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


