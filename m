Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD63A8A7E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:57:35 +0200 (CEST)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG7q-0000pp-Dw
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFys-0001zT-PL
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyq-000131-Jl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxaToqXqET+32RXmcOxyTCwSQw6bTuWZJnfHX32Y7h8=;
 b=YLiUdIZQQTJ99X/wFyaqZNa8EZuU1EDCOb/ewuxrdqdfy+1oB7r0ZEA9Qug/ahsVq94RDl
 QqEEm0rBZarvTVtfG2/IKdz2Upj7UvTk79otaCz9ecA57T7Cf/QWGE4M+8hPVav5VRrVzd
 ALHiBSwBrqr4pHYZWKkHiJeSUKCb/34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-gN8luQ-hOAqehK4FaSaNYA-1; Tue, 15 Jun 2021 16:48:12 -0400
X-MC-Unique: gN8luQ-hOAqehK4FaSaNYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 388238015DB;
 Tue, 15 Jun 2021 20:48:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7795D9E2;
 Tue, 15 Jun 2021 20:48:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/34] block/nbd: call socket_address_parse_named_fd() in
 advance
Date: Tue, 15 Jun 2021 15:47:30 -0500
Message-Id: <20210615204756.281505-9-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Detecting monitor by current coroutine works bad when we are not in
coroutine context. And that's exactly so in nbd reconnect code, where
qio_channel_socket_connect_sync() is called from thread.

Monitor is needed only to parse named file descriptor. So, let's just
parse it during nbd_open(), so that all further users of s->saddr don't
need to access monitor.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-7-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index f3a036354dc7..1c99654ef7e5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2140,6 +2140,12 @@ static SocketAddress *nbd_config(BDRVNBDState *s, QDict *options,
         goto done;
     }

+    if (socket_address_parse_named_fd(saddr, errp) < 0) {
+        qapi_free_SocketAddress(saddr);
+        saddr = NULL;
+        goto done;
+    }
+
 done:
     qobject_unref(addr);
     visit_free(iv);
-- 
2.31.1


