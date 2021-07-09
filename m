Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C53C259F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:12:01 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rEW-0000iw-GM
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rCd-0006eu-Uh
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1rCb-00046x-38
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625839800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8hzy/tgaVOOM7h9rwlrLTwLBAzVuAuKAssnUJ3a1gM=;
 b=Nn4rQNo5tvsf+hDMSwEgTQj1gy7tcgfMvt54gIrxouUN1Ou5ugaEtoWT4rG9RXSAkGjPBT
 SUXROAPDTKBpz1e/03YsltaDOkD+R5beoPjSKMvfHFTdLWOyBGL6WPQ3OLAOE5SQnnUWKQ
 XWS5CNexA0k5M+K/VBcp4xyOfkUbwOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-ENdIkFkdP4yLbw30--3duw-1; Fri, 09 Jul 2021 10:09:59 -0400
X-MC-Unique: ENdIkFkdP4yLbw30--3duw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D03F519200C0;
 Fri,  9 Jul 2021 14:09:57 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37CD860C04;
 Fri,  9 Jul 2021 14:09:57 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] nbd: register yank function earlier
Date: Fri,  9 Jul 2021 09:09:51 -0500
Message-Id: <20210709140951.2775730-5-eblake@redhat.com>
In-Reply-To: <20210709140951.2775730-1-eblake@redhat.com>
References: <20210709140951.2775730-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Although unlikely, qemu might hang in nbd_send_request().

Allow recovery in this case by registering the yank function before
calling it.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Message-Id: <20210704000730.1befb596@gecko.fritz.box>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 601fccc5bacd..f6ff1c4fb472 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -371,6 +371,9 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
         return -ECONNREFUSED;
     }

+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
+                           bs);
+
     ret = nbd_handle_updated_info(s->bs, NULL);
     if (ret < 0) {
         /*
@@ -381,6 +384,8 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,

         nbd_send_request(s->ioc, &request);

+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, bs);
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;

@@ -390,9 +395,6 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     qio_channel_set_blocking(s->ioc, false, NULL);
     qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));

-    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
-                           bs);
-
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
     qemu_co_queue_restart_all(&s->free_sema);
-- 
2.31.1


