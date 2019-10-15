Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1541D738D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 12:42:37 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKKHj-0000v8-SM
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 06:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iKKEZ-0007P3-PF
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 06:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iKKEY-0006Fy-FX
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 06:39:19 -0400
Received: from charlie.dont.surf ([128.199.63.193]:54798)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iKKEV-0006Bq-SC; Tue, 15 Oct 2019 06:39:15 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id D2248BF888;
 Tue, 15 Oct 2019 10:39:14 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 06/20] nvme: add support for the abort command
Date: Tue, 15 Oct 2019 12:38:46 +0200
Message-Id: <20191015103900.313928-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015103900.313928-1-its@irrelevant.dk>
References: <20191015103900.313928-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Javier Gonzalez <javier@javigon.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Required for compliance with NVMe revision 1.2.1. See NVM Express 1.2.1,
Section 5.1 ("Abort command").

The Abort command is a best effort command; for now, the device always
fails to abort the given command.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
---
 hw/block/nvme.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index daa2367b0863..84e4f2ea7a15 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -741,6 +741,18 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *=
cmd)
     }
 }
=20
+static uint16_t nvme_abort(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+{
+    uint16_t sqid =3D le32_to_cpu(cmd->cdw10) & 0xffff;
+
+    req->cqe.result =3D 1;
+    if (nvme_check_sqid(n, sqid)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
 {
     trace_nvme_setfeat_timestamp(ts);
@@ -859,6 +871,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd=
 *cmd, NvmeRequest *req)
         trace_nvme_err_invalid_setfeat(dw10);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
+
     return NVME_SUCCESS;
 }
=20
@@ -875,6 +888,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *=
cmd, NvmeRequest *req)
         return nvme_create_cq(n, cmd);
     case NVME_ADM_CMD_IDENTIFY:
         return nvme_identify(n, cmd);
+    case NVME_ADM_CMD_ABORT:
+        return nvme_abort(n, cmd, req);
     case NVME_ADM_CMD_SET_FEATURES:
         return nvme_set_feature(n, cmd, req);
     case NVME_ADM_CMD_GET_FEATURES:
@@ -1388,6 +1403,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     id->ieee[2] =3D 0xb3;
     id->ver =3D cpu_to_le32(0x00010201);
     id->oacs =3D cpu_to_le16(0);
+    id->acl =3D 3;
     id->frmw =3D 7 << 1;
     id->lpa =3D 1 << 0;
     id->sqes =3D (0x6 << 4) | 0x6;
--=20
2.23.0


