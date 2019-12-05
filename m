Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B033114374
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 16:24:12 +0100 (CET)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icszB-0002C0-VZ
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 10:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsvx-0000BG-IK
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsvt-0005ke-3l
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:46 -0500
Received: from relay.sw.ru ([185.231.240.75]:43530)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvq-0005a7-RW
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:43 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvZ-00007O-JS; Thu, 05 Dec 2019 18:20:25 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/21] net/net: Clean up variable shadowing in
 net_client_init()
Date: Thu,  5 Dec 2019 18:20:00 +0300
Message-Id: <20191205152019.8454-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205152019.8454-1-vsementsov@virtuozzo.com>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, vsementsov@virtuozzo.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Variable int err in inner scope shadows Error *err in outer scope.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/net.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/net/net.c b/net/net.c
index 84aa6d8d00..9e93c3f8a1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1126,16 +1126,13 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 
             prefix_addr = substrings[0];
 
-            if (substrings[1]) {
-                /* User-specified prefix length.  */
-                int err;
-
-                err = qemu_strtoul(substrings[1], NULL, 10, &prefix_len);
-                if (err) {
-                    error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                               "ipv6-prefixlen", "a number");
-                    goto out;
-                }
+            /* Handle user-specified prefix length. */
+            if (substrings[1] &&
+                qemu_strtoul(substrings[1], NULL, 10, &prefix_len))
+            {
+                error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                           "ipv6-prefixlen", "a number");
+                goto out;
             }
 
             qemu_opt_set(opts, "ipv6-prefix", prefix_addr, &error_abort);
-- 
2.21.0


