Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833596AFC24
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMf-00081x-If; Tue, 07 Mar 2023 20:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMd-0007yi-Si
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMc-0001iS-1j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J9ti866gyx6DOxptU+MHiY2Rogorph6rb11rc9zbrrY=;
 b=gI1Pd2AxX4eddeSBszx0lMQm8CBYE1WkNIS86Z9rLiZYsViJaAJ96CA78KY8J619p3KMrO
 CpVp9aSBrnzs6tmEcPNh2kBw5syhd3wyRDmwq7d2gjoNSAGs2c8fSwZooBElweAxTcLi4r
 ozUdw0AR9acatFuq8iuTXvTPjNHDer0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-iB-4VPYvO_eomV4OmCOkAg-1; Tue, 07 Mar 2023 20:13:03 -0500
X-MC-Unique: iB-4VPYvO_eomV4OmCOkAg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w7-20020a056402268700b004bbcdf3751bso21221707edd.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9ti866gyx6DOxptU+MHiY2Rogorph6rb11rc9zbrrY=;
 b=Hz0nxW6GFZAexKqbSfy0q1Mii1D60fXNSrWIkwjvMQP4PommmeMzUnJQ55vK1kWamS
 ++i+kmB6unlxrDPYhkHLdPkHfscLrOTF4OfSN7TVdw3F240oLK/MqKo2OtxN2vHrTt7y
 yH6Qe23Vc5NxCAMZrOol1/lovkt+KAbsvlOc4fuisWuw5Kb5OYZyoGBiCjAv2VjNQOKE
 BvNxDFKGkk0Kaec3qAzD7yijv3D2XrknQB4BIvH2R0Xy64WkU3fEdcGplHElj0iJiHVZ
 rD2P1/TQ9BXfwJNqaeBubaDI5WUJ4H+Ypq2+Tgy2QMQWuDHJ+tAJFpDDPhhq2sE9Scat
 H4Vw==
X-Gm-Message-State: AO0yUKWjVYkm2CTwtrLMz22fhTlhqUgYRC3oVvHpRcPAfgQSxHIvIF9q
 WLOJ3J0Oh2aNBPwTxQXTX52+q/5MNKbEZ66etGLdQmVoSgt9PZ7KBVXlpBIti1/pxJZuToYMulK
 I/GCwJwV6k2441bPW62EQRmn64XZ+il5hh854/mYF8NsElMTWvJ82FSXKnHjUC7c6kyFy
X-Received: by 2002:a17:906:fe0c:b0:8b3:b74:aeb5 with SMTP id
 wy12-20020a170906fe0c00b008b30b74aeb5mr20862800ejb.30.1678237982226; 
 Tue, 07 Mar 2023 17:13:02 -0800 (PST)
X-Google-Smtp-Source: AK7set95WoljaVcnVYohrRZGmc7Q4t40CNqagR8V2ugL/AdvNd4iF6wk6YBbnM9GmHwAfUkG4HzuAw==
X-Received: by 2002:a17:906:fe0c:b0:8b3:b74:aeb5 with SMTP id
 wy12-20020a170906fe0c00b008b30b74aeb5mr20862782ejb.30.1678237981905; 
 Tue, 07 Mar 2023 17:13:01 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 o13-20020a1709062e8d00b008e22978b98bsm6816302eji.61.2023.03.07.17.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:01 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 43/73] acpi: pci: add EDSM method to DSDT
Message-ID: <fe0d5f5319bbf4c7c772bb6579cdb17496dcb946.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

it's a helper method for acpi-index support on PCI buses
that do no support or have disabled ACPI PCI hotplug
or for non-hotpluggble endpoint devices.
(like non-hotpluggble NICs, integrated endpoints and
later for machines that do not support ACPI PCI hotplug)

no functional change, commit adds only EDSM method in DSDT
without any users. (the follow up patches will use it)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-18-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 54 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d8ec91b8e3..6f5501fb74 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -399,6 +399,58 @@ static void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar)
     aml_append(ctx, ifctx1);
 }
 
+static Aml *aml_pci_edsm(void)
+{
+    Aml *method, *ifctx;
+    Aml *zero = aml_int(0);
+    Aml *func = aml_arg(2);
+    Aml *ret = aml_local(0);
+    Aml *aidx = aml_local(1);
+    Aml *params = aml_arg(4);
+
+    method = aml_method("EDSM", 5, AML_SERIALIZED);
+
+    /* get supported functions */
+    ifctx = aml_if(aml_equal(func, zero));
+    {
+        /* 1: have supported functions */
+        /* 7: support for function 7 */
+        const uint8_t caps = 1 | BIT(7);
+        build_append_pci_dsm_func0_common(ifctx, ret);
+        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret, zero)));
+        aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
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
+       aml_append(pkg, zero);
+       /* optional, if not impl. should return null string */
+       aml_append(pkg, aml_string("%s", ""));
+       aml_append(ifctx, aml_store(pkg, ret));
+
+       /*
+        * IASL is fine when initializing Package with computational data,
+        * however it makes guest unhappy /it fails to process such AML/.
+        * So use runtime assignment to set acpi-index after initializer
+        * to make OSPM happy.
+        */
+       aml_append(ifctx,
+           aml_store(aml_derefof(aml_index(params, aml_int(0))), aidx));
+       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
+       aml_append(ifctx, aml_return(ret));
+    }
+    aml_append(method, ifctx);
+
+    return method;
+}
 
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
@@ -1398,6 +1450,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
+        aml_append(dev, aml_pci_edsm());
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1413,6 +1466,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
+        aml_append(dev, aml_pci_edsm());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
             aml_append(sb_scope, build_q35_dram_controller(&mcfg));
-- 
MST


