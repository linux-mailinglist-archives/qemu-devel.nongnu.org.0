Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E355634AD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:50:18 +0200 (CEST)
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7H2I-0004wh-29
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go3-00013a-46
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Gnx-0004de-60
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USnlfS0ot9q/dBanD+5Gxz7vkoGB4YUm4ouC337DtcY=;
 b=foGIwkWNoPk9giIYHtgX42iD6ysawn+WEUGaqshJGbRGAZASXxwmuj9ht8C6hxNhk5O5mQ
 FbURP0LmxyugRLu9LoWbLJAZgL/e08po/Wngs3cLlCs5k7/KUvydNMGRtkVNFIsB/F+4MF
 XihJuKim5+bPbIAbLfF2nM2rRgFE8H8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-bWREwDqZMDexD2eJWbyjzA-1; Fri, 01 Jul 2022 09:35:23 -0400
X-MC-Unique: bWREwDqZMDexD2eJWbyjzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B62FF811E90;
 Fri,  1 Jul 2022 13:35:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26E7B40E7F29;
 Fri,  1 Jul 2022 13:35:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 06/17] x86: acpi: _DSM: use Package to pass parameters
Date: Fri,  1 Jul 2022 09:35:04 -0400
Message-Id: <20220701133515.137890-7-imammedo@redhat.com>
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

Numer of possible arguments to pass to a method is limited
in ACPI. The following patches will need to pass over more
parameters to PDSM method, will hit that limit.

Prepare for this by passing structure (Package) to method,
which let us workaround arguments limitation.
Pass to PDSM all standard arguments of _DSM as is, and
pack custom parameters into Package that is passed as
the last argument to PDSM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fe676b4831..8700446f50 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -431,11 +431,17 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 );
                 aml_append(dev, method);
                 method = aml_method("_DSM", 4, AML_SERIALIZED);
-                aml_append(method,
-                    aml_return(aml_call6("PDSM", aml_arg(0), aml_arg(1),
-                                         aml_arg(2), aml_arg(3),
-                                         aml_name("BSEL"), aml_name("_SUN")))
-                );
+                {
+                    Aml *params = aml_local(0);
+                    Aml *pkg = aml_package(2);
+                    aml_append(pkg, aml_name("BSEL"));
+                    aml_append(pkg, aml_name("_SUN"));
+                    aml_append(method, aml_store(pkg, params));
+                    aml_append(method,
+                        aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
+                                             aml_arg(2), aml_arg(3), params))
+                    );
+                }
                 aml_append(dev, method);
                 aml_append(parent_scope, dev);
 
@@ -480,10 +486,17 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              */
             aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
             method = aml_method("_DSM", 4, AML_SERIALIZED);
-            aml_append(method, aml_return(
-                aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
-                          aml_arg(3), aml_name("BSEL"), aml_name("ASUN"))
-            ));
+            {
+                Aml *params = aml_local(0);
+                Aml *pkg = aml_package(2);
+                aml_append(pkg, aml_name("BSEL"));
+                aml_append(pkg, aml_name("ASUN"));
+                aml_append(method, aml_store(pkg, params));
+                aml_append(method, aml_return(
+                    aml_call5("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
+                              aml_arg(3), params)
+                ));
+            }
             aml_append(dev, method);
         }
 
@@ -580,12 +593,13 @@ Aml *aml_pci_device_dsm(void)
     Aml *acpi_index = aml_local(2);
     Aml *zero = aml_int(0);
     Aml *one = aml_int(1);
-    Aml *bnum = aml_arg(4);
     Aml *func = aml_arg(2);
     Aml *rev = aml_arg(1);
-    Aml *sunum = aml_arg(5);
+    Aml *params = aml_arg(4);
+    Aml *bnum = aml_derefof(aml_index(params, aml_int(0)));
+    Aml *sunum = aml_derefof(aml_index(params, aml_int(1)));
 
-    method = aml_method("PDSM", 6, AML_SERIALIZED);
+    method = aml_method("PDSM", 5, AML_SERIALIZED);
 
     /* get supported functions */
     ifctx = aml_if(aml_equal(func, zero));
@@ -662,10 +676,10 @@ Aml *aml_pci_device_dsm(void)
         * update acpi-index to actual value
         */
        aml_append(ifctx, aml_store(acpi_index, aml_index(ret, zero)));
+       aml_append(ifctx, aml_return(ret));
     }
 
     aml_append(method, ifctx);
-    aml_append(method, aml_return(ret));
     return method;
 }
 
-- 
2.31.1


