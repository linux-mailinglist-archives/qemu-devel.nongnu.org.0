Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5313A8A8F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:03:21 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGDQ-0002xC-PF
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyn-0001im-Pb
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyj-0000y5-Ro
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPL7tIn4VeWEaXBmh8QQ5kKPViX3Mn24TzXBre3WcZ4=;
 b=f8ZnkaBATYX1sWPvAlrrOpnZ5FzV3Q/tc/ZWkmDrjBJ0Wh69VQgynj3gLL6TFUy5iQPa/O
 Et7GGiKnJPl9qVj1run6luV7foNIb2cvNG6senF6tSgrkBjx99VyzVzUXEIwXLqLIXrGny
 /spMBnI0bf4VVdzYJeiMjArpxL9QxBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-6zA-JQKPOTitt3Vue_zoTA-1; Tue, 15 Jun 2021 16:48:07 -0400
X-MC-Unique: 6zA-JQKPOTitt3Vue_zoTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA40195D577;
 Tue, 15 Jun 2021 20:48:06 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 342BE5D9E2;
 Tue, 15 Jun 2021 20:48:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/34] block/nbd: connect_thread_func(): do
 qio_channel_set_delay(false)
Date: Tue, 15 Jun 2021 15:47:28 -0500
Message-Id: <20210615204756.281505-7-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

nbd_open() does it (through nbd_establish_connection()).
Actually we lost that call on reconnect path in 1dc4718d849e1a1fe
"block/nbd: use non-blocking connect: fix vm hang on connect()"
when we have introduced reconnect thread.

Fixes: 1dc4718d849e1a1fe665ce5241ed79048cfa2cfc
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-5-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 01d2c2efad63..f3a036354dc7 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -408,6 +408,8 @@ static void *connect_thread_func(void *opaque)
         thr->sioc = NULL;
     }

+    qio_channel_set_delay(QIO_CHANNEL(thr->sioc), false);
+
     qemu_mutex_lock(&thr->mutex);

     switch (thr->state) {
-- 
2.31.1


