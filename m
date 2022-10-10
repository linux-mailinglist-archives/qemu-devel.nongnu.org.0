Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F196A5FA3A1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:50:53 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxrY-0003l4-Bz
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdX-0004fx-J9
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdV-0007aC-TP
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LtbWC4TRYOxMw/Xs0vATAQEBjGtMGazJ9tDVXsGFzE=;
 b=G/4XXpkpypuj0x5iXc8q81yB3kUT53C5rldQCsZu0boNtQsWMAnEteYEU3wghjdin8uhcM
 ZK/d9y3ngh95JfCgi9KlNhGfjF1/b5+nykkGJlSGcg6fBy3+EshPixPtN6vN3/jQi78npJ
 4lXe0qWfxo9jCq8KR8+/1j0Dvdeqh3c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-_Jr2wz_tP1OSIdEDcriwrQ-1; Mon, 10 Oct 2022 13:32:16 -0400
X-MC-Unique: _Jr2wz_tP1OSIdEDcriwrQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso7298888wme.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LtbWC4TRYOxMw/Xs0vATAQEBjGtMGazJ9tDVXsGFzE=;
 b=Eywgao3rI8CHQX6RdLg9U9Ebo8IRHu5lTlFw7X0SJ/5PqLNw85MkMj5WHCDpIxyjnY
 GAsfYs2qBo+we1pvhJqiejbMkVuZ/tB2xEvGAy+Z3GayHaSf0eZK78XZTCvJmtcJIj2y
 /ZrX79W2xWlrxoTzBhoH+1Zsz6URG2YaDKbk20HzbZxGHhBZMYz8FDXmGGkQbO5YWtP7
 RaMexF5th2Y+q1JFQ5A1+Cj99SBMk4L/XPxbAgnT4NWmbzhq05kI85vp1Tx0GyH8CMUZ
 l2qHiSqrtX7Fi2GyVtCCYh4z+Xc+nV64zGNn6zXSE7BDHD5NZZCxspXggJwlGza6y9uK
 3TIA==
X-Gm-Message-State: ACrzQf254OUrUusVtK9mRIoJGKxkNywfdzufM5TFEX5kNDdPwaTN4e4R
 ISuTtUMI4lGKPGoodEvF7rzxvpcY6uFsFxBSs09nU6S30ESehnwg6ha9dWIMXuy5yFHdw4xSyU/
 MwSjr78un53HUSa5oP9KBJZwAoJXbbGGx/QUA+2Y1NKjNu8B2qGV+IEQBc0L1
X-Received: by 2002:a05:6000:1866:b0:22f:2616:5613 with SMTP id
 d6-20020a056000186600b0022f26165613mr8683152wri.145.1665423134677; 
 Mon, 10 Oct 2022 10:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tX0DZMi289p+RyrFYG5anzF9TgWYOuca2FLAhp/2bxrtXtFs1H1JAjgex4HsDpYnInE0lHw==
X-Received: by 2002:a05:6000:1866:b0:22f:2616:5613 with SMTP id
 d6-20020a056000186600b0022f26165613mr8683132wri.145.1665423134344; 
 Mon, 10 Oct 2022 10:32:14 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 q22-20020a7bce96000000b003c21ba7d7d6sm11552899wmj.44.2022.10.10.10.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:13 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 47/55] x86: acpi: cleanup PCI device _DSM duplication
Message-ID: <20221010172813.204597-48-mst@redhat.com>
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

add ASUN variable to hotpluggable slots and use it
instead of _SUN which has the same value to reuse
_DMS code on both branches (hot- and non-hotpluggable).
No functional change.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 56 +++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a19900c4e4..eb92b05197 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -374,6 +374,25 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
+Aml *aml_pci_device_dsm(void)
+{
+    Aml *method;
+
+    method = aml_method("_DSM", 4, AML_SERIALIZED);
+    {
+        Aml *params = aml_local(0);
+        Aml *pkg = aml_package(2);
+        aml_append(pkg, aml_name("BSEL"));
+        aml_append(pkg, aml_name("ASUN"));
+        aml_append(method, aml_store(pkg, params));
+        aml_append(method,
+            aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
+                                 aml_arg(2), aml_arg(3), params))
+        );
+    }
+    return method;
+}
+
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
     Aml *if_ctx;
@@ -423,26 +442,17 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     break;
                 }
                 dev = aml_device("S%.02X", devfn);
-                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
+                aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
                 aml_append(dev, method);
-                method = aml_method("_DSM", 4, AML_SERIALIZED);
-                {
-                    Aml *params = aml_local(0);
-                    Aml *pkg = aml_package(2);
-                    aml_append(pkg, aml_name("BSEL"));
-                    aml_append(pkg, aml_name("_SUN"));
-                    aml_append(method, aml_store(pkg, params));
-                    aml_append(method,
-                        aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
-                                             aml_arg(2), aml_arg(3), params))
-                    );
-                }
-                aml_append(dev, method);
+
+                aml_append(dev, aml_pci_device_dsm());
+
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
@@ -485,19 +495,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              * enumeration order in linux kernel, so use another variable for it
              */
             aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
-            method = aml_method("_DSM", 4, AML_SERIALIZED);
-            {
-                Aml *params = aml_local(0);
-                Aml *pkg = aml_package(2);
-                aml_append(pkg, aml_name("BSEL"));
-                aml_append(pkg, aml_name("ASUN"));
-                aml_append(method, aml_store(pkg, params));
-                aml_append(method, aml_return(
-                    aml_call5("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
-                              aml_arg(3), params)
-                ));
-            }
-            aml_append(dev, method);
+            aml_append(dev, aml_pci_device_dsm());
         }
 
         if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
@@ -585,7 +583,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     qobject_unref(bsel);
 }
 
-Aml *aml_pci_device_dsm(void)
+static Aml *aml_pci_pdsm(void)
 {
     Aml *method, *UUID, *ifctx, *ifctx1;
     Aml *ret = aml_local(0);
@@ -1368,7 +1366,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(method, aml_return(aml_local(0)));
     aml_append(scope, method);
 
-    aml_append(scope, aml_pci_device_dsm());
+    aml_append(scope, aml_pci_pdsm());
 
     aml_append(table, scope);
 }
-- 
MST


