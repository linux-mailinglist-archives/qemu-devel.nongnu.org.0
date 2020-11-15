Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC942B39EE
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:37:46 +0100 (CET)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQeX-0000Xp-SN
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUc-0000EQ-Ju
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUa-0001YI-Pz
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fy5h6h+m0qqiK7cH1TYiRgHFXaiX1Q/ASMsmRQ7XhRo=;
 b=DuvbbZ5UEOLHxOTuqYqmlXcS0DtfcJDtLnLxRhToJfkLP2r4ljPXyw4nfx1LJdjmHXAFYz
 GoxxrR5kZzIwuUxUYAhNkXl+SenBnLbSsd+wQ1GZ2QWabIyeFsICSZaWg6ReqJBuO+0jGP
 WkYbZQPktg6FJLwSHrJZDg8FfKmQ/jQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-1zXNVQBTNI-ZbyOli-Bkjw-1; Sun, 15 Nov 2020 17:27:25 -0500
X-MC-Unique: 1zXNVQBTNI-ZbyOli-Bkjw-1
Received: by mail-wr1-f71.google.com with SMTP id c8so9902964wrh.16
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Fy5h6h+m0qqiK7cH1TYiRgHFXaiX1Q/ASMsmRQ7XhRo=;
 b=ZAFGUbeIjfOfBibORrV2eUfVxjixvEGN+4WI1TI/OFBUhvQKzEzQScjsaqliqnfgT/
 xTHm2GmdY6bl4WSQ0QZdXiG7+i/InyeY3lFDECIO8hBhQs7uscpVdIzWshl8WabJq2sT
 4fezAhWjm8n/Pty+m/cIW6T2O6Cns10n7uaWAP3mT8pz55I3XJ70P9SmQq8MU7IZepue
 GeIlzisQmVYw2dBvimmIt0iWw1NdmswXm4gjNWlIH4N1PewxaWU2Z1/OK5gM+SOaskmq
 qELHW3Mi9YnI58QMkiZoIpvuqMosDZCesJQiCOqt/XFtePOB07sy8E4FJ9+m14inyZ7r
 DAxg==
X-Gm-Message-State: AOAM5306yko96SZj/eg7mYPLMk3kpbobLlFe4JWRnEXzdO1hb3nqffPU
 uadTDk87e1gOBB8o0AgvTnzN5gDiiWauDlH8VpScQIBP+AOFkvCqziBrLUwcrVbP41IPwj7BsL2
 q2Kp+1jiZknqWIgzoDQzD1uLwrnTDVrU7dae8muWecuRb7PiCjmRINOabNBpK
X-Received: by 2002:adf:c803:: with SMTP id d3mr15911888wrh.108.1605479244399; 
 Sun, 15 Nov 2020 14:27:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqPtN56L38gRTqBHFkoTu3KtlfiPTZEJPr2OHIurlmyB0JKYvY1E9VJP6UFrDRtzWWlJlwnA==
X-Received: by 2002:adf:c803:: with SMTP id d3mr15911871wrh.108.1605479244220; 
 Sun, 15 Nov 2020 14:27:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id j127sm18849572wma.31.2020.11.15.14.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:23 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] hw/i386/acpi-build: Fix maybe-uninitialized error when
 ACPI hotplug off
Message-ID: <20201115220740.488850-6-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
is already in the "if (bsel || pcihp_bridge_en)" block statement,
but it isn't smart enough to figure it out.

Restrict the code to be used only in the "if (bsel || pcihp_bridge_en)"
block statement to fix (on Ubuntu):

  ../hw/i386/acpi-build.c: In function 'build_append_pci_bus_devices':
  ../hw/i386/acpi-build.c:496:9: error: 'method' may be used uninitialized
  in this function [-Werror=maybe-uninitialized]
    496 |         aml_append(parent_scope, method);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug is off globally")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201107194045.438027-1-philmd@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 45 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f66642d88..1f5c211245 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -465,34 +465,31 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
      */
     if (bsel || pcihp_bridge_en) {
         method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
-    }
-    /* If bus supports hotplug select it and notify about local events */
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
-        aml_append(method,
-            aml_call2("DVNT", aml_name("PCIU"), aml_int(1) /* Device Check */)
-        );
-        aml_append(method,
-            aml_call2("DVNT", aml_name("PCID"), aml_int(3)/* Eject Request */)
-        );
-    }
+        /* If bus supports hotplug select it and notify about local events */
+        if (bsel) {
+            uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-    /* Notify about child bus events in any case */
-    if (pcihp_bridge_en) {
-        QLIST_FOREACH(sec, &bus->child, sibling) {
-            int32_t devfn = sec->parent_dev->devfn;
-
-            if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
-                continue;
-            }
-
-            aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+            aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
+            aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
+                                         aml_int(1))); /* Device Check */
+            aml_append(method, aml_call2("DVNT", aml_name("PCID"),
+                                         aml_int(3))); /* Eject Request */
+        }
+
+        /* Notify about child bus events in any case */
+        if (pcihp_bridge_en) {
+            QLIST_FOREACH(sec, &bus->child, sibling) {
+                int32_t devfn = sec->parent_dev->devfn;
+
+                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
+                    continue;
+                }
+
+                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+            }
         }
-    }
 
-    if (bsel || pcihp_bridge_en) {
         aml_append(parent_scope, method);
     }
     qobject_unref(bsel);
-- 
MST


