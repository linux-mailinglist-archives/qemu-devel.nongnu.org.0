Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF84A96EA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:34:54 +0100 (CET)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuzU-0003XL-St
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1nFtlZ-0003yW-Ga; Fri, 04 Feb 2022 03:16:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1nFtlW-0004d6-Ab; Fri, 04 Feb 2022 03:16:25 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2146CEd1022088; 
 Fri, 4 Feb 2022 08:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=nYmZij+j6wtZOmRjKSQm4U1kDEWDggU+bTUJFjvdpF8=;
 b=WLl9IqOtCDXBbIMmZZig/J8tqpJbnkxjjjvwec+9df1KUXyCuw16GrsiTwPp/yGrs5lx
 aSQQ7USxtalb9Xl9bJY5QvHz3NWnchHOwZy8Iw7IrsgyLsfK/GZKEx2aKJd0A1bPS3bn
 jPA4UdeqN/o0q+FXkXijt7cnpKQOHXStcORbwUZax0el3/8G5Ufbi+k/T1TbXV5wq4fg
 L+PQrzR+bTxQUfItUr6bbDsSd7W1LxRR3qqLVKCSIZCalDV4MLs7c0lOmxTGniYXND2S
 nd+MONFGAG4qVrVzD3H0fjRWonoWootyJXPmpetSiY2Y5cRfLaodrcmf6xnq2n/YJVZ3 RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0rj5fhum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:16:01 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2148EiXx022128;
 Fri, 4 Feb 2022 08:16:00 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0rj5fhu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:16:00 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21487oCH010499;
 Fri, 4 Feb 2022 08:15:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3e0r11jg2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 08:15:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2148Fteo21823888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 08:15:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B42BE4C040;
 Fri,  4 Feb 2022 08:15:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD4F94C044;
 Fri,  4 Feb 2022 08:15:53 +0000 (GMT)
Received: from ltczzess4.aus.stglabs.ibm.com (unknown [9.40.194.150])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 08:15:53 +0000 (GMT)
Subject: [PATCH v7 2/3] spapr: nvdimm: Implement H_SCM_FLUSH hcall
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, ani@anisinha.ca, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org
Date: Fri, 04 Feb 2022 08:15:53 +0000
Message-ID: <164396254862.109112.16675611182159105748.stgit@ltczzess4.aus.stglabs.ibm.com>
In-Reply-To: <164396252398.109112.13436924292537517470.stgit@ltczzess4.aus.stglabs.ibm.com>
References: <164396252398.109112.13436924292537517470.stgit@ltczzess4.aus.stglabs.ibm.com>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I5dq9IVl2_onxtBXtx1DWmBqJiFCLySb
X-Proofpoint-GUID: zvSw4Ha9Hgl_pJi3tJYq6VdwzQx4xkP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040037
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org,
 nvdimm@lists.linux.dev
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch adds support for the SCM flush hcall for the nvdimm devices.
To be available for exploitation by guest through the next patch. The
hcall is applicable only for new SPAPR specific device class which is
also introduced in this patch.

The hcall expects the semantics such that the flush to return with
H_LONG_BUSY_ORDER_10_MSEC when the operation is expected to take longer
time along with a continue_token. The hcall to be called again by providing
the continue_token to get the status. So, all fresh requests are put into
a 'pending' list and flush worker is submitted to the thread pool. The
thread pool completion callbacks move the requests to 'completed' list,
which are cleaned up after collecting the return status for the guest
in subsequent hcall from the guest.

The semantics makes it necessary to preserve the continue_tokens and
their return status across migrations. So, the completed flush states
are forwarded to the destination and the pending ones are restarted
at the destination in post_load. The necessary nvdimm flush specific
vmstate structures are also introduced in this patch which are to be
saved in the new SPAPR specific nvdimm device to be introduced in the
following patch.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/ppc/spapr.c                |    2 
 hw/ppc/spapr_nvdimm.c         |  260 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h        |    4 -
 include/hw/ppc/spapr_nvdimm.h |    1 
 4 files changed, 266 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3d6ec309dd..9263985663 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1634,6 +1634,8 @@ static void spapr_machine_reset(MachineState *machine)
         spapr->ov5_cas = spapr_ovec_clone(spapr->ov5);
     }
 
+    spapr_nvdimm_finish_flushes();
+
     /* DRC reset may cause a device to be unplugged. This will cause troubles
      * if this device is used by another device (eg, a running vhost backend
      * will crash QEMU if the DIMM holding the vring goes away). To avoid such
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 91de1052f2..ac44e00153 100644
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
@@ -30,6 +31,9 @@
 #include "hw/ppc/fdt.h"
 #include "qemu/range.h"
 #include "hw/ppc/spapr_numa.h"
+#include "block/thread-pool.h"
+#include "migration/vmstate.h"
+#include "qemu/pmem.h"
 
 /* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c */
 /* SCM device is unable to persist memory contents */
@@ -47,6 +51,14 @@
 /* Have an explicit check for alignment */
 QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE);
 
+#define TYPE_SPAPR_NVDIMM "spapr-nvdimm"
+OBJECT_DECLARE_TYPE(SpaprNVDIMMDevice, SPAPRNVDIMMClass, SPAPR_NVDIMM)
+
+struct SPAPRNVDIMMClass {
+    /* private */
+    NVDIMMClass parent_class;
+};
+
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp)
 {
@@ -375,6 +387,253 @@ static target_ulong h_scm_bind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+typedef struct SpaprNVDIMMDeviceFlushState {
+    uint64_t continue_token;
+    int64_t hcall_ret;
+    uint32_t drcidx;
+
+    QLIST_ENTRY(SpaprNVDIMMDeviceFlushState) node;
+} SpaprNVDIMMDeviceFlushState;
+
+typedef struct SpaprNVDIMMDevice SpaprNVDIMMDevice;
+struct SpaprNVDIMMDevice {
+    NVDIMMDevice parent_obj;
+
+    uint64_t nvdimm_flush_token;
+    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) pending_nvdimm_flush_states;
+    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) completed_nvdimm_flush_states;
+};
+
+static int flush_worker_cb(void *opaque)
+{
+    SpaprNVDIMMDeviceFlushState *state = opaque;
+    SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
+    PCDIMMDevice *dimm = PC_DIMM(drc->dev);
+    HostMemoryBackend *backend = MEMORY_BACKEND(dimm->hostmem);
+    int backend_fd = memory_region_get_fd(&backend->mr);
+
+    if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
+        MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
+        void *ptr = memory_region_get_ram_ptr(mr);
+        size_t size = object_property_get_uint(OBJECT(dimm), PC_DIMM_SIZE_PROP,
+                                               NULL);
+
+        /* flush pmem backend */
+        pmem_persist(ptr, size);
+    } else {
+        /* flush raw backing image */
+        if (qemu_fdatasync(backend_fd) < 0) {
+            error_report("papr_scm: Could not sync nvdimm to backend file: %s",
+                         strerror(errno));
+            return H_HARDWARE;
+        }
+    }
+
+    return H_SUCCESS;
+}
+
+static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
+{
+    SpaprNVDIMMDeviceFlushState *state = opaque;
+    SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
+    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
+
+    state->hcall_ret = hcall_ret;
+    QLIST_REMOVE(state, node);
+    QLIST_INSERT_HEAD(&s_nvdimm->completed_nvdimm_flush_states, state, node);
+}
+
+static int spapr_nvdimm_flush_post_load(void *opaque, int version_id)
+{
+    SpaprNVDIMMDevice *s_nvdimm = (SpaprNVDIMMDevice *)opaque;
+    SpaprNVDIMMDeviceFlushState *state;
+    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
+
+    QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
+        thread_pool_submit_aio(pool, flush_worker_cb, state,
+                               spapr_nvdimm_flush_completion_cb, state);
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_spapr_nvdimm_flush_state = {
+     .name = "spapr_nvdimm_flush_state",
+     .version_id = 1,
+     .minimum_version_id = 1,
+     .fields = (VMStateField[]) {
+         VMSTATE_UINT64(continue_token, SpaprNVDIMMDeviceFlushState),
+         VMSTATE_INT64(hcall_ret, SpaprNVDIMMDeviceFlushState),
+         VMSTATE_UINT32(drcidx, SpaprNVDIMMDeviceFlushState),
+         VMSTATE_END_OF_LIST()
+     },
+};
+
+const VMStateDescription vmstate_spapr_nvdimm_states = {
+    .name = "spapr_nvdimm_states",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = spapr_nvdimm_flush_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(nvdimm_flush_token, SpaprNVDIMMDevice),
+        VMSTATE_QLIST_V(completed_nvdimm_flush_states, SpaprNVDIMMDevice, 1,
+                        vmstate_spapr_nvdimm_flush_state,
+                        SpaprNVDIMMDeviceFlushState, node),
+        VMSTATE_QLIST_V(pending_nvdimm_flush_states, SpaprNVDIMMDevice, 1,
+                        vmstate_spapr_nvdimm_flush_state,
+                        SpaprNVDIMMDeviceFlushState, node),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+/*
+ * Assign a token and reserve it for the new flush state.
+ */
+static SpaprNVDIMMDeviceFlushState *spapr_nvdimm_init_new_flush_state(
+                                                SpaprNVDIMMDevice *spapr_nvdimm)
+{
+    SpaprNVDIMMDeviceFlushState *state;
+
+    state = g_malloc0(sizeof(*state));
+
+    spapr_nvdimm->nvdimm_flush_token++;
+    /* Token zero is presumed as no job pending. Assert on overflow to zero */
+    g_assert(spapr_nvdimm->nvdimm_flush_token != 0);
+
+    state->continue_token = spapr_nvdimm->nvdimm_flush_token;
+
+    QLIST_INSERT_HEAD(&spapr_nvdimm->pending_nvdimm_flush_states, state, node);
+
+    return state;
+}
+
+/*
+ * spapr_nvdimm_finish_flushes
+ *      Waits for all pending flush requests to complete
+ *      their execution and free the states
+ */
+void spapr_nvdimm_finish_flushes(void)
+{
+    SpaprNVDIMMDeviceFlushState *state, *next;
+    GSList *list, *nvdimms;
+
+    /*
+     * Called on reset path, the main loop thread which calls
+     * the pending BHs has gotten out running in the reset path,
+     * finally reaching here. Other code path being guest
+     * h_client_architecture_support, thats early boot up.
+     */
+    nvdimms = nvdimm_get_device_list();
+    for (list = nvdimms; list; list = list->next) {
+        NVDIMMDevice *nvdimm = list->data;
+        if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM)) {
+            SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(nvdimm);
+            while (!QLIST_EMPTY(&s_nvdimm->pending_nvdimm_flush_states)) {
+                aio_poll(qemu_get_aio_context(), true);
+            }
+
+            QLIST_FOREACH_SAFE(state, &s_nvdimm->completed_nvdimm_flush_states,
+                               node, next) {
+                QLIST_REMOVE(state, node);
+                g_free(state);
+            }
+        }
+    }
+    g_slist_free(nvdimms);
+}
+
+/*
+ * spapr_nvdimm_get_flush_status
+ *      Fetches the status of the hcall worker and returns
+ *      H_LONG_BUSY_ORDER_10_MSEC if the worker is still running.
+ */
+static int spapr_nvdimm_get_flush_status(SpaprNVDIMMDevice *s_nvdimm,
+                                         uint64_t token)
+{
+    SpaprNVDIMMDeviceFlushState *state, *node;
+
+    QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
+        if (state->continue_token == token) {
+            return H_LONG_BUSY_ORDER_10_MSEC;
+        }
+    }
+
+    QLIST_FOREACH_SAFE(state, &s_nvdimm->completed_nvdimm_flush_states,
+                       node, node) {
+        if (state->continue_token == token) {
+            int ret = state->hcall_ret;
+            QLIST_REMOVE(state, node);
+            g_free(state);
+            return ret;
+        }
+    }
+
+    /* If not found in complete list too, invalid token */
+    return H_P2;
+}
+
+/*
+ * H_SCM_FLUSH
+ * Input: drc_index, continue-token
+ * Out: continue-token
+ * Return Value: H_SUCCESS, H_Parameter, H_P2, H_LONG_BUSY_ORDER_10_MSEC,
+ *               H_UNSUPPORTED
+ *
+ * Given a DRC Index Flush the data to backend NVDIMM device. The hcall returns
+ * H_LONG_BUSY_ORDER_10_MSEC when the flush takes longer time and the hcall
+ * needs to be issued multiple times in order to be completely serviced. The
+ * continue-token from the output to be passed in the argument list of
+ * subsequent hcalls until the hcall is completely serviced at which point
+ * H_SUCCESS or other error is returned.
+ */
+static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                target_ulong opcode, target_ulong *args)
+{
+    int ret;
+    uint32_t drc_index = args[0];
+    uint64_t continue_token = args[1];
+    SpaprDrc *drc = spapr_drc_by_index(drc_index);
+    PCDIMMDevice *dimm;
+    HostMemoryBackend *backend = NULL;
+    SpaprNVDIMMDeviceFlushState *state;
+    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
+    int fd;
+
+    if (!drc || !drc->dev ||
+        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
+        return H_PARAMETER;
+    }
+
+    dimm = PC_DIMM(drc->dev);
+    if (continue_token == 0) {
+        backend = MEMORY_BACKEND(dimm->hostmem);
+        fd = memory_region_get_fd(&backend->mr);
+
+        if (fd < 0) {
+            return H_UNSUPPORTED;
+        }
+
+        state = spapr_nvdimm_init_new_flush_state(SPAPR_NVDIMM(dimm));
+        if (!state) {
+            return H_HARDWARE;
+        }
+
+        state->drcidx = drc_index;
+
+        thread_pool_submit_aio(pool, flush_worker_cb, state,
+                               spapr_nvdimm_flush_completion_cb, state);
+
+        continue_token = state->continue_token;
+    }
+
+    ret = spapr_nvdimm_get_flush_status(SPAPR_NVDIMM(dimm), continue_token);
+    if (H_IS_LONG_BUSY(ret)) {
+        args[0] = continue_token;
+    }
+
+    return ret;
+}
+
 static target_ulong h_scm_unbind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                      target_ulong opcode, target_ulong *args)
 {
@@ -523,6 +782,7 @@ static void spapr_scm_register_types(void)
     spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
     spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
+    spapr_register_hypercall(H_SCM_FLUSH, h_scm_flush);
 }
 
 type_init(spapr_scm_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ee7504b976..727b2a0e7f 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -341,6 +341,7 @@ struct SpaprMachineState {
 #define H_P7              -60
 #define H_P8              -61
 #define H_P9              -62
+#define H_UNSUPPORTED     -67
 #define H_OVERLAP         -68
 #define H_UNSUPPORTED_FLAG -256
 #define H_MULTI_THREADS_ACTIVE -9005
@@ -559,8 +560,9 @@ struct SpaprMachineState {
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
 #define H_RPT_INVALIDATE        0x448
+#define H_SCM_FLUSH             0x44C
 
-#define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
+#define MAX_HCALL_OPCODE        H_SCM_FLUSH
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.
diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
index 764f999f54..e9436cb6ef 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -21,5 +21,6 @@ void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt);
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp);
 void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
+void spapr_nvdimm_finish_flushes(void);
 
 #endif



