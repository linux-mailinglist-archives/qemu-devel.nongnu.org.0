Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2010616873
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKp-0001SV-Nw; Wed, 02 Nov 2022 12:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKg-0000rQ-OH
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKd-0003ML-CS
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=ehZJvyln2j3Rw7Nuy8ACjoj5MdMzMQmJXvNx7mpyJh92WDuN72Uic7EdUzivPgluiWsvaS
 XIzqXx0zcvIFLB13Qow2nNnWGjux5mJ+hKm+TLpf5l5mjFYAk+yWBP9mJWRPCPmG75VMLS
 qiInioarJ/bAFpKlJ4MRtbf6laH4wvM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-OQ0Sn-qcPDWNhuEx_oC6Eg-1; Wed, 02 Nov 2022 12:11:09 -0400
X-MC-Unique: OQ0Sn-qcPDWNhuEx_oC6Eg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so492887wmb.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=snqFkFFJ//2P5TE5YdnYO2Y0HBkAzSSCoTZBnqCS9qvc+7slJk6ZM9bBq3x1oAIatq
 HRHj+oTR8hx2FDHMIVMEp90owi+tuCC0wffHIRhJYTRWuAUX8mwA7j9dInQGhnHvEaMX
 YVtkxyKXcqeeZRtrKc8uH27enTNNxAI5tI/aTR6v6nuRW2wJfAky1G0KP43BIzdk0uvA
 te9NZ729Tk4PIkUM6M/xD66bNH7owHaghnpKCtd/oKWs0CIB19QJqiQLX4AxcH/WhEuk
 VMnIzDZuQS0TcaEK5jpNzkhMQ00k5dJnKrKqvbRA2GJ9rRIqGGGs6hh9juljZz0CQSMd
 0ysQ==
X-Gm-Message-State: ACrzQf2Pxsc8bdYNNtR/CEfOi6lXTHALWvLr05u+aGFQTdkJsTOqx+iW
 1lzypqdKqhUG/PQTvg1GHj7oyt6ZoX+BCOkoa1X/faLeLYw1E8dRZCOE6X31daByNaBTMVsD9Oe
 zg1taUdFyTxf91Box1bHhtB5ijJ/nRC7/kVDp62cBn+ycUvdJ8zAr9sQt8xO2
X-Received: by 2002:a05:6000:684:b0:236:839f:9276 with SMTP id
 bo4-20020a056000068400b00236839f9276mr15237331wrb.586.1667405468087; 
 Wed, 02 Nov 2022 09:11:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM45zqwkR9ZNWABfm9VasLhH6R6dRb3BS/u03JpK9XkH/uYteJSDR6bxD+BV8MEyUlFpiefP4Q==
X-Received: by 2002:a05:6000:684:b0:236:839f:9276 with SMTP id
 bo4-20020a056000068400b00236839f9276mr15237293wrb.586.1667405467709; 
 Wed, 02 Nov 2022 09:11:07 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h17-20020a5d6e11000000b002356c051b9csm13083631wrz.66.2022.11.02.09.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:07 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 58/82] acpi: enumerate SMB bridge automatically along with
 other PCI devices
Message-ID: <20221102160336.616599-59-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

to make that happen (bridge sits at _ADR: 0x001F0003),
relax PCI enumeration logic to include devices with *function* > 0
if device has something to say about itself (i.e. has build_dev_aml
callback set).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e1483bb11a..916343d8d6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -448,9 +448,10 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             /*
              * allow describing coldplugged bridges in ACPI even if they are not
              * on function 0, as they are not unpluggable, for all other devices
-             * generate description only for function 0 per slot
+             * generate description only for function 0 per slot, and for other
+             * functions if device on function provides its own AML
              */
-            if (func && !bridge_in_acpi) {
+            if (func && !bridge_in_acpi && !get_dev_aml_func(DEVICE(pdev))) {
                 continue;
             }
         } else {
@@ -1319,25 +1320,6 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
     return method;
 }
 
-static void build_smb0(Aml *table, int devnr, int func)
-{
-    Aml *scope = aml_scope("_SB.PCI0");
-    Aml *dev = aml_device("SMB0");
-    bool ambiguous;
-    Object *obj;
-    /*
-     * temporarily fish out device hosting SMBUS, build_smb0 will be gone once
-     * PCI enumeration will be switched to call_dev_aml_func()
-     */
-    obj = object_resolve_path_type("", TYPE_ICH9_SMB_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
 static void build_acpi0017(Aml *table)
 {
     Aml *dev, *scope, *method;
@@ -1440,9 +1422,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_q35_pci0_int(dsdt);
-        if (pcms->smbus) {
-            build_smb0(dsdt, ICH9_SMB_DEV, ICH9_SMB_FUNC);
-        }
     }
 
     if (misc->has_hpet) {
-- 
MST


