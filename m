Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10769631E6F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:34:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox46S-0007K7-4A; Mon, 21 Nov 2022 05:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46Q-0007Jg-J6
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ox46P-0007bn-3F
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669026749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Usx+llIyd505lGmR8u5jJxWaHo+XPc0pGqxKUzrki38=;
 b=Uv2+JVdoRzWFuH33wnUSKqxJbBrpKV5RaCFWRmbaotk7aHP0DgOv8e2H0YlUZ1ig41QjmS
 Wdr/h9aqToTqgf6pXnKixn6x37Ayb2rjwiOoODHT7bmnbhie9eZsZEhMkiRmEbL/7ue3PJ
 yDtBnJV+v2zfCD+JYwkQZA42OX9qwi0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-ZsVaQkXQM-yaZVYdjVwWvg-1; Mon, 21 Nov 2022 05:32:27 -0500
X-MC-Unique: ZsVaQkXQM-yaZVYdjVwWvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C0E986EB22;
 Mon, 21 Nov 2022 10:32:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B7140C6EC2;
 Mon, 21 Nov 2022 10:32:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 13C0B180099B; Mon, 21 Nov 2022 11:32:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 4/4] be less conservative with the 64bit pci io window
Date: Mon, 21 Nov 2022 11:32:13 +0100
Message-Id: <20221121103213.1675568-5-kraxel@redhat.com>
In-Reply-To: <20221121103213.1675568-1-kraxel@redhat.com>
References: <20221121103213.1675568-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
prefetchable pci bridge windows (scale with address space).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/fw/pciinit.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
index ad6def93633b..3e9636b139a4 100644
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
+                align = (u64)1 << (PhysBits - 11);
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
@@ -1174,6 +1177,9 @@ pci_setup(void)
 
     dprintf(3, "pci setup\n");
 
+    if (PhysBits >= 36 && LongMode && RamSizeOver4G)
+        pci_use_64bit = 1;
+
     dprintf(1, "=== PCI bus & bridge init ===\n");
     if (pci_probe_host() != 0) {
         return;
-- 
2.38.1


