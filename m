Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169223A8A81
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:58:44 +0200 (CEST)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG8x-00023D-2b
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz0-0002UQ-J8
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyx-00018Q-Nw
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzmWJ7+j2yt22NgLLb4CGPE97wxAljQ20otK6bDubQc=;
 b=gDpE0iYu+aOzGfmGYZOKxljsLNmwU0s++GpeYRUc56HLkHfMRUHRN1PA0VhqbK4mPBL9JE
 oxsjFbZZKOXetiolug3FcZtAfNwW1rzuj2U3RFAbE7kJTDrNErrmkc5NlHMe4C7wu38wnt
 IKaZnjynvdoWsQi41yxToEp7mfBithc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-L8nTccoaOLeoNTpCN0mXRg-1; Tue, 15 Jun 2021 16:48:21 -0400
X-MC-Unique: L8nTccoaOLeoNTpCN0mXRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59CBD80ED8E;
 Tue, 15 Jun 2021 20:48:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D211F5D9CA;
 Tue, 15 Jun 2021 20:48:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/34] block/nbd: introduce nbd_client_connection_new()
Date: Tue, 15 Jun 2021 15:47:39 -0500
Message-Id: <20210615204756.281505-18-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This is a step of creating bs-independent nbd connection interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-16-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index ce8d38d17abf..e7261aeaef7b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -358,15 +358,18 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }

-static void nbd_init_connect_thread(BDRVNBDState *s)
+static NBDClientConnection *
+nbd_client_connection_new(const SocketAddress *saddr)
 {
-    s->conn = g_new(NBDClientConnection, 1);
+    NBDClientConnection *conn = g_new(NBDClientConnection, 1);

-    *s->conn = (NBDClientConnection) {
-        .saddr = QAPI_CLONE(SocketAddress, s->saddr),
+    *conn = (NBDClientConnection) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
     };

-    qemu_mutex_init(&s->conn->mutex);
+    qemu_mutex_init(&conn->mutex);
+
+    return conn;
 }

 static void nbd_free_connect_thread(NBDClientConnection *conn)
@@ -2230,7 +2233,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }

-    nbd_init_connect_thread(s);
+    s->conn = nbd_client_connection_new(s->saddr);

     /*
      * establish TCP connection, return error if it fails
-- 
2.31.1


