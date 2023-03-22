Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754B6C4EB1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezsJ-0005DS-Jv; Wed, 22 Mar 2023 10:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pezsD-0005A2-G3
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pezs7-0001FH-Na
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679496925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xBQC+lT5WTsS+h8x8nwRvsBlah0V6IHUpMy4u0prios=;
 b=dSG/jDu37q/asVi9byUXyT0kBPQ12BBOSze9p6qqF/iRfgLuf7ogRmi/XvQpHYxt/uUKi7
 m1OKsZSWN3sc2HBWjaPBOA/4PiZA0lLSqJ1M0IVA7gxblHHH3M/+1NI/7A++9wbUrG9tkW
 aOOxPhkiisV7V/xBNvFbmrxPZ1O+u4A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-4EVEDtGkODC57JhizX82Fw-1; Wed, 22 Mar 2023 10:55:22 -0400
X-MC-Unique: 4EVEDtGkODC57JhizX82Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D71ED3823A03;
 Wed, 22 Mar 2023 14:55:21 +0000 (UTC)
Received: from localhost (unknown [10.2.16.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A453F140EBF4;
 Wed, 22 Mar 2023 14:55:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, <qemu-stable@nongnu.org>,
 Qing Wang <qinwang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-8.0] aio-posix: fix race between epoll upgrade and
 aio_set_fd_handler()
Date: Wed, 22 Mar 2023 10:55:21 -0400
Message-Id: <20230322145521.1294954-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
 util/fdmon-epoll.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/util/fdmon-epoll.c b/util/fdmon-epoll.c
index e11a8a022e..8f1323ab2c 100644
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
+    qemu_lockcnt_unlock(&ctx->list_lock);
+
+    if (!ok) {
+        fdmon_epoll_disable(ctx);
+    }
+    return ok;
 }
 
 void fdmon_epoll_setup(AioContext *ctx)
-- 
2.39.2


