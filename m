Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9749FC1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 13:54:24 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdCgx-0004bP-O4
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 07:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48336)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdCWX-00041t-AH
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:43:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdCWV-0000NB-7b
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:43:37 -0400
Received: from relay.sw.ru ([185.231.240.75]:58004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdCWU-0000Jj-Rn; Tue, 18 Jun 2019 07:43:35 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdCWP-00016b-9e; Tue, 18 Jun 2019 14:43:29 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 14:43:23 +0300
Message-Id: <20190618114328.55249-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190618114328.55249-1-vsementsov@virtuozzo.com>
References: <20190618114328.55249-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 4/9] block/nbd: add cmdline and qapi
 parameter reconnect-delay
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reconnect will be implemented in the following commit, so for now,
in semantics below, disconnect itself is a "serious error".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json | 11 ++++++++++-
 block/nbd.c          | 16 +++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 61124431d8..17faf723e0 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3858,13 +3858,22 @@
 #                  traditional "base:allocation" block status (see
 #                  NBD_OPT_LIST_META_CONTEXT in the NBD protocol) (since 3.0)
 #
+# @reconnect-delay: On an unexpected disconnect, the nbd client tries to
+#                   connect again until succeeding or encountering a serious
+#                   error.  During the first @reconnect-delay seconds, all
+#                   requests are paused and will be rerun on a successful
+#                   reconnect. After that time, any delayed requests and all
+#                   future requests before a successful reconnect will
+#                   immediately fail. Default 0 (Since 4.1)
+#
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsNbd',
   'data': { 'server': 'SocketAddress',
             '*export': 'str',
             '*tls-creds': 'str',
-            '*x-dirty-bitmap': 'str' } }
+            '*x-dirty-bitmap': 'str',
+            '*reconnect-delay': 'uint32' } }
 
 ##
 # @BlockdevOptionsRaw:
diff --git a/block/nbd.c b/block/nbd.c
index 9e505c895a..df9b0a2c8a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1276,6 +1276,7 @@ static int nbd_client_init(BlockDriverState *bs,
                            QCryptoTLSCreds *tlscreds,
                            const char *hostname,
                            const char *x_dirty_bitmap,
+                           uint32_t reconnect_delay,
                            Error **errp)
 {
     int ret;
@@ -1601,6 +1602,17 @@ static QemuOptsList nbd_runtime_opts = {
             .help = "experimental: expose named dirty bitmap in place of "
                     "block status",
         },
+        {
+            .name = "reconnect-delay",
+            .type = QEMU_OPT_NUMBER,
+            .help = "On an unexpected disconnect, the nbd client tries to "
+                    "connect again until succeeding or encountering a serious "
+                    "error.  During the first @reconnect-delay seconds, all "
+                    "requests are paused and will be rerun on a successful "
+                    "reconnect. After that time, any delayed requests and all "
+                    "future requests before a successful reconnect will "
+                    "immediately fail. Default 0",
+        },
         { /* end of list */ }
     },
 };
@@ -1652,7 +1664,9 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 
     /* NBD handshake */
     ret = nbd_client_init(bs, s->saddr, s->export, tlscreds, hostname,
-                          qemu_opt_get(opts, "x-dirty-bitmap"), errp);
+                          qemu_opt_get(opts, "x-dirty-bitmap"),
+                          qemu_opt_get_number(opts, "reconnect-delay", 0),
+                          errp);
 
  error:
     if (tlscreds) {
-- 
2.18.0


