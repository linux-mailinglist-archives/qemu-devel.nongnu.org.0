Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE815187059
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:46:40 +0100 (CET)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDssx-0002qU-NB
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDqkv-0000D2-Fk
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDqku-0002yE-3G
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:30:13 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDqkp-0007uv-DZ; Mon, 16 Mar 2020 10:30:07 -0400
Received: from apples.local (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id A882ABF91F;
 Mon, 16 Mar 2020 14:29:44 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 18/42] nvme: support identify namespace descriptor list
Date: Mon, 16 Mar 2020 07:29:04 -0700
Message-Id: <20200316142928.153431-19-its@irrelevant.dk>
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

Since we are not providing the NGUID or EUI64 fields, we must support
the Namespace UUID. We do not have any way of storing a persistent
unique identifier, so conjure up a UUID that is just the namespace id.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 38 ++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  1 +
 2 files changed, 39 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 16de3ca1c5d5..007f8817f101 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -942,6 +942,42 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, Nv=
meIdentify *c)
     return ret;
 }
=20
+static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeIdentify *c=
)
+{
+    uint32_t nsid =3D le32_to_cpu(c->nsid);
+    uint64_t prp1 =3D le64_to_cpu(c->prp1);
+    uint64_t prp2 =3D le64_to_cpu(c->prp2);
+
+    void *list;
+    uint16_t ret;
+    NvmeIdNsDescr *ns_descr;
+
+    trace_nvme_dev_identify_ns_descr_list(nsid);
+
+    if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
+        trace_nvme_dev_err_invalid_ns(nsid, n->num_namespaces);
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
+    list =3D g_malloc0(NVME_IDENTIFY_DATA_SIZE);
+    ns_descr =3D list;
+
+    /*
+     * Because the NGUID and EUI64 fields are 0 in the Identify Namespac=
e data
+     * structure, a Namespace UUID (nidt =3D 0x3) must be reported in th=
e
+     * Namespace Identification Descriptor. Add a very basic Namespace U=
UID
+     * here.
+     */
+    ns_descr->nidt =3D NVME_NIDT_UUID;
+    ns_descr->nidl =3D NVME_NIDT_UUID_LEN;
+    stl_be_p(ns_descr + sizeof(*ns_descr), nsid);
+
+    ret =3D nvme_dma_read_prp(n, (uint8_t *) list, NVME_IDENTIFY_DATA_SI=
ZE, prp1,
+                            prp2);
+    g_free(list);
+    return ret;
+}
+
 static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
 {
     NvmeIdentify *c =3D (NvmeIdentify *)cmd;
@@ -953,6 +989,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *c=
md)
         return nvme_identify_ctrl(n, c);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
         return nvme_identify_nslist(n, c);
+    case NVME_ID_CNS_NS_DESCR_LIST:
+        return nvme_identify_ns_descr_list(n, c);
     default:
         trace_nvme_dev_err_invalid_identify_cns(le32_to_cpu(c->cns));
         return NVME_INVALID_FIELD | NVME_DNR;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 13e2c71664f6..4cde0844ef64 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -41,6 +41,7 @@ nvme_dev_del_cq(uint16_t cqid) "deleted completion queu=
e, sqid=3D%"PRIu16""
 nvme_dev_identify_ctrl(void) "identify controller"
 nvme_dev_identify_ns(uint32_t ns) "nsid %"PRIu32""
 nvme_dev_identify_nslist(uint32_t ns) "nsid %"PRIu32""
+nvme_dev_identify_ns_descr_list(uint32_t ns) "nsid %"PRIu32""
 nvme_dev_getfeat(uint16_t cid, uint32_t fid) "cid %"PRIu16" fid 0x%"PRIx=
32""
 nvme_dev_setfeat(uint16_t cid, uint32_t fid, uint32_t val) "cid %"PRIu16=
" fid 0x%"PRIx32" val 0x%"PRIx32""
 nvme_dev_getfeat_vwcache(const char* result) "get feature volatile write=
 cache, result=3D%s"
--=20
2.25.1


