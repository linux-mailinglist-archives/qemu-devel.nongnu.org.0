Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2FA68070F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:10:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPFJ-0000fj-Mz; Mon, 30 Jan 2023 03:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPF9-0000cw-DD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPF7-0002HF-SJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675066221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJYG+euecEOLkjHsVWd7eJ4oTpdiHzIhC6SxjtzvC3I=;
 b=B0elRf8JKOU+YtHHsyWgPFG8EdehJdhqxNISP/FCeK39oGwYRdPaPOCf/1smJYe9NCHu5y
 Val1PeocVGXFM00v/+ZdGWW0eXI67HtNRg3MXvy+/LjsGM8ymMxsLTSQoaZ7KbrKLARyU1
 R+NEi6Ml5o3nlymUcEtQkoAMMQ9RlVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-0FwSQKAKNIKTWrUX5cftlg-1; Mon, 30 Jan 2023 03:10:15 -0500
X-MC-Unique: 0FwSQKAKNIKTWrUX5cftlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EB1D802D19;
 Mon, 30 Jan 2023 08:10:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F07FA40C2064;
 Mon, 30 Jan 2023 08:10:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 06/11] multifd: Make flags field thread local
Date: Mon, 30 Jan 2023 09:09:51 +0100
Message-Id: <20230130080956.3047-7-quintela@redhat.com>
In-Reply-To: <20230130080956.3047-1-quintela@redhat.com>
References: <20230130080956.3047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Use of flags with respect to locking was incensistant.  For the
sending side:
- it was set to 0 with mutex held on the multifd channel.
- MULTIFD_FLAG_SYNC was set with mutex held on the migration thread.
- Everything else was done without the mutex held on the multifd channel.

On the reception side, it is not used on the migration thread, only on
the multifd channels threads.

So we move it to the multifd channels thread only variables, and we
introduce a new bool sync_needed on the send side to pass that information.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h | 10 ++++++----
 migration/multifd.c | 23 +++++++++++++----------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 36f899c56f..a67cefc0a2 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -98,12 +98,12 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
-    /* multifd flags for each packet */
-    uint32_t flags;
     /* global number of generated multifd packets */
     uint64_t packet_num;
     /* How many bytes have we sent on the last packet */
     uint64_t sent_bytes;
+    /* Do we need to do an iteration sync */
+    bool sync_needed;
     /* thread has work to do */
     int pending_job;
     /* array of pages to sent.
@@ -117,6 +117,8 @@ typedef struct {
 
     /* pointer to the packet */
     MultiFDPacket_t *packet;
+    /* multifd flags for each packet */
+    uint32_t flags;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     /* packets sent through this channel */
@@ -163,8 +165,6 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
-    /* multifd flags for each packet */
-    uint32_t flags;
     /* global number of generated multifd packets */
     uint64_t packet_num;
 
@@ -172,6 +172,8 @@ typedef struct {
 
     /* pointer to the packet */
     MultiFDPacket_t *packet;
+    /* multifd flags for each packet */
+    uint32_t flags;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     /* packets sent through this channel */
diff --git a/migration/multifd.c b/migration/multifd.c
index cd26b2fda9..77196a55b4 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -620,7 +620,7 @@ int multifd_send_sync_main(QEMUFile *f)
         }
 
         p->packet_num = multifd_send_state->packet_num++;
-        p->flags |= MULTIFD_FLAG_SYNC;
+        p->sync_needed = true;
         p->pending_job++;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
@@ -667,7 +667,11 @@ static void *multifd_send_thread(void *opaque)
 
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
-            uint32_t flags = p->flags;
+            p->flags = 0;
+            if (p->sync_needed) {
+                p->flags |= MULTIFD_FLAG_SYNC;
+                p->sync_needed = false;
+            }
             p->normal_num = 0;
 
             if (use_zero_copy_send) {
@@ -689,14 +693,13 @@ static void *multifd_send_thread(void *opaque)
                 }
             }
             multifd_send_fill_packet(p);
-            p->flags = 0;
             p->num_packets++;
             p->total_normal_pages += p->normal_num;
             p->pages->num = 0;
             p->pages->block = NULL;
             qemu_mutex_unlock(&p->mutex);
 
-            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
+            trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
                                p->next_packet_size);
 
             if (use_zero_copy_send) {
@@ -724,7 +727,7 @@ static void *multifd_send_thread(void *opaque)
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
 
-            if (flags & MULTIFD_FLAG_SYNC) {
+            if (p->flags & MULTIFD_FLAG_SYNC) {
                 qemu_sem_post(&p->sem_sync);
             }
             qemu_sem_post(&multifd_send_state->channels_ready);
@@ -1099,7 +1102,7 @@ static void *multifd_recv_thread(void *opaque)
     rcu_register_thread();
 
     while (true) {
-        uint32_t flags;
+        bool sync_needed = false;
 
         if (p->quit) {
             break;
@@ -1121,11 +1124,11 @@ static void *multifd_recv_thread(void *opaque)
             break;
         }
 
-        flags = p->flags;
+        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags,
+                           p->next_packet_size);
+        sync_needed = p->flags & MULTIFD_FLAG_SYNC;
         /* recv methods don't know how to handle the SYNC flag */
         p->flags &= ~MULTIFD_FLAG_SYNC;
-        trace_multifd_recv(p->id, p->packet_num, p->normal_num, flags,
-                           p->next_packet_size);
         p->num_packets++;
         p->total_normal_pages += p->normal_num;
         qemu_mutex_unlock(&p->mutex);
@@ -1137,7 +1140,7 @@ static void *multifd_recv_thread(void *opaque)
             }
         }
 
-        if (flags & MULTIFD_FLAG_SYNC) {
+        if (sync_needed) {
             qemu_sem_post(&multifd_recv_state->sem_sync);
             qemu_sem_wait(&p->sem_sync);
         }
-- 
2.39.1


