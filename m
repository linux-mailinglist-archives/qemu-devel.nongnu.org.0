Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6D3832D2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:54:17 +0200 (CEST)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liedM-0006NH-5P
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaL-0001wN-8R
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lieaJ-0004nt-He
 for qemu-devel@nongnu.org; Mon, 17 May 2021 10:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621263066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33QIVLtuBhoIzq+RHDiCreoWe4oLY1whxlrAWafcQ1Y=;
 b=E7DstBCJRG32Eq9ohizaWVNTv5U76oOrQ/Dqu9xtlaQpm3zKSIG+UJOApx5MMcQqFwtO8Z
 N5lno6aDYHEvaJZxCcfXmL4Rn5KmoKJr5AoLtjSAsbw7P2ThE3fXScvHnIofGaourWcjsB
 pL1DmQtJeTkUMrLpXhB3gmDZo7gd39g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-PJ1wyg06PWyT5TPuv35KLg-1; Mon, 17 May 2021 10:51:04 -0400
X-MC-Unique: PJ1wyg06PWyT5TPuv35KLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AB8B80ED8E;
 Mon, 17 May 2021 14:51:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-23.ams2.redhat.com
 [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3934C5D6D7;
 Mon, 17 May 2021 14:51:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 4/5] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
Date: Mon, 17 May 2021 16:50:48 +0200
Message-Id: <20210517145049.55268-5-eesposit@redhat.com>
In-Reply-To: <20210517145049.55268-1-eesposit@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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


