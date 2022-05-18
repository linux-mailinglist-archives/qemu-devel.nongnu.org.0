Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA752B3B5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 09:42:59 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEKg-00015X-Dl
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 03:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nrEIF-0008Kl-EJ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:40:30 -0400
Received: from mail.ispras.ru ([83.149.199.84]:58146)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nrEI9-0008Lu-Qv
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:40:24 -0400
Received: from localhost.localdomain (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3184940755E5;
 Wed, 18 May 2022 07:39:50 +0000 (UTC)
From: Vitaly Cheptsov <cheptsov@ispras.ru>
To: qemu-devel@nongnu.org
Cc: Vitaly Cheptsov <cheptsov@ispras.ru>, Jason Wang <jasowang@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] net: fix multicast support with BSD (macOS) socket
 implementations
Date: Wed, 18 May 2022 10:39:45 +0300
Message-Id: <20220518073945.24787-1-cheptsov@ispras.ru>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Jason Wang <jasowang@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
---
 net/socket.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/socket.c b/net/socket.c
index bfd8596250..583f788a22 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -239,6 +239,22 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
         return -1;
     }
 
+#ifdef __APPLE__
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
+#else
     /* Allow multiple sockets to bind the same multicast ip and port by setting
      * SO_REUSEADDR. This is the only situation where SO_REUSEADDR should be set
      * on windows. Use socket_set_fast_reuse otherwise as it sets SO_REUSEADDR
@@ -253,6 +269,8 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
     }
 
     ret = bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
+#endif
+
     if (ret < 0) {
         error_setg_errno(errp, errno, "can't bind ip=%s to socket",
                          inet_ntoa(mcastaddr->sin_addr));
-- 
2.32.1 (Apple Git-133)


