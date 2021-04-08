Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667035893F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:06:29 +0200 (CEST)
Received: from localhost ([::1]:50734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXAq-0000QV-1Z
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX4J-0003Oo-V1
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUX4I-00075r-Ee
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617897581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lZ1JQWRdUbvZMeKwtjx5Ul7LhWQSYp3XxMJIFM4kfE=;
 b=dqBROxR+xr50PxOqev1XkUvLNLU6t8ta/gr7p8JxsT7h8VisI/F5vrTS74Hwh2Pt9CjNP+
 ttBCsqi9CPFFdcG2RT8xOaDD+6pa7jIc0DrZWM8KvmGtZM49KmfBUv+IPkRTh8wsqwfRDE
 KU43C8mlgfGBBAiGn1FmB2OBlWp6kiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-KMoPBbysNXKz51644dFQng-1; Thu, 08 Apr 2021 11:59:28 -0400
X-MC-Unique: KMoPBbysNXKz51644dFQng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96FD7BBEE2;
 Thu,  8 Apr 2021 15:59:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-155.ams2.redhat.com
 [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5A455D6AC;
 Thu,  8 Apr 2021 15:59:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/5] blkdebug: do not suspend in the middle of
 QLIST_FOREACH_SAFE
Date: Thu,  8 Apr 2021 17:59:12 +0200
Message-Id: <20210408155913.53235-5-eesposit@redhat.com>
In-Reply-To: <20210408155913.53235-1-eesposit@redhat.com>
References: <20210408155913.53235-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


