Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28268346026
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:50:38 +0100 (CET)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhQb-0001Gu-5o
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lOhOP-0007BK-Fo; Tue, 23 Mar 2021 09:48:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59918
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1lOhOL-0001xf-4s; Tue, 23 Mar 2021 09:48:21 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NDXhp7080988; Tue, 23 Mar 2021 09:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YR5oXTauCntOPFXgynv2SbWapbfvARpYlf4FQYCPQ1A=;
 b=Shdxa6JQ1GUjRYb+vNwTF6BpReH5tkqr9nFKxehcnE8nskru1JdXLAsEfIWj0ENjgFXf
 t687vzpOe326fSpV40deuMBxzA+KJ5KJGDcFkEyWnX2XIXUX8OkKRASWvSXElSCXP/xA
 V7Wu7cKV+z6myUOVwbgwDInXk/SxZsq7vqPsELHp9sUaGfjf1n2jx6Ap5IkqMOio8Eym
 J6CjygavwpCcQnYsyQgPj0EgWiiAiBbJXwVEx75ltm3yz6vZnVnoEAL8292d566lHNPs
 q6RW4hV5mBd3CssAWibGlD9lOTohbgUX3DXcvMYLCspJmcR6I199MSzN1al/VFNyhUME DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fb36b56j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 09:48:03 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NDY8TS082289;
 Tue, 23 Mar 2021 09:48:03 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fb36b55p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 09:48:02 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NDkqa7025032;
 Tue, 23 Mar 2021 13:48:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 37d9a6hrqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 13:48:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NDlwn833620434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 13:47:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB7AAE055;
 Tue, 23 Mar 2021 13:47:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6899AE051;
 Tue, 23 Mar 2021 13:47:56 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.40.192.207])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Mar 2021 13:47:56 +0000 (GMT)
Subject: [PATCH v3 3/3] spapr: nvdimm: Enable sync-dax device property for
 nvdimm
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: sbhat@linux.vnet.ibm.com, david@gibson.dropbear.id.au, groug@kaod.org,
 qemu-ppc@nongnu.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, imammedo@redhat.com, xiaoguangrong.eric@gmail.com
Date: Tue, 23 Mar 2021 09:47:55 -0400
Message-ID: <161650726635.2959.677683611241665210.stgit@6532096d84d3>
In-Reply-To: <161650723087.2959.8703728357980727008.stgit@6532096d84d3>
References: <161650723087.2959.8703728357980727008.stgit@6532096d84d3>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_06:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230100
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch adds the 'sync-dax' property to the nvdimm device.

When the sync-dax is 'off', the device tree property
"hcall-flush-required" is added to the nvdimm node which makes the
guest to issue H_SCM_FLUSH hcalls to request for flushes explicitly.
This would be the default behaviour without sync-dax property set
for the nvdimm device.

The sync-dax="on" would mean the guest need not make flush requests
to the qemu. On previous machine versions the sync-dax is set to be
"on" by default using the hw_compat magic.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/core/machine.c       |    1 +
 hw/mem/nvdimm.c         |    1 +
 hw/ppc/spapr_nvdimm.c   |   17 +++++++++++++++++
 include/hw/mem/nvdimm.h |   10 ++++++++++
 include/hw/ppc/spapr.h  |    1 +
 5 files changed, 30 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 257a664ea2..f843643574 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "PIIX4_PM", "smm-compat", "on"},
     { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-net-pci", "vectors", "3"},
+    { "nvdimm", "sync-dax", "on" },
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7397b67156..8f0e29b191 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -229,6 +229,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
 
 static Property nvdimm_properties[] = {
     DEFINE_PROP_BOOL(NVDIMM_UNARMED_PROP, NVDIMMDevice, unarmed, false),
+    DEFINE_PROP_BOOL(NVDIMM_SYNC_DAX_PROP, NVDIMMDevice, sync_dax, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 883317c1ed..dd1c90251b 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -125,6 +125,9 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     uint64_t lsize = nvdimm->label_size;
     uint64_t size = object_property_get_int(OBJECT(nvdimm), PC_DIMM_SIZE_PROP,
                                             NULL);
+    bool sync_dax = object_property_get_bool(OBJECT(nvdimm),
+                                             NVDIMM_SYNC_DAX_PROP,
+                                             &error_abort);
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_PMEM, slot);
     g_assert(drc);
@@ -159,6 +162,11 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
                              "operating-system")));
     _FDT(fdt_setprop(fdt, child_offset, "ibm,cache-flush-required", NULL, 0));
 
+    if (!sync_dax) {
+        _FDT(fdt_setprop(fdt, child_offset, "ibm,hcall-flush-required",
+                         NULL, 0));
+    }
+
     return child_offset;
 }
 
@@ -567,10 +575,12 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                       target_ulong opcode, target_ulong *args)
 {
     int ret;
+    bool sync_dax;
     uint32_t drc_index = args[0];
     uint64_t continue_token = args[1];
     SpaprDrc *drc = spapr_drc_by_index(drc_index);
     PCDIMMDevice *dimm;
+    NVDIMMDevice *nvdimm;
     HostMemoryBackend *backend = NULL;
     SpaprNVDIMMDeviceFlushState *state;
     ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
@@ -580,6 +590,13 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
         return H_PARAMETER;
     }
 
+    nvdimm = NVDIMM(drc->dev);
+    sync_dax = object_property_get_bool(OBJECT(nvdimm), NVDIMM_SYNC_DAX_PROP,
+                                        &error_abort);
+    if (sync_dax) {
+        return H_UNSUPPORTED;
+    }
+
     if (continue_token != 0) {
         ret = spapr_nvdimm_get_flush_status(continue_token);
         if (H_IS_LONG_BUSY(ret)) {
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c..f82979cf2f 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -51,6 +51,7 @@ OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
 #define NVDIMM_UUID_PROP       "uuid"
 #define NVDIMM_UNARMED_PROP    "unarmed"
+#define NVDIMM_SYNC_DAX_PROP   "sync-dax"
 
 struct NVDIMMDevice {
     /* private */
@@ -85,6 +86,15 @@ struct NVDIMMDevice {
      */
     bool unarmed;
 
+    /*
+     * On PPC64,
+     * The 'off' value results in the hcall-flush-required property set
+     * in the device tree for pseries machines. When 'off', the guest
+     * initiates explicit flush requests to the backend device ensuring
+     * write persistence.
+     */
+    bool sync_dax;
+
     /*
      * The PPC64 - spapr requires each nvdimm device have a uuid.
      */
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 7c27fb3e2d..51c35488a4 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -333,6 +333,7 @@ struct SpaprMachineState {
 #define H_P7              -60
 #define H_P8              -61
 #define H_P9              -62
+#define H_UNSUPPORTED     -67
 #define H_OVERLAP         -68
 #define H_UNSUPPORTED_FLAG -256
 #define H_MULTI_THREADS_ACTIVE -9005



