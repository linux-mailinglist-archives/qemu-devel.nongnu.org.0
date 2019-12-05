Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210A114388
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 16:29:13 +0100 (CET)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ict43-0007qy-RU
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 10:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icswB-0000Fq-G6
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:21:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsw7-0005wx-0J
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:21:01 -0500
Received: from relay.sw.ru ([185.231.240.75]:43548)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsw1-0005d5-5X
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:55 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvb-00007O-FX; Thu, 05 Dec 2019 18:20:27 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/21] 9pfs: well form error hint helpers
Date: Thu,  5 Dec 2019 18:20:06 +0300
Message-Id: <20191205152019.8454-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205152019.8454-1-vsementsov@virtuozzo.com>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
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
 hw/9pfs/9p-local.c | 2 +-
 hw/9pfs/9p-proxy.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 4708c0bd89..ca641390fb 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -1473,7 +1473,7 @@ static void local_cleanup(FsContext *ctx)
     g_free(data);
 }
 
-static void error_append_security_model_hint(Error **errp)
+static void error_append_security_model_hint(Error *const *errp)
 {
     error_append_hint(errp, "Valid options are: security_model="
                       "[passthrough|mapped-xattr|mapped-file|none]\n");
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 97ab9c58a5..8136e1342d 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1114,7 +1114,7 @@ static int connect_namedsocket(const char *path, Error **errp)
     return sockfd;
 }
 
-static void error_append_socket_sockfd_hint(Error **errp)
+static void error_append_socket_sockfd_hint(Error *const *errp)
 {
     error_append_hint(errp, "Either specify socket=/some/path where /some/path"
                       " points to a listening AF_UNIX socket or sock_fd=fd"
-- 
2.21.0


