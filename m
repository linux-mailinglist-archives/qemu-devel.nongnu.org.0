Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE894A88B9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:41:39 +0100 (CET)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfAw-0001Z3-Lv
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0t-0008IC-JV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0R-00009Q-Ad
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643905846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItNFeJ8ufoX3uuGQfNmnmxJlZPzBBwzibiijcWJPrUE=;
 b=boAPzyK7qrm+Od7B8zl2ck66l5QUp8lswkC/N9lYCBef0UqNf8NgVfIurAlwvrVUREr9aI
 ODi2gvxCZMJuRhJuvtUwnKCtuI1e2gB8/dFt9Un973yw7yMFHg5TK10zSNd5TYw+MPoQyd
 urNsNCXcCFvt8BslTw1ZCsM4Tr9vVi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-wJvwSbYyPd2k8pBW3B_aKg-1; Thu, 03 Feb 2022 11:30:43 -0500
X-MC-Unique: wJvwSbYyPd2k8pBW3B_aKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 206E1101F000;
 Thu,  3 Feb 2022 16:30:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC1C77E5AF;
 Thu,  3 Feb 2022 16:30:41 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 6/7] block/nbd: Move s->ioc on AioContext change
Date: Thu,  3 Feb 2022 17:30:23 +0100
Message-Id: <20220203163024.38913-7-hreitz@redhat.com>
In-Reply-To: <20220203163024.38913-1-hreitz@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

s->ioc must always be attached to the NBD node's AioContext.  If that
context changes, s->ioc must be attached to the new context.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2033626
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index dc6c3f3bbc..5853d85d60 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2055,6 +2055,42 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
     nbd_co_establish_connection_cancel(s->conn);
 }
 
+static void nbd_attach_aio_context(BlockDriverState *bs,
+                                   AioContext *new_context)
+{
+    BDRVNBDState *s = bs->opaque;
+
+    /* The open_timer is used only during nbd_open() */
+    assert(!s->open_timer);
+
+    /*
+     * The reconnect_delay_timer is scheduled in I/O paths when the
+     * connection is lost, to cancel the reconnection attempt after a
+     * given time.  Once this attempt is done (successfully or not),
+     * nbd_reconnect_attempt() ensures the timer is deleted before the
+     * respective I/O request is resumed.
+     * Since the AioContext can only be changed when a node is drained,
+     * the reconnect_delay_timer cannot be active here.
+     */
+    assert(!s->reconnect_delay_timer);
+
+    if (s->ioc) {
+        qio_channel_attach_aio_context(s->ioc, new_context);
+    }
+}
+
+static void nbd_detach_aio_context(BlockDriverState *bs)
+{
+    BDRVNBDState *s = bs->opaque;
+
+    assert(!s->open_timer);
+    assert(!s->reconnect_delay_timer);
+
+    if (s->ioc) {
+        qio_channel_detach_aio_context(s->ioc);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2078,6 +2114,9 @@ static BlockDriver bdrv_nbd = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_tcp = {
@@ -2103,6 +2142,9 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_unix = {
@@ -2128,6 +2170,9 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static void bdrv_nbd_init(void)
-- 
2.34.1


