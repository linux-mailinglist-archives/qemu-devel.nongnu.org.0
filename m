Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A2681B58
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:24:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMagF-0008EB-Tp; Mon, 30 Jan 2023 15:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeO-0006bN-Jk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeI-0007OC-5z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eCpquopnJL7ZS2jirS30C89chkKb2FpipvhkFmXO6g0=;
 b=ccBhwK5q7juoYyxo1XLQi76kl23OejTfXlKQKJ36bEUbyDUbPomIOuVNRLJfHYfKPnQjeM
 Jy1nWLSKNR31MSAQiUagXJ11nQt0njrKxbCbrOg6D/hpZpSm6bled/9ZTJzDyW2LHu0IpO
 r9QBIO2Ss9qe/nWrQspxrniecG1xGyw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-fyLokezsOl2I3HnsRueRtw-1; Mon, 30 Jan 2023 15:21:04 -0500
X-MC-Unique: fyLokezsOl2I3HnsRueRtw-1
Received: by mail-ed1-f70.google.com with SMTP id
 m12-20020a056402430c00b0049e4ac58509so8982094edc.16
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCpquopnJL7ZS2jirS30C89chkKb2FpipvhkFmXO6g0=;
 b=cf3syFmlESn84c+GhOhJUSUalqCiwXki8rlllAIh6rg9QBI56/l3dYEfbuuFCTIsZ5
 STlG4+SfNUDXUr7lBsh5Y6G7gZ7CVVagdZrhk41IHaVPbpPzYggToTcXcCtjNp7T3RL5
 5UYzlajtgwAvZcWB+FUFfh/M90m/q5TPtR3E8AwhmK1B5ZiJ11BQaI3shuOnrJSeVGkF
 0tE2F69Hz0KGg6JfgmVXS+wnDjmCdlQHQ9NdmHCyJUodw85sz6gE7vvvbYxGli+vcTa/
 DK4VgotxB8FBeHMqx6Qx3099bf7gbDU2gJjl4hSqpM2/bs1YM/1V1uX5Js8S+Mg8ZGnM
 2msg==
X-Gm-Message-State: AO0yUKU5aV+Pv9PW786Aj32vJpX6aQq4tX+W0gymABmCNsOA/gABDYUa
 3m6Der9xJjT9CaV+xzaUP6djPdTbMYpLPBVjuyp5toho/hKkyL6FZogk/y6kN/vultFDjUJEGJQ
 Sbk0EcIEhELlqTmhJusn35qxZhdl3zujajimtkQf6OzyvolAwHJ1bogNDAAiU
X-Received: by 2002:a17:906:be9:b0:883:258d:28fe with SMTP id
 z9-20020a1709060be900b00883258d28femr8386971ejg.12.1675110062337; 
 Mon, 30 Jan 2023 12:21:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8MEo3h6i1JEaPJF1ZiJuqr6qF3EcHuaa+AKB0Wctp4N9TcvHDfjUhUeKKd2nm8VIt3ODlHXA==
X-Received: by 2002:a17:906:be9:b0:883:258d:28fe with SMTP id
 z9-20020a1709060be900b00883258d28femr8386952ejg.12.1675110062054; 
 Mon, 30 Jan 2023 12:21:02 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 gc13-20020a1709072b0d00b008867f1905f2sm3114419ejc.39.2023.01.30.12.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:01 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 41/56] pcihp: isolate rule whether slot should be described in
 DSDT
Message-ID: <20230130201810.11518-42-mst@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-32-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 83 +++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 49181a55b1..b4c9ff4794 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -383,6 +383,42 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     aml_append(method, if_ctx);
 }
 
+static bool is_devfn_ignored(const int devfn, const PCIBus *bus,
+                             bool bus_has_hotplug)
+{
+    const PCIDevice *pdev = bus->devices[devfn];
+
+    if (pdev) {
+        if (PCI_FUNC(devfn)) {
+            if (IS_PCI_BRIDGE(pdev)) {
+                /*
+                 * Ignore only hotplugged PCI bridges on !0 functions, but
+                 * allow describing cold plugged bridges on all functions
+                 */
+                if (DEVICE(pdev)->hotplugged) {
+                    return true;
+                }
+            } else if (!get_dev_aml_func(DEVICE(pdev))) {
+                /*
+                 * Ignore all other devices on !0 functions unless they
+                 * have AML description (i.e have get_dev_aml_func() != 0)
+                 */
+                return true;
+            }
+        }
+    } else { /* non populated slots */
+        /*
+         * hotplug is supported only for non-multifunction device
+         * so generate device description only for function 0
+         */
+        if (!bus_has_hotplug || PCI_FUNC(devfn) ||
+            (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
+            return true;
+        }
+    }
+    return false;
+}
+
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 {
     Aml *dev, *notify_method = NULL, *method;
@@ -398,59 +434,26 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     }
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
-        DeviceClass *dc;
         PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
         int func = PCI_FUNC(devfn);
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = slot << 16 | func;
-        bool hotpluggbale_slot = false;
-        bool cold_plugged_bridge = false;
+        bool hotpluggbale_slot = true;
+
+        if (is_devfn_ignored(devfn, bus, !!bsel)) {
+            continue;
+        }
 
         if (pdev) {
-            dc = DEVICE_GET_CLASS(pdev);
-
             /*
              * Cold plugged bridges aren't themselves hot-pluggable.
              * Hotplugged bridges *are* hot-pluggable.
              */
-            cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
+            bool cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
                                   !DEVICE(pdev)->hotplugged;
-
-            hotpluggbale_slot = bsel && dc->hotpluggable &&
+            hotpluggbale_slot = bsel && DEVICE_GET_CLASS(pdev)->hotpluggable &&
                                 !cold_plugged_bridge;
-
-            if (func) {
-                if (IS_PCI_BRIDGE(pdev)) {
-                    /*
-                     * Ignore only hotplugged PCI bridges on !0 functions, but
-                     * allow describing cold plugged bridges on all functions
-                     */
-                    if (DEVICE(pdev)->hotplugged) {
-                        continue;
-                    }
-                } else if (!get_dev_aml_func(DEVICE(pdev))) {
-                    /*
-                     * Ignore all other devices on !0 functions unless they
-                     * have AML description (i.e have get_dev_aml_func() != 0)
-                     */
-                    continue;
-                }
-            }
-        } else {
-            /*
-             * hotplug is supported only for non-multifunction device
-             * so generate device description only for function 0
-             */
-            if (bsel && !func) {
-                if (pci_bus_is_express(bus) && slot > 0) {
-                    break;
-                }
-                /* mark it as empty hotpluggable slot */
-                hotpluggbale_slot = true;
-            } else {
-                continue;
-            }
         }
 
         /* start to compose PCI device descriptor */
-- 
MST


