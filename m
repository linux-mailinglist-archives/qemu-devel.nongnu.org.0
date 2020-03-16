Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFAA1870BE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:59:52 +0100 (CET)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDt5j-0001kL-Fd
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDqlI-0000SW-Tt
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDqlF-0004vi-Eg
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:30:36 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDql9-000269-8S; Mon, 16 Mar 2020 10:30:27 -0400
Received: from apples.local (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id 43EE4BF9DF;
 Mon, 16 Mar 2020 14:29:50 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 29/42] nvme: refactor request bounds checking
Date: Mon, 16 Mar 2020 07:29:15 -0700
Message-Id: <20200316142928.153431-30-its@irrelevant.dk>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index eecfad694bf8..ba520c76bae5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -491,6 +491,20 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t e=
vent_type)
     }
 }
=20
+static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
+                                         uint64_t slba, uint32_t nlb,
+                                         NvmeRequest *req)
+{
+    uint64_t nsze =3D le64_to_cpu(ns->id_ns.nsze);
+
+    if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
+        trace_nvme_dev_err_invalid_lba_range(slba, nlb, nsze);
+        return NVME_LBA_RANGE | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req =3D opaque;
@@ -536,10 +550,11 @@ static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeN=
amespace *ns, NvmeCmd *cmd,
     uint32_t nlb  =3D le16_to_cpu(rw->nlb) + 1;
     uint64_t offset =3D slba << data_shift;
     uint32_t count =3D nlb << data_shift;
+    uint16_t status;
=20
-    if (unlikely(slba + nlb > ns->id_ns.nsze)) {
-        trace_nvme_dev_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
-        return NVME_LBA_RANGE | NVME_DNR;
+    status =3D nvme_check_bounds(n, ns, slba, nlb, req);
+    if (status) {
+        return status;
     }
=20
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
@@ -562,13 +577,14 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace =
*ns, NvmeCmd *cmd,
     uint64_t data_offset =3D slba << data_shift;
     int is_write =3D rw->opcode =3D=3D NVME_CMD_WRITE ? 1 : 0;
     enum BlockAcctType acct =3D is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT=
_READ;
+    uint16_t status;
=20
     trace_nvme_dev_rw(is_write ? "write" : "read", nlb, data_size, slba)=
;
=20
-    if (unlikely((slba + nlb) > ns->id_ns.nsze)) {
+    status =3D nvme_check_bounds(n, ns, slba, nlb, req);
+    if (status) {
         block_acct_invalid(blk_get_stats(n->conf.blk), acct);
-        trace_nvme_dev_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
-        return NVME_LBA_RANGE | NVME_DNR;
+        return status;
     }
=20
     if (nvme_map(n, cmd, &req->qsg, &req->iov, data_size, req)) {
--=20
2.25.1


