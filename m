Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A322518705C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:47:47 +0100 (CET)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDsu2-0005DB-M2
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52887)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDqkV-0008Pu-3Q
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:29:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDqkR-0007lX-Ow
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:29:47 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDqkM-0006yQ-F8; Mon, 16 Mar 2020 10:29:38 -0400
Received: from apples.local (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id 3BCCDBF820;
 Mon, 16 Mar 2020 14:29:37 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 04/42] nvme: bump spec data structures to v1.3
Date: Mon, 16 Mar 2020 07:28:50 -0700
Message-Id: <20200316142928.153431-5-its@irrelevant.dk>
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

Add missing fields in the Identify Controller and Identify Namespace
data structures to bring them in line with NVMe v1.3.

This also adds data structures and defines for SGL support which
requires a couple of trivial changes to the nvme block driver as well.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Fam Zheng <fam@euphon.net>
---
 block/nvme.c         |  18 ++---
 hw/block/nvme.c      |  12 ++--
 include/block/nvme.h | 153 ++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 151 insertions(+), 32 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index d41c4bda6e39..99b9bb3dac96 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -446,7 +446,7 @@ static void nvme_identify(BlockDriverState *bs, int n=
amespace, Error **errp)
         error_setg(errp, "Cannot map buffer for DMA");
         goto out;
     }
-    cmd.prp1 =3D cpu_to_le64(iova);
+    cmd.dptr.prp1 =3D cpu_to_le64(iova);
=20
     if (nvme_cmd_sync(bs, s->queues[0], &cmd)) {
         error_setg(errp, "Failed to identify controller");
@@ -545,7 +545,7 @@ static bool nvme_add_io_queue(BlockDriverState *bs, E=
rror **errp)
     }
     cmd =3D (NvmeCmd) {
         .opcode =3D NVME_ADM_CMD_CREATE_CQ,
-        .prp1 =3D cpu_to_le64(q->cq.iova),
+        .dptr.prp1 =3D cpu_to_le64(q->cq.iova),
         .cdw10 =3D cpu_to_le32(((queue_size - 1) << 16) | (n & 0xFFFF)),
         .cdw11 =3D cpu_to_le32(0x3),
     };
@@ -556,7 +556,7 @@ static bool nvme_add_io_queue(BlockDriverState *bs, E=
rror **errp)
     }
     cmd =3D (NvmeCmd) {
         .opcode =3D NVME_ADM_CMD_CREATE_SQ,
-        .prp1 =3D cpu_to_le64(q->sq.iova),
+        .dptr.prp1 =3D cpu_to_le64(q->sq.iova),
         .cdw10 =3D cpu_to_le32(((queue_size - 1) << 16) | (n & 0xFFFF)),
         .cdw11 =3D cpu_to_le32(0x1 | (n << 16)),
     };
@@ -906,16 +906,16 @@ try_map:
     case 0:
         abort();
     case 1:
-        cmd->prp1 =3D pagelist[0];
-        cmd->prp2 =3D 0;
+        cmd->dptr.prp1 =3D pagelist[0];
+        cmd->dptr.prp2 =3D 0;
         break;
     case 2:
-        cmd->prp1 =3D pagelist[0];
-        cmd->prp2 =3D pagelist[1];
+        cmd->dptr.prp1 =3D pagelist[0];
+        cmd->dptr.prp2 =3D pagelist[1];
         break;
     default:
-        cmd->prp1 =3D pagelist[0];
-        cmd->prp2 =3D cpu_to_le64(req->prp_list_iova + sizeof(uint64_t))=
;
+        cmd->dptr.prp1 =3D pagelist[0];
+        cmd->dptr.prp2 =3D cpu_to_le64(req->prp_list_iova + sizeof(uint6=
4_t));
         break;
     }
     trace_nvme_cmd_map_qiov(s, cmd, req, qiov, entries);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b532818b4b76..40cb176dea3c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -372,8 +372,8 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *n=
s, NvmeCmd *cmd,
     NvmeRwCmd *rw =3D (NvmeRwCmd *)cmd;
     uint32_t nlb  =3D le32_to_cpu(rw->nlb) + 1;
     uint64_t slba =3D le64_to_cpu(rw->slba);
-    uint64_t prp1 =3D le64_to_cpu(rw->prp1);
-    uint64_t prp2 =3D le64_to_cpu(rw->prp2);
+    uint64_t prp1 =3D le64_to_cpu(rw->dptr.prp1);
+    uint64_t prp2 =3D le64_to_cpu(rw->dptr.prp2);
=20
     uint8_t lba_index  =3D NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     uint8_t data_shift =3D ns->id_ns.lbaf[lba_index].ds;
@@ -763,8 +763,8 @@ static inline uint64_t nvme_get_timestamp(const NvmeC=
trl *n)
=20
 static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd)
 {
-    uint64_t prp1 =3D le64_to_cpu(cmd->prp1);
-    uint64_t prp2 =3D le64_to_cpu(cmd->prp2);
+    uint64_t prp1 =3D le64_to_cpu(cmd->dptr.prp1);
+    uint64_t prp2 =3D le64_to_cpu(cmd->dptr.prp2);
=20
     uint64_t timestamp =3D nvme_get_timestamp(n);
=20
@@ -802,8 +802,8 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *=
n, NvmeCmd *cmd)
 {
     uint16_t ret;
     uint64_t timestamp;
-    uint64_t prp1 =3D le64_to_cpu(cmd->prp1);
-    uint64_t prp2 =3D le64_to_cpu(cmd->prp2);
+    uint64_t prp1 =3D le64_to_cpu(cmd->dptr.prp1);
+    uint64_t prp2 =3D le64_to_cpu(cmd->dptr.prp2);
=20
     ret =3D nvme_dma_write_prp(n, (uint8_t *)&timestamp,
                                 sizeof(timestamp), prp1, prp2);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8fb941c6537c..a083c1b3a613 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -205,15 +205,53 @@ enum NvmeCmbszMask {
 #define NVME_CMBSZ_GETSIZE(cmbsz) \
     (NVME_CMBSZ_SZ(cmbsz) * (1 << (12 + 4 * NVME_CMBSZ_SZU(cmbsz))))
=20
+enum NvmeSglDescriptorType {
+    NVME_SGL_DESCR_TYPE_DATA_BLOCK          =3D 0x0,
+    NVME_SGL_DESCR_TYPE_BIT_BUCKET          =3D 0x1,
+    NVME_SGL_DESCR_TYPE_SEGMENT             =3D 0x2,
+    NVME_SGL_DESCR_TYPE_LAST_SEGMENT        =3D 0x3,
+    NVME_SGL_DESCR_TYPE_KEYED_DATA_BLOCK    =3D 0x4,
+
+    NVME_SGL_DESCR_TYPE_VENDOR_SPECIFIC     =3D 0xf,
+};
+
+enum NvmeSglDescriptorSubtype {
+    NVME_SGL_DESCR_SUBTYPE_ADDRESS =3D 0x0,
+};
+
+typedef struct NvmeSglDescriptor {
+    uint64_t addr;
+    uint32_t len;
+    uint8_t  rsvd[3];
+    uint8_t  type;
+} NvmeSglDescriptor;
+
+#define NVME_SGL_TYPE(type)     ((type >> 4) & 0xf)
+#define NVME_SGL_SUBTYPE(type)  (type & 0xf)
+
+typedef union NvmeCmdDptr {
+    struct {
+        uint64_t    prp1;
+        uint64_t    prp2;
+    };
+
+    NvmeSglDescriptor sgl;
+} NvmeCmdDptr;
+
+enum NvmePsdt {
+    PSDT_PRP                 =3D 0x0,
+    PSDT_SGL_MPTR_CONTIGUOUS =3D 0x1,
+    PSDT_SGL_MPTR_SGL        =3D 0x2,
+};
+
 typedef struct NvmeCmd {
     uint8_t     opcode;
-    uint8_t     fuse;
+    uint8_t     flags;
     uint16_t    cid;
     uint32_t    nsid;
     uint64_t    res1;
     uint64_t    mptr;
-    uint64_t    prp1;
-    uint64_t    prp2;
+    NvmeCmdDptr dptr;
     uint32_t    cdw10;
     uint32_t    cdw11;
     uint32_t    cdw12;
@@ -222,6 +260,9 @@ typedef struct NvmeCmd {
     uint32_t    cdw15;
 } NvmeCmd;
=20
+#define NVME_CMD_FLAGS_FUSE(flags) (flags & 0x3)
+#define NVME_CMD_FLAGS_PSDT(flags) ((flags >> 6) & 0x3)
+
 enum NvmeAdminCommands {
     NVME_ADM_CMD_DELETE_SQ      =3D 0x00,
     NVME_ADM_CMD_CREATE_SQ      =3D 0x01,
@@ -321,8 +362,7 @@ typedef struct NvmeRwCmd {
     uint32_t    nsid;
     uint64_t    rsvd2;
     uint64_t    mptr;
-    uint64_t    prp1;
-    uint64_t    prp2;
+    NvmeCmdDptr dptr;
     uint64_t    slba;
     uint16_t    nlb;
     uint16_t    control;
@@ -362,8 +402,7 @@ typedef struct NvmeDsmCmd {
     uint16_t    cid;
     uint32_t    nsid;
     uint64_t    rsvd2[2];
-    uint64_t    prp1;
-    uint64_t    prp2;
+    NvmeCmdDptr dptr;
     uint32_t    nr;
     uint32_t    attributes;
     uint32_t    rsvd12[4];
@@ -427,6 +466,12 @@ enum NvmeStatusCodes {
     NVME_CMD_ABORT_MISSING_FUSE =3D 0x000a,
     NVME_INVALID_NSID           =3D 0x000b,
     NVME_CMD_SEQ_ERROR          =3D 0x000c,
+    NVME_INVALID_SGL_SEG_DESCR  =3D 0x000d,
+    NVME_INVALID_NUM_SGL_DESCRS =3D 0x000e,
+    NVME_DATA_SGL_LEN_INVALID   =3D 0x000f,
+    NVME_MD_SGL_LEN_INVALID     =3D 0x0010,
+    NVME_SGL_DESCR_TYPE_INVALID =3D 0x0011,
+    NVME_INVALID_USE_OF_CMB     =3D 0x0012,
     NVME_LBA_RANGE              =3D 0x0080,
     NVME_CAP_EXCEEDED           =3D 0x0081,
     NVME_NS_NOT_READY           =3D 0x0082,
@@ -515,7 +560,7 @@ enum NvmeSmartWarn {
     NVME_SMART_FAILED_VOLATILE_MEDIA  =3D 1 << 4,
 };
=20
-enum LogIdentifier {
+enum NvmeLogIdentifier {
     NVME_LOG_ERROR_INFO     =3D 0x01,
     NVME_LOG_SMART_INFO     =3D 0x02,
     NVME_LOG_FW_SLOT_INFO   =3D 0x03,
@@ -533,6 +578,15 @@ typedef struct NvmePSD {
     uint8_t     resv[16];
 } NvmePSD;
=20
+#define NVME_IDENTIFY_DATA_SIZE 4096
+
+enum {
+    NVME_ID_CNS_NS             =3D 0x0,
+    NVME_ID_CNS_CTRL           =3D 0x1,
+    NVME_ID_CNS_NS_ACTIVE_LIST =3D 0x2,
+    NVME_ID_CNS_NS_DESCR_LIST  =3D 0x3,
+};
+
 typedef struct NvmeIdCtrl {
     uint16_t    vid;
     uint16_t    ssvid;
@@ -543,7 +597,15 @@ typedef struct NvmeIdCtrl {
     uint8_t     ieee[3];
     uint8_t     cmic;
     uint8_t     mdts;
-    uint8_t     rsvd255[178];
+    uint16_t    cntlid;
+    uint32_t    ver;
+    uint32_t    rtd3r;
+    uint32_t    rtd3e;
+    uint32_t    oaes;
+    uint32_t    ctratt;
+    uint8_t     rsvd100[12];
+    uint8_t     fguid[16];
+    uint8_t     rsvd128[128];
     uint16_t    oacs;
     uint8_t     acl;
     uint8_t     aerl;
@@ -551,10 +613,28 @@ typedef struct NvmeIdCtrl {
     uint8_t     lpa;
     uint8_t     elpe;
     uint8_t     npss;
-    uint8_t     rsvd511[248];
+    uint8_t     avscc;
+    uint8_t     apsta;
+    uint16_t    wctemp;
+    uint16_t    cctemp;
+    uint16_t    mtfa;
+    uint32_t    hmpre;
+    uint32_t    hmmin;
+    uint8_t     tnvmcap[16];
+    uint8_t     unvmcap[16];
+    uint32_t    rpmbs;
+    uint16_t    edstt;
+    uint8_t     dsto;
+    uint8_t     fwug;
+    uint16_t    kas;
+    uint16_t    hctma;
+    uint16_t    mntmt;
+    uint16_t    mxtmt;
+    uint32_t    sanicap;
+    uint8_t     rsvd332[180];
     uint8_t     sqes;
     uint8_t     cqes;
-    uint16_t    rsvd515;
+    uint16_t    maxcmd;
     uint32_t    nn;
     uint16_t    oncs;
     uint16_t    fuses;
@@ -562,8 +642,14 @@ typedef struct NvmeIdCtrl {
     uint8_t     vwc;
     uint16_t    awun;
     uint16_t    awupf;
-    uint8_t     rsvd703[174];
-    uint8_t     rsvd2047[1344];
+    uint8_t     nvscc;
+    uint8_t     rsvd531;
+    uint16_t    acwu;
+    uint8_t     rsvd534[2];
+    uint32_t    sgls;
+    uint8_t     rsvd540[228];
+    uint8_t     subnqn[256];
+    uint8_t     rsvd1024[1024];
     NvmePSD     psd[32];
     uint8_t     vs[1024];
 } NvmeIdCtrl;
@@ -589,6 +675,16 @@ enum NvmeIdCtrlOncs {
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
 #define NVME_CTRL_CQES_MAX(cqes) (((cqes) >> 4) & 0xf)
=20
+#define NVME_CTRL_SGLS_SUPPORTED_MASK            (0x3 <<  0)
+#define NVME_CTRL_SGLS_SUPPORTED_NO_ALIGNMENT    (0x1 <<  0)
+#define NVME_CTRL_SGLS_SUPPORTED_DWORD_ALIGNMENT (0x1 <<  1)
+#define NVME_CTRL_SGLS_KEYED                     (0x1 <<  2)
+#define NVME_CTRL_SGLS_BITBUCKET                 (0x1 << 16)
+#define NVME_CTRL_SGLS_MPTR_CONTIGUOUS           (0x1 << 17)
+#define NVME_CTRL_SGLS_EXCESS_LENGTH             (0x1 << 18)
+#define NVME_CTRL_SGLS_MPTR_SGL                  (0x1 << 19)
+#define NVME_CTRL_SGLS_ADDR_OFFSET               (0x1 << 20)
+
 typedef struct NvmeFeatureVal {
     uint32_t    arbitration;
     uint32_t    power_mgmt;
@@ -611,6 +707,10 @@ typedef struct NvmeFeatureVal {
 #define NVME_INTC_THR(intc)     (intc & 0xff)
 #define NVME_INTC_TIME(intc)    ((intc >> 8) & 0xff)
=20
+#define NVME_TEMP_THSEL(temp)  ((temp >> 20) & 0x3)
+#define NVME_TEMP_TMPSEL(temp) ((temp >> 16) & 0xf)
+#define NVME_TEMP_TMPTH(temp)  ((temp >>  0) & 0xffff)
+
 enum NvmeFeatureIds {
     NVME_ARBITRATION                =3D 0x1,
     NVME_POWER_MANAGEMENT           =3D 0x2,
@@ -653,18 +753,37 @@ typedef struct NvmeIdNs {
     uint8_t     mc;
     uint8_t     dpc;
     uint8_t     dps;
-
     uint8_t     nmic;
     uint8_t     rescap;
     uint8_t     fpi;
     uint8_t     dlfeat;
-
-    uint8_t     res34[94];
+    uint16_t    nawun;
+    uint16_t    nawupf;
+    uint16_t    nacwu;
+    uint16_t    nabsn;
+    uint16_t    nabo;
+    uint16_t    nabspf;
+    uint16_t    noiob;
+    uint8_t     nvmcap[16];
+    uint8_t     rsvd64[40];
+    uint8_t     nguid[16];
+    uint64_t    eui64;
     NvmeLBAF    lbaf[16];
-    uint8_t     res192[192];
+    uint8_t     rsvd192[192];
     uint8_t     vs[3712];
 } NvmeIdNs;
=20
+typedef struct NvmeIdNsDescr {
+    uint8_t nidt;
+    uint8_t nidl;
+    uint8_t rsvd2[2];
+} NvmeIdNsDescr;
+
+#define NVME_NIDT_UUID_LEN 16
+
+enum {
+    NVME_NIDT_UUID =3D 0x3,
+};
=20
 /*Deallocate Logical Block Features*/
 #define NVME_ID_NS_DLFEAT_GUARD_CRC(dlfeat)       ((dlfeat) & 0x10)
--=20
2.25.1


