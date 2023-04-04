Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF36D559E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 02:43:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjUkf-0001uo-NZ; Mon, 03 Apr 2023 20:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjUkc-0001uW-MS
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 20:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjUjH-0005tz-OX
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 20:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680568854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ghimxv6q2GZqhNn00GP/SmdJfIdYbYnsMJqJgbJ/IwU=;
 b=dRZirAlMQStDdG548Giec02rREYKCNv/ncLtxeUSVj/UkiTq0ScM1Vw8TntMPAaMwcWC5f
 BtcnYVXMz2CGUv+hqpR0zeQ/zHHLRLY07la5JjUsc0uJ5ZPBMMtsxFCp21Y+hy15di51L/
 iUHkKSOzyv9Kg3D+5pA7ugIZYlWL9dk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-67eh01FRNaWBv_myHO-c0w-1; Mon, 03 Apr 2023 20:40:51 -0400
X-MC-Unique: 67eh01FRNaWBv_myHO-c0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EEC3101A550;
 Tue,  4 Apr 2023 00:40:51 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AF522027040;
 Tue,  4 Apr 2023 00:40:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Florian Westphal <fw@strlen.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH v2 for 8.0?] nbd/server: Request TCP_NODELAY
Date: Mon,  3 Apr 2023 19:40:47 -0500
Message-Id: <20230404004047.142086-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20230327192947.1324372-1-eblake@redhat.com>
---

v2 fix typo, enhance commit message

Given that corking made it in through Kevin's tree for 8.0-rc2 but
this one did not, but I didn't get any R-b, is there any objection to
me doing a pull request to get this into 8.0-rc3?

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

base-commit: efcd0ec14b0fe9ee0ee70277763b2d538d19238d
-- 
2.39.2


