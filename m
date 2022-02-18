Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9A4BB7AB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:06:41 +0100 (CET)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL15z-00016H-Tv
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fV-00012g-P4; Fri, 18 Feb 2022 05:39:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005fZ-3X; Fri, 18 Feb 2022 05:39:17 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I9ueLP024249; 
 Fri, 18 Feb 2022 10:38:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea995gxee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:37 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAORYB028448;
 Fri, 18 Feb 2022 10:38:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea995gxds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbtw6004691;
 Fri, 18 Feb 2022 10:38:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64has7w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcWb540239368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BED44C081;
 Fri, 18 Feb 2022 10:38:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 514424C087;
 Fri, 18 Feb 2022 10:38:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8D1FB220294;
 Fri, 18 Feb 2022 11:38:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/39] spapr: nvdimm: Introduce spapr-nvdimm device
Date: Fri, 18 Feb 2022 11:37:51 +0100
Message-Id: <20220218103827.682032-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AfM8ENASb82beOA186Yy6Q6eckbs5lRg
X-Proofpoint-GUID: Cvj5jID-j15YlADG3l57C7bgRDuu33e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1034 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

If the device backend is not persistent memory for the nvdimm, there is
need for explicit IO flushes on the backend to ensure persistence.

On SPAPR, the issue is addressed by adding a new hcall to request for
an explicit flush from the guest when the backend is not pmem. So, the
approach here is to convey when the hcall flush is required in a device
tree property. The guest once it knows the device backend is not pmem,
makes the hcall whenever flush is required.

To set the device tree property, a new PAPR specific device type inheriti=
ng
the nvdimm device is implemented. When the backend doesn't have pmem=3Don
the device tree property "ibm,hcall-flush-required" is set, and the guest
makes hcall H_SCM_FLUSH requesting for an explicit flush. The new device
has boolean property pmem-override which when "on" advertises the device
tree property even when pmem=3Don for the backend. The flush function
invokes the fdatasync or pmem_persist() based on the type of backend.

The vmstate structures are made part of the spapr-nvdimm device object.
The patch attempts to keep the migration compatibility between source and
destination while rejecting the incompatibles ones with failures.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <164396256092.109112.17933240273840803354.stgit@ltczzess4.aus=
.stglabs.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_nvdimm.c | 132 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index ac44e0015317..c4c97da5de98 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -34,6 +34,7 @@
 #include "block/thread-pool.h"
 #include "migration/vmstate.h"
 #include "qemu/pmem.h"
+#include "hw/qdev-properties.h"
=20
 /* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c =
*/
 /* SCM device is unable to persist memory contents */
@@ -57,6 +58,10 @@ OBJECT_DECLARE_TYPE(SpaprNVDIMMDevice, SPAPRNVDIMMClas=
s, SPAPR_NVDIMM)
 struct SPAPRNVDIMMClass {
     /* private */
     NVDIMMClass parent_class;
+
+    /* public */
+    void (*realize)(NVDIMMDevice *dimm, Error **errp);
+    void (*unrealize)(NVDIMMDevice *dimm, Error **errp);
 };
=20
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
@@ -64,6 +69,8 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev,=
 NVDIMMDevice *nvdimm,
 {
     const MachineClass *mc =3D MACHINE_GET_CLASS(hotplug_dev);
     const MachineState *ms =3D MACHINE(hotplug_dev);
+    PCDIMMDevice *dimm =3D PC_DIMM(nvdimm);
+    MemoryRegion *mr =3D host_memory_backend_get_memory(dimm->hostmem);
     g_autofree char *uuidstr =3D NULL;
     QemuUUID uuid;
     int ret;
@@ -101,6 +108,14 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_d=
ev, NVDIMMDevice *nvdimm,
         return false;
     }
=20
+    if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM) &&
+        (memory_region_get_fd(mr) < 0)) {
+        error_setg(errp, "spapr-nvdimm device requires the "
+                   "memdev %s to be of memory-backend-file type",
+                   object_get_canonical_path_component(OBJECT(dimm->host=
mem)));
+        return false;
+    }
+
     return true;
 }
=20
@@ -172,6 +187,20 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr,=
 void *fdt,
                              "operating-system")));
     _FDT(fdt_setprop(fdt, child_offset, "ibm,cache-flush-required", NULL=
, 0));
=20
+    if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM)) {
+        bool is_pmem =3D false, pmem_override =3D false;
+        PCDIMMDevice *dimm =3D PC_DIMM(nvdimm);
+        HostMemoryBackend *hostmem =3D dimm->hostmem;
+
+        is_pmem =3D object_property_get_bool(OBJECT(hostmem), "pmem", NU=
LL);
+        pmem_override =3D object_property_get_bool(OBJECT(nvdimm),
+                                                 "pmem-override", NULL);
+        if (!is_pmem || pmem_override) {
+            _FDT(fdt_setprop(fdt, child_offset, "ibm,hcall-flush-require=
d",
+                             NULL, 0));
+        }
+    }
+
     return child_offset;
 }
=20
@@ -397,11 +426,21 @@ typedef struct SpaprNVDIMMDeviceFlushState {
=20
 typedef struct SpaprNVDIMMDevice SpaprNVDIMMDevice;
 struct SpaprNVDIMMDevice {
+    /* private */
     NVDIMMDevice parent_obj;
=20
+    bool hcall_flush_required;
     uint64_t nvdimm_flush_token;
     QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) pending_nvdimm_flush_state=
s;
     QLIST_HEAD(, SpaprNVDIMMDeviceFlushState) completed_nvdimm_flush_sta=
tes;
+
+    /* public */
+
+    /*
+     * The 'on' value for this property forced the qemu to enable the hc=
all
+     * flush for the nvdimm device even if the backend is a pmem
+     */
+    bool pmem_override;
 };
=20
 static int flush_worker_cb(void *opaque)
@@ -448,6 +487,24 @@ static int spapr_nvdimm_flush_post_load(void *opaque=
, int version_id)
     SpaprNVDIMMDevice *s_nvdimm =3D (SpaprNVDIMMDevice *)opaque;
     SpaprNVDIMMDeviceFlushState *state;
     ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
+    HostMemoryBackend *backend =3D MEMORY_BACKEND(PC_DIMM(s_nvdimm)->hos=
tmem);
+    bool is_pmem =3D object_property_get_bool(OBJECT(backend), "pmem", N=
ULL);
+    bool pmem_override =3D object_property_get_bool(OBJECT(s_nvdimm),
+                                                  "pmem-override", NULL)=
;
+    bool dest_hcall_flush_required =3D pmem_override || !is_pmem;
+
+    if (!s_nvdimm->hcall_flush_required && dest_hcall_flush_required) {
+        error_report("The file backend for the spapr-nvdimm device %s at=
 "
+                     "source is a pmem, use pmem=3Don and pmem-override=3D=
off to "
+                     "continue.", DEVICE(s_nvdimm)->id);
+        return -EINVAL;
+    }
+    if (s_nvdimm->hcall_flush_required && !dest_hcall_flush_required) {
+        error_report("The guest expects hcall-flush support for the "
+                     "spapr-nvdimm device %s, use pmem_override=3Don to =
"
+                     "continue.", DEVICE(s_nvdimm)->id);
+        return -EINVAL;
+    }
=20
     QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
         thread_pool_submit_aio(pool, flush_worker_cb, state,
@@ -475,6 +532,7 @@ const VMStateDescription vmstate_spapr_nvdimm_states =
=3D {
     .minimum_version_id =3D 1,
     .post_load =3D spapr_nvdimm_flush_post_load,
     .fields =3D (VMStateField[]) {
+        VMSTATE_BOOL(hcall_flush_required, SpaprNVDIMMDevice),
         VMSTATE_UINT64(nvdimm_flush_token, SpaprNVDIMMDevice),
         VMSTATE_QLIST_V(completed_nvdimm_flush_states, SpaprNVDIMMDevice=
, 1,
                         vmstate_spapr_nvdimm_flush_state,
@@ -605,7 +663,11 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, Spa=
prMachineState *spapr,
     }
=20
     dimm =3D PC_DIMM(drc->dev);
+    if (!object_dynamic_cast(OBJECT(dimm), TYPE_SPAPR_NVDIMM)) {
+        return H_PARAMETER;
+    }
     if (continue_token =3D=3D 0) {
+        bool is_pmem =3D false, pmem_override =3D false;
         backend =3D MEMORY_BACKEND(dimm->hostmem);
         fd =3D memory_region_get_fd(&backend->mr);
=20
@@ -613,6 +675,13 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, Spa=
prMachineState *spapr,
             return H_UNSUPPORTED;
         }
=20
+        is_pmem =3D object_property_get_bool(OBJECT(backend), "pmem", NU=
LL);
+        pmem_override =3D object_property_get_bool(OBJECT(dimm),
+                                                "pmem-override", NULL);
+        if (is_pmem && !pmem_override) {
+            return H_UNSUPPORTED;
+        }
+
         state =3D spapr_nvdimm_init_new_flush_state(SPAPR_NVDIMM(dimm));
         if (!state) {
             return H_HARDWARE;
@@ -786,3 +855,66 @@ static void spapr_scm_register_types(void)
 }
=20
 type_init(spapr_scm_register_types)
+
+static void spapr_nvdimm_realize(NVDIMMDevice *dimm, Error **errp)
+{
+    SpaprNVDIMMDevice *s_nvdimm =3D SPAPR_NVDIMM(dimm);
+    HostMemoryBackend *backend =3D MEMORY_BACKEND(PC_DIMM(dimm)->hostmem=
);
+    bool is_pmem =3D object_property_get_bool(OBJECT(backend),  "pmem", =
NULL);
+    bool pmem_override =3D object_property_get_bool(OBJECT(dimm), "pmem-=
override",
+                                             NULL);
+    if (!is_pmem || pmem_override) {
+        s_nvdimm->hcall_flush_required =3D true;
+    }
+
+    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
+                     &vmstate_spapr_nvdimm_states, dimm);
+}
+
+static void spapr_nvdimm_unrealize(NVDIMMDevice *dimm)
+{
+    vmstate_unregister(NULL, &vmstate_spapr_nvdimm_states, dimm);
+}
+
+static Property spapr_nvdimm_properties[] =3D {
+#ifdef CONFIG_LIBPMEM
+    DEFINE_PROP_BOOL("pmem-override", SpaprNVDIMMDevice, pmem_override, =
false),
+#endif
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void spapr_nvdimm_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+    NVDIMMClass *nvc =3D NVDIMM_CLASS(oc);
+
+    nvc->realize =3D spapr_nvdimm_realize;
+    nvc->unrealize =3D spapr_nvdimm_unrealize;
+
+    device_class_set_props(dc, spapr_nvdimm_properties);
+}
+
+static void spapr_nvdimm_init(Object *obj)
+{
+    SpaprNVDIMMDevice *s_nvdimm =3D SPAPR_NVDIMM(obj);
+
+    s_nvdimm->hcall_flush_required =3D false;
+    QLIST_INIT(&s_nvdimm->pending_nvdimm_flush_states);
+    QLIST_INIT(&s_nvdimm->completed_nvdimm_flush_states);
+}
+
+static TypeInfo spapr_nvdimm_info =3D {
+    .name          =3D TYPE_SPAPR_NVDIMM,
+    .parent        =3D TYPE_NVDIMM,
+    .class_init    =3D spapr_nvdimm_class_init,
+    .class_size    =3D sizeof(SPAPRNVDIMMClass),
+    .instance_size =3D sizeof(SpaprNVDIMMDevice),
+    .instance_init =3D spapr_nvdimm_init,
+};
+
+static void spapr_nvdimm_register_types(void)
+{
+    type_register_static(&spapr_nvdimm_info);
+}
+
+type_init(spapr_nvdimm_register_types)
--=20
2.34.1


