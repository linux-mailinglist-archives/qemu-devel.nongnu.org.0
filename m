Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F117C4706BB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:10:01 +0100 (CET)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjPF-0002zB-2t
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLL-0005oa-Rh
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:06 -0500
Received: from [2a00:1450:4864:20::534] (port=43790
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLK-0006QZ-5a
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:05:59 -0500
Received: by mail-ed1-x534.google.com with SMTP id o20so32376685eds.10
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZYrOTlTize273kRDCgsOSabJUg4Thn9EplwiX40QqE=;
 b=zRieCPc0wjXAXswALgOBEXD5yw0zQ/C4scJuDI+y+gHD7LGo9pLaZQNoRhc+3/PyuE
 +EMJ5+UiduqNSopqv0qdRwnvkalaPbxU1775UlXDIiyaiq5nDfHQpQy5g6/p3CUF9T0J
 8DIT+TVkciZz20iQk9dW5vvJYRDHKWfMKaY0pNptP68CWXn15fmOIL7S0M+G/2H9zNkU
 JTOfCu3akXThV/WhQBZhOnITwwd/9PsPlgGK/exEtqnnZfsAr0aPQslS4jsh1CjvMsX/
 UiHDyGBA6luM24R1SX7ciupGLd6NBfMuHfXhT8O4WI1aTstl1IEFtFrEbjOWEmCP6SBk
 cadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZYrOTlTize273kRDCgsOSabJUg4Thn9EplwiX40QqE=;
 b=OawhWUcyUeyJDjiFYXkbbUax9ySPDBYkMIqrK2nVU+w3LT4pFjpioeTQul5JVB0hw3
 pMU4BAxAi2v6pB1TdCPtIM6R9uT40HlJRUpbFU7OYMvA/63XII0L4BVicqlyChV9naRc
 81q6QgGWvgfqmj2hxUFUDVWVFdaNe4rYtycY/3q5C/Bijb87KFiE3tz1k05IPhiWsApS
 8ORMUtkM3JNtxhl0MD86o+sBN4l2YaDaJ93biVzQ5TjC5m0nDGrf/Yo+XybdZW38R+Tp
 3Skt4+rSmCzBBUwUr5MpsxkIuGtiqAhuuVPTX72b3pMH+Yxs7GRnSaWRs63FoM/S3ONM
 McwQ==
X-Gm-Message-State: AOAM532lbNsg6XnDfS7KNxjE9je0+s0d3a8p8Ni7wjgSfdyOBsGzwiks
 zCrkngGaXcfLt2vmY9S4luXAZg==
X-Google-Smtp-Source: ABdhPJyaTE7xFM3xfjBl+4pYJYY004EbKM/SX3TlGIlgBCuHKguRhbfTsl6TDMF97GF9d9WPJnwFkg==
X-Received: by 2002:a17:906:fa87:: with SMTP id
 lt7mr25701801ejb.426.1639155952779; 
 Fri, 10 Dec 2021 09:05:52 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:52 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 1/8] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Fri, 10 Dec 2021 17:04:09 +0000
Message-Id: <20211210170415.583179-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f902652..d0f4867fdf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -1011,6 +1012,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(ms, tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d37d29f02..e652590943 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_HW_REDUCED
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
-- 
2.34.1


