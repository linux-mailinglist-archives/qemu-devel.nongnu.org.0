Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED114532FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 19:33:02 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntYOz-0003A1-6t
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 13:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ntYN5-0002LF-CO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ntYN2-0007VF-Jb
 for qemu-devel@nongnu.org; Tue, 24 May 2022 13:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653413459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=osTHyGs0nqmm7hjgr8tAPoAOdNGO4iCmwQFpxy/y2dI=;
 b=OG71lcjBuHlqwiPNB5NOW9VZTvVWHvfaKkGM78bwOFLX4mRXR6oilPZHWIAz6ER3Lzd2Ym
 RWP5lMX1uyJoedczmS2EDGm7gNVRhyrD/TLslo4B1fWN2HQn5PaQS0ZiW79TunKOcVfOvO
 rrXi/iIbOA5CyrGfCSx9xfPJUhb4qaI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-zLOoB9VnOFqz4M6Mx9eyLQ-1; Tue, 24 May 2022 13:30:57 -0400
X-MC-Unique: zLOoB9VnOFqz4M6Mx9eyLQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18A8E3831C49;
 Tue, 24 May 2022 17:30:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACE59492C3B;
 Tue, 24 May 2022 17:30:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] aio_wait_kick: add missing memory barrier
Date: Tue, 24 May 2022 13:30:54 -0400
Message-Id: <20220524173054.12651-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

It seems that aio_wait_kick always required a memory barrier
or atomic operation in the caller, but nobody actually
took care of doing it.

Let's put the barrier in the function instead, and pair it
with another one in AIO_WAIT_WHILE. Read aio_wait_kick()
comment for further explanation.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
2.31.1


