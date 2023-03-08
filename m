Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3E6AFBEA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNU-0003RI-DG; Tue, 07 Mar 2023 20:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNR-0002za-F0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNP-0001z9-HK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvK1sjWBwmXgmqva75M2OfnltUEHJkHEl+PUlTqgdeQ=;
 b=VolWp5oIBIK4zGXb9bA09UmoOGDRuV+zglu4ZVfKtwuz15Fr6QRPjma/7y54J6xHyOiR62
 QQRJT9hQ8sKOSL7jdrNujNsG77x280W1u7k3DI35moQ7xbqtnyArmXvnSdlf/r15NHq6CY
 OulOnekP5lIFioUif8Bgu1EiYcURvWI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-IP-sSnLFMki-Vcz6hNd2PA-1; Tue, 07 Mar 2023 20:13:48 -0500
X-MC-Unique: IP-sSnLFMki-Vcz6hNd2PA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402358100b004ea439d57b7so9290195edc.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvK1sjWBwmXgmqva75M2OfnltUEHJkHEl+PUlTqgdeQ=;
 b=Zo7uOK4yQpQFCm3A72cO4+cmQKa7pm0z5mbY84985aX8bHqMtrf6wMK6epsKPebrr7
 C6v25IbQX+o1MsKbQ0IkFraU3ih7gro7jfnQ6VS9Eaqx7BoAIqhNoaMc+KMVMm0cy4/W
 gOgkbzvYA3n2gS46EHGVD6Pg3Ui7zZ0Qrlj30nVlnQtC/3QEPYhtSSp9J5SREyVPPl8o
 DRjHMDnJNfMfljZDYQkRtttOyM/4nwS9dL2Vt+19gOSIbzIIPR/Vwxk+qA5PN7MAplTR
 UIzLIxXFg91lOdoC3Vn3bREqHRaEF9Mk+twyABi6YJ9MqC8t9gy5wpplwlWTFtPqBynt
 9LHg==
X-Gm-Message-State: AO0yUKV5W8GXFQrx7/YKHwYVs6Y5p4Jwty0wAi77ndDaGak9xLhNN7OT
 qAj6nA5BwCU/YWCMYJrBi/870Vy5TbL7oVgNcraUgpPWKluch2DMSHuR0ehXlOcxkgJL4wvNdPq
 DRpltrP0zx+uYX/mLPNwK2cq900ucJG/tOEQTS/qUbVsytI6UhWECHXdhEFAMjU8AIIYb
X-Received: by 2002:a17:907:6d92:b0:8ed:e8d6:4e0e with SMTP id
 sb18-20020a1709076d9200b008ede8d64e0emr23883328ejc.36.1678238026487; 
 Tue, 07 Mar 2023 17:13:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+OdbYu/0EOLsujRrBcupWcRM5JV5dUI2eXzTeQU+56efhMMh2/v2kyhx7jMVgw5rL31fv8hg==
X-Received: by 2002:a17:907:6d92:b0:8ed:e8d6:4e0e with SMTP id
 sb18-20020a1709076d9200b008ede8d64e0emr23883308ejc.36.1678238026289; 
 Tue, 07 Mar 2023 17:13:46 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 pv16-20020a170907209000b009079442dd11sm6773455ejb.154.2023.03.07.17.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:45 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 58/73] acpi: pci: move out ACPI PCI hotplug generator from
 generic slot generator build_append_pci_bus_devices()
Message-ID: <02c106139a5c01a5668246c748939b5a4bb0c467.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-33-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pci-bridge.c    | 12 +++++++++++-
 hw/i386/acpi-build.c    |  9 ++++-----
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 7e268c2c9c..cd18ebdcdc 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -71,6 +71,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
 
+void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus);
+
 extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
 #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 4fbf6da6ad..7baa7034a1 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -22,6 +22,16 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
     PCIBridge *br = PCI_BRIDGE(adev);
 
     if (!DEVICE(br)->hotplugged) {
-        build_append_pci_bus_devices(scope, pci_bridge_get_sec_bus(br));
+        PCIBus *sec_bus = pci_bridge_get_sec_bus(br);
+
+        build_append_pci_bus_devices(scope, sec_bus);
+
+        /*
+         * generate hotplug slots descriptors if
+         * bridge has ACPI PCI hotplug attached,
+         */
+        if (object_property_find(OBJECT(sec_bus), ACPI_PCIHP_PROP_BSEL)) {
+            build_append_pcihp_slots(scope, sec_bus);
+        }
     }
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0459acfbb4..ec857a117e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -520,7 +520,7 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     return false;
 }
 
-static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
+void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
 {
     int devfn;
     Aml *dev, *notify_method = NULL, *method;
@@ -599,10 +599,6 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
-
-    if (object_property_find(OBJECT(bus), ACPI_PCIHP_PROP_BSEL)) {
-        build_append_pcihp_slots(parent_scope, bus);
-    }
 }
 
 static bool build_append_notfication_callback(Aml *parent_scope,
@@ -1790,6 +1786,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus);
+            if (object_property_find(OBJECT(bus), ACPI_PCIHP_PROP_BSEL)) {
+                build_append_pcihp_slots(scope, bus);
+            }
             aml_append(sb_scope, scope);
         }
     }
-- 
MST


