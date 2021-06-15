Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71D3A8B0E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:24:06 +0200 (CEST)
Received: from localhost ([::1]:46244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGXV-0006zZ-1N
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzN-0003Kc-TG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzB-0001Hd-7d
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5lplDQFodWakYe4TIKYQfbPLYdG62Lnumqe7JGcOC0=;
 b=iKkGsoNcX4nhjld2m8H+SbCSrFA1kQR88UtnX65V86IBrt2ArjthW6DAFvP+eW1ULKULFe
 jmhZh/+lZnOSy58RjFNZhf3KvseJLaS6VFwTKA6xfmM/vzOHln82dLIJytM/cLwL1v5ahd
 NQV6ThZQ5KXlDx3tsUjZUc6lOaAZMTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-IectG_BtOEK_QtK7Bw8eRg-1; Tue, 15 Jun 2021 16:48:34 -0400
X-MC-Unique: IectG_BtOEK_QtK7Bw8eRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC8F3FC9E;
 Tue, 15 Jun 2021 20:48:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616805D9CA;
 Tue, 15 Jun 2021 20:48:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/34] block/nbd: safer transition to receiving request
Date: Tue, 15 Jun 2021 15:47:56 -0500
Message-Id: <20210615204756.281505-35-eblake@redhat.com>
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

req->receiving is a flag of request being in one concrete yield point
in nbd_co_do_receive_one_chunk().

Such kind of boolean flag is always better to unset before scheduling
the coroutine, to avoid double scheduling. So, let's be more careful.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-33-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5cfb749e089d..3cbee762de8d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -150,6 +150,7 @@ static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
         NBDClientRequest *req = &s->requests[i];

         if (req->coroutine && req->receiving) {
+            req->receiving = false;
             aio_co_wake(req->coroutine);
         }
     }
@@ -548,6 +549,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
          *   connection_co happens through a bottom half, which can only
          *   run after we yield.
          */
+        s->requests[i].receiving = false;
         aio_co_wake(s->requests[i].coroutine);
         qemu_coroutine_yield();
     }
@@ -934,7 +936,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     /* Wait until we're woken up by nbd_connection_entry.  */
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
-    s->requests[i].receiving = false;
+    assert(!s->requests[i].receiving);
     if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
-- 
2.31.1


