Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A533A8ABB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:10:05 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGJw-0001HS-TL
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzL-0003I2-1I
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz9-0001Fk-EO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z48b1Gxeot01okVsYxLXZmQhqFnl1OwCWRH1p2kS53g=;
 b=U6sb6wNm4wwBB8+m/YlpfvAMpqMn0DoV9i5bX23WIT0i8he5g8yFLeAGJyHZGuImxPXu0F
 KeSLb+gKVl/o1zzwHcWpB23rdKsfpDayVEvlTsw+yOek8zXQ3Z4m1To89MGFQbKfxl/qCI
 Ik7yC3HJ4w0GOdHg+bSGkuuJBOtpt8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-EoHOLzx6NmOVpMjqD6PbSg-1; Tue, 15 Jun 2021 16:48:33 -0400
X-MC-Unique: EoHOLzx6NmOVpMjqD6PbSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC4C9195D56E;
 Tue, 15 Jun 2021 20:48:31 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82B705D9CA;
 Tue, 15 Jun 2021 20:48:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/34] nbd/client-connection: add option for non-blocking
 connection attempt
Date: Tue, 15 Jun 2021 15:47:53 -0500
Message-Id: <20210615204756.281505-32-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We'll need a possibility of non-blocking nbd_co_establish_connection(),
so that it returns immediately, and it returns success only if a
connections was previously established in background.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-30-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     | 2 +-
 block/nbd.c             | 2 +-
 nbd/client-connection.c | 8 +++++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 10c8a0bcca80..78d101b77488 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -420,7 +420,7 @@ void nbd_client_connection_release(NBDClientConnection *conn);

 QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            Error **errp);
+                            bool blocking, Error **errp);

 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);

diff --git a/block/nbd.c b/block/nbd.c
index 8caeafc8d351..bf2e9393146b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -364,7 +364,7 @@ static int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,

     assert(!s->ioc);

-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, errp);
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, true, errp);
     if (!s->ioc) {
         return -ECONNREFUSED;
     }
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 72138a5ff74a..aff646028786 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -266,6 +266,8 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  *   otherwise the thread is not running, so start a thread and wait for
  *     completion
  *
+ * If @blocking is false, don't wait for the thread, return immediately.
+ *
  * If @info is not NULL, also do nbd-negotiation after successful connection.
  * In this case info is used only as out parameter, and is fully initialized by
  * nbd_co_establish_connection(). "IN" fields of info as well as related only to
@@ -274,7 +276,7 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  */
 QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            Error **errp)
+                            bool blocking, Error **errp)
 {
     QIOChannel *ioc;
     QemuThread thread;
@@ -314,6 +316,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                                connect_thread_func, conn, QEMU_THREAD_DETACHED);
         }

+        if (!blocking) {
+            return NULL;
+        }
+
         conn->wait_co = qemu_coroutine_self();
     }

-- 
2.31.1


