Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F85634BE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:54:57 +0200 (CEST)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7H6m-0001FR-5B
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go2-00013Z-Pq
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Gnw-0004NA-6w
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCdZLUzXtitLXLSRD0hi8tgsxFObqqJxv6A8dezcY6c=;
 b=RvNQtTiV/ybJmiv/QxT82MD+szwVS3Vue+QXjntj2ms/SaT47pmVqFvtQEyATrkPcUoPg5
 WguRc1b+AhB9C/ms2HA1QyvC0QdpkNFxfotrbIAtflm3qBfFGLMxl5g0e3rd62PZ7zdVen
 en8Lli2Fg9OMbEveaa8XtMQvo4UEJtM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85--TzANDzePA24XY-pQJlTBQ-1; Fri, 01 Jul 2022 09:35:22 -0400
X-MC-Unique: -TzANDzePA24XY-pQJlTBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E69153C1014E;
 Fri,  1 Jul 2022 13:35:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 595BA40E7F29;
 Fri,  1 Jul 2022 13:35:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 05/17] acpi: x86: refactor PDSM method to reduce nesting
Date: Fri,  1 Jul 2022 09:35:03 -0400
Message-Id: <20220701133515.137890-6-imammedo@redhat.com>
In-Reply-To: <20220701133515.137890-1-imammedo@redhat.com>
References: <20220701133515.137890-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

.., it will help with code readability and make easier
to extend method in followup patches

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 139 ++++++++++++++++++++++++-------------------
 1 file changed, 77 insertions(+), 62 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 69ead4b34a..fe676b4831 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -574,9 +574,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
 Aml *aml_pci_device_dsm(void)
 {
-    Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
-    Aml *acpi_index = aml_local(0);
+    Aml *method, *UUID, *ifctx, *ifctx1;
+    Aml *ret = aml_local(0);
+    Aml *caps = aml_local(1);
+    Aml *acpi_index = aml_local(2);
     Aml *zero = aml_int(0);
+    Aml *one = aml_int(1);
     Aml *bnum = aml_arg(4);
     Aml *func = aml_arg(2);
     Aml *rev = aml_arg(1);
@@ -584,73 +587,85 @@ Aml *aml_pci_device_dsm(void)
 
     method = aml_method("PDSM", 6, AML_SERIALIZED);
 
+    /* get supported functions */
+    ifctx = aml_if(aml_equal(func, zero));
+    {
+        uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
+        aml_append(ifctx, aml_store(aml_buffer(1, byte_list), ret));
+        aml_append(ifctx, aml_store(zero, caps));
+
+       /*
+        * PCI Firmware Specification 3.1
+        * 4.6.  _DSM Definitions for PCI
+        */
+        UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
+        ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
+        {
+            /* call is for unsupported UUID, bail out */
+            aml_append(ifctx1, aml_return(ret));
+        }
+        aml_append(ifctx, ifctx1);
+
+        ifctx1 = aml_if(aml_lless(rev, aml_int(2)));
+        {
+            /* call is for unsupported REV, bail out */
+            aml_append(ifctx1, aml_return(ret));
+        }
+        aml_append(ifctx, ifctx1);
+
+        aml_append(ifctx,
+            aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
+        /*
+         * advertise function 7 if device has acpi-index
+         * acpi_index values:
+         *            0: not present (default value)
+         *     FFFFFFFF: not supported (old QEMU without PIDX reg)
+         *        other: device's acpi-index
+         */
+        ifctx1 = aml_if(aml_lnot(
+                     aml_or(aml_equal(acpi_index, zero),
+                            aml_equal(acpi_index, aml_int(0xFFFFFFFF)), NULL)
+                 ));
+        {
+            /* have supported functions */
+            aml_append(ifctx1, aml_or(caps, one, caps));
+            /* support for function 7 */
+            aml_append(ifctx1,
+                aml_or(caps, aml_shiftleft(one, aml_int(7)), caps));
+        }
+        aml_append(ifctx, ifctx1);
+
+        aml_append(ifctx, aml_store(caps, aml_index(ret, zero)));
+        aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
+
+    /* handle specific functions requests */
     /*
      * PCI Firmware Specification 3.1
-     * 4.6.  _DSM Definitions for PCI
+     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
+     *        Operating Systems
      */
-    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
-    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
+    ifctx = aml_if(aml_equal(func, aml_int(7)));
     {
-        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
-        ifctx1 = aml_if(aml_equal(func, zero));
-        {
-            uint8_t byte_list[1];
+       Aml *pkg = aml_package(2);
 
-            ifctx2 = aml_if(aml_equal(rev, aml_int(2)));
-            {
-                /*
-                 * advertise function 7 if device has acpi-index
-                 * acpi_index values:
-                 *            0: not present (default value)
-                 *     FFFFFFFF: not supported (old QEMU without PIDX reg)
-                 *        other: device's acpi-index
-                 */
-                ifctx3 = aml_if(aml_lnot(
-                    aml_or(aml_equal(acpi_index, zero),
-                           aml_equal(acpi_index, aml_int(0xFFFFFFFF)), NULL)
-                ));
-                {
-                    byte_list[0] =
-                        1 /* have supported functions */ |
-                        1 << 7 /* support for function 7 */
-                    ;
-                    aml_append(ifctx3, aml_return(aml_buffer(1, byte_list)));
-                }
-                aml_append(ifctx2, ifctx3);
-             }
-             aml_append(ifctx1, ifctx2);
-
-             byte_list[0] = 0; /* nothing supported */
-             aml_append(ifctx1, aml_return(aml_buffer(1, byte_list)));
-         }
-         aml_append(ifctx, ifctx1);
-         elsectx = aml_else();
-         /*
-          * PCI Firmware Specification 3.1
-          * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
-          *        Operating Systems
-          */
-         ifctx1 = aml_if(aml_equal(func, aml_int(7)));
-         {
-             Aml *pkg = aml_package(2);
-             Aml *ret = aml_local(1);
-
-             aml_append(pkg, zero);
-             /*
-              * optional, if not impl. should return null string
-              */
-             aml_append(pkg, aml_string("%s", ""));
-             aml_append(ifctx1, aml_store(pkg, ret));
-             /*
-              * update acpi-index to actual value
-              */
-             aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
-             aml_append(ifctx1, aml_return(ret));
-         }
-         aml_append(elsectx, ifctx1);
-         aml_append(ifctx, elsectx);
+       aml_append(pkg, zero);
+       /*
+        * optional, if not impl. should return null string
+        */
+       aml_append(pkg, aml_string("%s", ""));
+       aml_append(ifctx, aml_store(pkg, ret));
+
+       aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
+       /*
+        * update acpi-index to actual value
+        */
+       aml_append(ifctx, aml_store(acpi_index, aml_index(ret, zero)));
     }
+
     aml_append(method, ifctx);
+    aml_append(method, aml_return(ret));
     return method;
 }
 
-- 
2.31.1


