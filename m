Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34016D78A9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 11:43:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzfV-0006wa-Ar; Wed, 05 Apr 2023 05:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzfT-0006wN-It
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzfR-00026y-VH
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680687781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2A7cInSBH49H6BWxGFXeW1JkGxgEAxC6mCuE1nHLstY=;
 b=WngLMkwihIKyTQHGhaZWOSTDuV5xK4GbVSnLdIn91NnMM8JboiaLiaXrewcq1HRbQpXLhT
 88O//iI19uoUjUpB6xOCIo8h23ZyOD4iZ08PW+E4JYBS0bQMzPGHVaEEL41rfonmqRLWsa
 WjEhBpGrxRoOGy3WMEEnJLoTaPoLIEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-hJel5k-dNOuGioZgg1VhYQ-1; Wed, 05 Apr 2023 05:42:59 -0400
X-MC-Unique: hJel5k-dNOuGioZgg1VhYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CC4B101A54F
 for <qemu-devel@nongnu.org>; Wed,  5 Apr 2023 09:42:59 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5031440C6EC4;
 Wed,  5 Apr 2023 09:42:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, jusual@redhat.com, kraxel@redhat.com
Subject: [PATCH v3] acpi: pcihp: make pending delete blocking action expire
Date: Wed,  5 Apr 2023 11:42:56 +0200
Message-Id: <20230405094256.1539122-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

with Q35 using ACPI PCI hotplug by default, user's request to unplug
device is ignored when it's issued before guest OS has been booted.
And any additional attempt to request device hot-unplug afterwards
results in following error:

  "Device XYZ is already in the process of unplug"

arguably it can be considered as a regression introduced by [2],
before which it was possible to issue unplug request multiple
times.

Allowing pending delete blocking expire brings ACPI PCI hotplug
on par with native PCIe unplug behavior [1] and allows user
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
CC: mst@redhat.com
CC: anisinha@redhat.com
CC: jusual@redhat.com
CC: kraxel@redhat.com
---
v3:
   * fix typo in comment
   * move CC to the main commit message body
v2:
   * change timeout to 1ms
   * add comment to expire usage
   * massage commit message to be a bit more clear
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


