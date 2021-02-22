Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A70322080
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:52:33 +0100 (CET)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHFw-00032r-U6
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9j-0005TB-Qa; Mon, 22 Feb 2021 14:46:11 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lEH9Z-0004J9-3r; Mon, 22 Feb 2021 14:46:07 -0500
Received: by mail-qk1-x72b.google.com with SMTP id x14so13913034qkm.2;
 Mon, 22 Feb 2021 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KCtQ4y+iavav+nWvV+OQ6yDFQ/vwhqZ0qt2JWOmpstQ=;
 b=UNQKeQncY4UuykxaYx3c/nh22ApFMbtVx5Tu4z7lw3HH4Zv4I4OPLbmugp9O7g2t+T
 jYS86Io88RW95+9LHlu+spBEFUwYTf5eFJ9u70/kKnbdZ2aO48hf0t8ITFffeIZ80B6F
 FMYrjKJ/p1QjPY4fojgBzMn//Ash1FegZhG38Fc1ygNf1p+4/pDJinB/9pb/dIKIimHs
 MdidIqM6EaJULWyTk6DWSFAfXRw9gc4fc78Op0yvI2POZpLTb+rFECwOmYds7cRlhnk0
 7RiuPl8R4yQg+NEvDcVQlQGLAvjfoDfhCP7vKMk4e34kCulUlBhu//vEmKYe0KTURvLA
 rXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KCtQ4y+iavav+nWvV+OQ6yDFQ/vwhqZ0qt2JWOmpstQ=;
 b=kMSppUzgkdIB0AkOxPBrU5XO7Q5ft/XLFU4/sHPKecxYaHIV1NYSZ2kvaCIfmm/iHz
 xZ/1zxqHv/+/7cZZlkJGtkFXjMxV/uhRAfIgCUc1oTB939vvF8eSn+2ja222l+OYxpHz
 Cw/rwiCl7kYM5o+D0W2dHMSFKD9aP6UtZLo+EZwZTMnXDD/7epkxZ2/UCSGDF+euCagA
 DxH3wipL6gmiy9UKsgDTkJJbPYygRyBr0ggx1BXwGyAb9Ds5RD7atJ9UghkV9u/p+5G3
 zSWvp4xvjV6h9pxAEr8WmjFujCUjdYPp4Dy4cIRuxtmMUV9DhBj81NwngIJFn9p7iUZO
 9/rQ==
X-Gm-Message-State: AOAM530T9oz02Off4vwC+fltkibVIW8F2RPMLTDQTJFBAX4rNTKU5mBo
 S07q287/24eYCIAhqF95GyUHOabl6NVuvg==
X-Google-Smtp-Source: ABdhPJyhcP3EVCsLyQOk7abyX9I3L0TQmcwt157JSckj1H6ILAqZvMwO0k77OvxaCNJR0udLuKpr8A==
X-Received: by 2002:a05:620a:21d8:: with SMTP id
 h24mr4085216qka.464.1614023155547; 
 Mon, 22 Feb 2021 11:45:55 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id 82sm13483178qkd.48.2021.02.22.11.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:45:55 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] spapr_drc.c: use DRC reconfiguration to cleanup DIMM
 unplug state
Date: Mon, 22 Feb 2021 16:45:31 -0300
Message-Id: <20210222194531.62717-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222194531.62717-1-danielhb413@gmail.com>
References: <20210222194531.62717-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Handling errors in memory hotunplug in the pSeries machine is more
complex than any other device type, because there are all the
complications that other devices has, and more.

For instance, determining a timeout for a DIMM hotunplug must consider
if it's a Hash-MMU or a Radix-MMU guest, because Hash guests takes
longer to hotunplug DIMMs. The size of the DIMM is also a factor, given
that longer DIMMs naturally takes longer to be hotunplugged from the
kernel. And there's also the guest memory usage to be considered: if
there's a process that is consuming memory that would be lost by the
DIMM unplug, the kernel will postpone the unplug process until the
process finishes, and then initiate the regular hotunplug process. The
first two considerations are manageable, but the last one is a deal
breaker.

There is no sane way for the pSeries machine to determine the memory
load in the guest when attempting a DIMM hotunplug - and even if there
was a way, the guest can start using all the RAM in the middle of the
unplug process and invalidate our previous assumptions - and in result
we can't even begin to calculate a timeout for the operation. This means
that we can't implement a viable timeout mechanism for memory unplug in
pSeries.

Going back to why we would consider an unplug timeout, the reason is
that we can't know if the kernel is giving up the unplug. Turns out
that, sometimes, we can. Consider a failed memory hotunplug attempt
where the kernel will error out with the following message:

'pseries-hotplug-mem: Memory indexed-count-remove failed, adding any
removed LMBs'

This happens when there is a LMB that the kernel gave up in removing,
and the LMBs previously marked for removal are now being added back.
This happens in the pseries kernel in [1], dlpar_memory_remove_by_ic()
into dlpar_add_lmb(), and after that update_lmb_associativity_index().
In this function, the kernel is configuring the LMB DRC connector again.
Note that this is a valid usage in LOPAR, as stated in section
"ibm,configure-connector RTAS Call":

'A subsequent sequence of calls to ibm,configure-connector with the same
entry from the “ibm,drc-indexes” or “ibm,drc-info” property will restart
the configuration of devices which were not completely configured.'

We can use this kernel behavior in our favor. If a DRC connector
reconfiguration for a LMB that we marked as unplug pending happens, this
indicates that the kernel changed its mind about the unplug and is
reasserting that it will keep using all the LMBs of the DIMM. In this
case, it's safe to assume that the whole DIMM device unplug was
cancelled.

This patch hops into rtas_ibm_configure_connector() and, in the scenario
described above, clear the unplug state for the DIMM device. This will
not solve all the problems we still have with memory unplug, but it will
cover this case where the kernel reconfigures LMBs after a failed
unplug. We are a bit more resilient, without using an unreliable
timeout, and we didn't make the remaining error cases any worse.

[1] arch/powerpc/platforms/pseries/hotplug-memory.c

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 43 ++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_drc.c     | 10 ++++++++++
 include/hw/ppc/spapr.h |  2 ++
 3 files changed, 55 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ecce8abf14..6eaddb12cb 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3575,6 +3575,49 @@ static SpaprDimmState *spapr_recover_pending_dimm_state(SpaprMachineState *ms,
     return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
 }
 
+void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
+                                           DeviceState *dev)
+{
+    SpaprDimmState *ds;
+    PCDIMMDevice *dimm;
+    SpaprDrc *drc;
+    uint32_t nr_lmbs;
+    uint64_t size, addr_start, addr;
+    int i;
+
+    if (!dev) {
+        return;
+    }
+
+    dimm = PC_DIMM(dev);
+    ds = spapr_pending_dimm_unplugs_find(spapr, dimm);
+
+    /*
+     * 'ds == NULL' would mean that the DIMM doesn't have a pending
+     * unplug state, but one of its DRC is marked as unplug_requested.
+     * This is bad and weird enough to g_assert() out.
+     */
+    g_assert(ds);
+
+    spapr_pending_dimm_unplugs_remove(spapr, ds);
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
index fd2e45640f..8c4997d795 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -1230,6 +1230,16 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
 
     drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
+    /*
+     * This indicates that the kernel is reconfiguring a LMB due to
+     * a failed hotunplug. Clear the pending unplug state for the whole
+     * DIMM.
+     */
+    if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB &&
+        drc->unplug_requested) {
+        spapr_clear_pending_dimm_unplug_state(spapr, drc->dev);
+    }
+
     if (!drc->fdt) {
         void *fdt;
         int fdt_size;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ccbeeca1de..d6edeaaaff 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -847,6 +847,8 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
 int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **errp);
 void spapr_clear_pending_events(SpaprMachineState *spapr);
 void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
+void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
+                                           DeviceState *dev);
 int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
-- 
2.29.2


