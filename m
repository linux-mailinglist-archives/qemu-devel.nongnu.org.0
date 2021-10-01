Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C405D41F452
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:05:45 +0200 (CEST)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMum-0001zE-Q7
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUG-0000XQ-1H
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUA-0000fo-62
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id k7so16526513wrd.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yO3yTTEzbhf/x4NiXg2WSPV6sp86QcJAMc0N5bcX0+w=;
 b=B0y+jAY1R3bsDDR0ds7bcYmxU1Xq6NEl1fRXnVVvBcmTTo8gSreqmxh6/cV2GJfG8U
 g6GDZMGtPpE5H8gTw1liG/rKJo9wQ/0ZFMr8vODzZRA+IvoCrfaL+jDNpeUprOTPlMLx
 uU83jm/+TehUGR4IZujs1kpeQr+uk/Su51+/2/PMwQXRr4J5ohonq/NDRRRI/rmQjhV7
 ypPc97aarua0C7mUP7bRV/GFvlpewTLcFSuxQ6unP9WFrOO0OwLF/h+AXydPVhqkkfTH
 2cmJPDhScFeDw4gEDt2P4HMg0j1YfDfVvLhq2ctVFKx3UQwX1CwpJu5BfdNNGXx9Ctem
 gsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yO3yTTEzbhf/x4NiXg2WSPV6sp86QcJAMc0N5bcX0+w=;
 b=G2QkwrO2hACPu6I1NVPgO3asMSrHUOFceyuHQLy5T1EMu0HcZv2sOtDaWJfv3qEByS
 uYSQhgu8ZbA8U2WAk17HdNqrcZW2uq3pgOjDzgh/pS9pIQveLCGvp3/iMUpoGYKs7W4j
 Cl+NcY1VNMUKFXei1u1Hy+IMrUgQ1iikd+V1wEG21JkQPO/VnV8Iun4/lBJhVWRhqlY6
 phud76TBvUVO+Ol/6JD3WcwA0zQyytiyJMbYaK79K4SBLA3gF7gWDDU1il+okchQigSZ
 B0Tt4rQdamJqZdKc5Z+52IM+gj+jGpqufyfaRxWYXpvyKfg6N/BwGR5z4xnl+VhSNZ1g
 FpNA==
X-Gm-Message-State: AOAM5312B/nGNfClHpYBzXkc+lrmN0oJgF2W7EPkMqJZWckmgwZOiCvg
 6KbLHwjIcckGvMhR/YkifMPSMw==
X-Google-Smtp-Source: ABdhPJxpupnCW2Dsa3o+TmUhNfRdGNR0AvRZux1AsfCeA3eaDRxE8/8zYEOv2IK8WsP1ZEIrbIhQlQ==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr9926159wrc.394.1633109892789; 
 Fri, 01 Oct 2021 10:38:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:12 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 02/11] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Date: Fri,  1 Oct 2021 18:33:50 +0100
Message-Id: <20211001173358.863017-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cec97352b..e26639e1e1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -934,6 +935,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
index 18832abf7d..a05d75faca 100644
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
2.33.0


