Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA831A382
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:25:04 +0100 (CET)
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcBj-0000Er-GV
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAc7X-0005rP-W4
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAc7W-0001yN-7V
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613150439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC0xwzn1JA4ElVC6izjtMT/Az7zQUDEK6CQ7rC/GCuw=;
 b=DSAoesgnZvEBPBiI/ZqQ7kFlUyxds+0godIxzfvOeLsGJHDAR+xf0z5XzNGfjMQX+z2cRQ
 z+9xQebQo4Y7k6Dx8UWwq9gJ4A6+nTqEBweoWHpf+IeKEPBLm9CUVR7dTlVfKgkrOIlPIa
 n7PeEhk0oBbiJHNwJgTSC6ONwTk5wYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-sNSn4QLzMwmbKJbLlsi_kA-1; Fri, 12 Feb 2021 12:20:38 -0500
X-MC-Unique: sNSn4QLzMwmbKJbLlsi_kA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 412E41005501
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 17:20:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-163.ams2.redhat.com [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE4F51B5FB;
 Fri, 12 Feb 2021 17:20:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] monitor: Fix assertion failure on shutdown
Date: Fri, 12 Feb 2021 18:20:27 +0100
Message-Id: <20210212172028.288825-2-kwolf@redhat.com>
In-Reply-To: <20210212172028.288825-1-kwolf@redhat.com>
References: <20210212172028.288825-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 357bda95 already tried to fix the order in monitor_cleanup() by
moving shutdown of the dispatcher coroutine further to the start.
However, it didn't go far enough:

iothread_stop() makes sure that all pending work (bottom halves) in the
AioContext of the monitor iothread is completed. iothread_destroy()
depends on this and fails an assertion if there is still a pending BH.

While the dispatcher coroutine is running, it will try to resume the
monitor after taking a request out of the queue, which involves a BH.
The dispatcher is run until it terminates in the AIO_WAIT_WHILE() loop.
However, adding new BHs between iothread_stop() and iothread_destroy()
is forbidden.

Fix this by stopping the dispatcher first before shutting down the other
parts of the monitor. This means we can now receive requests that aren't
handled any more when QEMU is shutting down, but this is unlikely to be
a problem for QMP clients.

Fixes: 357bda9590784ff75803d52de43150d4107ed98e
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/monitor.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 1e4a6b3f20..e94f532cf5 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -618,16 +618,6 @@ void monitor_data_destroy(Monitor *mon)
 
 void monitor_cleanup(void)
 {
-    /*
-     * We need to explicitly stop the I/O thread (but not destroy it),
-     * clean up the monitor resources, then destroy the I/O thread since
-     * we need to unregister from chardev below in
-     * monitor_data_destroy(), and chardev is not thread-safe yet
-     */
-    if (mon_iothread) {
-        iothread_stop(mon_iothread);
-    }
-
     /*
      * The dispatcher needs to stop before destroying the monitor and
      * the I/O thread.
@@ -637,6 +627,11 @@ void monitor_cleanup(void)
      * eventually terminates.  qemu_aio_context is automatically
      * polled by calling AIO_WAIT_WHILE on it, but we must poll
      * iohandler_ctx manually.
+     *
+     * Letting the iothread continue while shutting down the dispatcher
+     * means that new requests may still be coming in. This is okay,
+     * we'll just leave them in the queue without sending a response
+     * and monitor_data_destroy() will free them.
      */
     qmp_dispatcher_co_shutdown = true;
     if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
@@ -647,6 +642,16 @@ void monitor_cleanup(void)
                    (aio_poll(iohandler_get_aio_context(), false),
                     qatomic_mb_read(&qmp_dispatcher_co_busy)));
 
+    /*
+     * We need to explicitly stop the I/O thread (but not destroy it),
+     * clean up the monitor resources, then destroy the I/O thread since
+     * we need to unregister from chardev below in
+     * monitor_data_destroy(), and chardev is not thread-safe yet
+     */
+    if (mon_iothread) {
+        iothread_stop(mon_iothread);
+    }
+
     /* Flush output buffers and destroy monitors */
     qemu_mutex_lock(&monitor_lock);
     monitor_destroyed = true;
-- 
2.29.2


