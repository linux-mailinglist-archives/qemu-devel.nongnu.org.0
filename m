Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC5681B74
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMaeP-0006ah-8y; Mon, 30 Jan 2023 15:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadp-0004tT-7t
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadl-0007GA-Gg
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b9u5N65oc55e8DOwSph1DCZUKxvwxisHdLrYlc9DoLU=;
 b=CeySPzcxbRukftWOHlv5BpeHZEdzVETBYOBNJeBRhNRlKSsEML/RHBzuzCmuh1FJL7fk5u
 XEIG2XoOZHIYMrEvj1nydRalTIlTIFSXIrdRGqhcaRFOiWa0jDAjoAzSZZ8ZrYKytRFJuj
 dAwva3Ip/1HGFnEm4o7Oi2P4CLMoMSs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-vv7QfAcTNxmF_pNZz7t3Uw-1; Mon, 30 Jan 2023 15:20:30 -0500
X-MC-Unique: vv7QfAcTNxmF_pNZz7t3Uw-1
Received: by mail-ej1-f72.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso1897617ejz.15
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9u5N65oc55e8DOwSph1DCZUKxvwxisHdLrYlc9DoLU=;
 b=LgWS7tCwDAuVjDz3Y9YywNMFhdrOGvp+tjJ6tAR0CQs5BWjctMAKZ5ZJm3N1Lj80An
 Pi1FKb40idwEc05yDfSCr5FZr7Hsqw+2O8e1kfpTmJf5mYiFHlbgwX/fBrORRP3pIYG3
 jj9qnH7Fnk9aXf43ho8zW33SponWkPq8XrhgLOGHho+L6gRFF2lZAXFhBfAqlIOX4Mcf
 NRkgYuWjCMBEVkIYYa0zUUyTsQfUS2ZNftixMCR9T2NfM9jyzb0QTlgYUMU2y+wVVeQz
 XdD1YbVbTuE5VTMK2v4lSh9Die66Q0kk+ERYKR2P3P+m61D9cbzoBTb8X8Y3eHLGKhQ/
 UM9w==
X-Gm-Message-State: AO0yUKXnEj2BTyWLrljmid+WA76A7Hf1Rm1SxbvVCPhSN2I8Ur3Z3MSf
 DMLsJ1hUogjUOIHhGDIibM3huZ38gC8ULKWmAb5pxgxN9sBzAHuU5Ekz5bJ+rPkH+3CJAZHfI28
 GnFaMbjANFmHLEye4Uh5yFW6p4vlWry14+VQT+KoQmqy+98g824Vrz2xZDPFl
X-Received: by 2002:a17:907:8e9b:b0:87a:542e:53b4 with SMTP id
 tx27-20020a1709078e9b00b0087a542e53b4mr16126062ejc.64.1675110028937; 
 Mon, 30 Jan 2023 12:20:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/YYz+XskS5BMp0jtrTj9lhKNJioJ9YTx/HR5HkBfCMReTstisDiWEAyehm4279DRw1HTq4TA==
X-Received: by 2002:a17:907:8e9b:b0:87a:542e:53b4 with SMTP id
 tx27-20020a1709078e9b00b0087a542e53b4mr16126036ejc.64.1675110028607; 
 Mon, 30 Jan 2023 12:20:28 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 e13-20020a170906248d00b0087a9f699effsm6347998ejb.173.2023.01.30.12.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:27 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 31/56] pcihp: compose PCNT callchain right before its user
 _GPE._E01
Message-ID: <20230130201810.11518-32-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

it's a stepping stone to making build_append_pci_bus_devices() suitable
for AcpiDevAmlIfClass:build_dev_aml callback and lets further simplify
it by separating PCNT generation from slots descriptions.

It also makes PCNT callchain ASL much more readable since callchain
not longer cluttered by slots descriptors.

Plus, move will let next patch easily drop empty PCNT (pc/q35)
when there is nothing hotpluggable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-22-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 27f2cc4180..d434ad9189 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -388,7 +388,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 {
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
-    PCIBus *sec;
     int devfn;
 
     bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
@@ -494,12 +493,35 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(parent_scope, notify_method);
     }
 
+    qobject_unref(bsel);
+}
+
+static void build_append_notfication_callback(Aml *parent_scope,
+                                              const PCIBus *bus)
+{
+    Aml *method;
+    PCIBus *sec;
+    QObject *bsel;
+
+    QLIST_FOREACH(sec, &bus->child, sibling) {
+        Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
+        if (pci_bus_is_root(sec) ||
+            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
+            continue;
+        }
+        build_append_notfication_callback(br_scope, sec);
+        aml_append(parent_scope, br_scope);
+    }
+
     /*
      * Append PCNT method to notify about events on local and child buses.
+     * ps: hostbridge might not have hotplug (bsel) enabled but might have
+     * child bridges that do have bsel.
      */
     method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
 
     /* If bus supports hotplug select it and notify about local events */
+    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
     if (bsel) {
         uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
@@ -521,7 +543,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     }
 
     aml_append(parent_scope, method);
-
     qobject_unref(bsel);
 }
 
@@ -1721,6 +1742,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     aml_append(dsdt, sb_scope);
 
     if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+        Object *pci_host = acpi_get_i386_pci_host();
+        PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
+
+        scope = aml_scope("\\_SB.PCI0");
+        build_append_notfication_callback(scope, bus);
+        aml_append(dsdt, scope);
+
         scope =  aml_scope("_GPE");
         {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
-- 
MST


