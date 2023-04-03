Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3516D4D57
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:16:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMr8-0005SW-G7; Mon, 03 Apr 2023 12:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjMr5-0005Rl-TQ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjMr4-0004r7-99
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680538584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u87a0VaTmnKtpF3gG7dJguOGORn8i9ZSsO3bEv7cg3U=;
 b=eNLPdOBiX4gNq7UMx9BtfGzMD6PeWuLsQxPmkoDTk6r5FNzseJG+erHaG+4wNxCtx0ZoJT
 ug0lIK3ZYV3s0pg8k0Yuv7bf5iwfIVOln+ThbhBxHS2VHNQDXGHL6Po8ubxlCy7MfJtL1I
 OdnUodPqDhs/TT6LWUeYRGWNLqtZK6M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-silfxsy_Mj-WdkeXHv96Tw-1; Mon, 03 Apr 2023 12:16:23 -0400
X-MC-Unique: silfxsy_Mj-WdkeXHv96Tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F2BC1C0419E
 for <qemu-devel@nongnu.org>; Mon,  3 Apr 2023 16:16:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B31132166B26;
 Mon,  3 Apr 2023 16:16:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, jusual@redhat.com, kraxel@redhat.com
Subject: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Date: Mon,  3 Apr 2023 18:16:18 +0200
Message-Id: <20230403161618.1344414-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Allowing pending delete expire brings ACPI PCI hotplug on par
with native PCIe unplug behavior [1] which in its turn refers
back to ACPI PCI hotplug ability to repeat unplug requests.

PS:
From ACPI point of view, unplug request sets PCI hotplug status
bit in GPE0 block. However depending on OSPM, status bits may
be retained (Windows) or cleared (Linux) during guest's ACPI
subsystem initialization, and as result Linux guest looses
plug/unplug event (no SCI generated) if plug/unplug has
happend before guest OS initialized GPE registers handling.
I couldn't find any restrictions wrt OPM clearing GPE status
bits ACPI spec.
Hence a fallback approach is to let user repeat unplug request
later at the time when guest OS has booted.

1) 18416c62e3 ("pcie: expire pending delete")
2)
Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: mst@redhat.com
CC: anisinha@redhat.com
CC: jusual@redhat.com
CC: kraxel@redhat.com
---
 hw/acpi/pcihp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index dcfb779a7a..cd4f9fee0a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
      * acpi_pcihp_eject_slot() when the operation is completed.
      */
     pdev->qdev.pending_deleted_event = true;
+    pdev->qdev.pending_deleted_expires_ms =
+        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
     s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
-- 
2.39.1


