Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EF3E55EA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:51:14 +0200 (CEST)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNTd-0001EI-5n
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPK-0006W6-L5
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPI-00083v-2L
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id by4so10329245edb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a03XgQNkFMPjBL/zvIBVfYCJefW6jvTdpIcqSkUY9rI=;
 b=u1e5c0Sk3pIOVi1F9DI9SZVYO4dUSulXZ81wo6KgFlZA7aJlfITm5Eru4O7myZ8xEn
 czUTu6hJ5Sy8a+HuZAGdn2CbOLXEJ+30wvgwJaUwObGiOZVGwV5nxbLAYqT1n6BddoUq
 J8+534SSeeINaLRkj7+hxWe58EWwZ5gjpMzxtkkAjcao0ds8ziQEq+cWhyw5aXe5k1oz
 T+W9d8fMzAuN0ZSsmd86+kFpt83jcm3mJiPeUlgL1QCEV2yKFZ3u38JEEmtcGgtA4wpY
 pESnSWHe/60wuRThjkDeIRjwstFgfVjp+EkoZXBGKiUSZRem23yVnkuLtCw2gEysGNuA
 xv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a03XgQNkFMPjBL/zvIBVfYCJefW6jvTdpIcqSkUY9rI=;
 b=hVRunHpb/02zXYrgPxRsnDenHCZ49ntwo5dEG7mBj6edc9baxD6B5FslsRYNJIK0HI
 6ltEfY4Qb4QGSeeh7FID/zYxGeJvmPn8bBdZrO10aWQczsLwF2bnvfjsrb5eKLqp+04X
 7jR2eKgLUvJkPA6tZ1vtkozgF2W5MQ43qVVHCD1iu22oagRD371032hxBAvRQkdbs1f2
 3dfGDUwiKJ4R5LLXhF+1ehPgelYovU48oT+3yaBGRX1r5noMt/IXlprW9MrYyF7xRRhO
 eKFkSBZwvTE+JSt8Xkdz/K3ifcii/zUYlYESXAm/qR7PZgxmqr+QxMc4O64Ybxe7yNo/
 RqoQ==
X-Gm-Message-State: AOAM533HL1j1FEvmjOgVP+DmxTCVqqM3++65KGLx5lGq7oTCvb7dwhzQ
 ZlWzwOlUYph8Q6SudOeKBZZ8MQ==
X-Google-Smtp-Source: ABdhPJy4yaOV9xftfj0WUrN5deo6EqYz3S7ai5YLcM9ACTWhg8ii0wYrC3+QBpGL630kbLcTkLaWRg==
X-Received: by 2002:a05:6402:619:: with SMTP id
 n25mr3645198edv.243.1628585202531; 
 Tue, 10 Aug 2021 01:46:42 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:42 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 3/6] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Tue, 10 Aug 2021 10:45:03 +0200
Message-Id: <20210810084505.2257983-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

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
-- 
2.32.0


