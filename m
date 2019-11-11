Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8146F743B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 13:43:49 +0100 (CET)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU92q-0002XC-Te
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 07:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iU8mE-0008Km-Sl
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iU8mA-0003c7-N6
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 07:26:38 -0500
Received: from charlie.dont.surf ([128.199.63.193]:52272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iU8lz-0003QK-Lq; Mon, 11 Nov 2019 07:26:23 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 6C035BFB11;
 Mon, 11 Nov 2019 12:26:02 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 16/21] nvme: support multiple namespaces
Date: Mon, 11 Nov 2019 13:25:40 +0100
Message-Id: <20191111122545.252478-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111122545.252478-1-its@irrelevant.dk>
References: <20191111122545.252478-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Javier Gonzalez <javier@javigon.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Keith Busch <kbusch@kernel.org>,
 Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/block/Makefile.objs |   2 +-
 hw/block/nvme-ns.c     | 158 +++++++++++++++++++++++++++++
 hw/block/nvme-ns.h     |  60 +++++++++++
 hw/block/nvme.c        | 222 ++++++++++++++++++++++++-----------------
 hw/block/nvme.h        |  60 ++++++-----
 hw/block/trace-events  |   6 +-
 6 files changed, 389 insertions(+), 119 deletions(-)
 create mode 100644 hw/block/nvme-ns.c
 create mode 100644 hw/block/nvme-ns.h

diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs
index 28c2495a00dc..45f463462f1e 100644
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
 obj-$(CONFIG_SH4) +=3D tc58128.o
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
new file mode 100644
index 000000000000..36deedee07a6
--- /dev/null
+++ b/hw/block/nvme-ns.c
@@ -0,0 +1,158 @@
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "hw/block/block.h"
+#include "hw/pci/msix.h"
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
+    id_ns->nuse =3D id_ns->ncap =3D id_ns->nsze =3D
+        cpu_to_le64(nvme_ns_nlbas(ns));
+
+    return 0;
+}
+
+static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, NvmeIdCtrl *=
id,
+    Error **errp)
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
+        error_propagate_prepend(errp, local_err, "blk_set_perm: ");
+        return ret;
+    }
+
+    ns->size =3D blk_getlength(ns->blk);
+    if (ns->size < 0) {
+        error_setg_errno(errp, -ns->size, "blk_getlength");
+        return 1;
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
+    Error *local_err =3D NULL;
+
+    if (nvme_ns_check_constraints(ns, &local_err)) {
+        error_propagate_prepend(errp, local_err,
+            "nvme_ns_check_constraints: ");
+        return 1;
+    }
+
+    if (nvme_ns_init_blk(n, ns, &n->id_ctrl, &local_err)) {
+        error_propagate_prepend(errp, local_err, "nvme_ns_init_blk: ");
+        return 1;
+    }
+
+    nvme_ns_init(ns);
+    if (nvme_register_namespace(n, ns, &local_err)) {
+        error_propagate_prepend(errp, local_err, "nvme_register_namespac=
e: ");
+        return 1;
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
+        error_propagate_prepend(errp, local_err, "nvme_ns_setup: ");
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
+    dc->props =3D nvme_ns_props;
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
+        bootindex, DEVICE(obj), &error_abort);
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
index 000000000000..b564bac25f6d
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
+static inline NvmeLBAF nvme_ns_lbaf(NvmeNamespace *ns)
+{
+    NvmeIdNs *id_ns =3D &ns->id_ns;
+    return id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+}
+
+static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
+{
+    return nvme_ns_lbaf(ns).ds;
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
index 06b2530aa06c..7bd5c1bb2f55 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -17,7 +17,8 @@
 /**
  * Usage: add options:
  *     -drive file=3D<file>,if=3Dnone,id=3D<drive_id>
- *     -device nvme,drive=3D<drive_id>,serial=3D<serial>,id=3D<id[option=
al]>
+ *     -device nvme,serial=3D<serial>,id=3Dnvme0
+ *     -device nvme-ns,drive=3D<drive_id>,bus=3Dnvme0,nsid=3D1
  *
  * Advanced optional options:
  *
@@ -31,6 +32,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/error-report.h"
 #include "hw/block/block.h"
 #include "hw/pci/msix.h"
 #include "hw/pci/pci.h"
@@ -46,6 +48,7 @@
 #include "qemu/cutils.h"
 #include "trace.h"
 #include "nvme.h"
+#include "nvme-ns.h"
=20
 #define NVME_MAX_QS PCI_MSIX_FLAGS_QSIZE
 #define NVME_TEMPERATURE 0x143
@@ -882,11 +885,12 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t =
event_type)
=20
 static void nvme_rw_cb(NvmeRequest *req, void *opaque)
 {
+    NvmeNamespace *ns =3D req->ns;
     NvmeSQueue *sq =3D req->sq;
     NvmeCtrl *n =3D sq->ctrl;
     NvmeCQueue *cq =3D n->cq[sq->cqid];
=20
-    trace_nvme_rw_cb(req->cid, req->cmd.nsid);
+    trace_nvme_rw_cb(req->cid, nvme_nsid(ns));
=20
     nvme_enqueue_req_completion(cq, req);
 }
@@ -919,6 +923,7 @@ static void nvme_aio_cb(void *opaque, int ret)
         block_acct_failed(stats, acct);
=20
         if (req) {
+            NvmeNamespace *ns =3D req->ns;
             NvmeRwCmd *rw =3D (NvmeRwCmd *) &req->cmd;
             NvmeSQueue *sq =3D req->sq;
             NvmeCtrl *n =3D sq->ctrl;
@@ -941,7 +946,7 @@ static void nvme_aio_cb(void *opaque, int ret)
                 aio->offset, nvme_aio_opc_str(aio), req, status);
=20
             nvme_set_error_page(n, sq->sqid, cpu_to_le16(req->cid), stat=
us,
-                offsetof(NvmeRwCmd, slba), rw->slba, 1);
+                offsetof(NvmeRwCmd, slba), rw->slba, nvme_nsid(ns));
=20
             error_setg_errno(&local_err, -ret, "aio failed");
             error_report_err(local_err);
@@ -1007,7 +1012,7 @@ static inline uint16_t nvme_check_bounds(NvmeCtrl *=
n, NvmeRequest *req)
     uint64_t nsze =3D le64_to_cpu(ns->id_ns.nsze);
=20
     if (unlikely((req->slba + req->nlb) > nsze)) {
-        block_acct_invalid(blk_get_stats(n->conf.blk),
+        block_acct_invalid(blk_get_stats(ns->blk),
             nvme_req_is_write(req) ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ)=
;
         trace_nvme_err_invalid_lba_range(req->slba, req->nlb, nsze);
         return NVME_LBA_RANGE | NVME_DNR;
@@ -1042,7 +1047,9 @@ static uint16_t nvme_check_rw(NvmeCtrl *n, NvmeRequ=
est *req)
=20
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
-    NvmeAIO *aio =3D nvme_aio_new(n->conf.blk, 0x0, NULL, req, NULL);
+    NvmeNamespace *ns =3D req->ns;
+
+    NvmeAIO *aio =3D nvme_aio_new(ns->blk, 0x0, NULL, req, NULL);
=20
     nvme_req_register_aio(req, aio, NVME_AIO_OPC_FLUSH);
     nvme_aio(aio);
@@ -1064,19 +1071,18 @@ static uint16_t nvme_write_zeros(NvmeCtrl *n, Nvm=
eCmd *cmd, NvmeRequest *req)
     req->slba =3D le64_to_cpu(rw->slba);
     req->nlb  =3D le16_to_cpu(rw->nlb) + 1;
=20
-    trace_nvme_write_zeros(req->cid, le32_to_cpu(cmd->nsid), req->slba,
-        req->nlb);
+    trace_nvme_write_zeros(req->cid, nvme_nsid(ns), req->slba, req->nlb)=
;
=20
     status =3D nvme_check_bounds(n, req);
     if (unlikely(status)) {
-        block_acct_invalid(blk_get_stats(n->conf.blk), BLOCK_ACCT_WRITE)=
;
+        block_acct_invalid(blk_get_stats(ns->blk), BLOCK_ACCT_WRITE);
         return status;
     }
=20
     offset =3D req->slba << nvme_ns_lbads(ns);
     count =3D req->nlb << nvme_ns_lbads(ns);
=20
-    aio =3D nvme_aio_new(n->conf.blk, offset, NULL, req, NULL);
+    aio =3D nvme_aio_new(ns->blk, offset, NULL, req, NULL);
=20
     aio->iov.size =3D count;
=20
@@ -1098,22 +1104,23 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd=
, NvmeRequest *req)
     req->nlb  =3D le16_to_cpu(rw->nlb) + 1;
     req->slba =3D le64_to_cpu(rw->slba);
=20
-    trace_nvme_rw(nvme_req_is_write(req) ? "write" : "read", req->nlb,
-        req->nlb << nvme_ns_lbads(req->ns), req->slba);
+    trace_nvme_rw(req->cid, nvme_req_is_write(req) ? "write" : "read",
+        nvme_nsid(ns), req->nlb, req->nlb << nvme_ns_lbads(ns),
+        req->slba);
=20
     status =3D nvme_check_rw(n, req);
     if (status) {
-        block_acct_invalid(blk_get_stats(n->conf.blk), acct);
+        block_acct_invalid(blk_get_stats(ns->blk), acct);
         return status;
     }
=20
     status =3D nvme_map(n, cmd, req);
     if (status) {
-        block_acct_invalid(blk_get_stats(n->conf.blk), acct);
+        block_acct_invalid(blk_get_stats(ns->blk), acct);
         return status;
     }
=20
-    nvme_rw_aio(n->conf.blk, req->slba << nvme_ns_lbads(ns), &req->qsg, =
req);
+    nvme_rw_aio(ns->blk, req->slba << nvme_ns_lbads(ns), &req->qsg, req)=
;
     nvme_req_set_cb(req, nvme_rw_cb, NULL);
=20
     return NVME_NO_COMPLETE;
@@ -1125,12 +1132,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd =
*cmd, NvmeRequest *req)
=20
     trace_nvme_io_cmd(req->cid, nsid, le16_to_cpu(req->sq->sqid), cmd->o=
pcode);
=20
-    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
-        trace_nvme_err_invalid_ns(nsid, n->num_namespaces);
-        return NVME_INVALID_NSID | NVME_DNR;
-    }
+    req->ns =3D nvme_ns(n, nsid);
=20
-    req->ns =3D &n->namespaces[nsid - 1];
+    if (unlikely(!req->ns)) {
+        return nvme_nsid_err(n, nsid);
+    }
=20
     switch (cmd->opcode) {
     case NVME_CMD_FLUSH:
@@ -1296,18 +1302,24 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, Nvme=
Cmd *cmd, uint8_t rae,
     uint64_t units_read =3D 0, units_written =3D 0, read_commands =3D 0,
         write_commands =3D 0;
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
+
+        BlockAcctStats *s =3D blk_get_stats(ns->blk);
=20
-    units_read =3D s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
-    units_written =3D s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
-    read_commands =3D s->nr_ops[BLOCK_ACCT_READ];
-    write_commands =3D s->nr_ops[BLOCK_ACCT_WRITE];
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
@@ -1507,20 +1519,25 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, N=
vmeCmd *cmd, NvmeRequest *req)
=20
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
 {
-    NvmeNamespace *ns;
+    NvmeIdNs *id_ns, inactive =3D { 0 };
     uint32_t nsid =3D le32_to_cpu(cmd->nsid);
+    NvmeNamespace *ns =3D nvme_ns(n, nsid);
=20
     trace_nvme_identify_ns(nsid);
=20
-    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
-        trace_nvme_err_invalid_ns(nsid, n->num_namespaces);
-        return NVME_INVALID_NSID | NVME_DNR;
-    }
+    if (unlikely(!ns)) {
+        uint16_t status =3D nvme_nsid_err(n, nsid);
+
+        if (!nvme_is_error(status, NVME_INVALID_FIELD)) {
+            return status;
+        }
=20
-    ns =3D &n->namespaces[nsid - 1];
+        id_ns =3D &inactive;
+    } else {
+        id_ns =3D &ns->id_ns;
+    }
=20
-    return nvme_dma_read(n, (uint8_t *) &ns->id_ns, sizeof(ns->id_ns), c=
md,
-        req);
+    return nvme_dma_read(n, (uint8_t *) id_ns, sizeof(NvmeIdNs), cmd, re=
q);
 }
=20
 static uint16_t nvme_identify_ns_list(NvmeCtrl *n, NvmeCmd *cmd,
@@ -1535,11 +1552,11 @@ static uint16_t nvme_identify_ns_list(NvmeCtrl *n=
, NvmeCmd *cmd,
     trace_nvme_identify_ns_list(min_nsid);
=20
     list =3D g_malloc0(data_len);
-    for (i =3D 0; i < n->num_namespaces; i++) {
-        if (i < min_nsid) {
+    for (i =3D 1; i <=3D n->num_namespaces; i++) {
+        if (i <=3D min_nsid || !nvme_ns(n, i)) {
             continue;
         }
-        list[j++] =3D cpu_to_le32(i + 1);
+        list[j++] =3D cpu_to_le32(i);
         if (j =3D=3D data_len / sizeof(uint32_t)) {
             break;
         }
@@ -1568,9 +1585,8 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtr=
l *n, NvmeCmd *cmd,
=20
     trace_nvme_identify_ns_descr_list(nsid);
=20
-    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
-        trace_nvme_err_invalid_ns(nsid, n->num_namespaces);
-        return NVME_INVALID_NSID | NVME_DNR;
+    if (unlikely(!nvme_ns(n, nsid))) {
+        return nvme_nsid_err(n, nsid);
     }
=20
     list =3D g_malloc0(len);
@@ -1685,7 +1701,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeC=
md *cmd, NvmeRequest *req)
         result =3D cpu_to_le32(n->features.err_rec);
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        result =3D blk_enable_write_cache(n->conf.blk);
+        result =3D cpu_to_le32(n->features.volatile_wc);
         trace_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         break;
     case NVME_NUMBER_OF_QUEUES:
@@ -1739,6 +1755,8 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl=
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
@@ -1756,8 +1774,19 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, Nvme=
Cmd *cmd, NvmeRequest *req)
         break;
=20
     case NVME_VOLATILE_WRITE_CACHE:
-        blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
+        n->features.volatile_wc =3D dw11;
+
+        for (int i =3D 1; i <=3D n->num_namespaces; i++) {
+            ns =3D nvme_ns(n, i);
+            if (!ns) {
+                continue;
+            }
+
+            blk_set_enable_write_cache(ns->blk, dw11 & 1);
+        }
+
         break;
+
     case NVME_NUMBER_OF_QUEUES:
         if (n->qs_created > 2) {
             return NVME_CMD_SEQ_ERROR | NVME_DNR;
@@ -1931,9 +1960,17 @@ static void nvme_process_sq(void *opaque)
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
     for (i =3D 0; i < n->params.num_queues; i++) {
         if (n->sq[i] !=3D NULL) {
@@ -1960,7 +1997,15 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
=20
     n->outstanding_aers =3D 0;
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
@@ -2381,8 +2426,8 @@ static int nvme_check_constraints(NvmeCtrl *n, Erro=
r **errp)
 {
     NvmeParams *params =3D &n->params;
=20
-    if (!n->conf.blk) {
-        error_setg(errp, "nvme: block backend not configured");
+    if (!n->namespace.blk && !n->parent_obj.qdev.id) {
+        error_setg(errp, "nvme: invalid 'id' parameter");
         return 1;
     }
=20
@@ -2399,22 +2444,10 @@ static int nvme_check_constraints(NvmeCtrl *n, Er=
ror **errp)
     return 0;
 }
=20
-static int nvme_init_blk(NvmeCtrl *n, Error **errp)
-{
-    blkconf_blocksizes(&n->conf);
-    if (!blkconf_apply_backend_options(&n->conf, blk_is_read_only(n->con=
f.blk),
-        false, errp)) {
-        return 1;
-    }
-
-    return 0;
-}
-
 static void nvme_init_state(NvmeCtrl *n)
 {
-    n->num_namespaces =3D 1;
+    n->num_namespaces =3D 0;
     n->reg_size =3D pow2ceil(0x1004 + 2 * (n->params.num_queues + 1) * 4=
);
-    n->namespaces =3D g_new0(NvmeNamespace, n->num_namespaces);
     n->sq =3D g_new0(NvmeSQueue *, n->params.num_queues);
     n->cq =3D g_new0(NvmeCQueue *, n->params.num_queues);
     n->elpes =3D g_new0(NvmeErrorLog, n->params.elpe + 1);
@@ -2506,12 +2539,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     id->cqes =3D (0x4 << 4) | 0x4;
     id->nn =3D cpu_to_le32(n->num_namespaces);
     id->oncs =3D cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP=
);
-
-
-    if (blk_enable_write_cache(n->conf.blk)) {
-        id->vwc =3D 1;
-    }
-
+    id->vwc =3D 1;
     id->sgls =3D cpu_to_le32(0x1);
=20
     strcpy((char *) id->subnqn, "nqn.2019-08.org.qemu:");
@@ -2532,22 +2560,25 @@ static void nvme_init_ctrl(NvmeCtrl *n)
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
+
+    if (nsid =3D=3D 0 || nsid > NVME_MAX_NAMESPACES) {
+        error_setg(errp, "invalid nsid");
+        return 1;
+    }
=20
-    bs_size =3D blk_getlength(n->conf.blk);
-    if (bs_size < 0) {
-        error_setg_errno(errp, -bs_size, "blk_getlength");
+    if (n->namespaces[nsid - 1]) {
+        error_setg(errp, "nsid must be unique");
         return 1;
     }
=20
-    id_ns->lbaf[0].ds =3D BDRV_SECTOR_BITS;
-    n->ns_size =3D bs_size;
+    trace_nvme_register_namespace(nsid);
=20
-    id_ns->ncap =3D id_ns->nuse =3D id_ns->nsze =3D
-        cpu_to_le64(nvme_ns_nlbas(n, ns));
+    n->namespaces[nsid - 1] =3D ns;
+    n->num_namespaces =3D MAX(n->num_namespaces, nsid);
+    n->id_ctrl.nn =3D cpu_to_le32(n->num_namespaces);
=20
     return 0;
 }
@@ -2555,30 +2586,31 @@ static int nvme_init_namespace(NvmeCtrl *n, NvmeN=
amespace *ns, Error **errp)
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n =3D NVME(pci_dev);
+    NvmeNamespace *ns;
     Error *local_err =3D NULL;
-    int i;
=20
     if (nvme_check_constraints(n, &local_err)) {
         error_propagate_prepend(errp, local_err, "nvme_check_constraints=
: ");
         return;
     }
=20
+    qbus_create_inplace(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
+        &pci_dev->qdev, n->parent_obj.qdev.id);
+
     nvme_init_state(n);
+    nvme_init_pci(n, pci_dev);
+    nvme_init_ctrl(n);
=20
-    if (nvme_init_blk(n, &local_err)) {
-        error_propagate_prepend(errp, local_err, "nvme_init_blk: ");
-        return;
-    }
+    /* setup a namespace if the controller drive property was given */
+    if (n->namespace.blk) {
+        ns =3D &n->namespace;
+        ns->params.nsid =3D 1;
=20
-    for (i =3D 0; i < n->num_namespaces; i++) {
-        if (nvme_init_namespace(n, &n->namespaces[i], &local_err)) {
-            error_propagate_prepend(errp, local_err, "nvme_init_namespac=
e: ");
+        if (nvme_ns_setup(n, ns, &local_err)) {
+            error_propagate_prepend(errp, local_err, "nvme_ns_setup: ");
             return;
         }
     }
-
-    nvme_init_pci(n, pci_dev);
-    nvme_init_ctrl(n);
 }
=20
 static void nvme_exit(PCIDevice *pci_dev)
@@ -2600,7 +2632,8 @@ static void nvme_exit(PCIDevice *pci_dev)
 }
=20
 static Property nvme_props[] =3D {
-    DEFINE_BLOCK_PROPERTIES(NvmeCtrl, conf),
+    DEFINE_BLOCK_PROPERTIES_BASE(NvmeCtrl, conf), \
+    DEFINE_PROP_DRIVE("drive", NvmeCtrl, namespace.blk), \
     DEFINE_NVME_PROPERTIES(NvmeCtrl, params),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -2632,26 +2665,35 @@ static void nvme_instance_init(Object *obj)
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
index 2f6706899de1..175a988bd85f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -2,6 +2,10 @@
 #define HW_NVME_H
=20
 #include "block/nvme.h"
+#include "nvme-ns.h"
+#include "trace.h"
+
+#define NVME_MAX_NAMESPACES 256
=20
 #define DEFINE_NVME_PROPERTIES(_state, _props) \
     DEFINE_PROP_STRING("serial", _state, _props.serial), \
@@ -72,7 +76,6 @@ static inline const char *nvme_aio_opc_str(NvmeAIO *aio=
)
 #define NVME_REQ_TRANSFER_MASK 0x3
=20
 typedef struct NvmeSQueue    NvmeSQueue;
-typedef struct NvmeNamespace NvmeNamespace;
 typedef void NvmeRequestCompletionFunc(NvmeRequest *req, void *opaque);
=20
 struct NvmeRequest {
@@ -122,7 +125,7 @@ static inline bool nvme_req_is_cmb(NvmeRequest *req)
     return (req->flags & NVME_REQ_TRANSFER_MASK) =3D=3D NVME_REQ_TRANSFE=
R_CMB;
 }
=20
-static void nvme_req_set_cmb(NvmeRequest *req)
+static inline void nvme_req_set_cmb(NvmeRequest *req)
 {
     req->flags =3D NVME_REQ_TRANSFER_CMB;
 }
@@ -173,9 +176,12 @@ struct NvmeCQueue {
     QTAILQ_HEAD(, NvmeRequest) req_list;
 };
=20
-struct NvmeNamespace {
-    NvmeIdNs        id_ns;
-};
+#define TYPE_NVME_BUS "nvme-bus"
+#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
+
+typedef struct NvmeBus {
+    BusState parent_bus;
+} NvmeBus;
=20
 #define TYPE_NVME "nvme"
 #define NVME(obj) \
@@ -186,8 +192,9 @@ typedef struct NvmeCtrl {
     MemoryRegion iomem;
     MemoryRegion ctrl_mem;
     NvmeBar      bar;
-    BlockConf    conf;
     NvmeParams   params;
+    NvmeBus      bus;
+    BlockConf    conf;
=20
     uint32_t    page_size;
     uint16_t    page_bits;
@@ -197,7 +204,6 @@ typedef struct NvmeCtrl {
     uint32_t    reg_size;
     uint32_t    num_namespaces;
     uint32_t    max_q_ents;
-    uint64_t    ns_size;
     uint8_t     outstanding_aers;
     uint32_t    cmbsz;
     uint32_t    cmbloc;
@@ -217,7 +223,8 @@ typedef struct NvmeCtrl {
     NvmeRequest **aer_reqs;
     QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
=20
-    NvmeNamespace   *namespaces;
+    NvmeNamespace   namespace;
+    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
     NvmeSQueue      admin_sq;
@@ -227,36 +234,37 @@ typedef struct NvmeCtrl {
     NvmeIdCtrl      id_ctrl;
 } NvmeCtrl;
=20
-static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
+static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 {
-    return req->sq->ctrl;
-}
+    if (!nsid || nsid > n->num_namespaces) {
+        return NULL;
+    }
=20
-static inline bool nvme_is_error(uint16_t status, uint16_t err)
-{
-    /* strip DNR and MORE */
-    return (status & 0xfff) =3D=3D err;
+    return n->namespaces[nsid - 1];
 }
=20
-static inline NvmeLBAF nvme_ns_lbaf(NvmeNamespace *ns)
+static inline uint16_t nvme_nsid_err(NvmeCtrl *n, uint32_t nsid)
 {
-    NvmeIdNs *id_ns =3D &ns->id_ns;
-    return id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-}
+    if (nsid && nsid < n->num_namespaces) {
+        trace_nvme_err_inactive_ns(nsid, n->num_namespaces);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
=20
-static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
-{
-    return nvme_ns_lbaf(ns).ds;
+    trace_nvme_err_invalid_ns(nsid, n->num_namespaces);
+    return NVME_INVALID_NSID | NVME_DNR;
 }
=20
-static inline size_t nvme_ns_lbads_bytes(NvmeNamespace *ns)
+static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
 {
-    return 1 << nvme_ns_lbads(ns);
+    return req->sq->ctrl;
 }
=20
-static inline uint64_t nvme_ns_nlbas(NvmeCtrl *n, NvmeNamespace *ns)
+static inline bool nvme_is_error(uint16_t status, uint16_t err)
 {
-    return n->ns_size >> nvme_ns_lbads(ns);
+    /* strip DNR and MORE */
+    return (status & 0xfff) =3D=3D err;
 }
=20
+int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp=
);
+
 #endif /* HW_NVME_H */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 59d42a3b8c39..5df48cca55e4 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -29,6 +29,7 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t he=
ads, uint32_t secs, int t
=20
 # nvme.c
 # nvme traces for successful events
+nvme_register_namespace(uint32_t nsid) "nsid %"PRIu32""
 nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 nvme_irq_pin(void) "pulsing IRQ pin"
 nvme_irq_masked(void) "IRQ is masked"
@@ -38,7 +39,7 @@ nvme_map_sgl(uint16_t cid, uint8_t typ, uint32_t nlb, u=
int64_t len) "cid %"PRIu1
 nvme_req_register_aio(uint16_t cid, void *aio, const char *blkname, uint=
64_t offset, uint64_t count, const char *opc, void *req) "cid %"PRIu16" a=
io %p blk \"%s\" offset %"PRIu64" count %"PRIu64" opc \"%s\" req %p"
 nvme_aio_cb(uint16_t cid, void *aio, const char *blkname, uint64_t offse=
t, const char *opc, void *req) "cid %"PRIu16" aio %p blk \"%s\" offset %"=
PRIu64" opc \"%s\" req %p"
 nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode) =
"cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8""
-nvme_rw(const char *verb, uint32_t blk_count, uint64_t byte_count, uint6=
4_t lba) "%s %"PRIu32" blocks (%"PRIu64" bytes) from LBA %"PRIu64""
+nvme_rw(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uin=
t64_t count, uint64_t lba) "cid %"PRIu16" %s nsid %"PRIu32" nlb %"PRIu32"=
 count %"PRIu64" lba 0x%"PRIx64""
 nvme_rw_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
 nvme_write_zeros(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nl=
b) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsi=
ze, uint16_t qflags) "create submission queue, addr=3D0x%"PRIx64", sqid=3D=
%"PRIu16", cqid=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D%"PRIu16""
@@ -90,7 +91,8 @@ nvme_err_invalid_prplist_ent(uint64_t prplist) "PRP lis=
t entry is null or not pa
 nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x=
%"PRIx64""
 nvme_err_invalid_prp2_missing(void) "PRP2 is null and more data to be tr=
ansferred"
 nvme_err_invalid_prp(void) "invalid PRP"
-nvme_err_invalid_ns(uint32_t ns, uint32_t limit) "invalid namespace %u n=
ot within 1-%u"
+nvme_err_invalid_ns(uint32_t nsid, uint32_t nn) "nsid %"PRIu32" nn %"PRI=
u32""
+nvme_err_inactive_ns(uint32_t nsid, uint32_t nn) "nsid %"PRIu32" nn %"PR=
Iu32""
 nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8"=
"
 nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit)=
 "Invalid LBA start=3D%"PRIu64" len=3D%"PRIu64" limit=3D%"PRIu64""
--=20
2.24.0


