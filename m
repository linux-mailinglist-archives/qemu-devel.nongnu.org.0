Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A14D4551
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:24:27 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIxiM-0001SX-19
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQZ-0005dL-95
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQY-000451-7B
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:03 -0400
Received: from relay.sw.ru ([185.231.240.75]:47826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQX-00043W-Tj
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:02 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQU-0003XG-Th; Fri, 11 Oct 2019 19:05:59 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 009/126] 9pfs: well form error hint helpers
Date: Fri, 11 Oct 2019 19:03:55 +0300
Message-Id: <20191011160552.22907-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
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
Cc: vsementsov@virtuozzo.com, armbru@redhat.com, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make error_append_security_model_hint and
error_append_socket_sockfd_hint hint append helpers well formed:
rename errp to errp_in, as it is IN-parameter here (which is unusual
for errp).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/9pfs/9p-local.c | 4 ++--
 hw/9pfs/9p-proxy.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 08e673a79c..35635e7e7e 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -1469,9 +1469,9 @@ static void local_cleanup(FsContext *ctx)
     g_free(data);
 }
 
-static void error_append_security_model_hint(Error **errp)
+static void error_append_security_model_hint(Error **errp_in)
 {
-    error_append_hint(errp, "Valid options are: security_model="
+    error_append_hint(errp_in, "Valid options are: security_model="
                       "[passthrough|mapped-xattr|mapped-file|none]\n");
 }
 
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 57a8c1c808..0cea8b19fa 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1114,9 +1114,10 @@ static int connect_namedsocket(const char *path, Error **errp)
     return sockfd;
 }
 
-static void error_append_socket_sockfd_hint(Error **errp)
+static void error_append_socket_sockfd_hint(Error **errp_in)
 {
-    error_append_hint(errp, "Either specify socket=/some/path where /some/path"
+    error_append_hint(errp_in,
+                      "Either specify socket=/some/path where /some/path"
                       " points to a listening AF_UNIX socket or sock_fd=fd"
                       " where fd is a file descriptor to a connected AF_UNIX"
                       " socket\n");
-- 
2.21.0


