Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC849542D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:28:21 +0100 (CET)
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcAW-000565-HW
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgN-0004Bd-RM
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:52 -0500
Received: from [2a00:1450:4864:20::329] (port=52764
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgL-0003Aa-A8
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id v123so11818966wme.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iUwMXOyzZS8l0JUnEvs13j+GS4kFMz1hKnUNXMMSq20=;
 b=JQixlB1jRuPg7W7ZH0uka6czhfbc2EaKao2hVDONCG2PPTMSUR0qTBddOJHSVHh2/v
 q73hHu22TVZNKvUyqiyz7VSxOvKJtOGR/KmuMfWskq8AVaf118xV8pXiU+gnXRCMYLdA
 nTVd7G0CxODpZIaJAWv+IM/we0x9+qY2ihMYBePD1XpCCbB5DLfAdLI+P0WJPdSLTROP
 Q65yg+0NpWgipwAXxj1OoR7KtUxlKpeH0OrkLb920dH7uSI87pvqtqI6hPL8KiyIyjwb
 SAO3H3o0wX4SEE06arlxlF4J0epoYgW/WYP3byqLWhxd+yh9IaTPCJ4tLdRS6R8mmRgA
 iaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUwMXOyzZS8l0JUnEvs13j+GS4kFMz1hKnUNXMMSq20=;
 b=4f12JM3xu2SIfMlpv20gDZ37MsD68Aqry3NWU8QdMav8uQWl2Rc3gxLz5COE3B3ErF
 weQ7oWDXuTg/d1XFpI0ohky6VufL4RH+FNOZ3Hgg0uucW/wVU85Gu+Zuj6zvE9j+uASI
 n6v7/htnYszSOtmglxHCrzQBpVXOcx33tBtg4y7bgcFGfek18Dxabdxa4KRCthvlIUC8
 zmzqo+tOgWDB7OR3li0fcN8I0MrdxzPSKomf2clty3axAvZ3boCrvv2PcDCICnBXOVBH
 Ztis2yL1B2koHaYEjW9xCqWpO92wNbKIWMBFaikV9y/o4ipCFSI367ZYTLS33wPpX+wh
 SF/g==
X-Gm-Message-State: AOAM533Ag0O+K3m4BTPDa4J845bebsuznp5AGzCOSqUzjRPBefOQnJsh
 0F3rO+iiDW249qzBurrDe6wV63Ikg+Pd/g==
X-Google-Smtp-Source: ABdhPJxPTcJQGIhmbUEJ6t04HP959iSg6ZV8CkctSepEp1D70cwdQyPON1zVlJA/uJweSv9RWvny2A==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr8676922wmj.135.1642682207917; 
 Thu, 20 Jan 2022 04:36:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/38] hw/arm/virt: Add a control for the the highmem
 redistributors
Date: Thu, 20 Jan 2022 12:36:09 +0000
Message-Id: <20220120123630.267975-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Marc Zyngier <maz@kernel.org>

Just like we can control the enablement of the highmem PCIe region
using highmem_ecam, let's add a control for the highmem GICv3
redistributor region.

Similarily to highmem_ecam, these redistributors are disabled when
highmem is off.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220114140741.1358263-3-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h    | 4 +++-
 hw/arm/virt-acpi-build.c | 2 ++
 hw/arm/virt.c            | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index cf5d8b83ded..c1ea17d0def 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -144,6 +144,7 @@ struct VirtMachineState {
     bool highmem;
     bool highmem_ecam;
     bool highmem_mmio;
+    bool highmem_redists;
     bool its;
     bool tcg_its;
     bool virt;
@@ -191,7 +192,8 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 
     assert(vms->gic_version == VIRT_GIC_VERSION_3);
 
-    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
+    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
+            vms->highmem_redists) ? 2 : 1;
 }
 
 #endif /* QEMU_ARM_VIRT_H */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab00805..0757c28f69c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -947,6 +947,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
+    vms->highmem_redists &= vms->highmem;
+
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 16369ce10e4..62bdce1eb4b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2113,6 +2113,7 @@ static void machvirt_init(MachineState *machine)
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
     vms->highmem_mmio &= vms->highmem;
+    vms->highmem_redists &= vms->highmem;
 
     create_gic(vms, sysmem);
 
@@ -2902,6 +2903,7 @@ static void virt_instance_init(Object *obj)
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
     vms->highmem_mmio = true;
+    vms->highmem_redists = true;
 
     if (vmc->no_its) {
         vms->its = false;
-- 
2.25.1


