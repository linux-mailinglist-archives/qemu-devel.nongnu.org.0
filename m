Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825A516912
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 02:49:26 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlKFh-00066I-0V
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 20:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nlKEs-0005Ql-SW
 for qemu-devel@nongnu.org; Sun, 01 May 2022 20:48:34 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55582)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nlKEp-0007Ks-U7
 for qemu-devel@nongnu.org; Sun, 01 May 2022 20:48:33 -0400
Received: from localhost.localdomain (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id CA95240D403D;
 Mon,  2 May 2022 00:38:54 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] net: fix multicast support with BSD (macOS) socket
 implementations
Date: Mon,  2 May 2022 03:38:30 +0300
Message-Id: <20220502003830.31062-1-cheptsov@ispras.ru>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes socket communication with QEMU -> host on macOS,
which was originally impossible due to QEMU and host program
having to bind to the same ip/port in a way not supported by BSD
sockets. The change was tested on both Linux and macOS.

As per BSD manual pages SO_REUSEPORT allows completely duplicate
bindings by multiple processes, permitting multiple instances of
a program to each receive UDP/IP multicast datagrams destined
for the bound port. Without this option macOS, unlike Linux,
which (ab)uses SO_REUSEADDR for this purpose, will return
"Address already in use" on bind().

As per BSD manual pages binding to any address, even one not bound
to any available network interface in the system, should be
IP_BINDANY. Without binding to INADDR_ANY macOS will return
"Can't assign requested address" on send().

Cc: Jason Wang <jasowang@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
---
 net/socket.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index ea5220a2eb..8b2c6c4bb8 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -252,10 +252,24 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
         goto fail;
     }
 
-    ret = bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
+    val = 1;
+    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, sizeof(val));
+    if (ret < 0) {
+        error_setg_errno(errp, errno,
+                         "can't set socket option SO_REUSEPORT");
+        goto fail;
+    }
+
+    struct sockaddr_in bindaddr;
+    memset(&bindaddr, 0, sizeof(bindaddr));
+    bindaddr.sin_family = AF_INET;
+    bindaddr.sin_addr.s_addr = htonl(INADDR_ANY);
+    bindaddr.sin_port = mcastaddr->sin_port;
+    ret = bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
+
     if (ret < 0) {
         error_setg_errno(errp, errno, "can't bind ip=%s to socket",
-                         inet_ntoa(mcastaddr->sin_addr));
+                         inet_ntoa(bindaddr.sin_addr));
         goto fail;
     }
 
-- 
2.32.0 (Apple Git-132)


