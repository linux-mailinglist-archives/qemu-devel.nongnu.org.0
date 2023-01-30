Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9276B681B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMae7-0005c2-C1; Mon, 30 Jan 2023 15:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadr-0004tb-Bw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadp-0007JM-RK
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JjijdM1GMwOhp+4UE3xLbdkYOhGnIqO14eMmQr7xio=;
 b=cD7aEAkHZbL5EQSsgcrvFdRjL8wwnUPdq9hmzo8rN2Y+C+MI7I98NBoY0VTcwD8HY2rxxY
 YGuH9Nksn3Ol438n86ItWnRVzFn2qPHtGvY+d5O4KjvvGSrsb9cl8JzRqNVrgWHqdssorU
 tgiqUsp1JIy+VfsB+RCZOU11CrdEQL8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-NMxep1GiOiOumjZQaR43Pw-1; Mon, 30 Jan 2023 15:20:35 -0500
X-MC-Unique: NMxep1GiOiOumjZQaR43Pw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so8884392edc.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JjijdM1GMwOhp+4UE3xLbdkYOhGnIqO14eMmQr7xio=;
 b=cXBnS5mBtibzN6d7KCQT4XE2Fu08K+yLj2iMeeXoSa6u2zhrxl/FR/1LLH1TucdRTT
 C3pPhZGXy/UApBawcBhTte63PQ9acTxSB04wQLiYr/4euq9tkrpwl/Dc5+9UQbINv9ZY
 30f4NNAoiQbRx34vIk196GA7fUn2RpkFTnBYF7jv6zGbcFSPZ04uyxU7ELcHevyW5uzm
 f+9rA9OwREva/SdL3Bb/hakYXQLbxMvEwX1OyBxRRsumH/M2G0ltHJBWcQslJ9VyGuqO
 irlDN8VwN6TZ5Tf0M86+ZL3CH7YTCMFok6VdhEkT4vT0iS9oU7WLeTIzlchtwucFLidS
 z8/g==
X-Gm-Message-State: AO0yUKXmS60w25ggF6tecGSHyketwXXX1ZI82heoQmwrdTRpOkweUVQE
 Xy4jX/tcpa55Nj+QTvAeHwfxw39V7MRNL7IpCDJH+S6UUL6V93aHFr05PlXkiDPMvghPmeUkwSY
 mAEjsSoCuuStXYdSGzF2QdenrOSY12z+vVckEPBxyi2+vHzERDBlbM9ukB9S2
X-Received: by 2002:a05:6402:3511:b0:4a2:f18:6c9 with SMTP id
 b17-20020a056402351100b004a20f1806c9mr1037532edd.14.1675110032510; 
 Mon, 30 Jan 2023 12:20:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8+4rdhdOZ9TrEraMKnKbpQ9pmZRWl98O8Y9e8L/MO1qKN7H/QFio0atCB8zIGnpLhMmfzANQ==
X-Received: by 2002:a05:6402:3511:b0:4a2:f18:6c9 with SMTP id
 b17-20020a056402351100b004a20f1806c9mr1037506edd.14.1675110032190; 
 Mon, 30 Jan 2023 12:20:32 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 p4-20020a056402500400b0049dfd6bdc25sm7343477eda.84.2023.01.30.12.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:31 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 32/56] pcihp: do not put empty PCNT in DSDT
Message-ID: <20230130201810.11518-33-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

count number of PCNT methods that actually call Notify
and if there aren't any, drop PCNT altogether.
It mostly affects 'Q35' tests where there is no root-ports
/bridges attached and 'PC' machine when ACPI PCI hotplug is
completely disabled.

Expected ASL change:

-            Method (PCNT, 0, NotSerialized)
-            {
-            }
...
         Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
         {
-            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
-            \_SB.PCI0.PCNT ()
-            Release (\_SB.PCI0.BLCK)
         }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-23-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d434ad9189..6368fcefa3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -496,12 +496,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     qobject_unref(bsel);
 }
 
-static void build_append_notfication_callback(Aml *parent_scope,
+static bool build_append_notfication_callback(Aml *parent_scope,
                                               const PCIBus *bus)
 {
     Aml *method;
     PCIBus *sec;
     QObject *bsel;
+    int nr_notifiers = 0;
 
     QLIST_FOREACH(sec, &bus->child, sibling) {
         Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
@@ -509,7 +510,8 @@ static void build_append_notfication_callback(Aml *parent_scope,
             !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
             continue;
         }
-        build_append_notfication_callback(br_scope, sec);
+        nr_notifiers = nr_notifiers +
+                       build_append_notfication_callback(br_scope, sec);
         aml_append(parent_scope, br_scope);
     }
 
@@ -530,6 +532,7 @@ static void build_append_notfication_callback(Aml *parent_scope,
                                      aml_int(1))); /* Device Check */
         aml_append(method, aml_call2("DVNT", aml_name("PCID"),
                                      aml_int(3))); /* Eject Request */
+        nr_notifiers++;
     }
 
     /* Notify about child bus events in any case */
@@ -544,6 +547,7 @@ static void build_append_notfication_callback(Aml *parent_scope,
 
     aml_append(parent_scope, method);
     qobject_unref(bsel);
+    return !!nr_notifiers;
 }
 
 static Aml *aml_pci_pdsm(void)
@@ -1742,20 +1746,26 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     aml_append(dsdt, sb_scope);
 
     if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+        bool has_pcnt;
+
         Object *pci_host = acpi_get_i386_pci_host();
         PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
 
         scope = aml_scope("\\_SB.PCI0");
-        build_append_notfication_callback(scope, bus);
-        aml_append(dsdt, scope);
+        has_pcnt = build_append_notfication_callback(scope, bus);
+        if (has_pcnt) {
+            aml_append(dsdt, scope);
+        }
 
         scope =  aml_scope("_GPE");
         {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
-            aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
-            aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+            if (has_pcnt) {
+                aml_append(method,
+                    aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
+                aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
+                aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+            }
             aml_append(scope, method);
         }
         aml_append(dsdt, scope);
-- 
MST


