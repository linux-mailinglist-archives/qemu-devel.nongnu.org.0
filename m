Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFDE35E062
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:43:53 +0200 (CEST)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJKa-0005hA-6L
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lWJGZ-0003Yw-W5
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lWJGY-0005VQ-HT
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618321181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SoxoYVPStABLgBvBamkLSFv17gsk6VRl6mPBexslps=;
 b=OiJidPEU1xum5ExA5pqwIpa8A+TrVpe+UGXKvSc1Nwwl4iG3xZ05YuPa4mf6dUJL9fNpWh
 Kpz0NJSUdBC/H+FxdyBkSxqsuztIiESJi+8OyU9Nfk88pQe54gPvfAp+9CjtvD6StGN3Vy
 8v14nEYzvsmXmf7gtYy8FiOJi3tDkVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Xw9GQ4xCOQOCWBdI0EjXOg-1; Tue, 13 Apr 2021 09:39:08 -0400
X-MC-Unique: Xw9GQ4xCOQOCWBdI0EjXOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB83284B9AB;
 Tue, 13 Apr 2021 13:39:07 +0000 (UTC)
Received: from localhost (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E9D6062F;
 Tue, 13 Apr 2021 13:39:07 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/1] block/nbd: fix possible use after free of s->connect_thread
Date: Tue, 13 Apr 2021 15:39:03 +0200
Message-Id: <20210413133903.545695-2-mreitz@redhat.com>
In-Reply-To: <20210413133903.545695-1-mreitz@redhat.com>
References: <20210413133903.545695-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If on nbd_close() we detach the thread (in
nbd_co_establish_connection_cancel() thr->state becomes
CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
s->connect_thread (which is set to NULL), as running thread may free it
at any time.

Still nbd_co_establish_connection() does exactly this: it saves
s->connect_thread to local variable (just for better code style) and
use it even after yield point, when thread may be already detached.

Fix that. Also check thr to be non-NULL on
nbd_co_establish_connection() start for safety.

After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
impossible in the second switch in nbd_co_establish_connection().
Still, don't add extra abort() just before the release. If it somehow
possible to reach this "case:" it won't hurt. Anyway, good refactoring
of all this reconnect mess will come soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/nbd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..1d4668d42d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -443,6 +443,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
 
+    if (!thr) {
+        /* detached */
+        return -1;
+    }
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -486,6 +491,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();
 
+    if (!s->connect_thread) {
+        /* detached */
+        return -1;
+    }
+    assert(thr == s->connect_thread);
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
-- 
2.29.2


