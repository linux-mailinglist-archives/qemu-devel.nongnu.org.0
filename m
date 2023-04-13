Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAF96E15EF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cb-0003zQ-68; Thu, 13 Apr 2023 16:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cP-0003qI-Lb; Thu, 13 Apr 2023 16:32:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cD-0003k6-Lm; Thu, 13 Apr 2023 16:32:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9E43840137;
 Thu, 13 Apr 2023 23:31:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 278B721E;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: (nullmailer pid 2344351 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Qing Wang <qinwang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 10/21] aio-posix: fix race between epoll upgrade and
 aio_set_fd_handler()
Date: Thu, 13 Apr 2023 23:31:22 +0300
Message-Id: <20230413203143.2344250-10-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

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
Message-Id: <20230323144859.1338495-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit e62da98527fa35fe5f532cded01a33edf9fbe7b2)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
+    }
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
     }
-    return false;
+    return ok;
 }
 
 void fdmon_epoll_setup(AioContext *ctx)
-- 
2.30.2


