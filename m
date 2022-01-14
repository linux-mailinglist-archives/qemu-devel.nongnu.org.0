Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4848EBBD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:35:46 +0100 (CET)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ng9-0003q0-Db
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:35:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n8NFY-0006kW-Qf
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n8NFX-0002qU-7U
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3735FB825FC;
 Fri, 14 Jan 2022 14:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C043DC36AE5;
 Fri, 14 Jan 2022 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642169285;
 bh=M8Cd2nEinA8ZwFjNff4KGOaxdFUznBmA2VZZ9jWgOeM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Euw0JHQJDj5DxbVGy/QeI27q2H1xV59vAQBaqTgglbXdGq7+0DDKME7He05ee4DkU
 wq3HRntqXZzFKYUn89Abo+Ep7tPAQwdQniUtGVKf1iNSOT50pwTQ+Z56mE9o+iXCXr
 NwChYObjEopccPjbNr0HapByMrVPptZazX6YMJcVziqowP5sb/gE1JhBLVHjPtyai2
 dXTvehcWf//KTL2E5ZMKucG3Zmdk7s+QPmdBKt1NIoMUzkBrhC6EQLZe1VGCp+pYSC
 Xs6PQA/ohx8jrnNdsSpLQZDEuS4/3Wo+AmJw0BpIUw31bmWf/q7bA5bGPqCOHMhhMm
 b59Ctb9PGSbfA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n8NFL-000V8K-Qw; Fri, 14 Jan 2022 14:08:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] hw/arm/virt: Drop superfluous checks against highmem
Date: Fri, 14 Jan 2022 14:07:41 +0000
Message-Id: <20220114140741.1358263-7-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114140741.1358263-1-maz@kernel.org>
References: <20220114140741.1358263-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=145.40.68.75; envelope-from=maz@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the devices present in the extended memory map are checked
against the available PA space and disabled when they don't fit,
there is no need to keep the same checks against highmem, as
highmem really is a shortcut for the PA space being 32bit.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt-acpi-build.c | 2 --
 hw/arm/virt.c            | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0757c28f69..449fab0080 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -947,8 +947,6 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
-    vms->highmem_redists &= vms->highmem;
-
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 053791cc44..4524f3807d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2171,9 +2171,6 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    vms->highmem_mmio &= vms->highmem;
-    vms->highmem_redists &= vms->highmem;
-
     create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
@@ -2192,7 +2189,7 @@ static void machvirt_init(MachineState *machine)
                        machine->ram_size, "mach-virt.tag");
     }
 
-    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
+    vms->highmem_ecam &= (!firmware_loaded || aarch64);
 
     create_rtc(vms);
 
-- 
2.30.2


