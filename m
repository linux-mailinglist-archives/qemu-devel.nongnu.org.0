Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FB4A984C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:16:43 +0100 (CET)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwa2-0006DQ-Fa
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:16:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwTv-0003A1-QI
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwTt-0004Sk-HA
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yh8Oyf0DC8cMbFk20Sr83OIGqc+Ytpp0rPUUt7UE3bg=;
 b=U6Kce5aJBZnCqwvjZ5F5k3qQ9LK9bWf8TK7x8yRa5d9eqaD7P/9NC63o7TN2DA5Ubgwv8B
 k0/aec35NKjwu+D/+ALa43+jLjnQpC1FU7NxVXfvUV5oUtGs2QpkYKOJARxRdh7Je6E38L
 pKOV5CJtArvnpbT+mQi2YR+Lfd0aCXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-Wz-tdZu2M-aL-jUMRrNsHQ-1; Fri, 04 Feb 2022 06:10:18 -0500
X-MC-Unique: Wz-tdZu2M-aL-jUMRrNsHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A00D1091DA5;
 Fri,  4 Feb 2022 11:10:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1AE77D71E;
 Fri,  4 Feb 2022 11:10:16 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/7] block/nbd: Delete reconnect delay timer when done
Date: Fri,  4 Feb 2022 12:10:06 +0100
Message-Id: <20220204111012.34720-2-hreitz@redhat.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We start the reconnect delay timer to cancel the reconnection attempt
after a while.  Once nbd_co_do_establish_connection() has returned, this
attempt is over, and we no longer need the timer.

Delete it before returning from nbd_reconnect_attempt(), so that it does
not persist beyond the I/O request that was paused for reconnecting; we
do not want it to fire in a drained section, because all sort of things
can happen in such a section (e.g. the AioContext might be changed, and
we do not want the timer to fire in the wrong context; or the BDS might
even be deleted, and so the timer CB would access already-freed data).

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 63dbfa807d..16cd7fef77 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -381,6 +381,13 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     }
 
     nbd_co_do_establish_connection(s->bs, NULL);
+
+    /*
+     * The reconnect attempt is done (maybe successfully, maybe not), so
+     * we no longer need this timer.  Delete it so it will not outlive
+     * this I/O request (so draining removes all timers).
+     */
+    reconnect_delay_timer_del(s);
 }
 
 static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
-- 
2.34.1


