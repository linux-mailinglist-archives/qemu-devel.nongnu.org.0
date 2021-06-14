Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCD03A5E70
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:34:30 +0200 (CEST)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi3B-0001CN-7a
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyh-0002aS-FL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyf-0005xo-S8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zelo7l4Q4l4sjPAGLee4r67wQxcFSjyTneZmhHdBz90=;
 b=fT2BvKjZSu2YJsIGtQHB9C6VrREBGS7/1NVu6mhgqok69RvJ822Af+b9TE6VEF4vMXOjGE
 XmzrvgOvvjGttFw5IcaKxlAN28FqdQqFLRWE7HZTxfedfqbTcaueEsgF0OMl6xLu6ADUtr
 UdupLESI8ERTFLAMnXNDReL2fn7wh+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-h6PEQpaVOiCDriW7ODLn-Q-1; Mon, 14 Jun 2021 04:29:45 -0400
X-MC-Unique: h6PEQpaVOiCDriW7ODLn-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F20DA100C609;
 Mon, 14 Jun 2021 08:29:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9FD45D9E2;
 Mon, 14 Jun 2021 08:29:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 4/6] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
Date: Mon, 14 Jun 2021 10:29:29 +0200
Message-Id: <20210614082931.24925-5-eesposit@redhat.com>
In-Reply-To: <20210614082931.24925-1-eesposit@redhat.com>
References: <20210614082931.24925-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That would be unsafe in case a rule other than the current one
is removed while the coroutine has yielded.
Keep FOREACH_SAFE because suspend_request deletes the current rule.

After this patch, *all* matching rules are deleted before suspending
the coroutine, rather than just one.
This doesn't affect the existing testcases.

Use actions_count to see how many yield to issue.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/blkdebug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 6bdeb2c7b3..dd82131d1e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -789,7 +789,6 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
     if (!qtest_enabled()) {
         printf("blkdebug: Suspended request '%s'\n", r->tag);
     }
-    qemu_coroutine_yield();
 }
 
 static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
@@ -834,6 +833,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
     QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
         process_rule(bs, rule, actions_count);
     }
+
+    while (actions_count[ACTION_SUSPEND] > 0) {
+        qemu_coroutine_yield();
+        actions_count[ACTION_SUSPEND]--;
+    }
+
     s->state = s->new_state;
 }
 
-- 
2.31.1


