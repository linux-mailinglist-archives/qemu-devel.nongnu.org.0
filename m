Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA09575597
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 21:04:57 +0200 (CEST)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC48u-0000MP-AZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 15:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3ad-0006bW-8x
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC3ab-0008Bn-43
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:29:30 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EGBmsp026608;
 Thu, 14 Jul 2022 18:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=lbzGY+jIADZtZw967IbA4yLh8WEOgvAyZfxf5ZTRYkU=;
 b=QKfllkMWBpFneAJz3bidxaAJgALAUGv8rnMdC1YpQGBND99/POeM4Bq/hcgQ+j72D7J9
 5ncKBoz2Cv3in/eWMSCY/tQ/uI9KuNQ4RR6H2GMeMRRzkidNom6ctvpNZg6T8SG5EkWJ
 Tzc9EHH2mXwOOghZG65xWfUy8Bu1nQLKzXP0eN7yohnwcARKAALoT6IPQ4LFYQLapjWH
 NBdJfERR5mzFCNrwLtfdZvXJ3gVZJyV7QEUklAg//Ue9jp22nQ9LqRP6g0mEzGuCwBzL
 qIQhjsqgMnKASiW4JId6qrSJ//wX2ubEKKpGzHEp5eDzPS2NFr/94vqSPabGtc8hyBD4 Qg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71r1dj05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:29:23 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26EIGssL022689; Thu, 14 Jul 2022 18:29:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465k61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 18:29:22 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26EISiAR017868;
 Thu, 14 Jul 2022 18:29:22 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-172-165.vpn.oracle.com
 [10.175.172.165])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h70465j62-11; Thu, 14 Jul 2022 18:29:22 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v7 10/10] i386/pc: restrict AMD only enforcing of 1Tb hole to
 new machine type
Date: Thu, 14 Jul 2022 19:28:20 +0100
Message-Id: <20220714182820.30970-11-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220714182820.30970-1-joao.m.martins@oracle.com>
References: <20220714182820.30970-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: JPM34qy5rz7g83pNq3KrOtzT8KPxduf0
X-Proofpoint-GUID: JPM34qy5rz7g83pNq3KrOtzT8KPxduf0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The added enforcing is only relevant in the case of AMD where the
range right before the 1TB is restricted and cannot be DMA mapped
by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
or possibly other kinds of IOMMU events in the AMD IOMMU.

Although, there's a case where it may make sense to disable the
IOVA relocation/validation when migrating from a
non-amd-1tb-aware qemu to one that supports it.

Relocating RAM regions to after the 1Tb hole has consequences for
guest ABI because we are changing the memory mapping, so make
sure that only new machine enforce but not older ones.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c         | 6 ++++--
 hw/i386/pc_piix.c    | 2 ++
 hw/i386/pc_q35.c     | 2 ++
 include/hw/i386/pc.h | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 17613974163e..d13a77025054 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -952,9 +952,10 @@ void pc_memory_init(PCMachineState *pcms,
     /*
      * The HyperTransport range close to the 1T boundary is unique to AMD
      * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
-     * to above 1T to AMD vCPUs only.
+     * to above 1T to AMD vCPUs only. @enforce_amd_1tb_hole is only false in
+     * older machine types (<= 7.0) for compatibility purposes.
      */
-    if (IS_AMD_CPU(&cpu->env)) {
+    if (IS_AMD_CPU(&cpu->env) && pcmc->enforce_amd_1tb_hole) {
         /* Bail out if max possible address does not cross HT range */
         if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
             x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
@@ -1904,6 +1905,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_amd_1tb_hole = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2a483e8666b4..074571bc03a8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -446,9 +446,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
 
 static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 99ed75371c67..f3aa4694a299 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -383,8 +383,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
 
 static void pc_q35_7_0_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
+    pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 568c226d3034..9cc3f5d33805 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -118,6 +118,7 @@ struct PCMachineClass {
     bool has_reserved_memory;
     bool enforce_aligned_dimm;
     bool broken_reserved_end;
+    bool enforce_amd_1tb_hole;
 
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
-- 
2.17.2


