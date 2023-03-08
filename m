Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3846AFC2E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMs-0000UW-6X; Tue, 07 Mar 2023 20:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMp-0000Om-8k
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMn-0001pL-N0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERnHGD+WHTZ7klTG5kNjn7sN1MSben7lbHWCXSMxb1Q=;
 b=SNPsAG+/0DTFUugEuwNSIB/MxJjCPJl6dZAtkcB/P6XG3pgw2d6n7rtdLmdkS9qXEphDrv
 06m9jv7xMf86o2vxdWsAz7QXxcp7o5dGf7z73Xb49Bc4j1i42g+RyMksUyIkrWZM2pJo+p
 xtXaXA/nRcop/8wOCY4TDXDjYvP2X0A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-D8_QNs5SM3ajRYXYnYDv2w-1; Tue, 07 Mar 2023 20:13:16 -0500
X-MC-Unique: D8_QNs5SM3ajRYXYnYDv2w-1
Received: by mail-ed1-f71.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so21167773edx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERnHGD+WHTZ7klTG5kNjn7sN1MSben7lbHWCXSMxb1Q=;
 b=1flIpRkh/uInjW7U9QyARgvrvhQMxu/lAFdqtx3CO5Mmh3arMiYCS0in76AUVQAiq2
 GSVpB9Wl9PLSthsBF+F59L4KYGXstByyNad1vRso76iH7UeYWxM+CeO0Byf0ciF97rXm
 kLkRynqcn4c/RIJbd6IY5BRb6RoDZNIN1NSUrihCcKSibIEKqYhuplz1n6aQzWh3ZAaq
 lvrraER/oXEm5mAMoqa2hnT+qcNcYRMxXJhFMdQG8yBgrymqiRrR7fbaqmXUMrzj1iSO
 xfYaofPxwCxNwVGThxZdq0XdNB3g47LdSKripCOixF1cWS9Cvpx0y5yfAwKUTGu/VcM8
 uMWA==
X-Gm-Message-State: AO0yUKXSwWAPmta02g4pl4T9l8w7oWxbhJr563rnGm3gzBWuSqX94lfz
 UwyztRj+6oG6kf6iO5UOTc2wAjPj/FCBuXprtpJH0eiNn+5EeSmsc6opOtVivGEyoPXnXtFQX6h
 Etzo2NRWyUP7PQesDTO231dI8w62qYR8gcMFFPNDv1m+Ks+/0F7Ymnu5FeDlJvhHYOrZb
X-Received: by 2002:a17:906:b307:b0:8b1:7eb1:590e with SMTP id
 n7-20020a170906b30700b008b17eb1590emr15136416ejz.20.1678237994448; 
 Tue, 07 Mar 2023 17:13:14 -0800 (PST)
X-Google-Smtp-Source: AK7set827JLZkYrhcF605Gd7vhIy/FF4JX4cu8ACItZDblkV2a74274uM6dFsQ7czQQi0tP19kUqVQ==
X-Received: by 2002:a17:906:b307:b0:8b1:7eb1:590e with SMTP id
 n7-20020a170906b30700b008b17eb1590emr15136401ejz.20.1678237994077; 
 Tue, 07 Mar 2023 17:13:14 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 x22-20020a170906b09600b008d9ddd2da88sm6763929ejy.6.2023.03.07.17.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:13 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 47/73] acpi: pci: support acpi-index for non-hotpluggable
 devices
Message-ID: <7fb1d7388b10f5d0738aee94110344ce4132fafe.1678237635.git.mst@redhat.com>
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

Inject static _DSM (EDSM) if non-hotpluggable device has
acpi-index configured on it.
It lets use acpi-index non-hotpluggable devices / devices
attached to non-hotpluggable bus.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-22-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6f5501fb74..46f78e9338 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -452,6 +452,25 @@ static Aml *aml_pci_edsm(void)
     return method;
 }
 
+static Aml *aml_pci_static_endpoint_dsm(PCIDevice *pdev)
+{
+    Aml *method;
+
+    g_assert(pdev->acpi_index != 0);
+    method = aml_method("_DSM", 4, AML_SERIALIZED);
+    {
+        Aml *params = aml_local(0);
+        Aml *pkg = aml_package(1);
+        aml_append(pkg, aml_int(pdev->acpi_index));
+        aml_append(method, aml_store(pkg, params));
+        aml_append(method,
+            aml_return(aml_call5("EDSM", aml_arg(0), aml_arg(1),
+                                 aml_arg(2), aml_arg(3), params))
+        );
+    }
+    return method;
+}
+
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
     Aml *if_ctx;
@@ -577,6 +596,12 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
 
         call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
+        /* add _DSM if device has acpi-index set */
+        if (pdev->acpi_index && !bsel &&
+            !object_property_get_bool(OBJECT(pdev), "hotpluggable",
+                                      &error_abort)) {
+            aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
+        }
 
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
-- 
MST


