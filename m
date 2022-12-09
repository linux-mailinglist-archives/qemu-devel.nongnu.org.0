Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF096482B8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dEx-0007kL-00; Fri, 09 Dec 2022 08:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1p3dEk-0007eT-39
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:16:25 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1p3dEi-0003w9-0L
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:16:21 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id B0C6C43134;
 Fri,  9 Dec 2022 14:16:08 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com,
	quintela@redhat.com,
	chen.zhang@intel.com
Subject: [PATCH] migration/rdma: fix return value for qio_channel_rdma_{readv,
 writev}
Date: Fri,  9 Dec 2022 14:15:24 +0100
Message-Id: <20221209131524.219442-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

upon errors. As the documentation in include/io/channel.h states, only
-1 and QIO_CHANNEL_ERR_BLOCK should be returned upon error. Other
values have the potential to confuse the call sites.

error_setg is used rather than error_setg_errno, because there are
certain code paths where -1 (as a non-errno) is propagated up (e.g.
starting from qemu_rdma_block_for_wrid or qemu_rdma_post_recv_control)
all the way to qio_channel_rdma_{readv,writev}.

Similar to a216ec85b7 ("migration/channel-block: fix return value for
qio_channel_block_{readv,writev}").

Suggested-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

I did only compile-test the patch, because I have no experience with
RDMA.

@Zhang Chen: In [0], besides qio_channel_rdma_writev/readv, you
mentioned qio_channel_buffer_writev/readv and 'etc.', but I did only
find the issue in the RDMA-specific implementation.

[0]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg02636.html

 migration/rdma.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 94a55dd95b..0ba1668d70 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2785,7 +2785,8 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
     rdma = qatomic_rcu_read(&rioc->rdmaout);
 
     if (!rdma) {
-        return -EIO;
+        error_setg(errp, "RDMA control channel output is not set");
+        return -1;
     }
 
     CHECK_ERROR_STATE();
@@ -2797,7 +2798,8 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
     ret = qemu_rdma_write_flush(f, rdma);
     if (ret < 0) {
         rdma->error_state = ret;
-        return ret;
+        error_setg(errp, "qemu_rdma_write_flush returned %d", ret);
+        return -1;
     }
 
     for (i = 0; i < niov; i++) {
@@ -2816,7 +2818,8 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
 
             if (ret < 0) {
                 rdma->error_state = ret;
-                return ret;
+                error_setg(errp, "qemu_rdma_exchange_send returned %d", ret);
+                return -1;
             }
 
             data += len;
@@ -2867,7 +2870,8 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
     rdma = qatomic_rcu_read(&rioc->rdmain);
 
     if (!rdma) {
-        return -EIO;
+        error_setg(errp, "RDMA control channel input is not set");
+        return -1;
     }
 
     CHECK_ERROR_STATE();
@@ -2903,7 +2907,8 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
 
         if (ret < 0) {
             rdma->error_state = ret;
-            return ret;
+            error_setg(errp, "qemu_rdma_exchange_recv returned %d", ret);
+            return -1;
         }
 
         /*
-- 
2.30.2



