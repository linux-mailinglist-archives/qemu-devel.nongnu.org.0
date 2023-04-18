Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26666E5CF0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:05:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohGx-0007lJ-Kw; Tue, 18 Apr 2023 05:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pohGm-0007ku-9O
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pohGk-0005cT-NF
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:05:00 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-ifZO15vxN8Cxq3jlJg26iQ-1; Tue, 18 Apr 2023 05:04:52 -0400
X-MC-Unique: ifZO15vxN8Cxq3jlJg26iQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36E668996E8
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:04:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40DAD492B0D;
 Tue, 18 Apr 2023 09:04:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: kchamart@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com,
 anisinha@redhat.com, jusual@redhat.com
Subject: [PATCH v4] acpi: pcihp: allow repeating hot-unplug requests
Date: Tue, 18 Apr 2023 11:04:49 +0200
Message-Id: <20230418090449.2155757-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

with Q35 using ACPI PCI hotplug by default, user's request to unplug
device is ignored when it's issued before guest OS has been booted.
And any additional attempt to request device hot-unplug afterwards
results in following error:

  "Device XYZ is already in the process of unplug"

arguably it can be considered as a regression introduced by [2],
before which it was possible to issue unplug request multiple
times.

Accept new uplug requests after timeout (1ms). This brings ACPI PCI
hotplug on par with native PCIe unplug behavior [1] and allows user
to repeat unplug requests at propper times.
Set expire timeout to arbitrary 1msec so user won't be able to
flood guest with SCI interrupts by calling device_del in tight loop.

PS:
ACPI spec doesn't mandate what OSPM can do with GPEx.status
bits set before it's booted => it's impl. depended.
Status bits may be retained (I tested with one Windows version)
or cleared (Linux since 2.6 kernel times) during guest's ACPI
subsystem initialization.
Clearing status bits (though not wrong per se) hides the unplug
event from guest, and it's upto user to repeat device_del later
when guest is able to handle unplug requests.

1) 18416c62e3 ("pcie: expire pending delete")
2)
Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
CC: mst@redhat.com
CC: anisinha@redhat.com
CC: jusual@redhat.com
CC: kraxel@redhat.com
---
v4:
 * massage commit message some more (Kashyap Chamarthy <kchamart@redhat.com>)
 * pickup Gerd's ACK
---
 hw/acpi/pcihp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index dcfb779a7a..cdd6f775a1 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
      * acpi_pcihp_eject_slot() when the operation is completed.
      */
     pdev->qdev.pending_deleted_event = true;
+    /* if unplug was requested before OSPM is initialized,
+     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
+     * hides unplug event. And than followup qmp_device_del() calls remain
+     * blocked by above flag permanently.
+     * Unblock qmp_device_del() by setting expire limit, so user can
+     * repeat unplug request later when OSPM has been booted.
+     */
+    pdev->qdev.pending_deleted_expires_ms =
+        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
+
     s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
-- 
2.39.1


