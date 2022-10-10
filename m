Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFD5FA371
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:38:43 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxfm-0001UI-SO
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdH-000457-LM
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdD-0007Vs-Qe
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fPZ+ymEuIQsc1zeD4U7XDpJ3N7mtZLBvgFwV1A1BZFc=;
 b=hGBPmDzynXZwapXt5FgkFfvPco/W5qPue0CnmOBpKiHv3NEBiqFASj5jLB1qsjFJxABAgx
 9FhGBTsZ9R3M6vWWE2Q1JMGya8qXZoQiLgRwPWY9PE3WJWfAQK3raCCAs/cc4ziwXpary8
 gSRX7I9qi7ekP5gQpKaXRWSph/wKHdA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-Qk0nuXNnM9euAtwIsUWo0Q-1; Mon, 10 Oct 2022 13:31:58 -0400
X-MC-Unique: Qk0nuXNnM9euAtwIsUWo0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 fc12-20020a05600c524c00b003b5054c70d3so7294339wmb.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPZ+ymEuIQsc1zeD4U7XDpJ3N7mtZLBvgFwV1A1BZFc=;
 b=HcAJ6VZQNw5Sunr7WuQdhqZjRrfrGbqPqRgeiORutEzi+kAgLDw20L4zgiblAgDoim
 N1DfG/Zo2lDhR5ujDa4YhyuZR4kFTa65vg/M53N+eRzsvwRxFJmSOXYTEGyNRz2F54vb
 yO4lNHNR/ninovybRp7GhAQFpYqUkpcUa5ItTVIPzXVcttK6TWHZ2OGpm/rsyyQ+0kRv
 V+bB7UyHN3R2tGmrU0Zakn9i7Zc8JpRr5RpqB3ZZpzPfU780WYRb1mQoFeX9PsoP4kYB
 0OND+w3fzv7QbDPAB6mI1kVPLnbKbzQ1cf2yTJQAgPLREcWMwIUoY3bUGabyO6Oelm5E
 DSmw==
X-Gm-Message-State: ACrzQf3hBeVG3BHyuxRYuDxLGQGPWFb6VHaAkU0ZGtJHipGJZ+WD/ujl
 wmmefvAcL+TZIPP69Qe8LR/+bBDix8zJ0HZU02VLBYcaXAOdWTBfBJsqfjd6Hw/QZZm9y/dqB8v
 nmBFlyNFwrItTFaTe6om0djQc/4UILBYPtJVHroMbAs3UMHeve9KpLUmHcbuK
X-Received: by 2002:a05:600c:244:b0:3c6:bc2f:421b with SMTP id
 4-20020a05600c024400b003c6bc2f421bmr3092908wmj.32.1665423116740; 
 Mon, 10 Oct 2022 10:31:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5RjrwOabE2OG+sdReZHchMUzZs3taN/7b2tizTMbe5XjB27iFuB1xWCXA4tApvRpZjM434tQ==
X-Received: by 2002:a05:600c:244:b0:3c6:bc2f:421b with SMTP id
 4-20020a05600c024400b003c6bc2f421bmr3092884wmj.32.1665423116471; 
 Mon, 10 Oct 2022 10:31:56 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 da5-20020a056000408500b00225239d9265sm9947404wrb.74.2022.10.10.10.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:55 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 43/55] acpi: x86: refactor PDSM method to reduce nesting
Message-ID: <20221010172813.204597-44-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

.., it will help with code readability and make easier
to extend method in followup patches

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 139 ++++++++++++++++++++++++-------------------
 1 file changed, 77 insertions(+), 62 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 67b532f5a5..6d02eed12c 100644
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
 
-    /*
-     * PCI Firmware Specification 3.1
-     * 4.6.  _DSM Definitions for PCI
-     */
-    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
-    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
+    /* get supported functions */
+    ifctx = aml_if(aml_equal(func, zero));
     {
-        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
-        ifctx1 = aml_if(aml_equal(func, zero));
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
         {
-            uint8_t byte_list[1];
+            /* call is for unsupported UUID, bail out */
+            aml_append(ifctx1, aml_return(ret));
+        }
+        aml_append(ifctx, ifctx1);
 
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
+        ifctx1 = aml_if(aml_lless(rev, aml_int(2)));
+        {
+            /* call is for unsupported REV, bail out */
+            aml_append(ifctx1, aml_return(ret));
+        }
+        aml_append(ifctx, ifctx1);
 
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
+        aml_append(ifctx, aml_store(caps, aml_index(ret, zero)));
+        aml_append(ifctx, aml_return(ret));
     }
     aml_append(method, ifctx);
+
+    /* handle specific functions requests */
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
+     *        Operating Systems
+     */
+    ifctx = aml_if(aml_equal(func, aml_int(7)));
+    {
+       Aml *pkg = aml_package(2);
+
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
+    }
+
+    aml_append(method, ifctx);
+    aml_append(method, aml_return(ret));
     return method;
 }
 
-- 
MST


