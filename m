Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DFA3CE8D0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:31:44 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5X7G-0004nN-Tg
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2z-0005C3-ER
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2x-0003bU-8Y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626715634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnwJfIIpdzYND3bS03e3cI7ygpHvu0x9lIHcH4CR5RA=;
 b=jKDfRPhQQQl6RpWhxFDFqmZaA3YKKEFJaoHJdshwNLre6HKPWl8DZPgIHuPjIXPEX2hHv9
 kkOgSW03joWTqdu/oQWapMhwimSJKlaZdS7Lc9WD6/jStCAjxMuTNZ7NF/h8WXERbOvMwz
 f1WDYGkCBWVyHA/I0r+grAy0TCg6+IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-aNMUEk2iMKG2YXbpVPsU9g-1; Mon, 19 Jul 2021 13:27:11 -0400
X-MC-Unique: aNMUEk2iMKG2YXbpVPsU9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9AD804141;
 Mon, 19 Jul 2021 17:27:09 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 452CB61093;
 Mon, 19 Jul 2021 17:27:09 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/6] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
Date: Mon, 19 Jul 2021 19:26:56 +0200
Message-Id: <20210719172658.715442-5-mreitz@redhat.com>
In-Reply-To: <20210719172658.715442-1-mreitz@redhat.com>
References: <20210719172658.715442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

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
Message-Id: <20210614082931.24925-5-eesposit@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
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


