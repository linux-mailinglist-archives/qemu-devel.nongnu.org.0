Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9855454B97
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:07:10 +0100 (CET)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOOr-0003YA-HD
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:07:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnOKb-00053T-To
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnOKW-00047v-3F
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637168558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qe1/1VXXsPYjIhnJjmG1lHnXhuOOlyZUq0OJIq2hEbA=;
 b=FYe2HZ3Va4yjO9hN3Oj3tqptbi1s7KBEX6wgh50KvVgGK9HBabMpqQbz/QJ4tKIxFdXloO
 ktX0LeTtlnn3UyVmzanWzG8va4YKhpIj82L9wisvjMJ7qfnl5dgEpeapltzL8X4o2SfytU
 5JGLviQGa7tboBsOrw8u8W5h4Zf8jQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-olR736txPN6FUHJ0a9qpcA-1; Wed, 17 Nov 2021 12:02:35 -0500
X-MC-Unique: olR736txPN6FUHJ0a9qpcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293D98042F0;
 Wed, 17 Nov 2021 17:02:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0AC71F450;
 Wed, 17 Nov 2021 17:02:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2? 2/2] nbd/server: Simplify zero and trim
Date: Wed, 17 Nov 2021 11:02:30 -0600
Message-Id: <20211117170230.1128262-3-eblake@redhat.com>
In-Reply-To: <20211117170230.1128262-1-eblake@redhat.com>
References: <20211117170230.1128262-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, rjones@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the block layer supports 64-bit operations, we no longer have
to self-fragment requests larger than 2G, reverting the workaround
added in 890cbccb08 (nbd: Fix large trim/zero requests).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 85877f630533..1b3945220bd3 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2509,16 +2509,8 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (request->flags & NBD_CMD_FLAG_FAST_ZERO) {
             flags |= BDRV_REQ_NO_FALLBACK;
         }
-        ret = 0;
-        /* FIXME simplify this when blk_pwrite_zeroes switches to 64-bit */
-        while (ret >= 0 && request->len) {
-            int align = client->check_align ?: 1;
-            int len = MIN(request->len, QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
-                                                        align));
-            ret = blk_pwrite_zeroes(exp->common.blk, request->from, len, flags);
-            request->len -= len;
-            request->from += len;
-        }
+        ret = blk_pwrite_zeroes(exp->common.blk, request->from, request->len,
+                                flags);
         return nbd_send_generic_reply(client, request->handle, ret,
                                       "writing to file failed", errp);

@@ -2532,16 +2524,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                                       "flush failed", errp);

     case NBD_CMD_TRIM:
-        ret = 0;
-        /* FIXME simplify this when blk_co_pdiscard switches to 64-bit */
-        while (ret >= 0 && request->len) {
-            int align = client->check_align ?: 1;
-            int len = MIN(request->len, QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
-                                                        align));
-            ret = blk_co_pdiscard(exp->common.blk, request->from, len);
-            request->len -= len;
-            request->from += len;
-        }
+        ret = blk_co_pdiscard(exp->common.blk, request->from, request->len);
         if (ret >= 0 && request->flags & NBD_CMD_FLAG_FUA) {
             ret = blk_co_flush(exp->common.blk);
         }
-- 
2.33.1


