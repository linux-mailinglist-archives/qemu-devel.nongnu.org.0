Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC72D9802
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:31:55 +0100 (CET)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kon18-00035I-4b
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1komzZ-0002Or-2I; Mon, 14 Dec 2020 07:30:17 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1komzV-0000dn-4o; Mon, 14 Dec 2020 07:30:16 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvggQ4YPtzhtTn;
 Mon, 14 Dec 2020 20:29:22 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Mon, 14 Dec 2020
 20:29:50 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <dgilbert@redhat.com>, <stefanha@redhat.com>
Subject: [PATCH] virtiofsd: Remove useless code about send_notify_iov
Date: Mon, 14 Dec 2020 12:16:15 +0000
Message-ID: <20201214121615.29967-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'ch' will be NULL in the following stack:
send_notify_iov()->fuse_send_msg()->virtio_send_msg(), and
this may lead to NULL pointer dereferenced in virtio_send_msg().
But send_notify_iov() was never called, so remove the useless code
about send_notify_iov() to fix this problem.

Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 98 ---------------------------------
 1 file changed, 98 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index d4119e92ab..e94b71110b 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2143,104 +2143,6 @@ static void do_destroy(fuse_req_t req, fuse_ino_t nodeid,
     send_reply_ok(req, NULL, 0);
 }
 
-static int send_notify_iov(struct fuse_session *se, int notify_code,
-                           struct iovec *iov, int count)
-{
-    struct fuse_out_header out = {
-        .error = notify_code,
-    };
-
-    if (!se->got_init) {
-        return -ENOTCONN;
-    }
-
-    iov[0].iov_base = &out;
-    iov[0].iov_len = sizeof(struct fuse_out_header);
-
-    return fuse_send_msg(se, NULL, iov, count);
-}
-
-int fuse_lowlevel_notify_poll(struct fuse_pollhandle *ph)
-{
-    if (ph != NULL) {
-        struct fuse_notify_poll_wakeup_out outarg = {
-            .kh = ph->kh,
-        };
-        struct iovec iov[2];
-
-        iov[1].iov_base = &outarg;
-        iov[1].iov_len = sizeof(outarg);
-
-        return send_notify_iov(ph->se, FUSE_NOTIFY_POLL, iov, 2);
-    } else {
-        return 0;
-    }
-}
-
-int fuse_lowlevel_notify_inval_inode(struct fuse_session *se, fuse_ino_t ino,
-                                     off_t off, off_t len)
-{
-    struct fuse_notify_inval_inode_out outarg = {
-        .ino = ino,
-        .off = off,
-        .len = len,
-    };
-    struct iovec iov[2];
-
-    if (!se) {
-        return -EINVAL;
-    }
-
-    iov[1].iov_base = &outarg;
-    iov[1].iov_len = sizeof(outarg);
-
-    return send_notify_iov(se, FUSE_NOTIFY_INVAL_INODE, iov, 2);
-}
-
-int fuse_lowlevel_notify_inval_entry(struct fuse_session *se, fuse_ino_t parent,
-                                     const char *name, size_t namelen)
-{
-    struct fuse_notify_inval_entry_out outarg = {
-        .parent = parent,
-        .namelen = namelen,
-    };
-    struct iovec iov[3];
-
-    if (!se) {
-        return -EINVAL;
-    }
-
-    iov[1].iov_base = &outarg;
-    iov[1].iov_len = sizeof(outarg);
-    iov[2].iov_base = (void *)name;
-    iov[2].iov_len = namelen + 1;
-
-    return send_notify_iov(se, FUSE_NOTIFY_INVAL_ENTRY, iov, 3);
-}
-
-int fuse_lowlevel_notify_delete(struct fuse_session *se, fuse_ino_t parent,
-                                fuse_ino_t child, const char *name,
-                                size_t namelen)
-{
-    struct fuse_notify_delete_out outarg = {
-        .parent = parent,
-        .child = child,
-        .namelen = namelen,
-    };
-    struct iovec iov[3];
-
-    if (!se) {
-        return -EINVAL;
-    }
-
-    iov[1].iov_base = &outarg;
-    iov[1].iov_len = sizeof(outarg);
-    iov[2].iov_base = (void *)name;
-    iov[2].iov_len = namelen + 1;
-
-    return send_notify_iov(se, FUSE_NOTIFY_DELETE, iov, 3);
-}
-
 int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
                                off_t offset, struct fuse_bufvec *bufv)
 {
-- 
2.19.1


