Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307B534242
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 19:35:53 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuvH-0008LM-My
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 13:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusf-0005Zr-1D
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:33:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusa-0002Hs-5S
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VCTEhaR5vc7EUlIw1/VvwApCMPqBUHdTqrcUFmisNaA=; b=abOBjKgK8oEyOkE1kS6R5r/f+E
 3kM8GzOhQ/LBeUdHDnBzlP4adAJ7y9cmd38ll1hfOJ3/BKMAcEyUyZPBJAHdnKP7zxHh0FcCVR5q1
 XfwcCzhCuFi/Qa/lRd0zX/Tlvw8kad+yt4H5dLaPus5AWez9OgvMuDkvY50D/5iqp3RvBoUz268pu
 pnMQvzERYBfuESAFn3zVr3kdAiV2Ms6GR9HHAF0Ss/k6NwdgkhHhUvusChZzvimoZyB1uJxiqzJae
 dfU/VCXXhsNGLnARNErpKPHaflELqnd0GCBWxsNk6IYHZn4KKGQsLdOd4LaKrTZMeEFIZG+n54dHQ
 qheUm5QPFsqPZLxyquwUOmhjWk5w7zoFcsApBjgZfAidaGnZW+0tJUx04v9C7MUczLOeinI+orrla
 YyoVLDSWNgwkOEIJBrNF2V1ezwJIMYEba3e14rO8z3k+uR9wpBSg/A1/eorFU8GqUZyqjQrKAcqCj
 owHtRCYuTwlW+N3ZBdwzRY6/Ou4WY5N3c+q1k3L/QlfPGJjSzMFsQ+zgCanz0QR8WJzjQ4yGXcEFk
 yiP9+h3Bjfz/9YHtY5XpLI5XOSqzqlmZydUQlCejE7Zbjno88qvBXSTmoBZtlM8cMJsSLdbVgvGep
 mQi1YDPbzf0QXbpGPnrk1HygS//4It045KYYudggI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nturU-0006Pu-Mz; Wed, 25 May 2022 18:32:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 25 May 2022 18:32:31 +0100
Message-Id: <20220525173232.31429-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
References: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 5/6] hw/acpi/viot: sort VIOT ACPI table entries by PCI host
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/viot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index c32bbdd180..4e0bf69067 100644
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


