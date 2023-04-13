Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99516E15FC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:38:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3by-0003hw-Vg; Thu, 13 Apr 2023 16:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bs-0003ex-0R; Thu, 13 Apr 2023 16:32:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bn-0003iH-EO; Thu, 13 Apr 2023 16:31:59 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EE3884012F;
 Thu, 13 Apr 2023 23:31:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 7CB4595;
 Thu, 13 Apr 2023 23:31:51 +0300 (MSK)
Received: (nullmailer pid 2344334 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Raven <wxhusst@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 04/21] hw/pvrdma: Protect against buggy or malicious guest
 driver
Date: Thu, 13 Apr 2023 23:31:16 +0300
Message-Id: <20230413203143.2344250-4-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
(cherry picked from commit 31c4b6fb0293e359f9ef8a61892667e76eea4c99)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index da7ddfa548..89db963c46 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
 
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
2.30.2


