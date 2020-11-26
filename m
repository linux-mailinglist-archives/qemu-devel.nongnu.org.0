Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19022C4FE5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 08:58:34 +0100 (CET)
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiCAj-0002ua-S1
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 02:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1kiC7m-0000lw-Nl; Thu, 26 Nov 2020 02:55:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1kiC7k-0005l8-Ey; Thu, 26 Nov 2020 02:55:30 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ734lv118747; Thu, 26 Nov 2020 02:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=q4qOxUv82Vlz1okT0uQaPo+5wm5xH7ihGdQ6JZq/NVw=;
 b=GGLDezuvYTD3pO+4aHYZZeQ8vkAFdaLpEmQ1tb0D6iBJLNppZ4XPm3RnXoB7jHgbRaha
 gSH+O2snDveGNTaAqQoDxp+Tppv4Wa8ITnC7tpQPvBUhRYl2coweChceCSkioORP5XVa
 Kiz4fqUDeFmLCW1Qe/96wMG2DhRVzLN03fLdI/0B1MRStC83777BJf2/loG3un/aqcNF
 kRJkOFGbYiJekwroauTqCONLJR+q634tNWNqDmloGdGCR0zmN2AzvRoz54gG4qKza0FY
 pXWXZZ4g2dULD4lrqAabCQgRbDf5BMdc90OGm1wu7RHBuRdt7cR3Raq4JOV7FJtsWRa0 Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3522mrfksj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:55:24 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AQ7W1Qx067462;
 Thu, 26 Nov 2020 02:55:24 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3522mrfkqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 02:55:24 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ7lTpB022807;
 Thu, 26 Nov 2020 07:55:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8hen8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 07:55:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ7tJEw8848060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 07:55:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9016A52051;
 Thu, 26 Nov 2020 07:55:19 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6F6FC52050;
 Thu, 26 Nov 2020 07:55:18 +0000 (GMT)
Subject: [RFC PATCH 2/2] spapr: nvdimm: Implement async flush hcalls
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Thu, 26 Nov 2020 01:55:17 -0600
Message-ID: <160637730609.1977658.17051667828648659623.stgit@lep8c.aus.stglabs.ibm.com>
In-Reply-To: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
References: <160637722874.1977658.13777818163262816915.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_01:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=2 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260037
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: shivaprasadbhat@gmail.com, bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the persistent memory beacked by a file, a cpu cache flush instruction
is not sufficient to ensure the stores are correctly flushed to the media.

The patch implements the async hcalls for flush operation on demand from the
guest kernel.

The device option sync-dax is by default off and enables explicit asynchronous
flush requests from guest. It can be disabled by setting syn-dax=on.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/mem/nvdimm.c         |    1 +
 hw/ppc/spapr_nvdimm.c   |   79 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h |   10 ++++++
 include/hw/ppc/spapr.h  |    3 +-
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 03c2201b56..37a4db0135 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -220,6 +220,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
 
 static Property nvdimm_properties[] = {
     DEFINE_PROP_BOOL(NVDIMM_UNARMED_PROP, NVDIMMDevice, unarmed, false),
+    DEFINE_PROP_BOOL(NVDIMM_SYNC_DAX_PROP, NVDIMMDevice, sync_dax, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index a833a63b5e..557e36aa98 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/ppc/spapr_drc.h"
 #include "hw/ppc/spapr_nvdimm.h"
@@ -155,6 +156,11 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
                              "operating-system")));
     _FDT(fdt_setprop(fdt, child_offset, "ibm,cache-flush-required", NULL, 0));
 
+    if (!nvdimm->sync_dax) {
+        _FDT(fdt_setprop(fdt, child_offset, "ibm,async-flush-required",
+                         NULL, 0));
+    }
+
     return child_offset;
 }
 
@@ -370,6 +376,78 @@ static target_ulong h_scm_bind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+typedef struct SCMAsyncFlushData {
+    int fd;
+    uint64_t token;
+} SCMAsyncFlushData;
+
+static int flush_worker_cb(void *opaque)
+{
+    int ret = H_SUCCESS;
+    SCMAsyncFlushData *req_data = opaque;
+
+    /* flush raw backing image */
+    if (qemu_fdatasync(req_data->fd) < 0) {
+        error_report("papr_scm: Could not sync nvdimm to backend file: %s",
+                     strerror(errno));
+        ret = H_HARDWARE;
+    }
+
+    g_free(req_data);
+
+    return ret;
+}
+
+static target_ulong h_scm_async_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                      target_ulong opcode, target_ulong *args)
+{
+    int ret;
+    uint32_t drc_index = args[0];
+    uint64_t continue_token = args[1];
+    SpaprDrc *drc = spapr_drc_by_index(drc_index);
+    PCDIMMDevice *dimm;
+    HostMemoryBackend *backend = NULL;
+    SCMAsyncFlushData *req_data = NULL;
+
+    if (!drc || !drc->dev ||
+        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
+        return H_PARAMETER;
+    }
+
+    if (continue_token != 0) {
+        ret = spapr_drc_get_async_hcall_status(drc, continue_token);
+        if (ret == H_BUSY) {
+            args[0] = continue_token;
+            return H_LONG_BUSY_ORDER_1_SEC;
+        }
+
+        return ret;
+    }
+
+    dimm = PC_DIMM(drc->dev);
+    backend = MEMORY_BACKEND(dimm->hostmem);
+
+    req_data = g_malloc0(sizeof(SCMAsyncFlushData));
+    req_data->fd = memory_region_get_fd(&backend->mr);
+
+    continue_token = spapr_drc_get_new_async_hcall_token(drc);
+    if (!continue_token) {
+        g_free(req_data);
+        return H_P2;
+    }
+    req_data->token = continue_token;
+
+    spapr_drc_run_async_hcall(drc, continue_token, &flush_worker_cb, req_data);
+
+    ret = spapr_drc_get_async_hcall_status(drc, continue_token);
+    if (ret == H_BUSY) {
+        args[0] = req_data->token;
+        return ret;
+    }
+
+    return ret;
+}
+
 static target_ulong h_scm_unbind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                      target_ulong opcode, target_ulong *args)
 {
@@ -486,6 +564,7 @@ static void spapr_scm_register_types(void)
     spapr_register_hypercall(H_SCM_BIND_MEM, h_scm_bind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
+    spapr_register_hypercall(H_SCM_ASYNC_FLUSH, h_scm_async_flush);
 }
 
 type_init(spapr_scm_register_types)
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c699842dd0..9e8795766e 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -51,6 +51,7 @@ OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
 #define NVDIMM_UUID_PROP       "uuid"
 #define NVDIMM_UNARMED_PROP    "unarmed"
+#define NVDIMM_SYNC_DAX_PROP    "sync-dax"
 
 struct NVDIMMDevice {
     /* private */
@@ -85,6 +86,15 @@ struct NVDIMMDevice {
      */
     bool unarmed;
 
+    /*
+     * On PPC64,
+     * The 'off' value results in the async-flush-required property set
+     * in the device tree for pseries machines. When 'off', the guest
+     * initiates explicity flush requests to the backend device ensuring
+     * write persistence.
+     */
+    bool sync_dax;
+
     /*
      * The PPC64 - spapr requires each nvdimm device have a uuid.
      */
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 2e89e36cfb..6d7110b7dc 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -535,8 +535,9 @@ struct SpaprMachineState {
 #define H_SCM_BIND_MEM          0x3EC
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_UNBIND_ALL        0x3FC
+#define H_SCM_ASYNC_FLUSH       0x4A0
 
-#define MAX_HCALL_OPCODE        H_SCM_UNBIND_ALL
+#define MAX_HCALL_OPCODE        H_SCM_ASYNC_FLUSH
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.



