Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D74C3265F7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:59:26 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgSb-0003IN-14
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3Z-0004tN-8n; Fri, 26 Feb 2021 11:33:33 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:37280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3V-0007kW-L6; Fri, 26 Feb 2021 11:33:33 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id n4so2430513qvl.4;
 Fri, 26 Feb 2021 08:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sCLg0b1bGvQZdp5H68kCD1UXScNDhrufoE3t3af+d9k=;
 b=rk21n75KbULAxpA5pqny2RqARBEdWr0pn7kKjsbfd8halR063jsm4J7f0obfmLXF90
 w2Jp3mS7ZgF1ALWM+Re6uCSwxtGJIhCbQr2qomsiFM4h4H//i1Lz3hrAWf1x9WlaXklL
 3+g2Fm72JUhb/h2VjSwDWd62cngtzuR9f9pqpPCnGoOXBpCAeZT1VDVCNavqYiz5Jbq+
 +IWACRADWEgZ8aRfrwELD1P651BvezYSSnrwiwoonZwCDQKi2xewhT1h0djOFWokVg32
 hRayjkc2Cdk81/lXOaKu9hAvbFZAz719+MMgVbMuL9Yj41uInraVS7Y+w3LloxBWAVnH
 wwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sCLg0b1bGvQZdp5H68kCD1UXScNDhrufoE3t3af+d9k=;
 b=XgXotNawiSCYR1n+Iydbyxj/5F+kNDKIinFWVCPmyFNfkVWOcNvX/4sOlL2viM39kp
 9b6McYhOArB+acMbmNHSvf4uYkqtSG8j0coiTeFPpmAvw4KfgJK9BKpj0+JTqCuscdyg
 Sxd0o3YLMlDNtu+43WTjVPjiPZU5zrZfXi7D15ZqV1JQlvnWOtyGrVBZeT+tZH/jFJ8z
 LWblQbWPqvqya9kyyaH3usHpRZw8ufqTyqsgaSWCcz7uHXez1Tgpiy2yIquhwm5lZ9Pw
 XQ+Ggcbt82VetmvkU9Xl96gwYGPPlwiYg5MT+gLqx3iI5hfgHXJB0SxLMFawg+13yayI
 nPPA==
X-Gm-Message-State: AOAM5338sTdUlTgedHvJENTKnvejBqMCp7Vt81iioJxgHVQktJddVW6n
 qs5KuKxHnxfoL+IuhqMRY+QNRpKIdfJbIA==
X-Google-Smtp-Source: ABdhPJyZ9rTOVOQH+/IPGi+EFlJeQqzU/CSXEZg1+JAsew99XslVzIbRk/hjynVhTAx/JyDcFW+uMQ==
X-Received: by 2002:a05:6214:2464:: with SMTP id
 im4mr3165691qvb.61.1614357207175; 
 Fri, 26 Feb 2021 08:33:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t33sm731116qtd.13.2021.02.26.08.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] spapr.c: send QAPI event when memory hotunplug fails
Date: Fri, 26 Feb 2021 13:33:01 -0300
Message-Id: <20210226163301.419727-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226163301.419727-1-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 13 +++++++++++--
 hw/ppc/spapr_drc.c     |  5 ++---
 include/hw/ppc/spapr.h |  3 +--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6ef72ee7bd..cbe5cafb14 100644
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
+    qapi_error = g_strdup_printf("Memory hotunplug failed for device %s",
+                                 dev->id);
+    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
 }
 
 /* Callback to be called during DRC release. */
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8c4997d795..8faaf9f1dd 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -1232,12 +1232,11 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
 
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


