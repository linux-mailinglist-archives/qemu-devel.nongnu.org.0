Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593812AAE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Dec 2019 09:16:33 +0100 (CET)
Received: from localhost ([::1]:51960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikOJp-0002J9-HI
	for lists+qemu-devel@lfdr.de; Thu, 26 Dec 2019 03:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ikOIv-0001k0-4G
 for qemu-devel@nongnu.org; Thu, 26 Dec 2019 03:15:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ikOIu-0001kC-2j
 for qemu-devel@nongnu.org; Thu, 26 Dec 2019 03:15:33 -0500
Received: from relay.sw.ru ([185.231.240.75]:33626)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ikOIr-0001ho-Cc; Thu, 26 Dec 2019 03:15:29 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ikOIk-0000kR-2r; Thu, 26 Dec 2019 11:15:22 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] nbd/server: improve nbd_negotiate_send_rep_list
Date: Thu, 26 Dec 2019 11:15:21 +0300
Message-Id: <20191226081521.29652-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't try to write zero-lenght strings.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/server.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 24ebc1a805..28a915f5a2 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -392,14 +392,18 @@ static int nbd_negotiate_send_rep_list(NBDClient *client, NBDExport *exp,
         return -EINVAL;
     }
 
-    if (nbd_write(ioc, name, name_len, errp) < 0) {
-        error_prepend(errp, "write failed (name buffer): ");
-        return -EINVAL;
+    if (name_len > 0) {
+        if (nbd_write(ioc, name, name_len, errp) < 0) {
+            error_prepend(errp, "write failed (name buffer): ");
+            return -EINVAL;
+        }
     }
 
-    if (nbd_write(ioc, desc, desc_len, errp) < 0) {
-        error_prepend(errp, "write failed (description buffer): ");
-        return -EINVAL;
+    if (desc_len > 0) {
+        if (nbd_write(ioc, desc, desc_len, errp) < 0) {
+            error_prepend(errp, "write failed (description buffer): ");
+            return -EINVAL;
+        }
     }
 
     return 0;
-- 
2.21.0


