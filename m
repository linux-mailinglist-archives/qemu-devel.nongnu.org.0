Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239126CAEA3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 21:30:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgsXj-0001uL-5C; Mon, 27 Mar 2023 15:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pgsXZ-0001tm-Rr
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pgsXY-0005fU-6G
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679945398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fa2PP890Ps8Y9V+XOUxj4Q1L4hnirMxpO82Cb2yDkd8=;
 b=WnOT5fMNdMp29sJ1sN41g4x3KyHAxdVbcyhRkZDkfZpAdIRj5xKN7KV2TLT3SyRCIyX0Hv
 8wZcJ+dPs7qg6ido8LQoB+wpjfeCRhGqHvL3gcWhMSk2fVcHWp7YLL5AGUH5eJjWhlE3Nf
 luG9MY9GVIvvzolTOigMR/cad0ipj54=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-o0NonISEM7qHamL4RK3mRg-1; Mon, 27 Mar 2023 15:29:55 -0400
X-MC-Unique: o0NonISEM7qHamL4RK3mRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E353C10144;
 Mon, 27 Mar 2023 19:29:54 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35223C15BA0;
 Mon, 27 Mar 2023 19:29:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Florian Westphal <fw@strlen.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH for-8.0] nbd/server: Request TCP_NODELAY
Date: Mon, 27 Mar 2023 14:29:47 -0500
Message-Id: <20230327192947.1324372-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

Nagle's algorithm adds latency in order to reduce network packet
overhead on small packets.  But when we are already using corking to
merge smaller packets into transactional requests, the extra delay
from TCP defaults just gets in the way.

For reference, qemu as an NBD client already requests TCP_NODELAY (see
nbd_connect() in nbd/client-connection.c); as does libnbd as a client
[1], and nbdkit as a server [2].

[1] https://gitlab.com/nbdkit/libnbd/-/blob/a48a1142/generator/states-connect.c#L39
[2] https://gitlab.com/nbdkit/nbdkit/-/blob/45b72f5b/server/sockets.c#L430

CC: Florian Westphal <fw@strlen.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nbd/server.c b/nbd/server.c
index a4750e41880..976223860bf 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2755,6 +2755,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
     }
     client->tlsauthz = g_strdup(tlsauthz);
     client->sioc = sioc;
+    qio_channel_set_delay(QIO_CHANNEL(cioc), false);
     object_ref(OBJECT(client->sioc));
     client->ioc = QIO_CHANNEL(sioc);
     object_ref(OBJECT(client->ioc));

base-commit: e3debd5e7d0ce031356024878a0a18b9d109354a
-- 
2.39.2


