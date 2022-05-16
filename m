Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9887C528306
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:20:13 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYlo-00027X-H0
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6X-0006xh-QJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6W-0005OI-67
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
 b=b/akkovGRNTEvLQRVPWntm2VixACIwrTERzh/FBKbLQNsfb6+6U91T1zGymrgCqI0YXWwO
 y8d7Y79Dy9APlva9mu4KO8ezbAPotW1kJHx0oV228HDyNgW9b9BHSApLp9+RZzq/zHR9xV
 CHQ4lePWgmR2uIi3pUkaCyghZbJig2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-mvs6L7DRP_eqfom0ZDE-8w-1; Mon, 16 May 2022 06:37:30 -0400
X-MC-Unique: mvs6L7DRP_eqfom0ZDE-8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso5440208wmr.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5AC5uF/WZuTpqfGs+Ddsx5o6audS2NY0UkboNjUXSC4=;
 b=04eY8mWkL/ZhN+atJvSIdpV8TvAUyEKGr3pSTMuOMZEF9kmjitERgzJzAmUnW7Mv3D
 4CZfHgFMEKgUGx+ncgnazLjR9js0gAZIT5iiwNWJPWdZP0LeeKkrp695YArdbXKaIBAw
 gCKJ7Velq4e5Mv+VKO+mAfO2RGpehYvVB5mk2gAzKrJkKLbjMqsKPowNBlL8YeiT90Hx
 6fgAF83Sl10qYGSUHxQN9WN4MK8onjo2zfSBBBS4Mz5v8f1BSBJqDaImGzPxcOsIqs4L
 CGhd21n2+p+8tWlIVJHPkSpxk7owat0i1POqcrmigSx97zSp2LK62162wsdzBhZK4pMs
 KW+g==
X-Gm-Message-State: AOAM531bf9C97G2kwbHrBQEgeP2Dny7fMfT+4bGhq3Y2i9QElwRtiVph
 oMe4d1P1fUKdJtSxLl2S7EPl8Q6e1McnPVPXvYSqbDYGTf7XamM8KqacshvlyA12cYvge1ITy+v
 IDKUbng8gmzWtvT0LDA0+Wnsp9KHTB19Uz1Q7eah26tMrQ9GTDqWvMTTXKwQZ
X-Received: by 2002:adf:f504:0:b0:20c:734f:d39d with SMTP id
 q4-20020adff504000000b0020c734fd39dmr13767115wro.717.1652697448864; 
 Mon, 16 May 2022 03:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ6dRgiTpTvQVOzErV6u1i2qN280IwC2zdPiMbjDhaN3+Ae8u5DZMod5CEnoMyiZIhWSxCTA==
X-Received: by 2002:adf:f504:0:b0:20c:734f:d39d with SMTP id
 q4-20020adff504000000b0020c734fd39dmr13767097wro.717.1652697448640; 
 Mon, 16 May 2022 03:37:28 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 w12-20020a7bc10c000000b003942a244ee1sm9629511wmi.38.2022.05.16.03.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:28 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Subject: [PULL 31/91] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Message-ID: <20220516095448.507876-32-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This adds code to instantiate the slightly extended ACPI root port
description in DSDT as per the CXL 2.0 specification.

Basically a cut and paste job from the i386/pc code.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-30-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 20 +++++++++++++++++---
 hw/arm/Kconfig          |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e7e162a00a..7c7316bc96 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -5,6 +5,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/acpi/cxl.h"
 
 static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
@@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
+            bool is_cxl = pci_bus_is_cxl(bus);
 
             if (!pci_bus_is_root(bus)) {
                 continue;
@@ -154,8 +156,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             }
 
             dev = aml_device("PC%.02X", bus_num);
-            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            if (is_cxl) {
+                struct Aml *pkg = aml_package(2);
+                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+                aml_append(pkg, aml_eisaid("PNP0A08"));
+                aml_append(pkg, aml_eisaid("PNP0A03"));
+                aml_append(dev, aml_name_decl("_CID", pkg));
+            } else {
+                aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            }
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
@@ -175,7 +185,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                             cfg->pio.base, 0, 0, 0);
             aml_append(dev, aml_name_decl("_CRS", crs));
 
-            acpi_dsdt_add_pci_osc(dev);
+            if (is_cxl) {
+                build_cxl_osc_method(dev);
+            } else {
+                acpi_dsdt_add_pci_osc(dev);
+            }
 
             aml_append(scope, dev);
         }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 97f3b38019..219262a8da 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_APEI
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
+    select ACPI_CXL
 
 config CHEETAH
     bool
-- 
MST


