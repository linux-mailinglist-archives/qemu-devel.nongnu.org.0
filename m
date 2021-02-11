Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC1319645
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:02:18 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKyX-0001Ek-6s
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpp-0001Kv-O2; Thu, 11 Feb 2021 17:53:17 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:44801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lAKpn-0002as-Tn; Thu, 11 Feb 2021 17:53:17 -0500
Received: by mail-qk1-x72c.google.com with SMTP id o193so7031777qke.11;
 Thu, 11 Feb 2021 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mQVR3gMmth97tU7SkDPcq7EDdl4ka2Unc+wDklUQu/Q=;
 b=mgwhebO7Itd5kMk5tBC/Nrb8p8MGEBhOIytSvYV+iJQ8HpoDdzqKAPzAIooDJM+vNR
 wx0WPFyJI2390NQFbR09JIbkfnfxYz/GE+KW8x6hivFjs9mhClxuz6oJ+J0tpLGVbMo8
 pt9r1BZgxVuPVJ1F3aJd/ErwQzoLxqHdcaAW2YuzMRwJAxm8l/jFsdoGGhDPFIE/u1MW
 Imc+wGTLKbwy8nF2hCSXsWYa3vVZCbFKcSt4EGOW4jsWP2AOAewosW7B0IfPUKKi4Iph
 GzRl1gybGwL9DHrjqQD9Ni+vu4V9oypT/ehc5P8pCIczeSKmNAJemDs2Sq9j+GsFMQG0
 PFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQVR3gMmth97tU7SkDPcq7EDdl4ka2Unc+wDklUQu/Q=;
 b=dPjhD0TDV/DX8cLHyMV1UwMsK9YrfkifLyfzZ+FAZQUIPNPB3UQQ8TZZrEGtQfbprY
 FHHRwiLHifvKCTTLXKMh/bqFJwm+bgFQ7MbZAUdmQ+0OQzNbOkAXoOq5Eb4qeW6A945R
 RJMMID6rVjChWz2w3iAq4tEsMfhQ1Hk7CFuIfjTyQkX0GtZiaoIHiB+vwkTwn+zPKn0W
 DuLQ5JXc/Mfif5mfZdS97OZOskxE8InKvmahjy+PaogsxVhl1xwu9hKZhbfoHFu7pKLW
 MXUYG6NjidEB5Xfznf1wT9y7CnV7b/vMIwVnH7qPHyRtxH2GYXvlRAe37WzbvXpohZvb
 H2tQ==
X-Gm-Message-State: AOAM532E5l/3cqIOuPbLibu+7m9vhgAXL7xMLJ3CSZG38cPa7L5EZuwy
 Qh4B6RVOOi6Q3W3bI917RPkwLyhY26P/Iw==
X-Google-Smtp-Source: ABdhPJx4DoEOsytkWvx/oI3urpLjss8wlBwuJ5bZRK4RBtr40028+kaCDMp9l6sHJeoD2XhPM/DYJw==
X-Received: by 2002:a37:7ac3:: with SMTP id v186mr53801qkc.211.1613083994480; 
 Thu, 11 Feb 2021 14:53:14 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:6e83:c920:e8d3:a2df:bf3])
 by smtp.gmail.com with ESMTPSA id x49sm4662227qth.95.2021.02.11.14.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 14:53:14 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] spapr_drc.c: use DRC reconfiguration to cleanup DIMM
 unplug state
Date: Thu, 11 Feb 2021 19:52:46 -0300
Message-Id: <20210211225246.17315-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211225246.17315-1-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handling errors in memory hotunplug in the pSeries machine is more complex
than any other device type, because there are all the complications that other
devices has, and more.

For instance, determining a timeout for a DIMM hotunplug must consider if it's a
Hash-MMU or a Radix-MMU guest, because Hash guests takes longer to hotunplug DIMMs.
The size of the DIMM is also a factor, given that longer DIMMs naturally takes
longer to be hotunplugged from the kernel. And there's also the guest memory usage to
be considered: if there's a process that is consuming memory that would be lost by
the DIMM unplug, the kernel will postpone the unplug process until the process
finishes, and then initiate the regular hotunplug process. The first two
considerations are manageable, but the last one is a deal breaker.

There is no sane way for the pSeries machine to determine the memory load in the guest
when attempting a DIMM hotunplug - and even if there was a way, the guest can start
using all the RAM in the middle of the unplug process and invalidate our previous
assumptions - and in result we can't even begin to calculate a timeout for the
operation. This means that we can't implement a viable timeout mechanism for memory
unplug in pSeries.

Going back to why we would consider an unplug timeout, the reason is that we can't
know if the kernel is giving up the unplug. Turns out that, sometimes, we can.
Consider a failed memory hotunplug attempt where the kernel will error out with
the following message:

'pseries-hotplug-mem: Memory indexed-count-remove failed, adding any removed LMBs'

This happens when there is a LMB that the kernel gave up in removing, and the LMBs
marked for removal of the same DIMM are now being added back. This process happens
in the pseries kernel in [1], dlpar_memory_remove_by_ic() into dlpar_add_lmb(), and
after that update_lmb_associativity_index(). In this function, the kernel is configuring
the LMB DRC connector again. Note that this is a valid usage in LOPAR, as stated in
section "ibm,configure-connector RTAS Call":

'A subsequent sequence of calls to ibm,configure-connector with the same entry from
the “ibm,drc-indexes” or “ibm,drc-info” property will restart the configuration of
devices which were not completely configured.'

We can use this kernel behavior in our favor. If a DRC connector reconfiguration
for a LMB that we marked as unplug pending happens, this indicates that the kernel
changed its mind about the unplug and is reasserting that it will keep using the
DIMM. In this case, it's safe to assume that the whole DIMM unplug was cancelled.

This patch hops into rtas_ibm_configure_connector() and, in the scenario described
above, clear the unplug state for the DIMM device. This will not solve all the
problems we still have with memory unplug, but it will cover this case where the
kernel reconfigures LMBs after a failed unplug. We are a bit more resilient,
without using an unreliable timeout, and we didn't make the remaining error cases
any worse.

[1] arch/powerpc/platforms/pseries/hotplug-memory.c

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 30 ++++++++++++++++++++++++++++++
 hw/ppc/spapr_drc.c     | 14 ++++++++++++++
 include/hw/ppc/spapr.h |  2 ++
 3 files changed, 46 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ecce8abf14..4bcded4a1a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3575,6 +3575,36 @@ static SpaprDimmState *spapr_recover_pending_dimm_state(SpaprMachineState *ms,
     return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
 }
 
+void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
+                                           PCDIMMDevice *dimm)
+{
+    SpaprDimmState *ds = spapr_pending_dimm_unplugs_find(spapr, dimm);
+    SpaprDrc *drc;
+    uint32_t nr_lmbs;
+    uint64_t size, addr_start, addr;
+    int i;
+
+    if (ds) {
+        spapr_pending_dimm_unplugs_remove(spapr, ds);
+    }
+
+    size = memory_device_get_region_size(MEMORY_DEVICE(dimm), &error_abort);
+    nr_lmbs = size / SPAPR_MEMORY_BLOCK_SIZE;
+
+    addr_start = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
+                                          &error_abort);
+
+    addr = addr_start;
+    for (i = 0; i < nr_lmbs; i++) {
+        drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
+                              addr / SPAPR_MEMORY_BLOCK_SIZE);
+        g_assert(drc);
+
+        drc->unplug_requested = false;
+        addr += SPAPR_MEMORY_BLOCK_SIZE;
+    }
+}
+
 /* Callback to be called during DRC release. */
 void spapr_lmb_release(DeviceState *dev)
 {
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index c143bfb6d3..eae941233a 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -1230,6 +1230,20 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
 
     drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
+    /*
+     * This indicates that the kernel is reconfiguring a LMB due to
+     * a failed hotunplug. Clear the pending unplug state for the whole
+     * DIMM.
+     */
+    if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB &&
+        drc->unplug_requested) {
+
+        /* This really shouldn't happen in this point, but ... */
+        g_assert(drc->dev);
+
+        spapr_clear_pending_dimm_unplug_state(spapr, PC_DIMM(drc->dev));
+    }
+
     if (!drc->fdt) {
         void *fdt;
         int fdt_size;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ccbeeca1de..5bcc8f3bb8 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -847,6 +847,8 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
 int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **errp);
 void spapr_clear_pending_events(SpaprMachineState *spapr);
 void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
+void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
+                                           PCDIMMDevice *dimm);
 int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
-- 
2.29.2


