Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5D5FA3A5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:51:37 +0200 (CEST)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxsG-0004Nf-Rl
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwe8-0005MW-Bs
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwe2-0007hc-Gs
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5bysEFpqvfb0vnOAHiSAOOyWiN95lODHFTH7Hy6GPk0=;
 b=ZJdiR2OQFpACFhtlPcQVBOhBVZj8sTR2gkILO6DU7QvxtFsc6Y1pDzMpZZgbvGBQ0dznQP
 mrydPsTZ01FlRskj85MpMg+RaaJ5D+jJFW22vq03RdNDtaffZcZKbTO/QWKWEf+lF+WvH/
 Eb1BvvRcRAfd8/rrcM/JFQ7T1ZfoFXk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-Y47RBxDUObmp226iVFCZCw-1; Mon, 10 Oct 2022 13:32:48 -0400
X-MC-Unique: Y47RBxDUObmp226iVFCZCw-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so2953661wrg.16
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bysEFpqvfb0vnOAHiSAOOyWiN95lODHFTH7Hy6GPk0=;
 b=v43blivVUdpqlwQn7M1J25ygvF6/HZMaJdWXG+2h1bJFRYHlmVnibC480jrjtG7IEY
 kzoaPyzt2MpvkQ1nqu6HaeRK00VkTvypFA2Ih8ukS94Ihb5LLNjpBfn/uI04FJcAoeKJ
 rm0bSMmi7AMfjNtO2tm2eVWqZ0GqxnN7ATMFW7bIEwQPP7VuZKShImb/hoNYz7OLFv4g
 fRX/S1wrY8u8YbawG5m1wxBoj0srfD00Aqws02HXD/xlkrpBxTVveVT67p5XaFb+U1ne
 mPAe/lcR1LPCpq+0RIpzIQJZAOcsP8TH91oLv116E3dEoNhUjtFSeXgetHwYRPZynfEQ
 H6Fw==
X-Gm-Message-State: ACrzQf3sWjGrqHK4WGUbD8w157LWh02nAdn7imfEoGbMMvEj7I/NAA5E
 PGz7sPe6GihYPCKWO3S93PQHZTpEBbq1RLX3aPm8BNawwKHdDxudQrf8yDaGZNV3qOHL2qIxa7m
 5ch3P9iAB8tvZzdx42Y2FYtBj4hqNxUZFw65hqsnVJfDw4VrKchgHF3bMFNqI
X-Received: by 2002:a05:6000:1882:b0:230:9595:4131 with SMTP id
 a2-20020a056000188200b0023095954131mr3780874wri.17.1665423167546; 
 Mon, 10 Oct 2022 10:32:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7D7cWCeXh7IB2Ej7acYNXoc972Z/js1NDAB4zMpAGmZBzQT6ytSfyf3hyMmZFMlfrOIr8kNg==
X-Received: by 2002:a05:6000:1882:b0:230:9595:4131 with SMTP id
 a2-20020a056000188200b0023095954131mr3780851wri.17.1665423167245; 
 Mon, 10 Oct 2022 10:32:47 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d4349000000b0022cdb687bf9sm12070076wrr.0.2022.10.10.10.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:46 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 55/55] x86: pci: acpi: consolidate PCI slots creation
Message-ID: <20221010172813.204597-56-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

No functional changes nor AML bytecode changes.
Consolidate code that generates empty and populated slot
descriptors. Besides eliminating duplication,
it helps consolidate conditions for generating
parts of Device{} desriptor in one place, which makes
code more compact and easier to read.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-18-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 111 +++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 57 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fc23cb08c3..4f54b61904 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -427,13 +427,41 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         int func = PCI_FUNC(devfn);
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = slot << 16 | func;
-        bool hotplug_enabled_dev;
-        bool bridge_in_acpi;
-        bool cold_plugged_bridge;
+        bool hotpluggbale_slot = false;
+        bool bridge_in_acpi = false;
+        bool cold_plugged_bridge = false;
+        bool is_vga = false;
+
+        if (pdev) {
+            pc = PCI_DEVICE_GET_CLASS(pdev);
+            dc = DEVICE_GET_CLASS(pdev);
+
+            if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
+                continue;
+            }
+
+            is_vga = pc->class_id == PCI_CLASS_DISPLAY_VGA;
 
-        if (!pdev) {
             /*
-             * add hotplug slots for non present devices.
+             * Cold plugged bridges aren't themselves hot-pluggable.
+             * Hotplugged bridges *are* hot-pluggable.
+             */
+            cold_plugged_bridge = pc->is_bridge && !DEVICE(pdev)->hotplugged;
+            bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
+
+            hotpluggbale_slot = bsel && dc->hotpluggable &&
+                                !cold_plugged_bridge;
+
+            /*
+             * allow describing coldplugged bridges in ACPI even if they are not
+             * on function 0, as they are not unpluggable, for all other devices
+             * generate description only for function 0 per slot
+             */
+            if (func && !bridge_in_acpi) {
+                continue;
+            }
+        } else {
+            /*
              * hotplug is supported only for non-multifunction device
              * so generate device description only for function 0
              */
@@ -441,46 +469,11 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 if (pci_bus_is_express(bus) && slot > 0) {
                     break;
                 }
-                dev = aml_device("S%.02X", devfn);
-                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
-                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
-                aml_append(dev, aml_pci_device_dsm());
-                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-                aml_append(method,
-                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-                );
-                aml_append(dev, method);
-                aml_append(parent_scope, dev);
-
-                build_append_pcihp_notify_entry(notify_method, slot);
+                /* mark it as empty hotpluggable slot */
+                hotpluggbale_slot = true;
+            } else {
+                continue;
             }
-            continue;
-        }
-
-        pc = PCI_DEVICE_GET_CLASS(pdev);
-        dc = DEVICE_GET_CLASS(pdev);
-
-        /*
-         * Cold plugged bridges aren't themselves hot-pluggable.
-         * Hotplugged bridges *are* hot-pluggable.
-         */
-        cold_plugged_bridge = pc->is_bridge && !DEVICE(pdev)->hotplugged;
-        bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
-
-        hotplug_enabled_dev = bsel && dc->hotpluggable && !cold_plugged_bridge;
-
-        if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
-            continue;
-        }
-
-        /*
-         * allow describing coldplugged bridges in ACPI even if they are not
-         * on function 0, as they are not unpluggable, for all other devices
-         * generate description only for function 0 per slot
-         */
-        if (func && !bridge_in_acpi) {
-            continue;
         }
 
         /* start to compose PCI device descriptor */
@@ -496,7 +489,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(dev, aml_pci_device_dsm());
         }
 
-        if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
+        if (is_vga) {
             /* add VGA specific AML methods */
             int s3d;
 
@@ -517,19 +510,10 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
-        } else if (hotplug_enabled_dev) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-            /* add _EJ0 to make slot hotpluggable  */
-            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-            );
-            aml_append(dev, method);
+        }
 
-            if (bsel) {
-                build_append_pcihp_notify_entry(notify_method, slot);
-            }
-        } else if (bridge_in_acpi) {
+        bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
+        if (bridge_in_acpi) {
             /*
              * device is coldplugged bridge,
              * add child device descriptions into its scope
@@ -538,6 +522,19 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
             build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
         }
+
+        if (hotpluggbale_slot) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            /* add _EJ0 to make slot hotpluggable  */
+            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+            aml_append(method,
+                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
+            );
+            aml_append(dev, method);
+
+            build_append_pcihp_notify_entry(notify_method, slot);
+        }
+
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
-- 
MST


