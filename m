Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AD650F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQW-0002hk-Vb; Mon, 19 Dec 2022 10:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQK-0002Xo-AM
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQH-0000Zd-Jn
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mNAZMVGKhkXnvNBCGHt9IbwV3LsRKkwsbsubKDR2Ec=;
 b=U2TUD3TZW132XIQJQgtCrv2DQz566vcnuSErgpjq4QOuCug6H2Img9Zd3NsWhlRNHzZkoQ
 QYOa7p38Vs5bKFxuGT6/d+vGQkXv9xbbPozH/QkbIMr8grDEkxRsn/uCNfrO9DfIe+V037
 E/XJDctALkXI92bckHiSylf0VuFKJEs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-ZZ060WMnPmyPcF2uCgBBEQ-1; Mon, 19 Dec 2022 10:51:22 -0500
X-MC-Unique: ZZ060WMnPmyPcF2uCgBBEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B65DB3813F50;
 Mon, 19 Dec 2022 15:51:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 869E714152F4;
 Mon, 19 Dec 2022 15:51:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5539021E6891; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/13] pci: Clean up a few things checkpatch.pl would flag
 later on
Date: Mon, 19 Dec 2022 16:51:08 +0100
Message-Id: <20221219155120.2273041-2-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Fix a few style violations so that checkpatch.pl won't complain when I
move this code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221201121133.3813857-2-armbru@redhat.com>
---
 hw/pci/pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index c61348dca0..d70a567490 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1851,10 +1851,12 @@ static PciBridgeInfo *qmp_query_pci_bridge(PCIDevice *dev, PCIBus *bus,
     range->limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
 
     if (dev->config[PCI_SECONDARY_BUS] != 0) {
-        PCIBus *child_bus = pci_find_bus_nr(bus, dev->config[PCI_SECONDARY_BUS]);
+        PCIBus *child_bus = pci_find_bus_nr(bus,
+                                            dev->config[PCI_SECONDARY_BUS]);
         if (child_bus) {
             info->has_devices = true;
-            info->devices = qmp_query_pci_devices(child_bus, dev->config[PCI_SECONDARY_BUS]);
+            info->devices = qmp_query_pci_devices(child_bus,
+                                            dev->config[PCI_SECONDARY_BUS]);
         }
     }
 
@@ -2610,8 +2612,9 @@ static void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
                    pci_get_word(d->config + PCI_SUBSYSTEM_ID));
     for (i = 0; i < PCI_NUM_REGIONS; i++) {
         r = &d->io_regions[i];
-        if (!r->size)
+        if (!r->size) {
             continue;
+        }
         monitor_printf(mon, "%*sbar %d: %s at 0x%"FMT_PCIBUS
                        " [0x%"FMT_PCIBUS"]\n",
                        indent, "",
-- 
2.37.3


