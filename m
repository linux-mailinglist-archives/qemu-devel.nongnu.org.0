Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEAE5FA3B6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:53:29 +0200 (CEST)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxu4-00079a-Ai
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdL-00049K-1W
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdJ-0007XF-En
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usPkxvTH7QvAvChQcJRZywVhPddBwQYaDj8J2SS1D1c=;
 b=ifENLsqW3nS+kfbmZWjWTsSvIULyToJHU9AkBk2EBFiY9Co+2a7MEKtQ/Yup/3dWZG5m8b
 XZcFh4X9PTzZ/A2/XJNcBvjCISuR/J+9KvutjStEC5Fragx1C8tyBgJgab5BC82hGaWT5u
 psAXVC0VgPhM4pyB1qD/LiGG2iOqnhQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-Ygj5TACZOcOzeQa6EQ9XFw-1; Mon, 10 Oct 2022 13:32:03 -0400
X-MC-Unique: Ygj5TACZOcOzeQa6EQ9XFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so9284680wme.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usPkxvTH7QvAvChQcJRZywVhPddBwQYaDj8J2SS1D1c=;
 b=rbFz8FkKVA0vzir9yTC10JuT2ujLO8F6iOKCPbUPgMd4KNvlvFZ1GyObtpAgwYnPeW
 y7hsHniX8bPHEwM1zdWD+Hj+gukz0dKJzoGMdqhBpXTbORs0A3jDTOhFKZGkKD0/pqlP
 xi/qI70UgXMPZy/TIOnC8s9LR79GaDKh8hmlK6eas47AQiFm04MoAOcfyXiG7+3r5Y9G
 qR1T/eHc9ts8xcAqAQsM0wmLGDqwcQUER8Cc75ogZHlHdlKQmRDNl4hbyHLx15RYCNEK
 9lmw7EXI67IDmLwsCO+TUpTKN9aQ5+k4hraBsyn0lgolA80BwJfBT1RleEo05NGx3v2R
 omaQ==
X-Gm-Message-State: ACrzQf1apOkxy+kLk3vl9yiKpoj9k7rGwiltKU8DRJp8NizheA6aU2RB
 sIgKrLa8bcVnMpJ96bquHSvWuyh5MsWu70nTMdy12qAc9FDHTHbd91rhUQ2yz8zWgwYZu+62T4n
 m8Rfm39V7hT+BDBvEA4vFFTEu1osm1EjsptpnS5b2uvuui+VikrpkVtuW1AJY
X-Received: by 2002:a5d:5109:0:b0:22f:ed4:65da with SMTP id
 s9-20020a5d5109000000b0022f0ed465damr9081657wrt.688.1665423121382; 
 Mon, 10 Oct 2022 10:32:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+5V1yYoi02UPda3TFFWY4+Zo1T2XfYLrMFbZPhG22dg1G1gAdyDBK7yM3rWS1wJdjcIkGqA==
X-Received: by 2002:a5d:5109:0:b0:22f:ed4:65da with SMTP id
 s9-20020a5d5109000000b0022f0ed465damr9081640wrt.688.1665423121114; 
 Mon, 10 Oct 2022 10:32:01 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b003b47b913901sm38953308wmb.1.2022.10.10.10.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:00 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 44/55] x86: acpi: _DSM: use Package to pass parameters
Message-ID: <20221010172813.204597-45-mst@redhat.com>
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

Numer of possible arguments to pass to a method is limited
in ACPI. The following patches will need to pass over more
parameters to PDSM method, will hit that limit.

Prepare for this by passing structure (Package) to method,
which let us workaround arguments limitation.
Pass to PDSM all standard arguments of _DSM as is, and
pack custom parameters into Package that is passed as
the last argument to PDSM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6d02eed12c..a19900c4e4 100644
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
MST


