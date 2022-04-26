Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88380510A2C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:17:42 +0200 (CEST)
Received: from localhost ([::1]:45662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRcz-0002yH-EO
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRat-0008Kf-Bk
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaq-0007gt-Pb
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTrsDlN9xhRX7GYJUpvfuOluOwFl3yswP0XNV/kGm+Y=;
 b=IR1Ekd74HhRcV38QIUKtGVDshjKOs+cTVoSQDJKBBUAZfLa1sRsAg4aRsCUZ/XYybH9c+u
 05yC1yJ71VfbtSFJe8BpyjE1J11wYICkoKxnxxdaKIMJrJtGom1tTA+Axs+ltDVZHYAc4w
 xLP6XRX/Qc0x8ox/NGkqkQxYNysYdzU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-c5XJN1A7N0K-2n3Ln-uunQ-1; Tue, 26 Apr 2022 16:15:22 -0400
X-MC-Unique: c5XJN1A7N0K-2n3Ln-uunQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8246B3810D25;
 Tue, 26 Apr 2022 20:15:21 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEF2E5550B2;
 Tue, 26 Apr 2022 20:15:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] nbd: safeguard against waking up invalid coroutine
Date: Tue, 26 Apr 2022 15:15:05 -0500
Message-Id: <20220426201514.170410-5-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The .reply_possible field of s->requests is never set to false.  This is
not a problem as it is only a safeguard to detect protocol errors,
but it's sloppy.  In fact, the field is actually not necessary at all,
because .coroutine is set to NULL in NBD_FOREACH_REPLY_CHUNK after
receiving the last chunk.  Thus, replace .reply_possible with .coroutine
and move the check before deciding the fate of this request.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-2-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 567872ac5338..1f9716094924 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -58,7 +58,6 @@ typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
     bool receiving;         /* sleeping in the yield in nbd_receive_replies */
-    bool reply_possible;    /* reply header not yet received */
 } NBDClientRequest;

 typedef enum NBDClientState {
@@ -454,15 +453,15 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
-        if (s->reply.handle == handle) {
-            /* We are done */
-            return 0;
-        }
         ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
+        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
+        if (s->reply.handle == handle) {
+            /* We are done */
+            return 0;
+        }
         nbd_recv_coroutine_wake_one(&s->requests[ind2]);
     }
 }
@@ -505,7 +504,6 @@ static int nbd_co_send_request(BlockDriverState *bs,
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
-    s->requests[i].reply_possible = true;

     request->handle = INDEX_TO_HANDLE(s, i);

-- 
2.35.1


