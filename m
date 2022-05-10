Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCE52272C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 00:48:36 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noYeh-0003lW-D4
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 18:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYZu-0004Mj-Eo
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYZr-0006IE-JR
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652222613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stlpYdjoY1E0s2U959zM4zGk2+1jhMuLun8jHEno+aI=;
 b=H4GIea4ew8LX5UM2t/M7PVD0V7UXZ2ig/7aFOYzfkYtKTg9fUoEQ858LoHCz78DCK+WQS/
 Ov8MviUouhFvwjSg1Gqtbm8lfLl7uTWkI2UjnP4JqQZyhet//CTRX08b7qQBCN3MP0F0ja
 3jvJVnE4xfrKjih8UaW6oSp9lOW8poc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-AN1rdLkHPbyesVzwAK4s9w-1; Tue, 10 May 2022 18:42:26 -0400
X-MC-Unique: AN1rdLkHPbyesVzwAK4s9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254C485A5BC;
 Tue, 10 May 2022 22:42:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 969FD40CFD06;
 Tue, 10 May 2022 22:42:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
Date: Wed, 11 May 2022 00:42:08 +0200
Message-Id: <20220510224220.5912-2-quintela@redhat.com>
In-Reply-To: <20220510224220.5912-1-quintela@redhat.com>
References: <20220510224220.5912-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Reorder the structures so we can know if the fields are:
- Read only
- Their own locking (i.e. sems)
- Protected by 'mutex'
- Only for the multifd channel

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h | 86 +++++++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 35 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7d0effcb03..f1f88c6737 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -65,7 +65,9 @@ typedef struct {
 } MultiFDPages_t;
 
 typedef struct {
-    /* this fields are not changed once the thread is created */
+    /* Fiields are only written at creating/deletion time */
+    /* No lock required for them, they are read only */
+
     /* channel number */
     uint8_t id;
     /* channel thread name */
@@ -74,37 +76,45 @@ typedef struct {
     QemuThread thread;
     /* communication channel */
     QIOChannel *c;
-    /* sem where to wait for more work */
-    QemuSemaphore sem;
-    /* this mutex protects the following parameters */
-    QemuMutex mutex;
-    /* is this channel thread running */
-    bool running;
-    /* should this thread finish */
-    bool quit;
     /* is the yank function registered */
     bool registered_yank;
+    /* packet allocated len */
+    uint32_t packet_len;
+
+    /* sem where to wait for more work */
+    QemuSemaphore sem;
+    /* syncs main thread and channels */
+    QemuSemaphore sem_sync;
+
+    /* this mutex protects the following parameters */
+    QemuMutex mutex;
+    /* is this channel thread running */
+    bool running;
+    /* should this thread finish */
+    bool quit;
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
@@ -118,7 +128,9 @@ typedef struct {
 }  MultiFDSendParams;
 
 typedef struct {
-    /* this fields are not changed once the thread is created */
+    /* Fiields are only written at creating/deletion time */
+    /* No lock required for them, they are read only */
+
     /* channel number */
     uint8_t id;
     /* channel thread name */
@@ -127,31 +139,35 @@ typedef struct {
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
+    /* multifd flags for each packet */
+    uint32_t flags;
+    /* global number of generated multifd packets */
+    uint64_t packet_num;
+
+    /* thread local variables. No locking required */
+
+    /* pointer to the packet */
+    MultiFDPacket_t *packet;
+    /* size of the next packet that contains pages */
+    uint32_t next_packet_size;
+    /* packets sent through this channel */
+    uint64_t num_packets;
     /* ramblock host address */
     uint8_t *host;
-    /* packet allocated len */
-    uint32_t packet_len;
-    /* pointer to the packet */
-    MultiFDPacket_t *packet;
-    /* multifd flags for each packet */
-    uint32_t flags;
-    /* global number of generated multifd packets */
-    uint64_t packet_num;
-    /* thread local variables */
-    /* size of the next packet that contains pages */
-    uint32_t next_packet_size;
-    /* packets sent through this channel */
-    uint64_t num_packets;
     /* non zero pages recv through this channel */
     uint64_t total_normal_pages;
-    /* syncs main thread and channels */
-    QemuSemaphore sem_sync;
     /* buffers to recv */
     struct iovec *iov;
     /* Pages that are not zero */
-- 
2.35.1


