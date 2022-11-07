Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46919620383
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzj-0005F4-CR; Mon, 07 Nov 2022 17:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzS-000552-D0
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzQ-0000aw-TH
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=DfJye0pJItj2rhbMs+5JGePGWjEvjKii48aGkPZ/10XkForNudwUiiLJ2nQgluBkH8sdqE
 Fu/Tmyt+qjUIrnCpk+tB4TN5IGM1S3FTAr947g2KIFnfIDbRkXfrRK1Q7IDiPaY+sxs+Hj
 4WNnWf66THHMLfFAc4wfdoaSbIqV9/g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378--OLvLB3fOjeNo3UAoA75LA-1; Mon, 07 Nov 2022 17:53:11 -0500
X-MC-Unique: -OLvLB3fOjeNo3UAoA75LA-1
Received: by mail-qv1-f71.google.com with SMTP id
 d8-20020a0cfe88000000b004bb65193fdcso8560619qvs.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=JVFdPvnsX/AA1HaQEASl9G1QLJx+T+1G/9/DnSkpz4BrJxFvhD+6dJHqZ0NTyJ7hV5
 FHjLPvD/5ZUoYcebjI6AKfFu267LjCIJDudxH+yoTagN9VqB/9Q2LBoNvUMMHOcU7Cpl
 9bJ7UXJEAuWZMTxaA1ExcsB1B1aEOuBc4Xty7h9ea8cEiEkuKk6UGwWJY5/C05IdyQXT
 v0g1V6D7+91xVp0wfst6RwjhTdSb1oR0lJoesf4TxVwzavwZwrAH6NbH418tNmHxL+kL
 VkSofmXbXPJfGXfVn4yqYE+A4xOKI7/dgAuiHoXCh2HenoZIAslBgLiKdIbMH/v8S6pl
 YPNA==
X-Gm-Message-State: ACrzQf0sIGoCNVdalkCHiPihs0Vu7AMDzS1XOQAq5iMFoIgvRckRS7de
 Rr9icJn3IqlBKBfDsZOkOnLwYH+kKreYgfWLAGRcEhqoXHMoUrRKJSgqBEJHLTveXJQcuNp+VCr
 nK3kwASXd+sbiC8d64MhVAXlXYgTFzW2FDztHJ2jBHfYt9LmkpZyXymhZn7n2
X-Received: by 2002:ac8:4d0e:0:b0:3a5:17fe:aa58 with SMTP id
 w14-20020ac84d0e000000b003a517feaa58mr788110qtv.355.1667861590748; 
 Mon, 07 Nov 2022 14:53:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5GeXnekYxhX5f6MKGsbsfByqGlPxFsKXogFQ8iHAVw1leWud7kIHRoaNhvMxPIHg70nyGOHQ==
X-Received: by 2002:ac8:4d0e:0:b0:3a5:17fe:aa58 with SMTP id
 w14-20020ac84d0e000000b003a517feaa58mr788100qtv.355.1667861590437; 
 Mon, 07 Nov 2022 14:53:10 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 bp30-20020a05622a1b9e00b003a50248b89esm7055626qtb.26.2022.11.07.14.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:10 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, qemu-arm@nongnu.org
Subject: [PULL v4 67/83] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20221107224600.934080-68-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


