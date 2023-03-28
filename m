Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B26CBF4B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:37:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8YR-0004DM-EQ; Tue, 28 Mar 2023 08:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8YO-0004BX-6k
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8YM-0006CN-Ay
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680006953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RA1ZnMKSxLra8z0VlFyzeY9VJiVlM6sAzM3t1q82S6M=;
 b=h5qR3LJZKhnI738AR4LHu0tlNXuW9ijRTJ5t6xqmr465ssWKD1umQFO0OuzUqa6timAl7U
 xMYNy8NatF2GP6ZulZEx+2fEsPmVzTwxVL5dJhepGPDWO71pLopaY+cl+ojmuvsqr5pHe/
 RYYBNnMz8zQE1Mbj4dDoWk097PLtV1E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-7Ec6T_y4NeuTFxScQUTQrA-1; Tue, 28 Mar 2023 08:35:52 -0400
X-MC-Unique: 7Ec6T_y4NeuTFxScQUTQrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 972FF1C27D85;
 Tue, 28 Mar 2023 12:35:51 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF12FC15BA0;
 Tue, 28 Mar 2023 12:35:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 2/4] block/export: only acquire AioContext once for
 vhost_user_server_stop()
Date: Tue, 28 Mar 2023 14:35:40 +0200
Message-Id: <20230328123542.222022-3-kwolf@redhat.com>
In-Reply-To: <20230328123542.222022-1-kwolf@redhat.com>
References: <20230328123542.222022-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

vhost_user_server_stop() uses AIO_WAIT_WHILE(). AIO_WAIT_WHILE()
requires that AioContext is only acquired once.

Since blk_exp_request_shutdown() already acquires the AioContext it
shouldn't be acquired again in vhost_user_server_stop().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230323145853.1345527-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/vhost-user-server.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 40f36ea214..5b6216069c 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -346,10 +346,9 @@ static void vu_accept(QIONetListener *listener, QIOChannelSocket *sioc,
     aio_context_release(server->ctx);
 }
 
+/* server->ctx acquired by caller */
 void vhost_user_server_stop(VuServer *server)
 {
-    aio_context_acquire(server->ctx);
-
     qemu_bh_delete(server->restart_listener_bh);
     server->restart_listener_bh = NULL;
 
@@ -366,8 +365,6 @@ void vhost_user_server_stop(VuServer *server)
         AIO_WAIT_WHILE(server->ctx, server->co_trip);
     }
 
-    aio_context_release(server->ctx);
-
     if (server->listener) {
         qio_net_listener_disconnect(server->listener);
         object_unref(OBJECT(server->listener));
-- 
2.39.2


