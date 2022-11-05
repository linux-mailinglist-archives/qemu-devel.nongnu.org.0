Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4161DC6C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpq-0008P0-0Y; Sat, 05 Nov 2022 13:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoB-0007H1-W0
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoA-0007io-GZ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=MvJz/v/e1AfssGHVmS9UhMpanVnaUKdgOCboALRgPBDT16d0K4DAi8ktNoi7gEzZIv3dWp
 nd0GD1aeyaCcTWEVk3y6Kuvivcu+bio6nSw4Qn6OwRudIxLxTm82aA2tB3FJs+ecE6J1fI
 8KNEgzb6gh1MT07VwJrnX7uq3mnV1SM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-mEST8sc8OSuSgHTVA_KS6A-1; Sat, 05 Nov 2022 13:18:10 -0400
X-MC-Unique: mEST8sc8OSuSgHTVA_KS6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso6007079wmk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=nnann8Ib7RHTR+YTJdKgHWbeCgNy4QcxVRfErP8tb8Q2oxScUbD/c95i7+IsbiXHEt
 FZ0xiEjy0HRZvlxeK9QsJJhEk4Ug0jWZ5+4JuFg/SP3LBKbhVDo8BdfX0q1ppOx61ulp
 1EtO4+oU+ASXyXa99/9MnmOotD1JvlEmo7+vqunzHdq6AL/+mny5tgti2gGvZ0gE/jSm
 WrXktQ+GWDxVQzbWSP77zLIKLNemxS3wNcq8/UG6TnsHsf9o4AE7rn1vVEZerkY3h/J+
 R0V7KrccJ5wOAb2mRN3x8WkiNEGRyDjd8LEyb+MuD/J159Ngx2W2qBKs0+lTrJpnZRX8
 cGkg==
X-Gm-Message-State: ACrzQf3DEDV+ffaZclUKrUsZNft9TolMMFhf8bl1T5Y6k+HaK81UVIKi
 8yZmGvScvDf32RGWzVdF1FC5NmDVFmmfJtSWuUezYx50GiCzr+iJNVEsFq3ZffSg89ERW9cVIPy
 l/kfGwWwrcAWGAFgwMZjF0auvyc3e+EekdhSXGJ7ENodA4KElmv1ED1rup4d9
X-Received: by 2002:adf:f5cd:0:b0:236:55eb:a25a with SMTP id
 k13-20020adff5cd000000b0023655eba25amr388922wrp.55.1667668689162; 
 Sat, 05 Nov 2022 10:18:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5TW32mQX+xs5PptteDJLgC6q/Pmf79RXB1U8Hcalj6hX8hstS6NtzZo8efMyM10iwXTc8UfQ==
X-Received: by 2002:adf:f5cd:0:b0:236:55eb:a25a with SMTP id
 k13-20020adff5cd000000b0023655eba25amr388913wrp.55.1667668688930; 
 Sat, 05 Nov 2022 10:18:08 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 i5-20020adffc05000000b0023660f6cecfsm2597877wrr.80.2022.11.05.10.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:08 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v3 55/81] acpi: enumerate SMB bridge automatically along with
 other PCI devices
Message-ID: <20221105171116.432921-56-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


