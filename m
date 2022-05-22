Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8C5303F8
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 17:57:13 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsnxA-0008Er-7n
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 11:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqm-0007J1-O2
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnql-00084j-8e
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6D8Ayin6wAdGj7XiIWsL9Jb38aKCyQebycCOGDxBLw=; b=L1P0IeMzBExjQ6bSZIUr+cOcNW
 Z2mDyVUHdZrcXHRyLPzJDV12Alae6njrmG+hRG4nxflV8rzDSyicWMDq08c4NCPeFnGwsteCqRJq/
 iGrMZph0/eBFIVayjfx7CqxheR7NeAzXq82oPSf5uaX+/bJXdZIrY4yMaeE7fzKxgkL4dv0c/+Wof
 33EoLoWhO/kax31txXZsZsu1CUQqNtES9vR/TAztbHC1V+RdlT7t5sQKfvb/oXZvOxQ2f+Qnw71BG
 yNkqILSOgKFXuqWhFp+xGec98hZkvz91aH74YztdI3CCLyu2E45PBnsBBwshvH4ruBbgWrBfVCYOF
 drfmJvm4ZPazNjThueWhOMplANRASqRPkdN3dsLD83OLBFNijlgrknyHE+K2GwMiIhreaG0SNuGjy
 T9EWoLDn1+lxl+YgVNZYmgyK5T64yEHZGnn9Wlda4zz97AVAhxX2O517wZ0aKeNJAPcIpEwrUv6gV
 EnRVL3QFXWMw+5eiK36/IzZ/5TKZMqTIHjXDYphjoNmRREhonrrWeCVS7ZrdzKTyKVQQFYtq9x6Sa
 ZcpUrSlXcNR4Qa6b7MGRvOachSlys1mtJXRuJlLPh/IRcrO/T2AwvcJYvFRgrvhmgLpKBUn4ynE7n
 aObaoOQB4Cfs5vU8EHRqHUkaIQAaGe/0yXb8cMKZw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnph-0006zJ-BR; Sun, 22 May 2022 16:49:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 16:50:07 +0100
Message-Id: <20220522155008.21832-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
References: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 5/6] hw/acpi/viot: sort VIOT ACPI table entries by PCI host
 bridge min_bus
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This ensures that the VIOT ACPI table output is always stable for a given PCI
topology by ensuring that entries are ordered according to min_bus.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/viot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index 6ca041d18e..ff46703d87 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -64,6 +64,20 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
     return 0;
 }
 
+static gint pci_host_range_compare(gconstpointer a, gconstpointer b)
+{
+    struct viot_pci_host_range *range_a = (struct viot_pci_host_range *)a;
+    struct viot_pci_host_range *range_b = (struct viot_pci_host_range *)b;
+
+    if (range_a->min_bus < range_b->min_bus) {
+        return -1;
+    } else if (range_a->min_bus > range_b->min_bus) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
 /*
  * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
  * endpoints.
@@ -87,6 +101,9 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
                                    pci_host_ranges);
 
+    /* Sort the pci host ranges by min_bus */
+    g_array_sort(pci_host_ranges, pci_host_range_compare);
+
     /* ACPI table header */
     acpi_table_begin(&table, table_data);
     /* Node count */
-- 
2.20.1


