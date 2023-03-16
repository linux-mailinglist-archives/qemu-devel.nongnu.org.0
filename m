Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D36BD320
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpHd-0001Xo-KQ; Thu, 16 Mar 2023 11:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHO-0001QX-U7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHL-0003Hf-Ra
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678979550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+QgOHpzztQRoC5XV2gLvUVlYs/raQm+F133uw/FKVs=;
 b=UMD1KzAx6vfCicMkkjssTqmtPlJiefGZM7UXBr613NorW2DJ/5gnbY/owga0vGNXsb2DMT
 daDwQ5iDSDUZGaWlJ514abuHdh5lmuZTtjKVR//+w6ewa7w1TcDT9/xKeayhfQl6sl1mwm
 lEeXmSfj8kIVQYDzXf0a3TXX/M6h1XM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-0ZV6UHcaM3utLVAN_Y76dw-1; Thu, 16 Mar 2023 11:12:28 -0400
X-MC-Unique: 0ZV6UHcaM3utLVAN_Y76dw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A63E2807D76;
 Thu, 16 Mar 2023 15:12:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86045492B00;
 Thu, 16 Mar 2023 15:12:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/7] migration: Wait on preempt channel in preempt thread
Date: Thu, 16 Mar 2023 16:12:19 +0100
Message-Id: <20230316151225.11362-2-quintela@redhat.com>
In-Reply-To: <20230316151225.11362-1-quintela@redhat.com>
References: <20230316151225.11362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

QEMU main thread will wait until dest preempt channel established during
processing the LISTEN command (within the whole postcopy PACKAGED data), by
waiting on the semaphore postcopy_qemufile_dst_done.

That's racy, because it's possible that the dest QEMU main thread hasn't
yet accept()ed the new connection when processing the LISTEN event.  The
sem_wait() will yield the main thread without being able to run anything
else including the accept() of the new socket, which can cause deadlock
within the main thread.

To avoid the race, move the "wait channel" from main thread to the preempt
thread right at the start.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index f54f44d899..41c0713650 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1197,11 +1197,6 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
     }
 
     if (migrate_postcopy_preempt()) {
-        /*
-         * The preempt channel is established in asynchronous way.  Wait
-         * for its completion.
-         */
-        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
         /*
          * This thread needs to be created after the temp pages because
          * it'll fetch RAM_CHANNEL_POSTCOPY PostcopyTmpPage immediately.
@@ -1668,6 +1663,12 @@ void *postcopy_preempt_thread(void *opaque)
 
     qemu_sem_post(&mis->thread_sync_sem);
 
+    /*
+     * The preempt channel is established in asynchronous way.  Wait
+     * for its completion.
+     */
+    qemu_sem_wait(&mis->postcopy_qemufile_dst_done);
+
     /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
     qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
     while (1) {
-- 
2.39.2


