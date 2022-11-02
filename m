Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0A61682B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGL2-0002da-0v; Wed, 02 Nov 2022 12:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKz-0002VK-RX
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKm-0003Oh-J0
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=eulhsZtXlfHK5VvXk/lHObgAt23c0EnSqHd0KzB6CF7ocWR3GWRePYShLcR8T7tvUDK9sB
 v3lRLwI9CCWdw3pjYoUfhMjZ7dos4eGYhskYEZdHwrynWQZt57VXofGBK0CRGBRh2FzQDg
 IKyERGIpnf2LCrFx0NIK8Ml0fPBFjns=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-uBy10JkfNl6cHz82JBIzow-1; Wed, 02 Nov 2022 12:11:17 -0400
X-MC-Unique: uBy10JkfNl6cHz82JBIzow-1
Received: by mail-wm1-f72.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so1250206wme.7
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=rpTPnWe5ufWT1+axZVxol0cgskgCOpMXWyOav3M8BCHCAMCITFf+nRAgZPb3uz0rjB
 tPCTYPVmUMuJ8jBA5KTAsxVX259wk1dvsWKcW7cDtoTgQrpvHy/CXy/xzqT59nJAlBBR
 4Ph+MnmxqlSH+pKx49Z7vPC6nRgqaZtW2KtTVz1uqluI6VdCZ7t12Ij8XZHWIDAzgBF5
 QrMXut92/uf2kdxyKhrjI41TAs9mLKT+YEZDgsrCDP8hwspwok354gPF38/N3xugwd+X
 xWa8s6u/jQKgCXaMguSlnOK51BjBEgP73uPQijxOl9CT3JcCkIKfW6XzUW+7mNeSNPd5
 VjyA==
X-Gm-Message-State: ACrzQf0ieehG0eMVG7UfmMSvmaL7SU/V5wGdg/pSDtW4wdOgscfcTxCz
 UrHmjeQFYSO5cTjvNJR8nX7BY0UT+srRMjJGh5Mcd03Nink7LMkRamOye/X78AXy5tJgziTVqF1
 f4+ziY11ybSRvWBUUr1R9aS/f+YZ/4GG9onNH8cQTmETgcdosgWVwUCKi5cDP
X-Received: by 2002:a05:600c:3ac9:b0:3cf:6be9:e69a with SMTP id
 d9-20020a05600c3ac900b003cf6be9e69amr12922882wms.130.1667405476354; 
 Wed, 02 Nov 2022 09:11:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZHnQzFFzpHDwJKW2cYWJwiACjgFx32KF7WvirELoyX1B5acRudp/WzwWQgdGk5i6Jp+N0jA==
X-Received: by 2002:a05:600c:3ac9:b0:3cf:6be9:e69a with SMTP id
 d9-20020a05600c3ac900b003cf6be9e69amr12922848wms.130.1667405476083; 
 Wed, 02 Nov 2022 09:11:16 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b003cf4ec90938sm2392755wmq.21.2022.11.02.09.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:15 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 61/82] acpi: pc/35: sanitize _GPE declaration order
Message-ID: <20221102160336.616599-62-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Move _GPE block declaration before it gets referenced by other
hotplug handlers. While at it move PCI hotplug (_E01) handler
after PCI tree description to avoid forward reference to
to not yet declared methods/devices.

PS:
Forward 'usage' usualy is fine as long as it's hidden within
method, however 'iasl' may print warnings. So be nice
to iasl/guest OS and do things in proper order.

PS2: Also follow up patches will move some of hotplug code
from PCI tree to _E01 and that also requires PCI Device
nodes build first, before Scope can reuse that from
global context.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 47 +++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 916343d8d6..960305462c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1434,6 +1434,18 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, sb_scope);
     }
 
+    scope =  aml_scope("_GPE");
+    {
+        aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
+        if (machine->nvdimms_state->is_enabled) {
+            method = aml_method("_E04", 0, AML_NOTSERIALIZED);
+            aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
+                                          aml_int(0x80)));
+            aml_append(scope, method);
+        }
+    }
+    aml_append(dsdt, scope);
+
     if (pcmc->legacy_cpu_hotplug) {
         build_legacy_cpu_hotplug_aml(dsdt, machine, pm->cpu_hp_io_base);
     } else {
@@ -1452,28 +1464,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                                  pcms->memhp_io_base);
     }
 
-    scope =  aml_scope("_GPE");
-    {
-        aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
-
-        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
-            method = aml_method("_E01", 0, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
-            aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
-            aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
-            aml_append(scope, method);
-        }
-
-        if (machine->nvdimms_state->is_enabled) {
-            method = aml_method("_E04", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
-                                          aml_int(0x80)));
-            aml_append(scope, method);
-        }
-    }
-    aml_append(dsdt, scope);
-
     crs_range_set_init(&crs_range_set);
     bus = PC_MACHINE(machine)->bus;
     if (bus) {
@@ -1752,6 +1742,19 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     }
     aml_append(dsdt, sb_scope);
 
+    if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+        scope =  aml_scope("_GPE");
+        {
+            method = aml_method("_E01", 0, AML_NOTSERIALIZED);
+            aml_append(method,
+                aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
+            aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
+            aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+            aml_append(scope, method);
+        }
+        aml_append(dsdt, scope);
+    }
+
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     acpi_table_end(linker, &table);
-- 
MST


