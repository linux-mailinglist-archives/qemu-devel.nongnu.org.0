Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362126A510
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 14:24:50 +0200 (CEST)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIA0v-00033X-3E
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 08:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nN-0004tA-Dl
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nI-0007ib-Lh
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7l+P3buoZt7VTrit7Bgi07Dv5+mwhkNmD/cqJKlVcc=;
 b=fIKLYnL8tUdA/xSoq2l9Ue6Bb5/MgkuhovKsyVNPgXwDAoT38pcWKMsPgyD9xWxTKMaKVh
 SdXWOKafdCksjPC4DV22hz7JxpVWijFJXNB/xXcw0vuZg6oKlzbnLXMCevqzOULQz78fLd
 88gp18T76zeUHJOzScj3BClfYycdOMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-5BU4jkNcMPK9Ob8JkhdGdw-1; Tue, 15 Sep 2020 08:09:33 -0400
X-MC-Unique: 5BU4jkNcMPK9Ob8JkhdGdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9390C64086;
 Tue, 15 Sep 2020 12:09:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCFBA19D7D;
 Tue, 15 Sep 2020 12:09:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC6B240820; Tue, 15 Sep 2020 14:09:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/21] acpi: ged: add x86 device variant.
Date: Tue, 15 Sep 2020 14:08:53 +0200
Message-Id: <20200915120909.20838-6-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:23:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set AcpiDeviceIfClass->madt_cpu,
otherwise identical to TYPE_ACPI_GED.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/generic_event_device.h |  4 +++
 hw/i386/generic_event_device_x86.c     | 36 ++++++++++++++++++++++++++
 hw/i386/meson.build                    |  1 +
 3 files changed, 41 insertions(+)
 create mode 100644 hw/i386/generic_event_device_x86.c

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 38aec526f944..241151662b45 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -71,6 +71,10 @@ typedef struct AcpiGedState AcpiGedState;
 DECLARE_INSTANCE_CHECKER(AcpiGedState, ACPI_GED,
                          TYPE_ACPI_GED)
 
+#define TYPE_ACPI_GED_X86 "acpi-ged-x86"
+#define ACPI_GED_X86(obj) \
+    OBJECT_CHECK(AcpiGedX86State, (obj), TYPE_ACPI_GED_X86)
+
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
 
diff --git a/hw/i386/generic_event_device_x86.c b/hw/i386/generic_event_device_x86.c
new file mode 100644
index 000000000000..e26fb02a2ef6
--- /dev/null
+++ b/hw/i386/generic_event_device_x86.c
@@ -0,0 +1,36 @@
+/*
+ * x86 variant of the generic event device for hw reduced acpi
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/generic_event_device.h"
+#include "hw/i386/pc.h"
+
+static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
+{
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
+
+    adevc->madt_cpu = pc_madt_cpu_entry;
+}
+
+static const TypeInfo acpi_ged_x86_info = {
+    .name          = TYPE_ACPI_GED_X86,
+    .parent        = TYPE_ACPI_GED,
+    .class_init    = acpi_ged_x86_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { TYPE_ACPI_DEVICE_IF },
+        { }
+    }
+};
+
+static void acpi_ged_x86_register_types(void)
+{
+    type_register_static(&acpi_ged_x86_info);
+}
+
+type_init(acpi_ged_x86_register_types)
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 63918fbe22f9..1a7d1a685d77 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -18,6 +18,7 @@ i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
 i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
 
 i386_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-common.c'))
+i386_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device_x86.c'))
 i386_ss.add(when: 'CONFIG_PC', if_true: files(
   'pc.c',
   'pc_sysfw.c',
-- 
2.27.0


