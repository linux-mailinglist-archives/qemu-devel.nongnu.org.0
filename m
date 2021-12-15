Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC064757C9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:32:45 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSWa-0002XR-Az
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:32:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRih-0007HW-Ma
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: from [2a00:1450:4864:20::435] (port=37643
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRic-0000Al-Ju
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id t26so1057171wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LQfvPnAnSV9TH7ItFcMu9ilDeSCvJK9/sHlcO51QJJ0=;
 b=OS2HOkydTr9j8PsD7AfHWNrpbSzCavB/IVi5Rx4x6+PPQrXec8SPN5KBRZpT88TnLk
 QTcp99AOODOppUBoiNy2pUsK9b4C680DRBywqSGFtCHYtzbysmd78QdxfDh0QMM3gAr+
 Us3oRFE6cw0ETBRs0j0xDSf70ERMiw91H/T6glCzADr7aeV/QNAR1C69w5/gP22AW8v1
 p2th+YCUP8+vX3FeHYlzsiNHPHN+dGqOhmtL0pSeAB8BOFMvy1/OhNJyCRrAmc3a2k+n
 X0KlOfqHDEDq3LeSBjnqiLvAIn5CZo0gC/fFcmWQcN5yZOwzJGkDJmgH/e0NQzOJXoyF
 Lc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQfvPnAnSV9TH7ItFcMu9ilDeSCvJK9/sHlcO51QJJ0=;
 b=l0wLJoI++dAu8+Bw3R6GGnQawsWjp/SWchbtBJgX9Rb31nLXi5H57QGonIWTz+OFIF
 fF3MOhDtRhhtjzpOl+0vp/DXQ4zKnZ763R7Svm/aqZIdOJXrtAGmuesqRA5H+oa2ANWa
 vbx1OOn4BkEtZ2OUorrq9DrRek6eyVbbzoGUz2LkHZGpT3o0P6Fm5MjguiQKh98tlgKQ
 hwbO6rbPx7XcmW+Gr6Sm4esoJuL+jEXT2415RLJhrSR0e6kAngKyrZSabVN5niXrvXSI
 y4qKUXlO75mVNfY0DCTJ4WqZ9p1G96kYxsSrVYpFI4TqGdXBIzMp3ChsjIGnrht485p3
 0K2w==
X-Gm-Message-State: AOAM5307Y0mfU9i1aAWCoq3y8VqnyFO4uRediwnOlexfpUUVcAnFWCGs
 waXxV+9nDdOylYCkNz1cWDrz/Ei5nalEJQ==
X-Google-Smtp-Source: ABdhPJwXD86f9Cobdh3ojtfp9SOGjH5vSQ/iSoh4V/pocqXahRMGyy2qM/VLLJK4AMiTxPw6F8+SIQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr3825920wry.110.1639564865407; 
 Wed, 15 Dec 2021 02:41:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Wed, 15 Dec 2021 10:40:42 +0000
Message-Id: <20211215104049.2030475-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-2-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f9026525..d0f4867fdfe 100644
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
index 2d37d29f02b..e6525909438 100644
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
2.25.1


