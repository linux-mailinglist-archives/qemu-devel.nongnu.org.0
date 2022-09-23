Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D915B5E7F1E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:57:26 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obl3N-0006aB-Eq
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1obkxf-0006CG-KK
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:51:31 -0400
Received: from [106.39.185.57] (port=43656 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1obkxS-0007UZ-NL
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:51:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 92B6CFC0204;
 Fri, 23 Sep 2022 23:51:09 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain
 (1.39.88.218.broad.cd.sc.dynamic.163data.com.cn [218.88.39.1])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281470656377200S1663948267784997_; 
 Fri, 23 Sep 2022 23:51:09 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f5d8f998e56f3699ee147e95c76895a7>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 3
X-SENDER-IP: 218.88.39.1
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>,
	lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH] virtio: del net client if net_init_tap_one failed
Date: Fri, 23 Sep 2022 23:50:46 +0800
Message-Id: <20220923155046.1571-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: lu zhipeng <luzhipeng@cestc.cn>

If the net tap initializes successful, but failed during
network card hot-plugging, the net-tap will remains,
so cleanup.

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
---
 net/tap.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74..e203d07a12 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -686,7 +686,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
     tap_set_sndbuf(s->fd, tap, &err);
     if (err) {
         error_propagate(errp, err);
-        return;
+        goto failed;
     }
 
     if (tap->has_fd || tap->has_fds) {
@@ -726,12 +726,12 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                 } else {
                     warn_report_err(err);
                 }
-                return;
+                goto failed;
             }
             if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
                 error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
                                  name, fd);
-                return;
+                goto failed;
             }
         } else {
             vhostfd = open("/dev/vhost-net", O_RDWR);
@@ -743,11 +743,11 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                     warn_report("tap: open vhost char device failed: %s",
                                 strerror(errno));
                 }
-                return;
+                goto failed;
             }
             if (!g_unix_set_fd_nonblocking(vhostfd, true, NULL)) {
                 error_setg_errno(errp, errno, "Failed to set FD nonblocking");
-                return;
+                goto failed;
             }
         }
         options.opaque = (void *)(uintptr_t)vhostfd;
@@ -760,11 +760,17 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             } else {
                 warn_report(VHOST_NET_INIT_FAILED);
             }
-            return;
+            goto failed;
         }
     } else if (vhostfdname) {
         error_setg(errp, "vhostfd(s)= is not valid without vhost");
+        goto failed;
     }
+
+    return;
+
+failed:
+    qemu_del_net_client(&s->nc);
 }
 
 static int get_fds(char *str, char *fds[], int max)
-- 
2.31.1




