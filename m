Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03B6D65A1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:43:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhsB-0004mh-8S; Tue, 04 Apr 2023 10:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjhs9-0004mF-Lh
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:42:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjhs7-00011H-OK
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680619375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iK0YJs6AFdPZXI0zDQKc4QmDHrG1yoVZ+v/BUIur+RI=;
 b=PrQS9YymIDZblYhUl6lKJJ2iDiiLupuK+GbwQCFRi8LQx0xbgfiSLhNqPb8RODMDX27+vx
 CtKmfdnUIwRJh/w8lHknfAiLYiaSRWv0Kqoqdrq7LOfUKTbtEb7J4YofsyKV9NDBfV0hWh
 fL7yHJoMAPVNReg9QMshoo9/kM/JN28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-f2xldtMiNwKBbcMuiHqeKg-1; Tue, 04 Apr 2023 10:42:53 -0400
X-MC-Unique: f2xldtMiNwKBbcMuiHqeKg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C546B8996E7;
 Tue,  4 Apr 2023 14:42:48 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF5C8492C14;
 Tue,  4 Apr 2023 14:42:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Florian Westphal <fw@strlen.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PULL 1/1] nbd/server: Request TCP_NODELAY
Date: Tue,  4 Apr 2023 09:42:44 -0500
Message-Id: <20230404144244.185609-2-eblake@redhat.com>
In-Reply-To: <20230404144244.185609-1-eblake@redhat.com>
References: <20230404144244.185609-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
from TCP defaults just gets in the way (see recent commit bd2cd4a4).

For reference, qemu as an NBD client already requests TCP_NODELAY (see
nbd_connect() in nbd/client-connection.c); as does libnbd as a client
[1], and nbdkit as a server [2].  Furthermore, the NBD spec recommends
the use of TCP_NODELAY [3].

[1] https://gitlab.com/nbdkit/libnbd/-/blob/a48a1142/generator/states-connect.c#L39
[2] https://gitlab.com/nbdkit/nbdkit/-/blob/45b72f5b/server/sockets.c#L430
[3] https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#protocol-phases

CC: Florian Westphal <fw@strlen.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20230404004047.142086-1-eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 nbd/server.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nbd/server.c b/nbd/server.c
index 848836d4140..3d8d0d81df2 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2758,6 +2758,7 @@ void nbd_client_new(QIOChannelSocket *sioc,
     }
     client->tlsauthz = g_strdup(tlsauthz);
     client->sioc = sioc;
+    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
     object_ref(OBJECT(client->sioc));
     client->ioc = QIO_CHANNEL(sioc);
     object_ref(OBJECT(client->ioc));
-- 
2.39.2


