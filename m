Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2FA7443
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 22:08:25 +0200 (CEST)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5F6G-00061s-Fa
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 16:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i5F2U-0002Wc-Mk
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i5F2T-00049J-Hy
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:04:30 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:37076
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i5F2T-000484-Ao
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:04:29 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.92.1) (envelope-from <johannes@sipsolutions.net>)
 id 1i5F2P-0008HB-VJ; Tue, 03 Sep 2019 22:04:26 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 23:04:22 +0300
Message-Id: <20190903200422.11693-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: [Qemu-devel] [PATCH v2] libvhost-user: fix SLAVE_SEND_FD handling
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Johannes Berg <johannes.berg@intel.com>, Tiwei Bie <tiwei.bie@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Johannes Berg <johannes.berg@intel.com>

It doesn't look like this could possibly work properly since
VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD is defined to 10, but the
dev->protocol_features has a bitmap. I suppose the peer this
was tested with also supported VHOST_USER_PROTOCOL_F_LOG_SHMFD,
in which case the test would always be false, but nevertheless
the code seems wrong.

Use has_feature() to fix this.

Fixes: d84599f56c82 ("libvhost-user: support host notifier")
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 contrib/libvhost-user/libvhost-user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 6a02eaffc672..fcf4a8a00ed2 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -1097,7 +1097,8 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
 
     vmsg.fd_num = fd_num;
 
-    if ((dev->protocol_features & VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD) == 0) {
+    if (!has_feature(dev->protocol_features,
+                     VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
         return false;
     }
 
-- 
2.23.0


