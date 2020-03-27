Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F33195B47
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 17:38:13 +0100 (CET)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHrzo-0001L6-AZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 12:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1jHry8-0000As-OU
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1jHry7-00065K-Hd
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:36:28 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:7205)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dietmar@proxmox.com>) id 1jHry7-00060Y-A7
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 12:36:27 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id F3E06428B4
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 17:36:24 +0100 (CET)
Date: Fri, 27 Mar 2020 17:36:23 +0100 (CET)
From: Dietmar Maurer <dietmar@proxmox.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1242491200.59.1585326983523@webmail.proxmox.com>
Subject: AIO_WAIT_WHILE questions
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev22
X-Originating-Client: open-xchange-appsuite
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Reply-To: Dietmar Maurer <dietmar@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I have a question about AIO_WAIT_WHILE. The docs inside the code say:

 * The caller's thread must be the IOThread that owns @ctx or the main loop
 * thread (with @ctx acquired exactly once).

I wonder if that "with @ctx acquired exactly once" is always required?

I have done a quick test (see code below) and this reveals that the condition is not
always met.

Or is my test wrong (or the docs)?

---debug helper---
diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index afeeb18f95..cf78dca9f9 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -82,6 +82,8 @@ extern AioWait global_aio_wait;
     atomic_inc(&wait_->num_waiters);                               \
     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
         while ((cond)) {                                           \
+            printf("AIO_WAIT_WHILE %p %d\n", ctx, ctx_->lock_count);     \
+            assert(ctx_->lock_count == 1);                   \
             aio_poll(ctx_, true);                                  \
             waited_ = true;                                        \
         }                                                          \
diff --git a/include/block/aio.h b/include/block/aio.h
index cb1989105a..51ef20e2f0 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -125,6 +125,7 @@ struct AioContext {
 
     /* Used by AioContext users to protect from multi-threaded access.  */
     QemuRecMutex lock;
+    int lock_count;
 
     /* The list of registered AIO handlers.  Protected by ctx->list_lock. */
     AioHandlerList aio_handlers;
diff --git a/util/async.c b/util/async.c
index b94518b948..9804c6c64f 100644
--- a/util/async.c
+++ b/util/async.c
@@ -594,9 +594,11 @@ void aio_context_unref(AioContext *ctx)
 void aio_context_acquire(AioContext *ctx)
 {
     qemu_rec_mutex_lock(&ctx->lock);
+    ctx->lock_count++;
 }
 
 void aio_context_release(AioContext *ctx)
 {
+    ctx->lock_count--;
     qemu_rec_mutex_unlock(&ctx->lock);
 }


