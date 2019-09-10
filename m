Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D4AE50E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 10:03:30 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7b7Z-0002Rt-DL
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 04:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i7b41-0000DC-DW
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:59:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i7b40-0002ls-DL
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:59:49 -0400
Received: from relay.sw.ru ([185.231.240.75]:55626)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i7b40-0002lS-6Y
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 03:59:48 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i7b3w-00077S-ET; Tue, 10 Sep 2019 10:59:44 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 10:59:43 +0300
Message-Id: <20190910075943.12977-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] util/qemu-sockets: fix keep_alive handling in
 inet_connect_saddr
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 kraxel@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In "if (saddr->keep_alive) {" we may already be on error path, with
invalid sock < 0. Fix it by returning error earlier.

Reported-by: Coverity (CID 1405300)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 util/qemu-sockets.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 98ff3a1cce..bcc06d0e01 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -461,12 +461,13 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
         }
     }
 
+    freeaddrinfo(res);
+
     if (sock < 0) {
         error_propagate(errp, local_err);
+        return sock;
     }
 
-    freeaddrinfo(res);
-
     if (saddr->keep_alive) {
         int val = 1;
         int ret = qemu_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-- 
2.18.0


