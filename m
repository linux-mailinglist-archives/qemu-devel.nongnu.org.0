Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077EB545422
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:28:24 +0200 (CEST)
Received: from localhost ([::1]:42840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMtK-0001oZ-2b
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrp-0007sv-7H
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrd-0003hc-UF
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFIvPH+fdjrHK1JSwlSp/ERGBTgIqaOOG2KfwhXX78A=;
 b=BgO6unLZDe3Xx1F7p9NFTFsEt4CJ7Hu7J10xUXDVmduh2me7jAcgHoxYjM/L3Pb+vlY4Se
 zOZOmOHoQuxJ+R5kaSiALW68tJZfezlCZnOtuvcVp+yxm8lz/PMQkXEuRa0AQKXf7bnWgO
 eOERBReBZOAybST2F8b/k2gH44bIcXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-QQGjBQFTOPSaJVWaU4WFlQ-1; Thu, 09 Jun 2022 13:22:27 -0400
X-MC-Unique: QQGjBQFTOPSaJVWaU4WFlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78FAC294EDDB;
 Thu,  9 Jun 2022 17:22:27 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D981F40D2827;
 Thu,  9 Jun 2022 17:22:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 17/18] aio_wait_kick: add missing memory barrier
Date: Thu,  9 Jun 2022 19:21:48 +0200
Message-Id: <20220609172149.293877-18-kwolf@redhat.com>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


