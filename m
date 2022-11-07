Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6800D6202E2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:00:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAy3-0003bH-IH; Mon, 07 Nov 2022 17:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAy1-0003X1-9J
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxy-000454-Q8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=fU8hqV1RHJRLKH54IP+jxv71re6xJwvvtb61twICXdKWLsJLk9x/Kw51CxYbcqsLHUMmx3
 Vn7x4nEfbac5k7kt2PqqGqynXCc+PKpiFgabBDc9K8uQNm9gldFypoVCSZJQPnjkyWvl9S
 qGadTEz5jIXQIAHGnDvPGafW2BF3dHI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-M-GIWX9aP3On9UvuLcagwQ-1; Mon, 07 Nov 2022 17:51:41 -0500
X-MC-Unique: M-GIWX9aP3On9UvuLcagwQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 71-20020a0c804d000000b004b2fb260447so8604029qva.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=3AzWhiZYXo8tp0Ru/P+tpECDFtJYuCRv9Bte3Zf16wXuEeJYFUzy+h36/2xokhBTPH
 OgDu2I6eVwVsgvhIM/90+YfXlBQsMq453CLaA1Crkzcw3rzEyObj24dFm9BLY4d3tK/V
 EKfS2ytxeDCG6H2w/mXN0ujVxbNU0t3JXbW4e73f08/uXAWO2kr+8o3NvxCSm+KuphFd
 6f5+B+ms/NOWvvBMBuxCD6BiuxtyNikpY4G1hB7bNB2+AcXW0JhgKFUR367lUGO3NHQ+
 To2BAnzalTWHPPtN6kf7E+kBWr2+3SOPSyTUjDoDmk5z4QuC+vGGH7BL9mgJLn7nHOj4
 RvfA==
X-Gm-Message-State: ACrzQf2IOcVNzMUww3/ZRcrPjFcBxoRR9ZOK8E3HqByEE2XxGth1xQiO
 GTtvDBMDVGjLyfloATsJkyBO7nVJgt5PziW8XTQP2yattPeZyKri5PulKEK2O+kSTT5i80CgF3B
 WrmxKcDb+4QFdw0qVPSCEnPlG672zka4WNMlP69WXR5ik5Twri43i/YXy7ukl
X-Received: by 2002:a37:65d2:0:b0:6fa:132:1729 with SMTP id
 z201-20020a3765d2000000b006fa01321729mr36972677qkb.188.1667861500615; 
 Mon, 07 Nov 2022 14:51:40 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4WB4GajIO5nDCHLAECOzCAW1mtkqUIaZFuC20m2V1Dk3wpA8VcG1o/CcrdODaSDzx+ZI458Q==
X-Received: by 2002:a37:65d2:0:b0:6fa:132:1729 with SMTP id
 z201-20020a3765d2000000b006fa01321729mr36972648qkb.188.1667861500333; 
 Mon, 07 Nov 2022 14:51:40 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 ci25-20020a05622a261900b003a57f822157sm5652660qtb.90.2022.11.07.14.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:40 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v4 50/83] acpi: enumerate SMB bridge automatically along with
 other PCI devices
Message-ID: <20221107224600.934080-51-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


