Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE7A739C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 21:26:26 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5ERd-0007GJ-3E
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 15:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i5EQU-0006SL-W2
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 15:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i5EQT-0001wM-TS
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 15:25:14 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:36568
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i5EQT-0001uL-Mz
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 15:25:13 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.92.1) (envelope-from <johannes@sipsolutions.net>)
 id 1i5EQN-0007W0-Pk; Tue, 03 Sep 2019 21:25:08 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 22:25:05 +0300
Message-Id: <20190903192505.10686-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: [Qemu-devel] [PATCH] libvhost-user: implement
 VHOST_USER_PROTOCOL_F_REPLY_ACK
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
Cc: Johannes Berg <johannes.berg@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Johannes Berg <johannes.berg@intel.com>

This is really simple, since we know whether a response is
already requested or not, so we can just send a (successful)
response when there isn't one already.

Given that, it's not all _that_ useful but the master can at
least be sure the message was processed, and we can exercise
more code paths using the example code.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 contrib/libvhost-user/libvhost-user.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 4b36e35a82f8..010ddb9c0f42 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -1164,7 +1164,8 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
                         1ULL << VHOST_USER_PROTOCOL_F_LOG_SHMFD |
                         1ULL << VHOST_USER_PROTOCOL_F_SLAVE_REQ |
                         1ULL << VHOST_USER_PROTOCOL_F_HOST_NOTIFIER |
-                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD;
+                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD |
+                        1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK;
 
     if (have_userfault()) {
         features |= 1ULL << VHOST_USER_PROTOCOL_F_PAGEFAULT;
@@ -1546,13 +1547,20 @@ vu_dispatch(VuDev *dev)
 {
     VhostUserMsg vmsg = { 0, };
     int reply_requested;
-    bool success = false;
+    bool need_reply, success = false;
 
     if (!vu_message_read(dev, dev->sock, &vmsg)) {
         goto end;
     }
 
+    need_reply = vmsg.flags & VHOST_USER_NEED_REPLY_MASK;
+
     reply_requested = vu_process_message(dev, &vmsg);
+    if (!reply_requested && need_reply) {
+        vmsg_set_reply_u64(&vmsg, 0);
+        reply_requested = 1;
+    }
+
     if (!reply_requested) {
         success = true;
         goto end;
-- 
2.23.0


