Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D296210F2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNrj-0007hv-TR; Tue, 08 Nov 2022 07:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrb-0007fs-PF
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrZ-0000PN-ML
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M41wqeY7k1iT6AvPvsFo70lZxD5TyMTs2NziNtkBCrU=;
 b=gFNtb/7ylC8k5qYSJwQlx/sY0Rl43ydSxMLShpg0Ot/o61ISvrUI1MECgE7F3qSoPULFZ7
 AVPvbbfEje/OwzBLvtTqidPT4Vx/s+UuAT1K7Z/RVearovzEh2314LMCNGzDmTyWJg9mZx
 73xbkEIj+9P2GZHxIS5QmXHvtPuyUfc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-q7av53KVPWOjUw_i7bDMxg-1; Tue, 08 Nov 2022 07:37:54 -0500
X-MC-Unique: q7av53KVPWOjUw_i7bDMxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 434AC3C0CD48;
 Tue,  8 Nov 2022 12:37:54 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28EA29E70;
 Tue,  8 Nov 2022 12:37:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 01/13] qed: Don't yield in bdrv_qed_co_drain_begin()
Date: Tue,  8 Nov 2022 13:37:26 +0100
Message-Id: <20221108123738.530873-2-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We want to change .bdrv_co_drained_begin() back to be a non-coroutine
callback, so in preparation, avoid yielding in its implementation.

Because we increase bs->in_flight and bdrv_drained_begin() polls, the
behaviour is unchanged.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qed.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index 2f36ad342c..013f826c44 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -282,9 +282,8 @@ static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
     qemu_co_mutex_unlock(&s->table_lock);
 }
 
-static void coroutine_fn qed_need_check_timer_entry(void *opaque)
+static void coroutine_fn qed_need_check_timer(BDRVQEDState *s)
 {
-    BDRVQEDState *s = opaque;
     int ret;
 
     trace_qed_need_check_timer_cb(s);
@@ -310,9 +309,20 @@ static void coroutine_fn qed_need_check_timer_entry(void *opaque)
     (void) ret;
 }
 
+static void coroutine_fn qed_need_check_timer_entry(void *opaque)
+{
+    BDRVQEDState *s = opaque;
+
+    qed_need_check_timer(opaque);
+    bdrv_dec_in_flight(s->bs);
+}
+
 static void qed_need_check_timer_cb(void *opaque)
 {
+    BDRVQEDState *s = opaque;
     Coroutine *co = qemu_coroutine_create(qed_need_check_timer_entry, opaque);
+
+    bdrv_inc_in_flight(s->bs);
     qemu_coroutine_enter(co);
 }
 
@@ -363,8 +373,12 @@ static void coroutine_fn bdrv_qed_co_drain_begin(BlockDriverState *bs)
      * header is flushed.
      */
     if (s->need_check_timer && timer_pending(s->need_check_timer)) {
+        Coroutine *co;
+
         qed_cancel_need_check_timer(s);
-        qed_need_check_timer_entry(s);
+        co = qemu_coroutine_create(qed_need_check_timer_entry, s);
+        bdrv_inc_in_flight(bs);
+        aio_co_enter(bdrv_get_aio_context(bs), co);
     }
 }
 
-- 
2.38.1


