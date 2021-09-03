Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C9D400158
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:37:18 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAJh-0004S3-HH
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFG-0004Es-Pe
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFE-0005cT-Bw
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so3747130wmq.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/iDZlUIiWksCDGamgB0/fI2nOB2PJMcezNLmt9rDEI=;
 b=lVKWnYElYrSuBWv0TUfIYfmzM/s8V1xj5XgKHpsWvs6TqIz7taY6Zf0cirPp8/CKzw
 fxI21FKcDXOpgj9Q4897KWRnjuLwdyIkek7pDIOcFWT/qyDpfpgWENbZaECe7FHm+JgU
 N/inlyZIhkmQsl+lw2xyf9Dv/lGUAsbItGgiHWWulQqO/SxXrNkS03MQw/7yNZZY6qTm
 27SkXiG5sBsLecD0/dHvCZm1LILm9DUoZ3wFy93HTSqshrAPHSRcPw+DgQ7Zt+ET6unX
 gduTqymw0BXWFxIy9qgB7RFK7o2dVzJ1Y36WvD+tJiqdnO1CPjJxuxn1ilJ4mRiy3dJY
 G0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/iDZlUIiWksCDGamgB0/fI2nOB2PJMcezNLmt9rDEI=;
 b=lgkT1zrvps3npVUuUouGRxz+wOvNzFORH2s2hpWOqWfqXUvItEcdYsMSxbFsO2rF4I
 cLwhOY3VcjU6FxMtOMhUwhd9daScBUQzD9sSO2P8XeDDJ5iE84fILLAT4h27ODCkybr1
 X+dbB+OaZfFrZAPtQJDsqm5009czH6ZhJMebGiO2r2PlXygsr+j8oJjIofojQULEX9Qx
 cBYY5FVi0UlAaxe11hXAL6/QOY5ey1JlgiO3UplcBHMo+OohJJdz7XgB/zNtuV5OkLKL
 ikuzcqEnJI8/U9uXm7ripVE06oacFGgubrzK9YoFsC/GIi6bdhYIEQqjGkP1WWulU4gX
 jfbQ==
X-Gm-Message-State: AOAM531xCGQG3DICbayuDDuciqMlwHdiFRXprfhSCeiKY9bcip4pQ48f
 eKEx2d1i2opscD5P2PJ958stnw==
X-Google-Smtp-Source: ABdhPJz5YYDQXGhWNjA0fcTU6u+gIwPlvIN6UKxWR1IeMRakpU5pH/X3MtJtqO2uNv9DIdstMNBhQg==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr733449wml.62.1630679559088;
 Fri, 03 Sep 2021 07:32:39 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:38 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 3/8] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Fri,  3 Sep 2021 16:32:04 +0200
Message-Id: <20210903143208.2434284-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/Kconfig           | 1 +
 hw/arm/virt-acpi-build.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..7da0422446 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_NVDIMM
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..e2fa677d80 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -849,6 +850,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
-- 
2.33.0


