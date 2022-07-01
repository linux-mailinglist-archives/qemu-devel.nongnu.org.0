Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BEE5637DB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:27:14 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JU9-00014G-0P
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEj-0000eC-GH
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEg-0002ms-R8
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:17 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261G3HOF015598;
 Fri, 1 Jul 2022 16:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=O4pTTLxZV+n0/VuPRBbRciJ+yiI5rPj2CVwAg/SdhcE=;
 b=c/QLCaeAICXDXebPrtvSVRcHNPowJ5Ja07994doxyFJouvhTppYnw/I0kI2p/YJxAkJC
 xAzEuBxaDC7KIYoOfQRhNNWhcN3IInIJWmsPb71+qjNNi5IOP0/ZYMaUs9fHYlilnN5f
 szSGM80Icl8fqEL4Wy8AJpkK4l9BsRXmb2IKF4AmlkeSwoGz+rkLgGhtPbJ9M8KKYGb1
 t4VjN6X0PRhxFt/sVf2cqQPjlRJRtw8YfZp7+KNBCB4m+vEMfzlT98DlLAksx+0OP4C8
 xj6wTaLIPnbhzKyKAvlKqDTJQf05U8AwXre4UFzxGS1MAGneWQV99FuVwuwQ8bOrB8B+ iA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwsysqenm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:06 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 261G5hka016148; Fri, 1 Jul 2022 16:11:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4sw6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:05 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 261GAftO029065;
 Fri, 1 Jul 2022 16:11:05 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-184-247.vpn.oracle.com
 [10.175.184.247])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4svtm-7; Fri, 01 Jul 2022 16:11:04 +0000
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
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v6 06/10] i386/pc: factor out cxl range start to helper
Date: Fri,  1 Jul 2022 17:10:10 +0100
Message-Id: <20220701161014.3850-7-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220701161014.3850-1-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: 76_xH_wqoQTg3jlpckUgWri9EaxnUiaR
X-Proofpoint-GUID: 76_xH_wqoQTg3jlpckUgWri9EaxnUiaR
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

Factor out the calculation of the base address of the MR. It will be
used later on for the cxl range end counterpart calculation and as
well in pc_memory_init() CXL mr initialization, thus avoiding
duplication.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0abbf81841a9..8655cc3b8894 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,6 +825,24 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    MachineState *machine = MACHINE(pcms);
+    hwaddr cxl_base;
+
+    if (pcmc->has_reserved_memory && machine->device_memory->base) {
+        cxl_base = machine->device_memory->base;
+        if (!pcmc->broken_reserved_end) {
+            cxl_base += memory_region_size(&machine->device_memory->mr);
+        }
+    } else {
+        cxl_base = pc_above_4g_end(pcms);
+    }
+
+    return cxl_base;
+}
+
 static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 {
     uint64_t start = 0;
@@ -946,15 +964,7 @@ void pc_memory_init(PCMachineState *pcms,
         MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
 
-        if (pcmc->has_reserved_memory && machine->device_memory->base) {
-            cxl_base = machine->device_memory->base;
-            if (!pcmc->broken_reserved_end) {
-                cxl_base += memory_region_size(&machine->device_memory->mr);
-            }
-        } else {
-            cxl_base = pc_above_4g_end(pcms);
-        }
-
+        cxl_base = pc_get_cxl_range_start(pcms);
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
-- 
2.17.2


