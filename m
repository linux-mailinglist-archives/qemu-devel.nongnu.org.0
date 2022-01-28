Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73749FE3F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:43:34 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDULV-0005AR-V4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:43:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDTXH-0007YH-Ne
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nDTXE-0001G4-F2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643385095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XIIUv5uqy0sjqvNCzWvSgWTBko21v8VJtK52bGBa8+8=;
 b=U3EVrnD46q646RDG3xffheQ6ZlSCEj/PIV08f0DMrCsyRCxf3af6kC2/jDoGAgQ8wHNxq8
 3ZkW+lSGldlm8ZqffgDp7nCw+/JkC7MBHJYuj1D8yTsKX8qvGCLJiNeG1Speqjx8Y4XmqY
 JLKLetJx9QACYIElpjTeY0KGQOKP/mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-bWxlMEeSOn6ehHTcNABbsg-1; Fri, 28 Jan 2022 10:51:33 -0500
X-MC-Unique: bWxlMEeSOn6ehHTcNABbsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7458986A8A0;
 Fri, 28 Jan 2022 15:51:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191B710A48A4;
 Fri, 28 Jan 2022 15:51:31 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC] block/nbd: Move s->ioc on AioContext change
Date: Fri, 28 Jan 2022 16:51:30 +0100
Message-Id: <20220128155130.13326-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1990835
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
This is an RFC because I believe there are some other things in the NBD
block driver that need attention on an AioContext change, too.  Namely,
there are two timers (reconnect_delay_timer and open_timer) that are
also attached to the node's AioContext, and I'm afraid they need to be
handled, too.  Probably pause them on detach, and resume them on attach,
but I'm not sure, which is why I'm posting this as an RFC to get some
comments from that from someone who knows this code better than me. :)

(Also, in a real v1, of course I'd want to add a regression test.)
---
 block/nbd.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 63dbfa807d..119a774c04 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2036,6 +2036,25 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
     nbd_co_establish_connection_cancel(s->conn);
 }
 
+static void nbd_attach_aio_context(BlockDriverState *bs,
+                                   AioContext *new_context)
+{
+    BDRVNBDState *s = bs->opaque;
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
+    if (s->ioc) {
+        qio_channel_detach_aio_context(s->ioc);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2059,6 +2078,9 @@ static BlockDriver bdrv_nbd = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_tcp = {
@@ -2084,6 +2106,9 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_unix = {
@@ -2109,6 +2134,9 @@ static BlockDriver bdrv_nbd_unix = {
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


