Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2120D0A0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 20:31:00 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpyYV-00054n-PZ
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 14:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUd-0008Gr-FM; Mon, 29 Jun 2020 14:26:59 -0400
Received: from charlie.dont.surf ([128.199.63.193]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUb-0000Zq-0P; Mon, 29 Jun 2020 14:26:59 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 480C2BF783;
 Mon, 29 Jun 2020 18:26:54 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 03/17] hw/block/nvme: add support for the abort command
Date: Mon, 29 Jun 2020 20:26:28 +0200
Message-Id: <20200629182642.1170387-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629182642.1170387-1-its@irrelevant.dk>
References: <20200629182642.1170387-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Required for compliance with NVMe revision 1.3d. See NVM Express 1.3d,
Section 5.1 ("Abort command").

The Abort command is a best effort command; for now, the device always
fails to abort the given command.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f5d9148f0936..b7037a7d3504 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -761,6 +761,18 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
     }
 }
 
+static uint16_t nvme_abort(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+{
+    uint16_t sqid = le32_to_cpu(cmd->cdw10) & 0xffff;
+
+    req->cqe.result = 1;
+    if (nvme_check_sqid(n, sqid)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
 {
     trace_pci_nvme_setfeat_timestamp(ts);
@@ -897,6 +909,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
         return nvme_create_cq(n, cmd);
     case NVME_ADM_CMD_IDENTIFY:
         return nvme_identify(n, cmd);
+    case NVME_ADM_CMD_ABORT:
+        return nvme_abort(n, cmd, req);
     case NVME_ADM_CMD_SET_FEATURES:
         return nvme_set_feature(n, cmd, req);
     case NVME_ADM_CMD_GET_FEATURES:
@@ -1582,6 +1596,19 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->ieee[1] = 0x02;
     id->ieee[2] = 0xb3;
     id->oacs = cpu_to_le16(0);
+
+    /*
+     * Because the controller always completes the Abort command immediately,
+     * there can never be more than one concurrently executing Abort command,
+     * so this value is never used for anything. Note that there can easily be
+     * many Abort commands in the queues, but they are not considered
+     * "executing" until processed by nvme_abort.
+     *
+     * The specification recommends a value of 3 for Abort Command Limit (four
+     * concurrently outstanding Abort commands), so lets use that though it is
+     * inconsequential.
+     */
+    id->acl = 3;
     id->frmw = 7 << 1;
     id->lpa = 1 << 0;
     id->sqes = (0x6 << 4) | 0x6;
-- 
2.27.0


