Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C5487A96
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:42:45 +0100 (CET)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5sKC-0005XJ-8P
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:42:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n5sBz-0006IX-Ie
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:34:20 -0500
Received: from [2604:1380:4641:c500::1] (port=41164 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n5sBn-0006cn-51
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:34:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D5F361F0A;
 Fri,  7 Jan 2022 16:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134B5C36AF4;
 Fri,  7 Jan 2022 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641573241;
 bh=WmoIozEvGlNS3dJc+2DA44l+mzjupH6RhSJiIollmi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VZAmRzkKz3TICIXaNfHBEW4S55KGkrCYfXEZ96oGuMwnh4l2WHwfYRFDqej3Jmk1I
 /hzOGVfyns2Vs0OeVSbp7KaPlJhdjcmQKXjHRbp1bNrq7juK7W4HcBgCc9doIKfiWy
 TqujOaGRqXIkxcspsA2WdaRIprygxFcnmDiDCyYtvAi/nU/RGrHnoO26VhdELJtVzK
 3PqZpSqFdMIKCCqc7vABBV2Rngy07PXEtqtnyJCfVhcSqroucs2imjNTMpdz5T/OhZ
 9mGwdRd5vEt/XeN5AkK/ggZbq6REVAV+Rr5okmP70ZI4Bw5v8kss8muaZIwwFy+tFG
 Ss3W039Y/l/bg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n5sBj-00GbiJ-6m; Fri, 07 Jan 2022 16:33:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] hw/arm/virt: Drop superfluous checks against highmem
Date: Fri,  7 Jan 2022 16:33:24 +0000
Message-Id: <20220107163324.2491209-7-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107163324.2491209-1-maz@kernel.org>
References: <20220107163324.2491209-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=maz@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the devices present in the extended memory map are checked
against the available PA space and disabled when they don't fit,
there is no need to keep the same checks against highmem, as
highmem really is a shortcut for the PA space being 32bit.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt-acpi-build.c | 2 --
 hw/arm/virt.c            | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 505c61e88e..cdac009419 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -946,8 +946,6 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
-    vms->highmem_redists &= vms->highmem;
-
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 70b4773b3e..641c6a9c31 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2170,9 +2170,6 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    vms->highmem_mmio &= vms->highmem;
-    vms->highmem_redists &= vms->highmem;
-
     create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
@@ -2191,7 +2188,7 @@ static void machvirt_init(MachineState *machine)
                        machine->ram_size, "mach-virt.tag");
     }
 
-    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
+    vms->highmem_ecam &= (!firmware_loaded || aarch64);
 
     create_rtc(vms);
 
-- 
2.30.2


