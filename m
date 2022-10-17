Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1D600C81
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:33:17 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQn-0006cf-8W
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNGH-0006MA-0d
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNGE-0002m0-Dc
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu4Pd9atxWKhpPks5SopPHcdkGtNLx4sut7j9KPzELc=;
 b=TKyasq9otFZBDbo29ZWzPijkvSL9LShjigo0wed3QmrYrNSY+33BpdsfoJNCgHaIoXHHMd
 DyR7BjT/ebeJio0XuocJ2b8mPBlj5lfvMoVVmf2pXr+xQYeNjZhCBS4e3q2olaC0L9ZjDN
 FWq96rjXNVExHWiybkkxX29EDJwsx7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-ayMxTLLHMFKsQCv4Xkz_kg-1; Mon, 17 Oct 2022 06:22:16 -0400
X-MC-Unique: ayMxTLLHMFKsQCv4Xkz_kg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECDB718E0044;
 Mon, 17 Oct 2022 10:22:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4073F492B0B;
 Mon, 17 Oct 2022 10:22:03 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 10/11] acpi: pc/35: sanitize _GPE declaration order
Date: Mon, 17 Oct 2022 12:21:45 +0200
Message-Id: <20221017102146.2254096-11-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
2.31.1


