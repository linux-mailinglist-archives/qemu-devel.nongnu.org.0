Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0F61379A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUId-0003bm-2r; Mon, 31 Oct 2022 08:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIW-00032D-4n
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIU-0003Lj-Dh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=K/xB6fzFEWV7iEfReG2pcMgcidZPT8doLVqJg49vq38UZAY9weSKehVyZt45XR7WKRZGOJ
 o0Y3r+QZO/LU3OR6g0p4BlbJiLMgBabSnw0itSxRs0lBtb4BjGLt6iJqODKpROVu3YPNJ/
 UoN3qM0/6i7sfQc4+zC7cWCiiKTI57M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-0IIPoMdiNe2pcB759Ugufg-1; Mon, 31 Oct 2022 08:53:44 -0400
X-MC-Unique: 0IIPoMdiNe2pcB759Ugufg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so8324734wma.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=4Sm9qZYD3vzNiNjAFhFv+G4Wf0pR/P/O0yasT06MWu5/Vh3lukTGpiDdUryD350sTa
 n+SCLsDGyhC/XRue0uvwsn5FYkTDsDeATabGlpn5c/kjMiwlf09L8lryJPxJ31tZXa3f
 3Wk8wDUC1N8ikefXSkxKBKYkSbAqdEvQbV6+0O46u3elngMtUrm3ykRwvK4hZP3haMww
 9XlPj/KHhc4S0h/kOS/fnSGaHYX1nlJpW0SsWCEUX/dHCj7Gcr+kXD5F5M4vizS8ZOLe
 iMZuVSIb7pQNbu2gP6U4zoLGUUXmqJ5pPWm/9/BMQ5AnAZqcv/bjibfrvW9mQycfzSgf
 gjKQ==
X-Gm-Message-State: ACrzQf2c3ldrQzUMGI8qRsNGC2mYNCMw8CjPHz9ic0Ix+j7qaNG5dJ45
 byeiS89PGNFKj2MTKAT9XPYvcj99lms2RWhmXSgt4U51srG69R76v/rBQLgEK/iWNW7lZ3B+gFD
 RSKWzXXPOa12CI24MUARV9yU8JyNGrGglkiN3lg+ZRPzZPd2qlIijiy7pCDi6
X-Received: by 2002:adf:f78f:0:b0:236:992b:1f62 with SMTP id
 q15-20020adff78f000000b00236992b1f62mr7735873wrp.605.1667220823308; 
 Mon, 31 Oct 2022 05:53:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4T2gn2h9mcovd4GfjlYtbfMafNyq6CDbqfH0KkMrUMPTC/oFZ5FVsr4KoFHr9gAflsk8BKNg==
X-Received: by 2002:adf:f78f:0:b0:236:992b:1f62 with SMTP id
 q15-20020adff78f000000b00236992b1f62mr7735846wrp.605.1667220823008; 
 Mon, 31 Oct 2022 05:53:43 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 n2-20020a7bc5c2000000b003c6c5a5a651sm7106527wmk.28.2022.10.31.05.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:42 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 63/86] acpi: pc/35: sanitize _GPE declaration order
Message-ID: <20221031124928.128475-64-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


