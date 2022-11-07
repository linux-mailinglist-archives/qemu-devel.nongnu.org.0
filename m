Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21D6203B2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:23:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAyK-0003yy-AT; Mon, 07 Nov 2022 17:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyF-0003wq-Ie
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyD-0004xk-QC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=Z71Z+x+hKPQu1E1FDB9NZkDV8nWNHSECz6oM3C4/lEF3b20oB55McHYjUdc/ofslU0MpeQ
 uQNARd3s/5ZNrGDkMIlcCIgbBIkXXr0ZXHRcfPnWJxlrJmjWt+tuZSlbsqsm7yrIzGg0Df
 kwBCQjKfCWqeQ0bk7EZLGU8D//79wUM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-DOSh1RmlOwiGP-yeoEtjbQ-1; Mon, 07 Nov 2022 17:51:55 -0500
X-MC-Unique: DOSh1RmlOwiGP-yeoEtjbQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 bl21-20020a05620a1a9500b006fa35db066aso11379852qkb.19
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=pIfqJKDvmPOw8emwrPTbZ/gqv5+Q3+mi2ba/2im5knq+mYK5VC6pKuZFqrQA2hDDO+
 KP4pN3AHoOfxxqh+dBUGoMuriDsx20wB7noI49lB1LVlmC1OBeZnBkQrriUgUvXAziTl
 cnoPv4TKU+BEHr28BWYnBE+bJm75JwPWarKPzqsoXZ1hgnqzfUPLwiw5/RnTZyvojJ8c
 UYp4QEeybYE+x2JTDhczmRUiXAzR1YMOBzuetr/JGBrPm5dYH2Z5QNqmC6qv6FGu3OHH
 UnTr9FbvoMPj1yMWIxV7GR3hkhHJd1ogdoRf5m9Pp0gmYE9P4+k8YzFG9wN5ZXS4ZyF8
 waxQ==
X-Gm-Message-State: ANoB5pmrB9WqZyNicXIK41Iy8TXE8s5HJJRBQ8QXuqANfxzY0S0qMKSY
 ZgLSXFpiwJRjlQi+KmqVDBRTf0zSJX8D9zg6qpRCAWYsCwVm5iC4H7c8pkx6KBvSbjU/C2UBCpp
 3YP6c2lpSM8AO5wDhIfJgKPBf5HajeH658+blPtkXogRIbTFF5TtVHD+hYtHR
X-Received: by 2002:a05:620a:693:b0:6fa:fc92:13fd with SMTP id
 f19-20020a05620a069300b006fafc9213fdmr92040qkh.183.1667861514545; 
 Mon, 07 Nov 2022 14:51:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf474HA6wS3YdqT/m00VvaDKIQY6zdlW6eH4oVkF009g7kXjO1Q+JysqbPK94HgvhkkYpSPhmA==
X-Received: by 2002:a05:620a:693:b0:6fa:fc92:13fd with SMTP id
 f19-20020a05620a069300b006fafc9213fdmr92029qkh.183.1667861514211; 
 Mon, 07 Nov 2022 14:51:54 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05620a0c4600b006eeca296c00sm7620047qki.104.2022.11.07.14.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:53 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v4 53/83] acpi: pc/35: sanitize _GPE declaration order
Message-ID: <20221107224600.934080-54-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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


