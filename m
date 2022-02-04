Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF64A9852
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:19:59 +0100 (CET)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwdC-0002gs-JV
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwTv-00039r-Ls
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwTt-0004Sr-NO
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0p2MbAYvGEK+H05cwgHZfnLWgyD6KUNR2DRN2LojXP8=;
 b=WYqTP1jWHLx5iX5FBdYjR30gYtnAvVbOT+/s3RyLtbrJE11Ku81IalrzrwBpXB/l+UtUpc
 Vq5D1MHdco8IfbemJNZ5NbzGJJ6nAmwGTE1B1T7lh7FPg93qxAgmHADZfBG9+s9fdzzH1j
 XtDh6vsOf77DyHDhwsnx+UY1QwILuWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-Wa_iISQnPNKt5qYWo2UCQw-1; Fri, 04 Feb 2022 06:10:20 -0500
X-MC-Unique: Wa_iISQnPNKt5qYWo2UCQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E00B100CCC7;
 Fri,  4 Feb 2022 11:10:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B75F57B6EC;
 Fri,  4 Feb 2022 11:10:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/7] block/nbd: Delete open timer when done
Date: Fri,  4 Feb 2022 12:10:07 +0100
Message-Id: <20220204111012.34720-3-hreitz@redhat.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We start the open timer to cancel the connection attempt after a while.
Once nbd_do_establish_connection() has returned, the attempt is over,
and we no longer need the timer.

Delete it before returning from nbd_open(), so that it does not persist
for longer.  It has no use after nbd_open(), and just like the reconnect
delay timer, it might well be dangerous if it were to fire afterwards.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 16cd7fef77..5ff8a57314 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1885,11 +1885,19 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
+    /*
+     * The connect attempt is done, so we no longer need this timer.
+     * Delete it, because we do not want it to be around when this node
+     * is drained or closed.
+     */
+    open_timer_del(s);
+
     nbd_client_connection_enable_retry(s->conn);
 
     return 0;
 
 fail:
+    open_timer_del(s);
     nbd_clear_bdrvstate(bs);
     return ret;
 }
-- 
2.34.1


