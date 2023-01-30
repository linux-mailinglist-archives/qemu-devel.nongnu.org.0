Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB92681B60
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMade-00042O-JO; Mon, 30 Jan 2023 15:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadb-0003rP-Hx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMada-0007Bv-01
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KBz6wG5deB9Si5qL+2YtmJbELltQcc5eyzG12gn3s1s=;
 b=FImIFsSsro0sujPCSx0DDl3xleHiTrkdhyIa4IGX98skgEmM3o901PsdTom7lEBMlb0HRI
 2UplhoSgFhK9JdyJymHLhUll1lC++358rfo02tX/yR7AZQy0Nv8whB0EH3TOkRqAlY/Pho
 E9KR4MWaaUYWEqyDmykzGq74G/tbjwk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442--tcn9OYZPxC0GgkFLyf_eQ-1; Mon, 30 Jan 2023 15:20:20 -0500
X-MC-Unique: -tcn9OYZPxC0GgkFLyf_eQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 js21-20020a17090797d500b008858509ff2aso3236894ejc.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBz6wG5deB9Si5qL+2YtmJbELltQcc5eyzG12gn3s1s=;
 b=po6qBJXK+3MyJBMa9XIWq2eWAFC/IwNutQsres2gcgziwoHqE0H/iPjxpH7689zia+
 BtdSrUN+4Om++3YmAPrjI81XijzMat5Q5x2dhAO/LNbwLyuaZAfUB+XQdcvNvR8YvE7V
 Pp+Z2heo2gecVIZoIJ2R5RotXiQ78eT8gfvemXNgh1HjkD2U6lZsmV3oDutV6l54nz22
 ocRTz+qldrVVWbCjdCBYee7FowJQFYp1sRerNjXT9kVbjqp60vZsW7wtywlISTB8jSuL
 pdUtuq82Y8cQANOon8XsG6vl1dYut5laO6dgv1TnbqhOInfJ+Ae+mqEJ0aRSn3yNAYmZ
 dqrw==
X-Gm-Message-State: AO0yUKVqFHDp4GpsS8qQGMi3kMJw3zSKoeWaJNGQiLVhQCJpfsOkvW4J
 WYjbXN48gvDzjAprONjXnZd9tXJSL+83lBUr6O/AwU1xVO0MjuMMbayrffA5Jpw1fJMFXSxyzj7
 ndxGdq4vfDIeKFpnEok+NmXv122ebfm3OqbiSfJN8/diq64eHmKhrjKE3YwuF
X-Received: by 2002:a17:907:3f1f:b0:878:702c:bd86 with SMTP id
 hq31-20020a1709073f1f00b00878702cbd86mr873250ejc.74.1675110018361; 
 Mon, 30 Jan 2023 12:20:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8JXnJ6Mz4wWZc3ZcrTcI59fWNnDJzgZmBc9Mw/kY2dnnhny63/YVgsVJmgVFqxk57UMSF6eg==
X-Received: by 2002:a17:907:3f1f:b0:878:702c:bd86 with SMTP id
 hq31-20020a1709073f1f00b00878702cbd86mr873224ejc.74.1675110018083; 
 Mon, 30 Jan 2023 12:20:18 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 t12-20020a1709063e4c00b0088a9e083318sm1048449eji.168.2023.01.30.12.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:17 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 28/56] pcihp: drop pcihp_bridge_en dependency when composing
 PCNT method
Message-ID: <20230130201810.11518-29-mst@redhat.com>
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

 .. and use only BSEL presence to decide on how PCNT should be composed.
That simplifies possible combinations to consider, but mainly it makes
PCIHP AML be governed only by BSEL, which is property of PCIBus
(aka part of bridge) and as result it opens possibility to convert
build_append_pci_bus_devices() into AcpiDevAmlIf::build_dev_aml
callback to make bridges self describing.

PS:
used approach leaves unused PCNT, when ACPI hotplug is completely
disabled but that's harmless and followup commits will get rid of
it later.

     Scope (PCI0)
           ...
           Method (PCNT, 0, NotSerialized)
            {
            }
           ...
     }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-19-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 53 ++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1c51ab01fc..27f2cc4180 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -494,39 +494,34 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(parent_scope, notify_method);
     }
 
-    /* Append PCNT method to notify about events on local and child buses.
-     * Add this method for root bus only when hotplug is enabled since DSDT
-     * expects it.
+    /*
+     * Append PCNT method to notify about events on local and child buses.
      */
-    if (bsel || pcihp_bridge_en) {
-        method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
+    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
 
-        /* If bus supports hotplug select it and notify about local events */
-        if (bsel) {
-            uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+    /* If bus supports hotplug select it and notify about local events */
+    if (bsel) {
+        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-            aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
-            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
-                                         aml_int(1))); /* Device Check */
-            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
-                                         aml_int(3))); /* Eject Request */
-        }
-
-        /* Notify about child bus events in any case */
-        if (pcihp_bridge_en) {
-            QLIST_FOREACH(sec, &bus->child, sibling) {
-                if (pci_bus_is_root(sec) ||
-                    !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
-                    continue;
-                }
-
-                aml_append(method, aml_name("^S%.02X.PCNT",
-                                            sec->parent_dev->devfn));
-            }
-        }
-
-        aml_append(parent_scope, method);
+        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
+        aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
+                                     aml_int(1))); /* Device Check */
+        aml_append(method, aml_call2("DVNT", aml_name("PCID"),
+                                     aml_int(3))); /* Eject Request */
     }
+
+    /* Notify about child bus events in any case */
+    QLIST_FOREACH(sec, &bus->child, sibling) {
+        if (pci_bus_is_root(sec) ||
+            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
+            continue;
+        }
+
+        aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
+    }
+
+    aml_append(parent_scope, method);
+
     qobject_unref(bsel);
 }
 
-- 
MST


