Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21B613729
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJz-0007sX-0j; Mon, 31 Oct 2022 08:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJI-0005bG-Vh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJH-0003aF-DE
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=WFBhN2APUo6OeBiGkjrjOLmPpsJlwc/GIxwglVf+meKQfeed5jvf6X4kZxpb8uXl5HG23G
 N35EZVSBvwEsVJgSQmxgISaYWkPxIskOQfdsFI7H0eSEIGgin0Y5fosVzyTEC7zk4pbwHz
 XxW74r085yimUiSRNcco2HmntgR7xdc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-38LZb5jVMQqQV92RwZnSsA-1; Mon, 31 Oct 2022 08:54:33 -0400
X-MC-Unique: 38LZb5jVMQqQV92RwZnSsA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so3048576wra.22
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=2UBBrZeAxyWiOldteoD1rt7c4TXXZcthS2Z58R0I3EsUvZEda5eseqkdX9Is8KDTAX
 Ktp+AuRI+aMmdSpJ+FRFB6j61VrVRjnksU1SUWvS5CGX80/go7Gng1X10drzhFUhD0xa
 2x4ekNWksqJ3Pzdw85ZpDPiGH0CU5R4rjqBiWF3yyI2XyJp7YacvV2G6F/ph0ITsSmsS
 zVqVMQvvR63IXAU0Ee6rgH2s5FPNpuQ3JCrRYLIg+8sTEdGIzWkfB+bhGYuABQQXhcSq
 jdNVfYwavmWu7CumLzj4YW3TLckV3ZfTO08ikBOI336KrDm1AlEBi3wDysnFtVw6AR/F
 Tnwg==
X-Gm-Message-State: ACrzQf3A/Eti/GTJAhFOlWBKfRlTehz6+lKRP4gd3tLsnZkWV9eCM4hP
 iZnbTDSovQLd+5YSpoS3pvk8MyVZvMqELnYpiRA81ORR36EYJA7TaFeJ1Fs5K2O7vLBKSgzTP4D
 u626vBinw5YOdvcWnX7bBf6Bcdm/VK6IeVEmtC/wrPCEgwFBBc2O7xla3JbFM
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id
 e1-20020a056000120100b0023661f4b384mr7687133wrx.505.1667220872067; 
 Mon, 31 Oct 2022 05:54:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5vMH3FTF92MwRVYfheBwSabMBnK1qc0hQ520+tXjOoUHIKo2CS7TzAT3rKs6d+pF3mRFiEnw==
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id
 e1-20020a056000120100b0023661f4b384mr7687116wrx.505.1667220871809; 
 Mon, 31 Oct 2022 05:54:31 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003cf568a736csm5265122wmq.20.2022.10.31.05.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:31 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, qemu-arm@nongnu.org
Subject: [PULL 79/86] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20221031124928.128475-80-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221027100037.251-7-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index da9e41e72b..4156111d49 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -987,6 +988,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
-- 
MST


