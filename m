Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FB4C33FA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:48:06 +0100 (CET)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIDl-0003hp-Hf
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNIC2-0001lQ-93
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNIBt-0002VQ-ED
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645724758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHYpuN/ALkxd3ga2HMxALEv4o/lFFAEjKJ81OR2oV/4=;
 b=Jr1twSYVHJ1/h7ZuDXXsA7hdFRuxh/wY2s4tugABnmxKrz9gvpwUQh/bvmPUSMslVhnMQJ
 CrLiuP96bgh+qhrns/pMArvVzBMqzj67IPsMu1VBBLvuRp8pS8S0wMx6GMvELmK1ijrhIr
 piEvDDoqAr3UkUDlzWVBZk0q9AJLlFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-o0lNQ3VNPaaU0YHVo20y6g-1; Thu, 24 Feb 2022 12:45:57 -0500
X-MC-Unique: o0lNQ3VNPaaU0YHVo20y6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E54180FD73
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 17:45:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94F9710AC;
 Thu, 24 Feb 2022 17:45:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] pcie: update slot power status only is power control is
 enabled
Date: Thu, 24 Feb 2022 12:44:09 -0500
Message-Id: <20220224174411.3296848-3-imammedo@redhat.com>
In-Reply-To: <20220224174411.3296848-1-imammedo@redhat.com>
References: <20220224174411.3296848-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
however later on if PCIe slot isn't populated with any children
it's power is turned off. It's fine if native hotplug is used
as plug callback will power slot on among other things.
However when ACPI hotplug is enabled it replaces native PCIe plug
callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
as result slot stays powered off. It works fine as ACPI hotplug
on guest side takes care of enumerating/initializing hotplugged
device. But when later guest is migrated, call chain introduced by [1]

   pcie_cap_slot_post_load()
       -> pcie_cap_update_power()
           -> pcie_set_power_device()
               -> pci_set_power()
                   -> pci_update_mappings()

will disable earlier initialized BARs for the hotplugged device
in powered off slot due to commit [2] which disables BARs if
power is off. As result guest OS after migration will be very
much confused [3], still thinking that it has working device,
which isn't true anymore due to disabled BARs.

Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
only if capability is enabled. Follow up patch will disable
PCI_EXP_SLTCAP_PCP overriding COMPAT_PROP_PCP property when
PCIe slot is under ACPI PCI hotplug control.

See [3] for reproducer.

1)
Fixes: commit d5daff7d312 (pcie: implement slot power control for pcie root ports)
2)
       commit 23786d13441 (pci: implement power state)
3)
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2053584

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/pci/pcie.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index d7d73a31e4..2339729a7c 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
 
     if (sltcap & PCI_EXP_SLTCAP_PCP) {
         power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
+        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
+                            pcie_set_power_device, &power);
     }
-
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        pcie_set_power_device, &power);
 }
 
 /*
-- 
2.31.1


