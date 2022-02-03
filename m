Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201674A889F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:34:53 +0100 (CET)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFf4N-0002Mt-To
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0K-0007yj-09
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0E-00007G-UD
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643905834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WNSXZb0CfazjaLqKJNvpi+xiMFdTNSe4k139keRfjo=;
 b=d+rTifpiDQqPmZmIugqXZTW1zqgrJ6S3p98bKCLEMyVes+vUXVXEDbGYDenaPHIkKsJNXo
 rZPrfpC3G0vMo2b9n6HQ92zw1HSx1L5uisKJ8fm5itDi94d2IlmnFCZJcTMnz9R2P1X+lt
 Q3gQPYZl1bOkLasmDIOB+SI2mzboNug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-_DeE4YXAMJ6yq4i2bARnCg-1; Thu, 03 Feb 2022 11:30:30 -0500
X-MC-Unique: _DeE4YXAMJ6yq4i2bARnCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5694839A42;
 Thu,  3 Feb 2022 16:30:29 +0000 (UTC)
Received: from localhost (unknown [10.39.193.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F77284D24;
 Thu,  3 Feb 2022 16:30:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/7] block/nbd: Delete reconnect delay timer when done
Date: Thu,  3 Feb 2022 17:30:18 +0100
Message-Id: <20220203163024.38913-2-hreitz@redhat.com>
In-Reply-To: <20220203163024.38913-1-hreitz@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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

We start the reconnect delay timer to cancel the reconnection attempt
after a while.  Once nbd_co_do_establish_connection() has returned, this
attempt is over, and we no longer need the timer.

Delete it before returning from nbd_reconnect_attempt(), so that it does
not persist beyond the I/O request that was paused for reconnecting; we
do not want it to fire in a drained section, because all sort of things
can happen in such a section (e.g. the AioContext might be changed, and
we do not want the timer to fire in the wrong context; or the BDS might
even be deleted, and so the timer CB would access already-freed data).

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


