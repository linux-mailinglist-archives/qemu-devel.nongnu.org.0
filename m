Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632824BB761
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:58:10 +0100 (CET)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0xl-0007OX-Fs
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fT-00012A-SQ; Fri, 18 Feb 2022 05:39:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005fV-3O; Fri, 18 Feb 2022 05:39:15 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9UW4J020658; 
 Fri, 18 Feb 2022 10:38:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea8vvsc2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:37 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAV1ME026923;
 Fri, 18 Feb 2022 10:38:36 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea8vvsc1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:36 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbtqs009389;
 Fri, 18 Feb 2022 10:38:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3e64haeqxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcWAI44433668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E701C11C073;
 Fri, 18 Feb 2022 10:38:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AAC611C06E;
 Fri, 18 Feb 2022 10:38:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:31 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DCB912201F1;
 Fri, 18 Feb 2022 11:38:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 02/39] spapr: nvdimm: Implement H_SCM_FLUSH hcall
Date: Fri, 18 Feb 2022 11:37:50 +0100
Message-Id: <20220218103827.682032-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CchZ2VItL0Lj-jIUt-Eur8DWe28gTLHz
X-Proofpoint-GUID: hPuzKu5NpvtXa8uPcrGwiaYct-3y29XM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1034 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

The patch adds support for the SCM flush hcall for the nvdimm devices.
To be available for exploitation by guest through the next patch. The
hcall is applicable only for new SPAPR specific device class which is
also introduced in this patch.

The hcall expects the semantics such that the flush to return with
H_LONG_BUSY_ORDER_10_MSEC when the operation is expected to take longer
time along with a continue_token. The hcall to be called again by providi=
ng
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
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <164396254862.109112.16675611182159105748.stgit@ltczzess4.aus=
.stglabs.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr.h        |   4 +-
 include/hw/ppc/spapr_nvdimm.h |   1 +
 hw/ppc/spapr.c                |   2 +
 hw/ppc/spapr_nvdimm.c         | 260 ++++++++++++++++++++++++++++++++++
 4 files changed, 266 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ee7504b9760b..727b2a0e7fc9 100644
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
=20
-#define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
+#define MAX_HCALL_OPCODE        H_SCM_FLUSH
=20
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.
diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.=
h
index 764f999f5471..e9436cb6ef61 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -21,5 +21,6 @@ void spapr_dt_persistent_memory(SpaprMachineState *spap=
r, void *fdt);
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
                            uint64_t size, Error **errp);
 void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
+void spapr_nvdimm_finish_flushes(void);
=20
 #endif
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3d6ec309dd21..92639856635a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1634,6 +1634,8 @@ static void spapr_machine_reset(MachineState *machi=
ne)
         spapr->ov5_cas =3D spapr_ovec_clone(spapr->ov5);
     }
=20
+    spapr_nvdimm_finish_flushes();
+
     /* DRC reset may cause a device to be unplugged. This will cause tro=
ubles
      * if this device is used by another device (eg, a running vhost bac=
kend
      * will crash QEMU if the DIMM holding the vring goes away). To avoi=
d such
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 91de1052f233..ac44e0015317 100644
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
=20
 /* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c =
*/
 /* SCM device is unable to persist memory contents */
@@ -47,6 +51,14 @@
 /* Have an explicit check for alignment */
 QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE=
);
=20
+#define TYPE_SPAPR_NVDIMM "spapr-nvdimm"
+OBJECT_DECLARE_TYPE(SpaprNVDIMMDevice, SPAPRNVDIMMClass, SPAPR_NVDIMM)
+
+struct SPAPRNVDIMMClass {
+    /* private */
+    NVDIMMClass parent_class;
+};
+
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
                            uint64_t size, Error **errp)
 {
@@ -375,6 +387,253 @@ static target_ulong h_scm_bind_mem(PowerPCCPU *cpu,=
 SpaprMachineState *spapr,
     return H_SUCCESS;
 }
=20
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
+    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) pending_nvdimm_flush_state=
s;
+    QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) completed_nvdimm_flush_sta=
tes;
+};
+
+static int flush_worker_cb(void *opaque)
+{
+    SpaprNVDIMMDeviceFlushState *state =3D opaque;
+    SpaprDrc *drc =3D spapr_drc_by_index(state->drcidx);
+    PCDIMMDevice *dimm =3D PC_DIMM(drc->dev);
+    HostMemoryBackend *backend =3D MEMORY_BACKEND(dimm->hostmem);
+    int backend_fd =3D memory_region_get_fd(&backend->mr);
+
+    if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
+        MemoryRegion *mr =3D host_memory_backend_get_memory(dimm->hostme=
m);
+        void *ptr =3D memory_region_get_ram_ptr(mr);
+        size_t size =3D object_property_get_uint(OBJECT(dimm), PC_DIMM_S=
IZE_PROP,
+                                               NULL);
+
+        /* flush pmem backend */
+        pmem_persist(ptr, size);
+    } else {
+        /* flush raw backing image */
+        if (qemu_fdatasync(backend_fd) < 0) {
+            error_report("papr_scm: Could not sync nvdimm to backend fil=
e: %s",
+                         strerror(errno));
+            return H_HARDWARE;
+        }
+    }
+
+    return H_SUCCESS;
+}
+
+static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret=
)
+{
+    SpaprNVDIMMDeviceFlushState *state =3D opaque;
+    SpaprDrc *drc =3D spapr_drc_by_index(state->drcidx);
+    SpaprNVDIMMDevice *s_nvdimm =3D SPAPR_NVDIMM(drc->dev);
+
+    state->hcall_ret =3D hcall_ret;
+    QLIST_REMOVE(state, node);
+    QLIST_INSERT_HEAD(&s_nvdimm->completed_nvdimm_flush_states, state, n=
ode);
+}
+
+static int spapr_nvdimm_flush_post_load(void *opaque, int version_id)
+{
+    SpaprNVDIMMDevice *s_nvdimm =3D (SpaprNVDIMMDevice *)opaque;
+    SpaprNVDIMMDeviceFlushState *state;
+    ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
+
+    QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
+        thread_pool_submit_aio(pool, flush_worker_cb, state,
+                               spapr_nvdimm_flush_completion_cb, state);
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_spapr_nvdimm_flush_state =3D {
+     .name =3D "spapr_nvdimm_flush_state",
+     .version_id =3D 1,
+     .minimum_version_id =3D 1,
+     .fields =3D (VMStateField[]) {
+         VMSTATE_UINT64(continue_token, SpaprNVDIMMDeviceFlushState),
+         VMSTATE_INT64(hcall_ret, SpaprNVDIMMDeviceFlushState),
+         VMSTATE_UINT32(drcidx, SpaprNVDIMMDeviceFlushState),
+         VMSTATE_END_OF_LIST()
+     },
+};
+
+const VMStateDescription vmstate_spapr_nvdimm_states =3D {
+    .name =3D "spapr_nvdimm_states",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .post_load =3D spapr_nvdimm_flush_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(nvdimm_flush_token, SpaprNVDIMMDevice),
+        VMSTATE_QLIST_V(completed_nvdimm_flush_states, SpaprNVDIMMDevice=
, 1,
+                        vmstate_spapr_nvdimm_flush_state,
+                        SpaprNVDIMMDeviceFlushState, node),
+        VMSTATE_QLIST_V(pending_nvdimm_flush_states, SpaprNVDIMMDevice, =
1,
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
+                                                SpaprNVDIMMDevice *spapr=
_nvdimm)
+{
+    SpaprNVDIMMDeviceFlushState *state;
+
+    state =3D g_malloc0(sizeof(*state));
+
+    spapr_nvdimm->nvdimm_flush_token++;
+    /* Token zero is presumed as no job pending. Assert on overflow to z=
ero */
+    g_assert(spapr_nvdimm->nvdimm_flush_token !=3D 0);
+
+    state->continue_token =3D spapr_nvdimm->nvdimm_flush_token;
+
+    QLIST_INSERT_HEAD(&spapr_nvdimm->pending_nvdimm_flush_states, state,=
 node);
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
+    nvdimms =3D nvdimm_get_device_list();
+    for (list =3D nvdimms; list; list =3D list->next) {
+        NVDIMMDevice *nvdimm =3D list->data;
+        if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM)) {
+            SpaprNVDIMMDevice *s_nvdimm =3D SPAPR_NVDIMM(nvdimm);
+            while (!QLIST_EMPTY(&s_nvdimm->pending_nvdimm_flush_states))=
 {
+                aio_poll(qemu_get_aio_context(), true);
+            }
+
+            QLIST_FOREACH_SAFE(state, &s_nvdimm->completed_nvdimm_flush_=
states,
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
+        if (state->continue_token =3D=3D token) {
+            return H_LONG_BUSY_ORDER_10_MSEC;
+        }
+    }
+
+    QLIST_FOREACH_SAFE(state, &s_nvdimm->completed_nvdimm_flush_states,
+                       node, node) {
+        if (state->continue_token =3D=3D token) {
+            int ret =3D state->hcall_ret;
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
+ * Return Value: H_SUCCESS, H_Parameter, H_P2, H_LONG_BUSY_ORDER_10_MSEC=
,
+ *               H_UNSUPPORTED
+ *
+ * Given a DRC Index Flush the data to backend NVDIMM device. The hcall =
returns
+ * H_LONG_BUSY_ORDER_10_MSEC when the flush takes longer time and the hc=
all
+ * needs to be issued multiple times in order to be completely serviced.=
 The
+ * continue-token from the output to be passed in the argument list of
+ * subsequent hcalls until the hcall is completely serviced at which poi=
nt
+ * H_SUCCESS or other error is returned.
+ */
+static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
+                                target_ulong opcode, target_ulong *args)
+{
+    int ret;
+    uint32_t drc_index =3D args[0];
+    uint64_t continue_token =3D args[1];
+    SpaprDrc *drc =3D spapr_drc_by_index(drc_index);
+    PCDIMMDevice *dimm;
+    HostMemoryBackend *backend =3D NULL;
+    SpaprNVDIMMDeviceFlushState *state;
+    ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
+    int fd;
+
+    if (!drc || !drc->dev ||
+        spapr_drc_type(drc) !=3D SPAPR_DR_CONNECTOR_TYPE_PMEM) {
+        return H_PARAMETER;
+    }
+
+    dimm =3D PC_DIMM(drc->dev);
+    if (continue_token =3D=3D 0) {
+        backend =3D MEMORY_BACKEND(dimm->hostmem);
+        fd =3D memory_region_get_fd(&backend->mr);
+
+        if (fd < 0) {
+            return H_UNSUPPORTED;
+        }
+
+        state =3D spapr_nvdimm_init_new_flush_state(SPAPR_NVDIMM(dimm));
+        if (!state) {
+            return H_HARDWARE;
+        }
+
+        state->drcidx =3D drc_index;
+
+        thread_pool_submit_aio(pool, flush_worker_cb, state,
+                               spapr_nvdimm_flush_completion_cb, state);
+
+        continue_token =3D state->continue_token;
+    }
+
+    ret =3D spapr_nvdimm_get_flush_status(SPAPR_NVDIMM(dimm), continue_t=
oken);
+    if (H_IS_LONG_BUSY(ret)) {
+        args[0] =3D continue_token;
+    }
+
+    return ret;
+}
+
 static target_ulong h_scm_unbind_mem(PowerPCCPU *cpu, SpaprMachineState =
*spapr,
                                      target_ulong opcode, target_ulong *=
args)
 {
@@ -523,6 +782,7 @@ static void spapr_scm_register_types(void)
     spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
     spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
+    spapr_register_hypercall(H_SCM_FLUSH, h_scm_flush);
 }
=20
 type_init(spapr_scm_register_types)
--=20
2.34.1


