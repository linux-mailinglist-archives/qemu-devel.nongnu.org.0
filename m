Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75730678729
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK33a-0003rc-Dw; Mon, 23 Jan 2023 15:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33O-0003nm-Gv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33M-0005iz-1P
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674504267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/hbz20BsRpzLhiXGvPfvpG5+LIRXyoeC0W83t9mgzw=;
 b=hixj4nK6etnfEHNkBD0vR6OBIpfYY92Nf+1iJUX15jhekl24AGlwge9B9VPAMUAEQdxTfF
 KOmb1/vBom6YUR/R8K7mD7Uld0D26JO7Lj896pfI4JUNXXmLGpRQI1PiT+U9VTKR3vKeRn
 KQxIwIWECg9jFklCUWv0cJMuTrizsPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-MmIsa_-nMm29l94RyBc_0g-1; Mon, 23 Jan 2023 15:04:22 -0500
X-MC-Unique: MmIsa_-nMm29l94RyBc_0g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E36B2101A5B4;
 Mon, 23 Jan 2023 20:04:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49C11492C3C;
 Mon, 23 Jan 2023 20:04:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Chao Gao <chao.gao@intel.com>
Subject: [PULL 1/3] util/aio: Defer disabling poll mode as long as possible
Date: Mon, 23 Jan 2023 15:04:15 -0500
Message-Id: <20230123200417.169053-2-stefanha@redhat.com>
In-Reply-To: <20230123200417.169053-1-stefanha@redhat.com>
References: <20230123200417.169053-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

From: Chao Gao <chao.gao@intel.com>

When we measure FIO read performance (cache=writethrough, bs=4k,
iodepth=64) in VMs, ~80K/s notifications (e.g., EPT_MISCONFIG) are observed
from guest to qemu.

It turns out those frequent notificatons are caused by interference from
worker threads. Worker threads queue bottom halves after completing IO
requests.  Pending bottom halves may lead to either aio_compute_timeout()
zeros timeout and pass it to try_poll_mode() or run_poll_handlers() returns
no progress after noticing pending aio_notify() events. Both cause
run_poll_handlers() to call poll_set_started(false) to disable poll mode.
However, for both cases, as timeout is already zeroed, the event loop
(i.e., aio_poll()) just processes bottom halves and then starts the next
event loop iteration. So, disabling poll mode has no value but leads to
unnecessary notifications from guest.

To minimize unnecessary notifications from guest, defer disabling poll
mode to when the event loop is about to be blocked.

With this patch applied, FIO seq-read performance (bs=4k, iodepth=64,
cache=writethrough) in VMs increases from 330K/s to 413K/s IOPS.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
Message-id: 20220710120849.63086-1-chao.gao@intel.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/aio-posix.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 731f3826c0..6cc6256d53 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -585,18 +585,16 @@ static bool try_poll_mode(AioContext *ctx, AioHandlerList *ready_list,
 
     max_ns = qemu_soonest_timeout(*timeout, ctx->poll_ns);
     if (max_ns && !ctx->fdmon_ops->need_wait(ctx)) {
+        /*
+         * Enable poll mode. It pairs with the poll_set_started() in
+         * aio_poll() which disables poll mode.
+         */
         poll_set_started(ctx, ready_list, true);
 
         if (run_poll_handlers(ctx, ready_list, max_ns, timeout)) {
             return true;
         }
     }
-
-    if (poll_set_started(ctx, ready_list, false)) {
-        *timeout = 0;
-        return true;
-    }
-
     return false;
 }
 
@@ -657,6 +655,17 @@ bool aio_poll(AioContext *ctx, bool blocking)
      * system call---a single round of run_poll_handlers_once suffices.
      */
     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
+        /*
+         * Disable poll mode. poll mode should be disabled before the call
+         * of ctx->fdmon_ops->wait() so that guest's notification can wake
+         * up IO threads when some work becomes pending. It is essential to
+         * avoid hangs or unnecessary latency.
+         */
+        if (poll_set_started(ctx, &ready_list, false)) {
+            timeout = 0;
+            progress = true;
+        }
+
         ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
     }
 
-- 
2.39.0


