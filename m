Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B16C3B6F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiMv-0002Zq-1V; Tue, 21 Mar 2023 16:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peiMr-0002YO-LO; Tue, 21 Mar 2023 16:14:02 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peiMp-0000t0-Aq; Tue, 21 Mar 2023 16:14:01 -0400
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:5708:0:640:5704:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id AAC845EA80;
 Tue, 21 Mar 2023 23:13:47 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:1224::1:29])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id fDwl040OnOs0-BxPhDACI; Tue, 21 Mar 2023 23:13:46 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679429626; bh=350kmENVs4y4oRc6fDqn78MOAWx6tQ9idjyBULPH48w=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=IXL9j6Yy+wfaAE9ClMHm2wppqRl7ag64Pzv6SPlKoIi1JoqVIXiKnNsD2Vl41imTs
 rqqffxDu1JO10leTQlqwj5cxpE9a0J9SEGYksnYKlDkFHnbpj+fRoZgCf+8xsk2KGa
 lUAWvPMImxJIusFZ2fCE0CkECBGs//UMFX4ea0Hg=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 Coiby.Xu@gmail.com, yc-core@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH] vhost-user-blk-server: notify client about disk resize
Date: Tue, 21 Mar 2023 23:13:23 +0300
Message-Id: <20230321201323.3695923-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Currently block_resize qmp command is simply ignored by vhost-user-blk
export. So, the block-node is successfully resized, but virtio config
is unchanged and guest doesn't see that disk is resized.

Let's handle the resize by modifying the config and notifying the guest
appropriately.

After this comment, lsblk in linux guest with attached
vhost-user-blk-pci device shows new size immediately after block_resize
QMP command on vhost-user exported block node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

Hi all! Seems, we have everything except this tiny patch to support live
disk resize for vhost-user export.

How I test:

./build/storage-daemon/qemu-storage-daemon --blockdev file,filename=a,node-name=f1 --export vhost-user-blk,node-name=f1,addr.type=unix,addr.path=/tmp/sock,writable=on,id=gg --chardev socket,path=qmp.sock,server=on,wait=off,id=char1 --monitor chardev=char1

In another terminal, connect to qmp interface by

nc -U qmp.sock

Launch QEMU:

./build/qemu-system-x86_64 -M q35,accel=kvm,memory-backend=mem -object memory-backend-file,share=on,id=mem,size=1G,mem-path=/dev/shm/qemu-ram -drive file=/home/vsementsov/work/vms/ub -chardev socket,path=/tmp/sock,id=char0 -device vhost-user-blk-pci,chardev=char0

Then, run in the guest lsblk command to check current size of vhost-user
driven disk.

Then in nc terminal:
{'execute': 'qmp_capabilities'}
{'execute': 'block_resize', 'arguments': {'node-name': 'f1', 'size': 628531200}}

Then, check in the guest that lsblk shows new size.


 subprojects/libvhost-user/libvhost-user.h |  2 ++
 block/export/vhost-user-blk-server.c      | 24 +++++++++++++++++++++++
 subprojects/libvhost-user/libvhost-user.c | 10 ++++++++++
 3 files changed, 36 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 8c5a2719e3..49208cceaa 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -585,6 +585,8 @@ bool vu_queue_empty(VuDev *dev, VuVirtq *vq);
  */
 void vu_queue_notify(VuDev *dev, VuVirtq *vq);
 
+void vu_config_change_msg(VuDev *dev);
+
 /**
  * vu_queue_notify_sync:
  * @dev: a VuDev context
diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 3409d9e02e..e56b92f2e2 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -10,6 +10,7 @@
  * later.  See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "block/block.h"
 #include "subprojects/libvhost-user/libvhost-user.h" /* only for the type definitions */
 #include "standard-headers/linux/virtio_blk.h"
@@ -251,6 +252,27 @@ static void vu_blk_exp_request_shutdown(BlockExport *exp)
     vhost_user_server_stop(&vexp->vu_server);
 }
 
+static void vu_blk_exp_resize(void *opaque)
+{
+    VuBlkExport *vexp = opaque;
+    BlockDriverState *bs = blk_bs(vexp->handler.blk);
+    int64_t new_size = bdrv_getlength(bs);
+
+    if (new_size < 0) {
+        error_printf("Failed to get length of block node '%s'",
+                     bdrv_get_node_name(bs));
+        return;
+    }
+
+    vexp->blkcfg.capacity = cpu_to_le64(new_size >> VIRTIO_BLK_SECTOR_BITS);
+
+    vu_config_change_msg(&vexp->vu_server.vu_dev);
+}
+
+static const BlockDevOps vu_blk_dev_ops = {
+    .resize_cb = vu_blk_exp_resize,
+};
+
 static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
                              Error **errp)
 {
@@ -292,6 +314,8 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                  vexp);
 
+    blk_set_dev_ops(exp->blk, &vu_blk_dev_ops, vexp);
+
     if (!vhost_user_server_start(&vexp->vu_server, vu_opts->addr, exp->ctx,
                                  num_queues, &vu_blk_iface, errp)) {
         blk_remove_aio_context_notifier(exp->blk, blk_aio_attached,
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0200b78e8e..0abd898a52 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2455,6 +2455,16 @@ void vu_queue_notify_sync(VuDev *dev, VuVirtq *vq)
     _vu_queue_notify(dev, vq, true);
 }
 
+void vu_config_change_msg(VuDev *dev)
+{
+    VhostUserMsg vmsg = {
+        .request = VHOST_USER_BACKEND_CONFIG_CHANGE_MSG,
+        .flags = VHOST_USER_VERSION,
+    };
+
+    vu_message_write(dev, dev->slave_fd, &vmsg);
+}
+
 static inline void
 vring_used_flags_set_bit(VuVirtq *vq, int mask)
 {
-- 
2.34.1


