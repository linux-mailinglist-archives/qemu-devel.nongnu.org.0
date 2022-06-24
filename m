Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D833C559D99
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:48:04 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lXP-000170-Kb
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRB-0006ah-1b
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR5-0000tO-MY
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFIvPH+fdjrHK1JSwlSp/ERGBTgIqaOOG2KfwhXX78A=;
 b=GjCkdIZD+fzlfz8xmOPqiseejwTWgJCsQ5nLEZUNDKCYIz58XOwc8emhmaEA+ft9cIPggT
 hTE2Nxpw5cTm9kSbGdG02JruaVZ9TYj5id0jIF5LbtpA94upbIjuLke36fRZ0rXGD5kMhG
 eIzJ7plASgKMAWB7arNujwZ/qZkeZmo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-Q4ensA69MjOu7GNfLrz-LQ-1; Fri, 24 Jun 2022 11:41:29 -0400
X-MC-Unique: Q4ensA69MjOu7GNfLrz-LQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69E38382ECCA;
 Fri, 24 Jun 2022 15:41:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA15A492C3B;
 Fri, 24 Jun 2022 15:41:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 17/20] aio_wait_kick: add missing memory barrier
Date: Fri, 24 Jun 2022 17:41:00 +0200
Message-Id: <20220624154103.185902-18-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

It seems that aio_wait_kick always required a memory barrier
or atomic operation in the caller, but nobody actually
took care of doing it.

Let's put the barrier in the function instead, and pair it
with another one in AIO_WAIT_WHILE. Read aio_wait_kick()
comment for further explanation.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220524173054.12651-1-eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/aio-wait.h |  2 ++
 util/aio-wait.c          | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index b39eefb38d..54840f8622 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -81,6 +81,8 @@ extern AioWait global_aio_wait;
     AioContext *ctx_ = (ctx);                                      \
     /* Increment wait_->num_waiters before evaluating cond. */     \
     qatomic_inc(&wait_->num_waiters);                              \
+    /* Paired with smp_mb in aio_wait_kick(). */                   \
+    smp_mb();                                                      \
     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
         while ((cond)) {                                           \
             aio_poll(ctx_, true);                                  \
diff --git a/util/aio-wait.c b/util/aio-wait.c
index bdb3d3af22..98c5accd29 100644
--- a/util/aio-wait.c
+++ b/util/aio-wait.c
@@ -35,7 +35,21 @@ static void dummy_bh_cb(void *opaque)
 
 void aio_wait_kick(void)
 {
-    /* The barrier (or an atomic op) is in the caller.  */
+    /*
+     * Paired with smp_mb in AIO_WAIT_WHILE. Here we have:
+     * write(condition);
+     * aio_wait_kick() {
+     *      smp_mb();
+     *      read(num_waiters);
+     * }
+     *
+     * And in AIO_WAIT_WHILE:
+     * write(num_waiters);
+     * smp_mb();
+     * read(condition);
+     */
+    smp_mb();
+
     if (qatomic_read(&global_aio_wait.num_waiters)) {
         aio_bh_schedule_oneshot(qemu_get_aio_context(), dummy_bh_cb, NULL);
     }
-- 
2.35.3


