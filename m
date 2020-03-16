Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B541870F0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:11:18 +0100 (CET)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtGn-0005M1-OE
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDqli-0000hO-5x
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDqld-0007JK-Oo
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:31:02 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDqlQ-0003sK-VU; Mon, 16 Mar 2020 10:30:45 -0400
Received: from apples.local (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id A89FFBFA98;
 Mon, 16 Mar 2020 14:29:54 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 38/42] nvme: support multiple namespaces
Date: Mon, 16 Mar 2020 07:29:24 -0700
Message-Id: <20200316142928.153431-39-its@irrelevant.dk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316142928.153431-1-its@irrelevant.dk>
References: <20200316142928.153431-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This adds support for multiple namespaces by introducing a new 'nvme-ns'
device model. The nvme device creates a bus named from the device name
('id'). The nvme-ns devices then connect to this and registers
themselves with the nvme device.

This changes how an nvme device is created. Example with two namespaces:

  -drive file=3Dnvme0n1.img,if=3Dnone,id=3Ddisk1
  -drive file=3Dnvme0n2.img,if=3Dnone,id=3Ddisk2
  -device nvme,serial=3Ddeadbeef,id=3Dnvme0
  -device nvme-ns,drive=3Ddisk1,bus=3Dnvme0,nsid=3D1
  -device nvme-ns,drive=3Ddisk2,bus=3Dnvme0,nsid=3D2

The drive property is kept on the nvme device to keep the change
backward compatible, but the property is now optional. Specifying a
drive for the nvme device will always create the namespace with nsid 1.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/Makefile.objs |   2 +-
 hw/block/nvme-ns.c     | 157 +++++++++++++++++++++++++++
 hw/block/nvme-ns.h     |  60 +++++++++++
 hw/block/nvme.c        | 233 ++++++++++++++++++++++++++---------------
 hw/block/nvme.h        |  47 ++++-----
 hw/block/trace-events  |   4 +-
 6 files changed, 389 insertions(+), 114 deletions(-)
 create mode 100644 hw/block/nvme-ns.c
 create mode 100644 hw/block/nvme-ns.h

diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs
index 4b4a2b338dc4..d9141d6a4b9b 100644
--- a/hw/block/Makefile.objs
+++ b/hw/block/Makefile.objs
@@ -7,7 +7,7 @@ common-obj-$(CONFIG_PFLASH_CFI02) +=3D pflash_cfi02.o
 common-obj-$(CONFIG_XEN) +=3D xen-block.o
 common-obj-$(CONFIG_ECC) +=3D ecc.o
 common-obj-$(CONFIG_ONENAND) +=3D onenand.o
-common-obj-$(CONFIG_NVME_PCI) +=3D nvme.o
+common-obj-$(CONFIG_NVME_PCI) +=3D nvme.o nvme-ns.o
 common-obj-$(CONFIG_SWIM) +=3D swim.o
=20
 common-obj-$(CONFIG_SH4) +=3D tc58128.o
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
new file mode 100644
index 000000000000..6d975104171d
--- /dev/null
+++ b/hw/block/nvme-ns.c
@@ -0,0 +1,157 @@
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "hw/block/block.h"
+#include "hw/pci/pci.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+#include "qapi/error.h"
+
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+
+#include "nvme.h"
+#include "nvme-ns.h"
+
+static int nvme_ns_init(NvmeNamespace *ns)
+{
+    NvmeIdNs *id_ns =3D &ns->id_ns;
+
+    id_ns->lbaf[0].ds =3D BDRV_SECTOR_BITS;
+    id_ns->nsze =3D cpu_to_le64(nvme_ns_nlbas(ns));
+
+    /* no thin provisioning */
+    id_ns->ncap =3D id_ns->nsze;
+    id_ns->nuse =3D id_ns->ncap;
+
+    return 0;
+}
+
+static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, NvmeIdCtrl *=
id,
+                            Error **errp)
+{
+    uint64_t perm, shared_perm;
+
+    Error *local_err =3D NULL;
+    int ret;
+
+    perm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    shared_perm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED =
|
+        BLK_PERM_GRAPH_MOD;
+
+    ret =3D blk_set_perm(ns->blk, perm, shared_perm, &local_err);
+    if (ret) {
+        error_propagate_prepend(errp, local_err,
+                                "could not set block permissions: ");
+        return ret;
+    }
+
+    ns->size =3D blk_getlength(ns->blk);
+    if (ns->size < 0) {
+        error_setg_errno(errp, -ns->size, "could not get blockdev size")=
;
+        return -1;
+    }
+
+    switch (n->conf.wce) {
+    case ON_OFF_AUTO_ON:
+        n->features.volatile_wc =3D 1;
+        break;
+    case ON_OFF_AUTO_OFF:
+        n->features.volatile_wc =3D 0;
+    case ON_OFF_AUTO_AUTO:
+        n->features.volatile_wc =3D blk_enable_write_cache(ns->blk);
+        break;
+    default:
+        abort();
+    }
+
+    blk_set_enable_write_cache(ns->blk, n->features.volatile_wc);
+
+    return 0;
+}
+
+static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
+{
+    if (!ns->blk) {
+        error_setg(errp, "block backend not configured");
+        return 1;
+    }
+
+    return 0;
+}
+
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+{
+    if (nvme_ns_check_constraints(ns, errp)) {
+        return -1;
+    }
+
+    if (nvme_ns_init_blk(n, ns, &n->id_ctrl, errp)) {
+        return -1;
+    }
+
+    nvme_ns_init(ns);
+    if (nvme_register_namespace(n, ns, errp)) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static void nvme_ns_realize(DeviceState *dev, Error **errp)
+{
+    NvmeNamespace *ns =3D NVME_NS(dev);
+    BusState *s =3D qdev_get_parent_bus(dev);
+    NvmeCtrl *n =3D NVME(s->parent);
+    Error *local_err =3D NULL;
+
+    if (nvme_ns_setup(n, ns, &local_err)) {
+        error_propagate_prepend(errp, local_err,
+                                "could not setup namespace: ");
+        return;
+    }
+}
+
+static Property nvme_ns_props[] =3D {
+    DEFINE_NVME_NS_PROPERTIES(NvmeNamespace, params),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void nvme_ns_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    dc->bus_type =3D TYPE_NVME_BUS;
+    dc->realize =3D nvme_ns_realize;
+    device_class_set_props(dc, nvme_ns_props);
+    dc->desc =3D "virtual nvme namespace";
+}
+
+static void nvme_ns_instance_init(Object *obj)
+{
+    NvmeNamespace *ns =3D NVME_NS(obj);
+    char *bootindex =3D g_strdup_printf("/namespace@%d,0", ns->params.ns=
id);
+
+    device_add_bootindex_property(obj, &ns->bootindex, "bootindex",
+                                  bootindex, DEVICE(obj), &error_abort);
+
+    g_free(bootindex);
+}
+
+static const TypeInfo nvme_ns_info =3D {
+    .name =3D TYPE_NVME_NS,
+    .parent =3D TYPE_DEVICE,
+    .class_init =3D nvme_ns_class_init,
+    .instance_size =3D sizeof(NvmeNamespace),
+    .instance_init =3D nvme_ns_instance_init,
+};
+
+static void nvme_ns_register_types(void)
+{
+    type_register_static(&nvme_ns_info);
+}
+
+type_init(nvme_ns_register_types)
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
new file mode 100644
index 000000000000..3c3651d485d0
--- /dev/null
+++ b/hw/block/nvme-ns.h
@@ -0,0 +1,60 @@
+#ifndef NVME_NS_H
+#define NVME_NS_H
+
+#define TYPE_NVME_NS "nvme-ns"
+#define NVME_NS(obj) \
+    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
+
+#define DEFINE_NVME_NS_PROPERTIES(_state, _props) \
+    DEFINE_PROP_DRIVE("drive", _state, blk), \
+    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0)
+
+typedef struct NvmeNamespaceParams {
+    uint32_t nsid;
+} NvmeNamespaceParams;
+
+typedef struct NvmeNamespace {
+    DeviceState  parent_obj;
+    BlockBackend *blk;
+    int32_t      bootindex;
+    int64_t      size;
+
+    NvmeIdNs            id_ns;
+    NvmeNamespaceParams params;
+} NvmeNamespace;
+
+static inline uint32_t nvme_nsid(NvmeNamespace *ns)
+{
+    if (ns) {
+        return ns->params.nsid;
+    }
+
+    return -1;
+}
+
+static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
+{
+    NvmeIdNs *id_ns =3D &ns->id_ns;
+    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+}
+
+static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
+{
+    return nvme_ns_lbaf(ns)->ds;
+}
+
+static inline size_t nvme_ns_lbads_bytes(NvmeNamespace *ns)
+{
+    return 1 << nvme_ns_lbads(ns);
+}
+
+static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
+{
+    return ns->size >> nvme_ns_lbads(ns);
+}
+
+typedef struct NvmeCtrl NvmeCtrl;
+
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+
+#endif /* NVME_NS_H */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bf9fb500842a..88a0499d0fe0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -17,10 +17,11 @@
 /**
  * Usage: add options:
  *      -drive file=3D<file>,if=3Dnone,id=3D<drive_id>
- *      -device nvme,drive=3D<drive_id>,serial=3D<serial>,id=3D<id[optio=
nal]>, \
+ *      -device nvme,serial=3D<serial>,id=3D<bus_name>, \
  *              cmb_size_mb=3D<cmb_size_mb[optional]>, \
  *              max_ioqpairs=3D<N[optional]>, \
  *              mdts=3D<mdts[optional]>
+ *      -device nvme-ns,drive=3D<drive_id>,bus=3Dbus_name,nsid=3D1
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
@@ -44,6 +45,7 @@
 #include "qemu/cutils.h"
 #include "trace.h"
 #include "nvme.h"
+#include "nvme-ns.h"
=20
 #define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
@@ -89,6 +91,11 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, vo=
id *buf, int size)
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
=20
+static uint16_t nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
+{
+    return nsid && nsid <=3D n->num_namespaces;
+}
+
 static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
 {
     return sqid < n->params.max_ioqpairs + 1 && n->sq[sqid] !=3D NULL ? =
0 : -1;
@@ -892,11 +899,12 @@ static uint16_t nvme_check_rw(NvmeCtrl *n, NvmeRequ=
est *req)
=20
 static void nvme_rw_cb(NvmeRequest *req, void *opaque)
 {
+    NvmeNamespace *ns =3D req->ns;
     NvmeSQueue *sq =3D req->sq;
     NvmeCtrl *n =3D sq->ctrl;
     NvmeCQueue *cq =3D n->cq[sq->cqid];
=20
-    trace_nvme_dev_rw_cb(nvme_cid(req), req->cmd.nsid);
+    trace_nvme_dev_rw_cb(nvme_cid(req), nvme_nsid(ns));
=20
     nvme_enqueue_req_completion(cq, req);
 }
@@ -980,10 +988,11 @@ static void nvme_aio_cb(void *opaque, int ret)
=20
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
+    NvmeNamespace *ns =3D req->ns;
     NvmeAIO *aio =3D g_new0(NvmeAIO, 1);
=20
     *aio =3D (NvmeAIO) {
-        .blk =3D n->conf.blk,
+        .blk =3D ns->blk,
         .req =3D req,
     };
=20
@@ -1008,8 +1017,8 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, Nvme=
Cmd *cmd, NvmeRequest *req)
     req->slba =3D le64_to_cpu(rw->slba);
     req->nlb  =3D le16_to_cpu(rw->nlb) + 1;
=20
-    trace_nvme_dev_write_zeroes(nvme_cid(req), le32_to_cpu(cmd->nsid),
-                                req->slba, req->nlb);
+    trace_nvme_dev_write_zeroes(nvme_cid(req), nvme_nsid(ns), req->slba,
+                                req->nlb);
=20
     status =3D nvme_check_prinfo(n, ctrl, req);
     if (status) {
@@ -1032,7 +1041,7 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, Nvme=
Cmd *cmd, NvmeRequest *req)
     aio =3D g_new0(NvmeAIO, 1);
=20
     *aio =3D (NvmeAIO) {
-        .blk =3D n->conf.blk,
+        .blk =3D ns->blk,
         .offset =3D offset,
         .len =3D count,
         .req =3D req,
@@ -1044,7 +1053,7 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, Nvme=
Cmd *cmd, NvmeRequest *req)
     return NVME_NO_COMPLETE;
=20
 invalid:
-    block_acct_invalid(blk_get_stats(n->conf.blk), BLOCK_ACCT_WRITE);
+    block_acct_invalid(blk_get_stats(ns->blk), BLOCK_ACCT_WRITE);
     return status;
 }
=20
@@ -1060,11 +1069,11 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd=
, NvmeRequest *req)
=20
     req->nlb  =3D le16_to_cpu(rw->nlb) + 1;
     req->slba =3D le64_to_cpu(rw->slba);
-
     len =3D req->nlb << nvme_ns_lbads(ns);
=20
-    trace_nvme_dev_rw(nvme_req_is_write(req) ? "write" : "read", req->nl=
b,
-                      req->nlb << nvme_ns_lbads(req->ns), req->slba);
+    trace_nvme_dev_rw(nvme_cid(req), nvme_req_is_write(req) ? "write" : =
"read",
+                      nvme_nsid(ns), req->nlb, req->nlb << nvme_ns_lbads=
(ns),
+                      req->slba);
=20
     status =3D nvme_check_rw(n, req);
     if (status) {
@@ -1076,13 +1085,13 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd=
, NvmeRequest *req)
         goto invalid;
     }
=20
-    nvme_rw_aio(n->conf.blk, req->slba << nvme_ns_lbads(ns), req);
+    nvme_rw_aio(ns->blk, req->slba << nvme_ns_lbads(ns), req);
     nvme_req_set_cb(req, nvme_rw_cb, NULL);
=20
     return NVME_NO_COMPLETE;
=20
 invalid:
-    block_acct_invalid(blk_get_stats(n->conf.blk), acct);
+    block_acct_invalid(blk_get_stats(ns->blk), acct);
     return status;
 }
=20
@@ -1093,12 +1102,15 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd =
*cmd, NvmeRequest *req)
     trace_nvme_dev_io_cmd(nvme_cid(req), nsid, le16_to_cpu(req->sq->sqid=
),
                           cmd->opcode);
=20
-    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
-        trace_nvme_dev_err_invalid_ns(nsid, n->num_namespaces);
+    if (!nvme_nsid_valid(n, nsid)) {
         return NVME_INVALID_NSID | NVME_DNR;
     }
=20
-    req->ns =3D &n->namespaces[nsid - 1];
+    req->ns =3D nvme_ns(n, nsid);
+
+    if (unlikely(!req->ns)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
=20
     switch (cmd->opcode) {
     case NVME_CMD_FLUSH:
@@ -1245,18 +1257,24 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, Nvme=
Cmd *cmd, uint8_t rae,
     uint64_t units_read =3D 0, units_written =3D 0;
     uint64_t read_commands =3D 0, write_commands =3D 0;
     NvmeSmartLog smart;
-    BlockAcctStats *s;
=20
     if (nsid && nsid !=3D 0xffffffff) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
=20
-    s =3D blk_get_stats(n->conf.blk);
+    for (int i =3D 1; i <=3D n->num_namespaces; i++) {
+        NvmeNamespace *ns =3D nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
=20
-    units_read =3D s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
-    units_written =3D s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
-    read_commands =3D s->nr_ops[BLOCK_ACCT_READ];
-    write_commands =3D s->nr_ops[BLOCK_ACCT_WRITE];
+        BlockAcctStats *s =3D blk_get_stats(ns->blk);
+
+        units_read +=3D s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS=
;
+        units_written +=3D s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_=
BITS;
+        read_commands +=3D s->nr_ops[BLOCK_ACCT_READ];
+        write_commands +=3D s->nr_ops[BLOCK_ACCT_WRITE];
+    }
=20
     if (off > sizeof(smart)) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -1482,19 +1500,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, N=
vmeIdentify *c,
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeIdentify *c,
                                  NvmeRequest *req)
 {
-    NvmeNamespace *ns;
+    NvmeIdNs *id_ns, inactive =3D { 0 };
     uint32_t nsid =3D le32_to_cpu(c->nsid);
+    NvmeNamespace *ns;
=20
     trace_nvme_dev_identify_ns(nsid);
=20
-    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
-        trace_nvme_dev_err_invalid_ns(nsid, n->num_namespaces);
+    if (!nvme_nsid_valid(n, nsid)) {
         return NVME_INVALID_NSID | NVME_DNR;
     }
=20
-    ns =3D &n->namespaces[nsid - 1];
+    ns =3D nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
+        id_ns =3D &inactive;
+    } else {
+        id_ns =3D &ns->id_ns;
+    }
=20
-    return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(ns->id_ns),
+    return nvme_dma(n, (uint8_t *)id_ns, sizeof(NvmeIdNs),
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
=20
@@ -1511,7 +1534,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, N=
vmeIdentify *c,
=20
     list =3D g_malloc0(data_len);
     for (int i =3D 1; i <=3D n->num_namespaces; i++) {
-        if (i <=3D min_nsid) {
+        if (i <=3D min_nsid || !nvme_ns(n, i)) {
             continue;
         }
         list[j++] =3D cpu_to_le32(i);
@@ -1536,11 +1559,14 @@ static uint16_t nvme_identify_ns_descr_list(NvmeC=
trl *n, NvmeIdentify *c,
=20
     trace_nvme_dev_identify_ns_descr_list(nsid);
=20
-    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
-        trace_nvme_dev_err_invalid_ns(nsid, n->num_namespaces);
+    if (!nvme_nsid_valid(n, nsid)) {
         return NVME_INVALID_NSID | NVME_DNR;
     }
=20
+    if (unlikely(!nvme_ns(n, nsid))) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     list =3D g_malloc0(NVME_IDENTIFY_DATA_SIZE);
     ns_descr =3D list;
=20
@@ -1680,7 +1706,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeC=
md *cmd, NvmeRequest *req)
         result =3D cpu_to_le32(n->features.err_rec);
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        result =3D cpu_to_le32(blk_enable_write_cache(n->conf.blk));
+        result =3D cpu_to_le32(n->features.volatile_wc);
         trace_nvme_dev_getfeat_vwcache(result ? "enabled" : "disabled");
         break;
     case NVME_NUMBER_OF_QUEUES:
@@ -1734,6 +1760,8 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl=
 *n, NvmeCmd *cmd,
=20
 static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
 {
+    NvmeNamespace *ns;
+
     uint32_t dw10 =3D le32_to_cpu(cmd->cdw10);
     uint32_t dw11 =3D le32_to_cpu(cmd->cdw11);
=20
@@ -1766,12 +1794,23 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, Nvm=
eCmd *cmd, NvmeRequest *req)
=20
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        if (blk_enable_write_cache(n->conf.blk)) {
-            blk_flush(n->conf.blk);
+        n->features.volatile_wc =3D dw11;
+
+        for (int i =3D 1; i <=3D n->num_namespaces; i++) {
+            ns =3D nvme_ns(n, i);
+            if (!ns) {
+                continue;
+            }
+
+            if (blk_enable_write_cache(ns->blk)) {
+                blk_flush(ns->blk);
+            }
+
+            blk_set_enable_write_cache(ns->blk, dw11 & 1);
         }
=20
-        blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
         break;
+
     case NVME_NUMBER_OF_QUEUES:
         if (n->qs_created) {
             return NVME_CMD_SEQ_ERROR | NVME_DNR;
@@ -1898,9 +1937,17 @@ static void nvme_process_sq(void *opaque)
=20
 static void nvme_clear_ctrl(NvmeCtrl *n)
 {
+    NvmeNamespace *ns;
     int i;
=20
-    blk_drain(n->conf.blk);
+    for (i =3D 1; i <=3D n->num_namespaces; i++) {
+        ns =3D nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
+
+        blk_drain(ns->blk);
+    }
=20
     for (i =3D 0; i < n->params.max_ioqpairs + 1; i++) {
         if (n->sq[i] !=3D NULL) {
@@ -1923,7 +1970,15 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
     n->outstanding_aers =3D 0;
     n->qs_created =3D false;
=20
-    blk_flush(n->conf.blk);
+    for (i =3D 1; i <=3D n->num_namespaces; i++) {
+        ns =3D nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
+
+        blk_flush(ns->blk);
+    }
+
     n->bar.cc =3D 0;
 }
=20
@@ -2360,17 +2415,17 @@ static int nvme_check_constraints(NvmeCtrl *n, Er=
ror **errp)
         n->params.max_ioqpairs =3D n->params.num_queues - 1;
     }
=20
+    if (n->namespace.blk) {
+        warn_report("nvme: drive is deprecated; please use an nvme-ns de=
vice "
+                    "instead");
+    }
+
     if (params->max_ioqpairs < 1 ||
         params->max_ioqpairs > PCI_MSIX_FLAGS_QSIZE) {
         error_setg(errp, "nvme: max_ioqpairs must be ");
         return -1;
     }
=20
-    if (!n->conf.blk) {
-        error_setg(errp, "nvme: block backend not configured");
-        return -1;
-    }
-
     if (!params->serial) {
         error_setg(errp, "nvme: serial not configured");
         return -1;
@@ -2379,22 +2434,10 @@ static int nvme_check_constraints(NvmeCtrl *n, Er=
ror **errp)
     return 0;
 }
=20
-static int nvme_init_blk(NvmeCtrl *n, Error **errp)
-{
-    blkconf_blocksizes(&n->conf);
-    if (!blkconf_apply_backend_options(&n->conf, blk_is_read_only(n->con=
f.blk),
-                                       false, errp)) {
-        return -1;
-    }
-
-    return 0;
-}
-
 static void nvme_init_state(NvmeCtrl *n)
 {
-    n->num_namespaces =3D 1;
+    n->num_namespaces =3D NVME_MAX_NAMESPACES;
     n->reg_size =3D pow2ceil(0x1008 + 2 * (n->params.max_ioqpairs) * 4);
-    n->namespaces =3D g_new0(NvmeNamespace, n->num_namespaces);
     n->sq =3D g_new0(NvmeSQueue *, n->params.max_ioqpairs + 1);
     n->cq =3D g_new0(NvmeCQueue *, n->params.max_ioqpairs + 1);
     n->temperature =3D NVME_TEMPERATURE;
@@ -2509,7 +2552,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     id->cqes =3D (0x4 << 4) | 0x4;
     id->nn =3D cpu_to_le32(n->num_namespaces);
     id->oncs =3D cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP=
);
-
+    id->vwc =3D 0x1;
     id->sgls =3D cpu_to_le32(NVME_CTRL_SGLS_SUPPORTED_NO_ALIGNMENT);
=20
     pstrcpy((char *) id->subnqn, sizeof(id->subnqn), "nqn.2019-08.org.qe=
mu:");
@@ -2518,9 +2561,6 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     id->psd[0].mp =3D cpu_to_le16(0x9c4);
     id->psd[0].enlat =3D cpu_to_le32(0x10);
     id->psd[0].exlat =3D cpu_to_le32(0x4);
-    if (blk_enable_write_cache(n->conf.blk)) {
-        id->vwc =3D 1;
-    }
=20
     n->bar.cap =3D 0;
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
@@ -2533,25 +2573,34 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     n->bar.intmc =3D n->bar.intms =3D 0;
 }
=20
-static int nvme_init_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **e=
rrp)
+int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp=
)
 {
-    int64_t bs_size;
-    NvmeIdNs *id_ns =3D &ns->id_ns;
+    uint32_t nsid =3D nvme_nsid(ns);
=20
-    bs_size =3D blk_getlength(n->conf.blk);
-    if (bs_size < 0) {
-        error_setg_errno(errp, -bs_size, "blk_getlength");
+    if (nsid > NVME_MAX_NAMESPACES) {
+        error_setg(errp, "invalid nsid (must be between 0 and %d)",
+                   NVME_MAX_NAMESPACES);
         return -1;
     }
=20
-    id_ns->lbaf[0].ds =3D BDRV_SECTOR_BITS;
-    n->ns_size =3D bs_size;
+    if (!nsid) {
+        for (int i =3D 1; i <=3D n->num_namespaces; i++) {
+            NvmeNamespace *ns =3D nvme_ns(n, i);
+            if (!ns) {
+                nsid =3D i;
+                break;
+            }
+        }
+    } else {
+        if (n->namespaces[nsid - 1]) {
+            error_setg(errp, "nsid must be unique");
+            return -1;
+        }
+    }
=20
-    id_ns->nsze =3D cpu_to_le64(nvme_ns_nlbas(n, ns));
+    trace_nvme_dev_register_namespace(nsid);
=20
-    /* no thin provisioning */
-    id_ns->ncap =3D id_ns->nsze;
-    id_ns->nuse =3D id_ns->ncap;
+    n->namespaces[nsid - 1] =3D ns;
=20
     return 0;
 }
@@ -2559,26 +2608,28 @@ static int nvme_init_namespace(NvmeCtrl *n, NvmeN=
amespace *ns, Error **errp)
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n =3D NVME(pci_dev);
-    int i;
+    NvmeNamespace *ns;
=20
     if (nvme_check_constraints(n, errp)) {
         return;
     }
=20
+    qbus_create_inplace(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
+                        &pci_dev->qdev, n->parent_obj.qdev.id);
+
     nvme_init_state(n);
-
-    if (nvme_init_blk(n, errp)) {
-        return;
-    }
-
-    for (i =3D 0; i < n->num_namespaces; i++) {
-        if (nvme_init_namespace(n, &n->namespaces[i], errp)) {
-            return;
-        }
-    }
-
     nvme_init_pci(n, pci_dev);
     nvme_init_ctrl(n);
+
+    /* setup a namespace if the controller drive property was given */
+    if (n->namespace.blk) {
+        ns =3D &n->namespace;
+        ns->params.nsid =3D 1;
+
+        if (nvme_ns_setup(n, ns, errp)) {
+            return;
+        }
+    }
 }
=20
 static void nvme_exit(PCIDevice *pci_dev)
@@ -2599,7 +2650,8 @@ static void nvme_exit(PCIDevice *pci_dev)
 }
=20
 static Property nvme_props[] =3D {
-    DEFINE_BLOCK_PROPERTIES(NvmeCtrl, conf),
+    DEFINE_BLOCK_PROPERTIES_BASE(NvmeCtrl, conf), \
+    DEFINE_PROP_DRIVE("drive", NvmeCtrl, namespace.blk), \
     DEFINE_NVME_PROPERTIES(NvmeCtrl, params),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -2631,26 +2683,35 @@ static void nvme_instance_init(Object *obj)
 {
     NvmeCtrl *s =3D NVME(obj);
=20
-    device_add_bootindex_property(obj, &s->conf.bootindex,
-                                  "bootindex", "/namespace@1,0",
-                                  DEVICE(obj), &error_abort);
+    if (s->namespace.blk) {
+        device_add_bootindex_property(obj, &s->conf.bootindex,
+                                      "bootindex", "/namespace@1,0",
+                                      DEVICE(obj), &error_abort);
+    }
 }
=20
 static const TypeInfo nvme_info =3D {
     .name          =3D TYPE_NVME,
     .parent        =3D TYPE_PCI_DEVICE,
     .instance_size =3D sizeof(NvmeCtrl),
-    .class_init    =3D nvme_class_init,
     .instance_init =3D nvme_instance_init,
+    .class_init    =3D nvme_class_init,
     .interfaces =3D (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { }
     },
 };
=20
+static const TypeInfo nvme_bus_info =3D {
+    .name =3D TYPE_NVME_BUS,
+    .parent =3D TYPE_BUS,
+    .instance_size =3D sizeof(NvmeBus),
+};
+
 static void nvme_register_types(void)
 {
     type_register_static(&nvme_info);
+    type_register_static(&nvme_bus_info);
 }
=20
 type_init(nvme_register_types)
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5d5fa8c8833a..c66f6cd8413a 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,9 @@
 #define HW_NVME_H
=20
 #include "block/nvme.h"
+#include "nvme-ns.h"
+
+#define NVME_MAX_NAMESPACES 256
=20
 #define DEFINE_NVME_PROPERTIES(_state, _props) \
     DEFINE_PROP_STRING("serial", _state, _props.serial), \
@@ -110,26 +113,6 @@ typedef struct NvmeCQueue {
     QTAILQ_HEAD(, NvmeRequest) req_list;
 } NvmeCQueue;
=20
-typedef struct NvmeNamespace {
-    NvmeIdNs        id_ns;
-} NvmeNamespace;
-
-static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
-{
-    NvmeIdNs *id_ns =3D &ns->id_ns;
-    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-}
-
-static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
-{
-    return nvme_ns_lbaf(ns)->ds;
-}
-
-static inline size_t nvme_ns_lbads_bytes(NvmeNamespace *ns)
-{
-    return 1 << nvme_ns_lbads(ns);
-}
-
 typedef enum NvmeAIOOp {
     NVME_AIO_OPC_NONE         =3D 0x0,
     NVME_AIO_OPC_FLUSH        =3D 0x1,
@@ -184,6 +167,13 @@ static inline bool nvme_req_is_write(NvmeRequest *re=
q)
     }
 }
=20
+#define TYPE_NVME_BUS "nvme-bus"
+#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
+
+typedef struct NvmeBus {
+    BusState parent_bus;
+} NvmeBus;
+
 #define TYPE_NVME "nvme"
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
@@ -193,8 +183,9 @@ typedef struct NvmeCtrl {
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
     NvmeBar      bar;
-    BlockConf    conf;
     NvmeParams   params;
+    NvmeBus      bus;
+    BlockConf    conf;
=20
     bool        qs_created;
     uint32_t    page_size;
@@ -205,7 +196,6 @@ typedef struct NvmeCtrl {
     uint32_t    reg_size;
     uint32_t    num_namespaces;
     uint32_t    max_q_ents;
-    uint64_t    ns_size;
     uint8_t     outstanding_aers;
     uint8_t     *cmbuf;
     uint64_t    irq_status;
@@ -219,7 +209,8 @@ typedef struct NvmeCtrl {
     QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
     int         aer_queued;
=20
-    NvmeNamespace   *namespaces;
+    NvmeNamespace   namespace;
+    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
     NvmeSQueue      admin_sq;
@@ -228,9 +219,13 @@ typedef struct NvmeCtrl {
     NvmeFeatureVal  features;
 } NvmeCtrl;
=20
-static inline uint64_t nvme_ns_nlbas(NvmeCtrl *n, NvmeNamespace *ns)
+static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 {
-    return n->ns_size >> nvme_ns_lbads(ns);
+    if (!nsid || nsid > n->num_namespaces) {
+        return NULL;
+    }
+
+    return n->namespaces[nsid - 1];
 }
=20
 static inline uint16_t nvme_cid(NvmeRequest *req)
@@ -253,4 +248,6 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
     return req->sq->ctrl;
 }
=20
+int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp=
);
+
 #endif /* HW_NVME_H */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 70702cc67d5a..3d907eaf0800 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -29,6 +29,7 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t he=
ads, uint32_t secs, int t
=20
 # nvme.c
 # nvme traces for successful events
+nvme_dev_register_namespace(uint32_t nsid) "nsid %"PRIu32""
 nvme_dev_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 nvme_dev_irq_pin(void) "pulsing IRQ pin"
 nvme_dev_irq_masked(void) "IRQ is masked"
@@ -38,7 +39,7 @@ nvme_dev_map_sgl(uint16_t cid, uint8_t typ, uint32_t nl=
b, uint64_t len) "cid %"P
 nvme_dev_req_register_aio(uint16_t cid, void *aio, const char *blkname, =
uint64_t offset, uint64_t count, const char *opc, void *req) "cid %"PRIu1=
6" aio %p blk \"%s\" offset %"PRIu64" count %"PRIu64" opc \"%s\" req %p"
 nvme_dev_aio_cb(uint16_t cid, void *aio, const char *blkname, uint64_t o=
ffset, const char *opc, void *req) "cid %"PRIu16" aio %p blk \"%s\" offse=
t %"PRIu64" opc \"%s\" req %p"
 nvme_dev_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opco=
de) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8""
-nvme_dev_rw(const char *verb, uint32_t blk_count, uint64_t byte_count, u=
int64_t lba) "%s %"PRIu32" blocks (%"PRIu64" bytes) from LBA %"PRIu64""
+nvme_dev_rw(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb,=
 uint64_t count, uint64_t lba) "cid %"PRIu16" %s nsid %"PRIu32" nlb %"PRI=
u32" count %"PRIu64" lba 0x%"PRIx64""
 nvme_dev_rw_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32=
""
 nvme_dev_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32=
_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 nvme_dev_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t=
 qsize, uint16_t qflags) "create submission queue, addr=3D0x%"PRIx64", sq=
id=3D%"PRIu16", cqid=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D%"PRIu16""
@@ -98,7 +99,6 @@ nvme_dev_err_invalid_prplist_ent(uint64_t prplist) "PRP=
 list entry is null or no
 nvme_dev_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned=
: 0x%"PRIx64""
 nvme_dev_err_invalid_prp2_missing(void) "PRP2 is null and more data to b=
e transferred"
 nvme_dev_err_invalid_prp(void) "invalid PRP"
-nvme_dev_err_invalid_ns(uint32_t ns, uint32_t limit) "invalid namespace =
%u not within 1-%u"
 nvme_dev_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 nvme_dev_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PR=
Ix8""
 nvme_dev_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t li=
mit) "Invalid LBA start=3D%"PRIu64" len=3D%"PRIu64" limit=3D%"PRIu64""
--=20
2.25.1


