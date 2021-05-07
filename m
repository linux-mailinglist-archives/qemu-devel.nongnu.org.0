Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D283767C6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:16:48 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2Df-0002np-Td
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lf29M-0007D1-QY
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lf29L-0001rc-25
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620400338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPJI0wpYCTY0iQNa0rAI5UCS3nrZccZucaPyLMiMpFw=;
 b=VjZNTyPFrgep6kCsxbiQjJG0+hdCxj8TGbCE8P4KWwH21TEYKpo+4KLf8bx2V+Jsk7n5x5
 2HceWhF3fgJLmSkpcM/EXQsxIMlYeHjH+GWTh9ASfmoCJ9E7bPIKnpPD+GsLfHvZqjQ2bz
 PW6HBtyMnrq/c5jnCAbSQSQPs3EBbvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-ZIfZC44-OCmNNaFTG3PF5g-1; Fri, 07 May 2021 11:12:15 -0400
X-MC-Unique: ZIfZC44-OCmNNaFTG3PF5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0262107ACCA;
 Fri,  7 May 2021 15:12:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-137.ams2.redhat.com
 [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0425D9CC;
 Fri,  7 May 2021 15:12:12 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/5] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
Date: Fri,  7 May 2021 17:12:02 +0200
Message-Id: <20210507151203.39643-5-eesposit@redhat.com>
In-Reply-To: <20210507151203.39643-1-eesposit@redhat.com>
References: <20210507151203.39643-1-eesposit@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That would be unsafe in case a rule other than the current one
is removed while the coroutine has yielded.
Keep FOREACH_SAFE because suspend_request deletes the current rule.

After this patch, *all* matching rules are deleted before suspending
the coroutine, rather than just one.
This doesn't affect the existing testcases.

Use actions_count to see how many yeld to issue.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/blkdebug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 388b5ed615..dffd869b32 100644
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
2.30.2


