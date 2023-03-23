Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18C6C6B83
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfMFg-0004rK-9a; Thu, 23 Mar 2023 10:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfMFd-0004qV-Rr
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfMFc-0006YL-8Y
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679582951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ne02jBTUVytCtkiCSHbnDLNyMcjhCwvdvgeUfCutJCo=;
 b=AcWliKauhxJYrchKSFK0w0xiCmkiom8i/61MY2zD+NYIpj+K+MdglQ1Gu0YOaFUyOI4Emz
 a0iOHrKpodG03vMJHK40m4/QxmBg64j58oZHIdDHP1EDD7cTqsvTxmIB5ESCMg+VNgqA8E
 WE5Fep7W2fwCn/f6V52mUM7dbT9CgNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-9I8OhDETN1qRz1-lCSdlPg-1; Thu, 23 Mar 2023 10:49:07 -0400
X-MC-Unique: 9I8OhDETN1qRz1-lCSdlPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62703802314;
 Thu, 23 Mar 2023 14:49:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8210C15BAD;
 Thu, 23 Mar 2023 14:49:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Fam Zheng <fam@euphon.net>,
 <qemu-stable@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qing Wang <qinwang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-8.0 v2] aio-posix: fix race between epoll upgrade and
 aio_set_fd_handler()
Date: Thu, 23 Mar 2023 10:48:59 -0400
Message-Id: <20230323144859.1338495-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

If another thread calls aio_set_fd_handler() while the IOThread event
loop is upgrading from ppoll(2) to epoll(7) then we might miss new
AioHandlers. The epollfd will not monitor the new AioHandler's fd,
resulting in hangs.

Take the AioHandler list lock while upgrading to epoll. This prevents
AioHandlers from changing while epoll is being set up. If we cannot lock
because we're in a nested event loop, then don't upgrade to epoll (it
will happen next time we're not in a nested call).

The downside to taking the lock is that the aio_set_fd_handler() thread
has to wait until the epoll upgrade is finished, which involves many
epoll_ctl(2) system calls. However, this scenario is rare and I couldn't
think of another solution that is still simple.

Reported-by: Qing Wang <qinwang@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2090998
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v2:
- Use qemu_lockcnt_inc_and_unlock() instead of qemu_lockcnt_unlock() [Paolo]
---
 util/fdmon-epoll.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
index e11a8a022e..1683aa1105 100644
--- a/util/fdmon-epoll.c
+++ b/util/fdmon-epoll.c
@@ -127,6 +127,8 @@ static bool fdmon_epoll_try_enable(AioContext *ctx)
 
 bool fdmon_epoll_try_upgrade(AioContext *ctx, unsigned npfd)
 {
+    bool ok;
+
     if (ctx->epollfd < 0) {
         return false;
     }
@@ -136,14 +138,23 @@ bool fdmon_epoll_try_upgrade(AioContext *ctx, unsigned npfd)
         return false;
     }
 
-    if (npfd >= EPOLL_ENABLE_THRESHOLD) {
-        if (fdmon_epoll_try_enable(ctx)) {
-            return true;
-        } else {
-            fdmon_epoll_disable(ctx);
-        }
+    if (npfd < EPOLL_ENABLE_THRESHOLD) {
+        return false;
     }
-    return false;
+
+    /* The list must not change while we add fds to epoll */
+    if (!qemu_lockcnt_dec_if_lock(&ctx->list_lock)) {
+        return false;
+    }
+
+    ok = fdmon_epoll_try_enable(ctx);
+
+    qemu_lockcnt_inc_and_unlock(&ctx->list_lock);
+
+    if (!ok) {
+        fdmon_epoll_disable(ctx);
+    }
+    return ok;
 }
 
 void fdmon_epoll_setup(AioContext *ctx)
-- 
2.39.2


