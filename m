Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501213A8A75
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:53:07 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG3W-0002Da-B7
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyj-0001Zs-AC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyh-0000vk-3b
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtJew8wW0RSFLaTtJ46vtbsdZhNnPEfaTbUSdYtdQ0w=;
 b=BzryTI0GMhaF1d8VtZDiS7EEwour96IlA5G4/sVeQ77XcWWBz6YGp643obW4APlbnbHR0R
 s4e39y+acBa2v28ot7oT1LKPiY8M2tpUIjZTg8MVNsGxji9lKMvm45is19JaNg2Q8MnRtq
 qjmAyX6UCVRH5610fyXsT+YXaI3IQlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160--y7cCFxMN3iRa4zO_ccTJw-1; Tue, 15 Jun 2021 16:48:04 -0400
X-MC-Unique: -y7cCFxMN3iRa4zO_ccTJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AAA7801106;
 Tue, 15 Jun 2021 20:48:04 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B145F5D9CA;
 Tue, 15 Jun 2021 20:48:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/34] co-queue: drop extra coroutine_fn marks
Date: Tue, 15 Jun 2021 15:47:25 -0500
Message-Id: <20210615204756.281505-4-eblake@redhat.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

qemu_co_queue_next() and qemu_co_queue_restart_all() just call
aio_co_wake() which works well in non-coroutine context. So these
functions can be called from non-coroutine context as well. And
actually qemu_co_queue_restart_all() is called from
nbd_cancel_in_flight(), which is called from non-coroutine context.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-2-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/coroutine.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 292e61aef0c2..4829ff373d3c 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -210,13 +210,15 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.
  * Returns true if a coroutine was removed, false if the queue is empty.
+ * OK to run from coroutine and non-coroutine context.
  */
-bool coroutine_fn qemu_co_queue_next(CoQueue *queue);
+bool qemu_co_queue_next(CoQueue *queue);

 /**
  * Empties the CoQueue; all coroutines are woken up.
+ * OK to run from coroutine and non-coroutine context.
  */
-void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue);
+void qemu_co_queue_restart_all(CoQueue *queue);

 /**
  * Removes the next coroutine from the CoQueue, and wake it up.  Unlike
-- 
2.31.1


