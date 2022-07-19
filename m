Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B657A5CB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:52:08 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrOB-0008T3-3L
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcl-0006uq-QD
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcj-0002zO-U1
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658250185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6Ltalk0EK7prV05BwJqnejrt3XTBqQjUBfKph9FJ+M=;
 b=g0DAL01LLO7t9EQoJbO51VIWsxBiDZiUtzIYfMrj7PyB7LHQ65UtWaMcMTsoPznmLjRtBM
 yKHcaojRe7z5cc4oJKsBrTmvuRNCft09vYEClQgIppvdUSuuX1oxXe7lgQd0oWjLh2XWm/
 dPvsiBXiTVvcJ2mDnr0Oby8jqDK9Lpk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-LAHKOBtZOP6g-N5ssFw6VA-1; Tue, 19 Jul 2022 13:03:00 -0400
X-MC-Unique: LAHKOBtZOP6g-N5ssFw6VA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2116A380673A;
 Tue, 19 Jul 2022 17:03:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29D3240CF8E5;
 Tue, 19 Jul 2022 17:02:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 28/29] multifd: Document the locking of MultiFD{Send/Recv}Params
Date: Tue, 19 Jul 2022 18:02:20 +0100
Message-Id: <20220719170221.576190-29-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
References: <20220719170221.576190-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: Juan Quintela <quintela@redhat.com>

Reorder the structures so we can know if the fields are:
- Read only
- Their own locking (i.e. sems)
- Protected by 'mutex'
- Only for the multifd channel

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220531104318.7494-2-quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Typo fixes from Chen Zhang
---
 migration/multifd.h | 66 ++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 25 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 4d8d89e5e5..519f498643 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -65,7 +65,9 @@ typedef struct {
 } MultiFDPages_t;
 
 typedef struct {
-    /* this fields are not changed once the thread is created */
+    /* Fields are only written at creating/deletion time */
+    /* No lock required for them, they are read only */
+
     /* channel number */
     uint8_t id;
     /* channel thread name */
@@ -74,39 +76,47 @@ typedef struct {
     QemuThread thread;
     /* communication channel */
     QIOChannel *c;
+    /* is the yank function registered */
+    bool registered_yank;
+    /* packet allocated len */
+    uint32_t packet_len;
+    /* multifd flags for sending ram */
+    int write_flags;
+
     /* sem where to wait for more work */
     QemuSemaphore sem;
+    /* syncs main thread and channels */
+    QemuSemaphore sem_sync;
+
     /* this mutex protects the following parameters */
     QemuMutex mutex;
     /* is this channel thread running */
     bool running;
     /* should this thread finish */
     bool quit;
-    /* is the yank function registered */
-    bool registered_yank;
+    /* multifd flags for each packet */
+    uint32_t flags;
+    /* global number of generated multifd packets */
+    uint64_t packet_num;
     /* thread has work to do */
     int pending_job;
-    /* array of pages to sent */
+    /* array of pages to sent.
+     * The owner of 'pages' depends of 'pending_job' value:
+     * pending_job == 0 -> migration_thread can use it.
+     * pending_job != 0 -> multifd_channel can use it.
+     */
     MultiFDPages_t *pages;
-    /* packet allocated len */
-    uint32_t packet_len;
+
+    /* thread local variables. No locking required */
+
     /* pointer to the packet */
     MultiFDPacket_t *packet;
-    /* multifd flags for sending ram */
-    int write_flags;
-    /* multifd flags for each packet */
-    uint32_t flags;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
-    /* global number of generated multifd packets */
-    uint64_t packet_num;
-    /* thread local variables */
     /* packets sent through this channel */
     uint64_t num_packets;
     /* non zero pages sent through this channel */
     uint64_t total_normal_pages;
-    /* syncs main thread and channels */
-    QemuSemaphore sem_sync;
     /* buffers to send */
     struct iovec *iov;
     /* number of iovs used */
@@ -120,7 +130,9 @@ typedef struct {
 }  MultiFDSendParams;
 
 typedef struct {
-    /* this fields are not changed once the thread is created */
+    /* Fields are only written at creating/deletion time */
+    /* No lock required for them, they are read only */
+
     /* channel number */
     uint8_t id;
     /* channel thread name */
@@ -129,31 +141,35 @@ typedef struct {
     QemuThread thread;
     /* communication channel */
     QIOChannel *c;
+    /* packet allocated len */
+    uint32_t packet_len;
+
+    /* syncs main thread and channels */
+    QemuSemaphore sem_sync;
+
     /* this mutex protects the following parameters */
     QemuMutex mutex;
     /* is this channel thread running */
     bool running;
     /* should this thread finish */
     bool quit;
-    /* ramblock host address */
-    uint8_t *host;
-    /* packet allocated len */
-    uint32_t packet_len;
-    /* pointer to the packet */
-    MultiFDPacket_t *packet;
     /* multifd flags for each packet */
     uint32_t flags;
     /* global number of generated multifd packets */
     uint64_t packet_num;
-    /* thread local variables */
+
+    /* thread local variables. No locking required */
+
+    /* pointer to the packet */
+    MultiFDPacket_t *packet;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     /* packets sent through this channel */
     uint64_t num_packets;
+    /* ramblock host address */
+    uint8_t *host;
     /* non zero pages recv through this channel */
     uint64_t total_normal_pages;
-    /* syncs main thread and channels */
-    QemuSemaphore sem_sync;
     /* buffers to recv */
     struct iovec *iov;
     /* Pages that are not zero */
-- 
2.36.1


