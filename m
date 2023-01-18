Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74095671592
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fb-0001w9-A0; Wed, 18 Jan 2023 02:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FY-0001tg-Mq; Wed, 18 Jan 2023 02:52:48 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FW-00023L-RF; Wed, 18 Jan 2023 02:52:48 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M42b8-1pI3FT2uLQ-00023T; Wed, 18
 Jan 2023 08:52:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Raven <wxhusst@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 12/15] hw/pvrdma: Protect against buggy or malicious guest
 driver
Date: Wed, 18 Jan 2023 08:52:31 +0100
Message-Id: <20230118075234.2322131-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6aHjtHLv6iSXuw3k9XqVyX+UA/RTpSksAfSYQncQCpPeVqLXWzy
 Dox1yjqKNQWqeqkTRrWO9j89y4MnR2sjbh+0k3XxqqzUmSbZEE7Bv/bbo2XD+nhtk+czHVW
 WL1GJq/55sNt9EuRL3LFFT1U2u+Oxp9Ryi0MPjF3hl7elZmykmSZYukXWkXVMSf3uirKSkL
 u/RzeP6O8Q87rTaA/JWRg==
UI-OutboundReport: notjunk:1;M01:P0:sviUA3l5rsk=;ul11+I4s4nAobkRdbAjs/rcDOR2
 MVc0dwl+sE1QkCTbgGoyyu+XgENObH7iXPeEbDz8pxUKNYvpnWX75p7zSIKhkszRhSVeuD6LG
 Mud39EhKbMC9biLAd5JHflGLIBm4hazoAtL2JJ0IMqtVmgC0GgLjf4A2mY+e+Bz5PeTx8EMo9
 edilMudVNLBap2+QJP2x6kyLK41N0WUuoJ2+ZtySWEM3DobNHkxTZmohPV4JYpwGKsUTd6ZPR
 SpkjZPG8ChyCnCa4Yn1zs/Z5RiGuSXIBiuXXOSJaxCZ/RJoHaH5mxiNmaqxuEewTXxf3rI5VW
 9MKMWKKd82xuy+7E8vsGkG4ftm8Lv20134UdIomcjTXMn9g10lMQ2lCJTpTAWcLkgO+haUXOi
 i5ims4UQq1PB6ilHHP0Bp3yOKluV+8UexUcBHXuMqBDdJtKTaRK5GvdvJ/OlWzRSTq1lZReoC
 SduCsFQz0XAhqWA0B5zPDfe/Hwh/2YqWK4t2J0caWcMozjd5sNr3edpt+nZw9t2BrGgXMRbsW
 MBYwugxIR26G5VytxHrDPeyGAybbJkOF6NktxMuj5Dl4+UykhoJr5sIQRVnvT/Ttx+zerLrC2
 wNVn5Q7ulQnog/U9crKWCRFpd7KxemqlKqTeOI1KGdGt8iWs7EoFnMAz0teN5I/fXmeR8xQMZ
 DPGnS0j5WBN/DBxl974KUK2+z/Dvqt0Lnh2hrXJs9Q==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yuval Shaia <yuval.shaia.ml@gmail.com>

Guest driver might execute HW commands when shared buffers are not yet
allocated.
This could happen on purpose (malicious guest) or because of some other
guest/host address mapping error.
We need to protect againts such case.

Fixes: CVE-2022-1050

Reported-by: Raven <wxhusst@gmail.com>
Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Message-Id: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index 1eca6328c924..c6ed02598211 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -776,6 +776,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
 
     dsr_info = &dev->dsr_info;
 
+    if (!dsr_info->dsr) {
+            /* Buggy or malicious guest driver */
+            rdma_error_report("Exec command without dsr, req or rsp buffers");
+            goto out;
+    }
+
     if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
                       sizeof(struct cmd_handler)) {
         rdma_error_report("Unsupported command");
-- 
2.38.1


