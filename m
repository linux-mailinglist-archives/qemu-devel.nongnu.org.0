Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F22DE1C1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:06:48 +0100 (CET)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDax-0006ax-4u
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDD1-0003q6-3k
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCz-0004fz-4s
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgnKVQes/+rsc9Qae198nAa6ob5L5drbXnb9PvrTf2g=;
 b=biA+4QT6j/9efYvutjs+CUIFVG7Y6hoeOnIMZGRwwShcYh8mQnkJfR69uaxRhKn1u/fPjF
 MldX2p0Opd0XNfN+MskM1sDzCZ4BQuTN8H7vbEHKBQr50y0b+UQqAUbknkSR8qozHvDhHE
 Y8pbhot7lL3BX1ZsJlYfwCmxLsP3UtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-YobG6np2NMaVMbNVmVF33Q-1; Fri, 18 Dec 2020 05:41:55 -0500
X-MC-Unique: YobG6np2NMaVMbNVmVF33Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16C88800D53;
 Fri, 18 Dec 2020 10:41:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1650D60C15;
 Fri, 18 Dec 2020 10:41:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 11/15] virtiofsd: Remove useless code about send_notify_iov
Date: Fri, 18 Dec 2020 10:41:13 +0000
Message-Id: <20201218104117.199096-12-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

The 'ch' will be NULL in the following stack:
send_notify_iov()->fuse_send_msg()->virtio_send_msg(), and
this may lead to NULL pointer dereferenced in virtio_send_msg().
But send_notify_iov() was never called, so remove the useless code
about send_notify_iov() to fix this problem.

Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-Id: <20201214121615.29967-1-alex.chen@huawei.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.29.2


