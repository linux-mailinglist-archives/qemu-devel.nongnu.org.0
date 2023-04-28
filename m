Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DC6F1466
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:44:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKe8-0003Rm-WB; Fri, 28 Apr 2023 05:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKe4-0003RK-7a
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKe2-0007ZG-Dx
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXaLpd203QwVJtQ9A6szekZJ+736OD/NuahYG+Yxquo=;
 b=fmyPSV5y8j0jkMev4mX4fSPcnoXmmNBXJbzb1MODnwiJc603xfHMU7KLDBY9Fv85fki5vd
 Jv9wP0qW/6YJ2UzWpQsTj4hub1mTf144kjnAQ4hwl7QOT25WOxkg6ht7AbD23DjIrTpFSk
 /yTrdb42ad9kgvNB4dXsbBG21aTals0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-vnS9hBzLPTa1WQAHCbmcnA-1; Fri, 28 Apr 2023 05:44:00 -0400
X-MC-Unique: vnS9hBzLPTa1WQAHCbmcnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB5FA10504A2;
 Fri, 28 Apr 2023 09:43:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC41C1410F1E;
 Fri, 28 Apr 2023 09:43:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 06/13] memory: prevent dma-reentracy issues
Date: Fri, 28 Apr 2023 11:43:39 +0200
Message-Id: <20230428094346.1292054-7-thuth@redhat.com>
In-Reply-To: <20230428094346.1292054-1-thuth@redhat.com>
References: <20230428094346.1292054-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alexander Bulekov <alxndr@bu.edu>

Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
This flag is set/checked prior to calling a device's MemoryRegion
handlers, and set when device code initiates DMA.  The purpose of this
flag is to prevent two types of DMA-based reentrancy issues:

1.) mmio -> dma -> mmio case
2.) bh -> dma write -> mmio case

These issues have led to problems such as stack-exhaustion and
use-after-frees.

Summary of the problem from Peter Maydell:
https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
Resolves: CVE-2023-0330

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
[thuth: Replace warn_report() with warn_report_once()]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/memory.h  |  5 +++++
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 15ade918ba..e45ce6061f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -767,6 +767,8 @@ struct MemoryRegion {
     bool is_iommu;
     RAMBlock *ram_block;
     Object *owner;
+    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
+    DeviceState *dev;
 
     const MemoryRegionOps *ops;
     void *opaque;
@@ -791,6 +793,9 @@ struct MemoryRegion {
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
     RamDiscardManager *rdm; /* Only for RAM */
+
+    /* For devices designed to perform re-entrant IO into their own IO MRs */
+    bool disable_reentrancy_guard;
 };
 
 struct IOMMUMemoryRegion {
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bd50ad5ee1..7623703943 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -162,6 +162,10 @@ struct NamedClockList {
     QLIST_ENTRY(NamedClockList) node;
 };
 
+typedef struct {
+    bool engaged_in_io;
+} MemReentrancyGuard;
+
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
@@ -194,6 +198,9 @@ struct DeviceState {
     int alias_required_for_version;
     ResettableState reset;
     GSList *unplug_blockers;
+
+    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
+    MemReentrancyGuard mem_reentrancy_guard;
 };
 
 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index b1a6cae6f5..b7b3386e9d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -542,6 +542,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultaneous access to a device's IO Regions */
+    if (mr->dev && !mr->disable_reentrancy_guard &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
+            warn_report_once("Blocked re-entrant IO on MemoryRegion: "
+                             "%s at addr: 0x%" HWADDR_PRIX,
+                             memory_region_name(mr), addr);
+            return MEMTX_ACCESS_ERROR;
+        }
+        mr->dev->mem_reentrancy_guard.engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (mr->dev) {
+        mr->dev->mem_reentrancy_guard.engaged_in_io = false;
+    }
     return r;
 }
 
@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRegion *mr,
     }
     mr->name = g_strdup(name);
     mr->owner = owner;
+    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
     mr->ram_block = NULL;
 
     if (name) {
-- 
2.31.1


