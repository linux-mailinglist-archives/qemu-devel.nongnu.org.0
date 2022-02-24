Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB384C3417
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:55:05 +0100 (CET)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIKV-0005TO-T5
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNIC3-0001lP-VI
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNIBy-0002Z7-Ne
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645724771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Aj9T10glahEHERQa7XalzUZWUCHxTU7/MVvMSBEwek=;
 b=Fqafj7IrLsw1Z/QfwnKVv365TS+QJMHPoB+XXoMzu+I5xjMD6abYr3CgZ1Kvp+NQoMaBzT
 tvV9NfWrqFtGKc0fMsuPtAF+9/70xPBPdqxR+fGaIbMfM0aBqaZ897SegT6R29Ddxf92Xs
 Kt+7+qYbWlRF3x7PdIDanHfbXBasB2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-PSotJuvKN6OaPbYqCuiFcQ-1; Thu, 24 Feb 2022 12:46:08 -0500
X-MC-Unique: PSotJuvKN6OaPbYqCuiFcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 712D0100C610
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 17:46:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA56C710AC;
 Thu, 24 Feb 2022 17:45:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] acpi: pcihp: disable power control on PCIe slot
Date: Thu, 24 Feb 2022 12:44:10 -0500
Message-Id: <20220224174411.3296848-4-imammedo@redhat.com>
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

Previous patch [1] fixed unconditional power handling on a PCIe
slot, and make it honor PCI_EXP_SLTCAP_PCP capability.

Use COMPAT_PROP_PCP to disable power control (PCI_EXP_SLTCAP_PCP)
on PCIe slot when its plug callbacks are wired to ACPI pcihp,
which effectively leaves stop always powered.

PS:
See [1] for detailed description of the issue [2] and how it's
being addressed.

1) "pcie: update slot power status only is power control is enabled"

2)
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/pcihp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6befd23e16..bc47d1bf64 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -32,6 +32,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-bridge/xio3130_downstream.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
@@ -329,6 +330,15 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                  GINT_TO_POINTER(pdev->acpi_index),
                                  g_cmp_uint32, NULL);
     }
+
+    /*
+     * since acpi_pcihp manages hotplug, disable PCI-E power control on slot
+     */
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_XIO3130_DOWNSTREAM)) {
+        object_property_set_bool(OBJECT(dev), COMPAT_PROP_PCP, false,
+                                 &error_abort);
+    }
 }
 
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
-- 
2.31.1


