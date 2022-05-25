Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24037534248
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 19:38:12 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuxX-0004ft-9C
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 13:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusL-0005J5-7h
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusI-0002Fa-Ov
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X4b0jdgOJfgZEh31zO+z6gVMRnPFvOJcfyknX+J9Cl4=; b=Z0sb1o+sTntLQ593LkrgtWKKqV
 g2GNOeViPOTALNKpk3w9R/bOedwqXk4SRF1biKRfZDz2UNcQ4/x/Kzujpk/ryZnxoRGew8/yAGm/A
 VTc4kSU6tBGgX6MrphvZCI9itLVGWO6kz3ZSXN1qHTe1VvpLGN+a/vxfV5o41LbDVv08jDONWXGij
 8zKz3fqjXKTRidKHnQgCMsRm+qOZ77XPYfSIB2xs7JaYwCiuaLAbon6StFMpHNrjcAGFjvaGCmnbP
 Qc2SnU3GpwJypYIVVyNeD7c3s9Ek90gluqKfYwERyQS09NPeD85qdTRwwFHsfS41CyyanRK1jL61c
 9ZriXedj+FuGsD3/0ww6vDYrmH0+1pDGZFy14md83tGNnrWSn/Nr0cogRqrJs/j2/cdzEO5pTWzM0
 iexlNMP//oWB7YTPnhYqbo5EBkfa9s9wCzouqwt7bnxi0+eDkdbzAm8XvyKqkCIWPdwa6oqBoK0l5
 rit3XbI0u4BPX+tMHMRoSPtQXcc/3hhrorQMh8h7mPcArMObsCOW9ugZyfeP8Mph+xsbcm65Lsovh
 VelpW3tfoL1cRBqbFtTkGPff5yTFQer0buaXC+CWm6Sh1SY2I3bb1r/VeoyF90do7tV1olR9XAFgx
 hLw5GfrRT5luOFkVe4wRAXHhHPkDY22C85HtSHYZY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nturD-0006Pu-VR; Wed, 25 May 2022 18:31:43 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 25 May 2022 18:32:27 +0100
Message-Id: <20220525173232.31429-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
References: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 1/6] hw/acpi/viot: rename build_pci_range_node() to
 enumerate_pci_host_bridges()
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

This is in preparation for separating out the VIOT ACPI table build from the
PCI host bridge numeration.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/viot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index c1af75206e..a41daded71 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -17,7 +17,7 @@ struct viot_pci_ranges {
 };
 
 /* Build PCI range for a given PCI host bridge */
-static int build_pci_range_node(Object *obj, void *opaque)
+static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
     struct viot_pci_ranges *pci_ranges = opaque;
     GArray *blob = pci_ranges->blob;
@@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     };
 
     /* Build the list of PCI ranges that this viommu manages */
-    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
+    object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
                                    &pci_ranges);
 
     /* ACPI table header */
-- 
2.20.1


