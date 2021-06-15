Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9EF3A8A83
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:00:19 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGAU-0005TD-Ne
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFym-0001e6-8i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyj-0000xU-7j
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlTl4h8WRBzjszeGX5X7kM5uxNydnj4ozPH/5NYr4ZA=;
 b=HaCFJ+0/PhxwE6g0vs/9pTujEIoSULVH2cKMs5WgkZv3vgtIg8Vz43sn+sS3qpjVbPS2Ft
 +OT3X1rZoS+HeKQA6R8fwc4uuGiJkgQcH2nIRD/SzKTj+szGN/y+Mqm0tVLObMgLQ1DMSf
 /yKj6Vkfdsj2I8sNTYNQnfucqvzSPEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-2oUjowCqPg-W-I6fSOeM0g-1; Tue, 15 Jun 2021 16:48:07 -0400
X-MC-Unique: 2oUjowCqPg-W-I6fSOeM0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0623E80EDAA;
 Tue, 15 Jun 2021 20:48:06 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57CAD5D9CA;
 Tue, 15 Jun 2021 20:48:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/34] block/nbd: fix how state is cleared on nbd_open()
 failure paths
Date: Tue, 15 Jun 2021 15:47:27 -0500
Message-Id: <20210615204756.281505-6-eblake@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We have two "return error" paths in nbd_open() after
nbd_process_options(). Actually we should call nbd_clear_bdrvstate()
on these paths. Interesting that nbd_process_options() calls
nbd_clear_bdrvstate() by itself.

Let's fix leaks and refactor things to be more obvious:

- intialize yank at top of nbd_open()
- move yank cleanup to nbd_clear_bdrvstate()
- refactor nbd_open() so that all failure paths except for
  yank-register goes through nbd_clear_bdrvstate()

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-4-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index f4b3407587df..01d2c2efad63 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -152,8 +152,12 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);

-static void nbd_clear_bdrvstate(BDRVNBDState *s)
+static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
+
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
@@ -2275,9 +2279,6 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     ret = 0;

  error:
-    if (ret < 0) {
-        nbd_clear_bdrvstate(s);
-    }
     qemu_opts_del(opts);
     return ret;
 }
@@ -2288,11 +2289,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

-    ret = nbd_process_options(bs, options, errp);
-    if (ret < 0) {
-        return ret;
-    }
-
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
     qemu_co_queue_init(&s->free_sema);
@@ -2301,20 +2297,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         return -EEXIST;
     }

+    ret = nbd_process_options(bs, options, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
     if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
-        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-        return -ECONNREFUSED;
+        ret = -ECONNREFUSED;
+        goto fail;
     }

     ret = nbd_client_handshake(bs, errp);
     if (ret < 0) {
-        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-        nbd_clear_bdrvstate(s);
-        return ret;
+        goto fail;
     }
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
@@ -2326,6 +2325,10 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);

     return 0;
+
+fail:
+    nbd_clear_bdrvstate(bs);
+    return ret;
 }

 static int nbd_co_flush(BlockDriverState *bs)
@@ -2369,11 +2372,8 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)

 static void nbd_close(BlockDriverState *bs)
 {
-    BDRVNBDState *s = bs->opaque;
-
     nbd_client_close(bs);
-    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-    nbd_clear_bdrvstate(s);
+    nbd_clear_bdrvstate(bs);
 }

 /*
-- 
2.31.1


