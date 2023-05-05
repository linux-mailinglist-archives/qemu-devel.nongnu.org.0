Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24556F7D88
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:12:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupbI-0004mg-CQ; Fri, 05 May 2023 03:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbE-0004lX-GH
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pupbC-0000fZ-H1
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683270685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rlu4Dbr7nV6FubMH9YcoNGq9K+JqpiH6IUzURmGHJAM=;
 b=JdUczE0sg5R1qbxbgSfx2AXDJkhHOpvFUiQI0d8Vn3pkzondc9ESsNBPfavYVOOrRoKEF9
 eGIAobrkvNRY1ENdj3q0V2rIXLEIy/VHR50VdbrMLRYZ4ET1OmuKt060vo74O6dWsNhqr4
 qPvznEcnTOrE1z1yMIAYzSeAz7gZlNo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-hqkWumDROCWII-tQW30O-Q-1; Fri, 05 May 2023 03:11:22 -0400
X-MC-Unique: hqkWumDROCWII-tQW30O-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9393811E7C;
 Fri,  5 May 2023 07:11:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C46C15BA0;
 Fri,  5 May 2023 07:11:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C774618011EC; Fri,  5 May 2023 09:11:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 4/6] be less conservative with the 64bit pci io window
Date: Fri,  5 May 2023 09:11:15 +0200
Message-Id: <20230505071117.369471-5-kraxel@redhat.com>
In-Reply-To: <20230505071117.369471-1-kraxel@redhat.com>
References: <20230505071117.369471-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Current seabios code will only enable and use the 64bit pci io window in
case it runs out of space in the 32bit pci mmio window below 4G.

This patch will also enable the 64bit pci io window when
  (a) RAM above 4G is present, and
  (b) the physical address space size is known, and
  (c) seabios is running on a 64bit capable processor.

This operates with the assumption that guests which are ok with memory
above 4G most likely can handle mmio above 4G too.

In case the 64bit pci io window is enabled also assign more memory to
prefetchable pci bridge windows and the complete 64bit pci io window.

The total mmio window size is 1/8 of the physical address space.
Minimum bridge windows size is 1/256 of the total mmio window size.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/fw/pciinit.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
index 0fcd2be598a2..a6b5dff12bd3 100644
--- a/src/fw/pciinit.c
+++ b/src/fw/pciinit.c
@@ -51,6 +51,7 @@ u64 pcimem_end     = BUILD_PCIMEM_END;
 u64 pcimem64_start = BUILD_PCIMEM64_START;
 u64 pcimem64_end   = BUILD_PCIMEM64_END;
 u64 pci_io_low_end = 0xa000;
+u32 pci_use_64bit  = 0;
 
 struct pci_region_entry {
     struct pci_device *dev;
@@ -920,6 +921,8 @@ static int pci_bios_check_devices(struct pci_bus *busses)
         for (type = 0; type < PCI_REGION_TYPE_COUNT; type++) {
             u64 align = (type == PCI_REGION_TYPE_IO) ?
                 PCI_BRIDGE_IO_MIN : PCI_BRIDGE_MEM_MIN;
+            if (pci_use_64bit && (type == PCI_REGION_TYPE_PREFMEM))
+                align = (u64)1 << (CPUPhysBits - 11);
             if (!pci_bridge_has_region(s->bus_dev, type))
                 continue;
             u64 size = 0;
@@ -1108,7 +1111,7 @@ static void pci_bios_map_devices(struct pci_bus *busses)
         panic("PCI: out of I/O address space\n");
 
     dprintf(1, "PCI: 32: %016llx - %016llx\n", pcimem_start, pcimem_end);
-    if (pci_bios_init_root_regions_mem(busses)) {
+    if (pci_use_64bit || pci_bios_init_root_regions_mem(busses)) {
         struct pci_region r64_mem, r64_pref;
         r64_mem.list.first = NULL;
         r64_pref.list.first = NULL;
@@ -1132,6 +1135,8 @@ static void pci_bios_map_devices(struct pci_bus *busses)
             u64 top = 1LL << CPUPhysBits;
             u64 size = (ALIGN(sum_mem, (1LL<<30)) +
                         ALIGN(sum_pref, (1LL<<30)));
+            if (pci_use_64bit)
+                size = ALIGN(size, (1LL<<(CPUPhysBits-3)));
             if (r64_mem.base < top - size) {
                 r64_mem.base = top - size;
             }
@@ -1174,6 +1179,9 @@ pci_setup(void)
 
     dprintf(3, "pci setup\n");
 
+    if (CPUPhysBits >= 36 && CPULongMode && RamSizeOver4G)
+        pci_use_64bit = 1;
+
     dprintf(1, "=== PCI bus & bridge init ===\n");
     if (pci_probe_host() != 0) {
         return;
-- 
2.40.1


