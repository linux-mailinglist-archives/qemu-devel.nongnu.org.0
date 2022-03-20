Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC6E4E1E15
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:01:15 +0100 (CET)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3bu-0007Ro-CS
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:01:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Yc-0005Gt-JJ
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:57:51 -0400
Received: from smtp107.iad3b.emailsrvr.com ([146.20.161.107]:51188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Ya-0003ez-Tj
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:57:50 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp22.relay.iad3b.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 3518A6014F; 
 Sun, 20 Mar 2022 17:57:45 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] io: Limit readv/writev to IOV_MAX
Date: Sun, 20 Mar 2022 16:57:33 -0500
Message-Id: <20220320215733.5523-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: 779ff874-26dd-4bba-adcb-75066c0ad08a-1-1
Received-SPF: pass client-ip=146.20.161.107;
 envelope-from=adeason@sinenomine.net; helo=smtp107.iad3b.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unit tests 'test-io-channel-file' and 'test-io-channel-socket'
currently fail on Solaris, because we try to perform vectored I/O with
a batch of 250 (CHUNK_COUNT) iovs. This exceeds MAX_IOV on Solaris
(only 16, much lower than Linux's 1024), and so results in an EINVAL
for file operations, and EMSGSIZE for sockets.

To fix this, make qio_channel_readv_full and qio_channel_writev_full
only use the first IOV_MAX iovs passed in, and we'll return the number
of bytes actually processed like always.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
These aren't the only tests that fail on Solaris right now, but this
seemed easy to fix (assuming this is correct), so I'm just submitting
something while I'm looking at it.

 io/channel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..cb9d85a30d 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -56,40 +56,44 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
     if ((fds || nfds) &&
         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         error_setg_errno(errp, EINVAL,
                          "Channel does not support file descriptor passing");
         return -1;
     }
 
+    niov = MIN(niov, IOV_MAX);
+
     return klass->io_readv(ioc, iov, niov, fds, nfds, errp);
 }
 
 
 ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
                                 Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
     if ((fds || nfds) &&
         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
         error_setg_errno(errp, EINVAL,
                          "Channel does not support file descriptor passing");
         return -1;
     }
 
+    niov = MIN(niov, IOV_MAX);
+
     return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
 }
 
 
 int qio_channel_readv_all_eof(QIOChannel *ioc,
                               const struct iovec *iov,
                               size_t niov,
                               Error **errp)
 {
     return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
-- 
2.11.0


