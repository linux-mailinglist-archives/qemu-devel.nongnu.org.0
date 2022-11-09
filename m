Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9996230BD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:55:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoMA-0005m9-AU; Wed, 09 Nov 2022 11:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM7-0005iQ-Q9
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM6-0007Cg-EA
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668012913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GoPyUzlp4ewB5aVuOklPFzlcWGFhkDh3wdADGNvjG3w=;
 b=gYCmKqrzwUR6DIYYG2rSzJLm021EpzXgG1IWJD+5h1Y8E5QhbHGfc5G1TOJnouMzhY9N6d
 1nyZxnkcaPgCbOH0O6iaD9PSP8p3QwZ8TVG+p9esjf5N3vLATQjycG3vRqa0/dEK4YUXij
 9nMzfjh7+b/ziRH7Jf4RGsXygvKMiGo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-SbZwEd_YMaqppxSOD049cQ-1; Wed, 09 Nov 2022 11:55:10 -0500
X-MC-Unique: SbZwEd_YMaqppxSOD049cQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FC512833B0B;
 Wed,  9 Nov 2022 16:54:57 +0000 (UTC)
Received: from localhost (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7D02166B30;
 Wed,  9 Nov 2022 16:54:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH for-7.2 2/5] block/mirror: Drop mirror_wait_for_any_operation()
Date: Wed,  9 Nov 2022 17:54:49 +0100
Message-Id: <20221109165452.67927-3-hreitz@redhat.com>
In-Reply-To: <20221109165452.67927-1-hreitz@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

mirror_wait_for_free_in_flight_slot() is the only remaining user of
mirror_wait_for_any_operation(), so inline the latter into the former.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/mirror.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index e5467b0053..5b6f42392c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -305,19 +305,21 @@ static int mirror_cow_align(MirrorBlockJob *s, int64_t *offset,
 }
 
 static inline void coroutine_fn
-mirror_wait_for_any_operation(MirrorBlockJob *s, bool active)
+mirror_wait_for_free_in_flight_slot(MirrorBlockJob *s)
 {
     MirrorOp *op;
 
     QTAILQ_FOREACH(op, &s->ops_in_flight, next) {
-        /* Do not wait on pseudo ops, because it may in turn wait on
+        /*
+         * Do not wait on pseudo ops, because it may in turn wait on
          * some other operation to start, which may in fact be the
          * caller of this function.  Since there is only one pseudo op
          * at any given time, we will always find some real operation
-         * to wait on. */
-        if (!op->is_pseudo_op && op->is_in_flight &&
-            op->is_active_write == active)
-        {
+         * to wait on.
+         * Also, do not wait on active operations, because they do not
+         * use up in-flight slots.
+         */
+        if (!op->is_pseudo_op && op->is_in_flight && !op->is_active_write) {
             qemu_co_queue_wait(&op->waiting_requests, NULL);
             return;
         }
@@ -325,13 +327,6 @@ mirror_wait_for_any_operation(MirrorBlockJob *s, bool active)
     abort();
 }
 
-static inline void coroutine_fn
-mirror_wait_for_free_in_flight_slot(MirrorBlockJob *s)
-{
-    /* Only non-active operations use up in-flight slots */
-    mirror_wait_for_any_operation(s, false);
-}
-
 /* Perform a mirror copy operation.
  *
  * *op->bytes_handled is set to the number of bytes copied after and
-- 
2.36.1


