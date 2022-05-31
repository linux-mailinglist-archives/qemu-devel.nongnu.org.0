Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A6538F71
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:08:33 +0200 (CEST)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzjk-0003Dw-Du
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLl-0003K8-6q
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLj-0004ei-D1
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653993821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IS8/A1+2LN3G+NxGJwHePXx4Wgtz98BoC2Tycoao7+8=;
 b=HmPdkAxLW1m0yezJ4UiTuhU4U7E8ozlBO0QrAmMxzrQKqYDhO2Unh+3fcdGgUNMPNXHB7O
 B5V0NZhDX7NtileQpni+BEBn2TlIa2PiS2aaGCuyG4OVvCASkYmKlJMhpYfIu6mVgrTOWt
 UZC/mDApKnfZO/ZmM08ITX8N5iFQyIE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-YIvHgRnONh63QV013ZJgtA-1; Tue, 31 May 2022 06:43:38 -0400
X-MC-Unique: YIvHgRnONh63QV013ZJgtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 120301D32362;
 Tue, 31 May 2022 10:43:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35B811131A;
 Tue, 31 May 2022 10:43:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v7 07/13] multifd: Make flags field thread local
Date: Tue, 31 May 2022 12:43:12 +0200
Message-Id: <20220531104318.7494-8-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-1-quintela@redhat.com>
References: <20220531104318.7494-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
index 8a45dda58c..af8ce8921d 100644
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
index eef47c274f..69b9d7cf98 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -602,7 +602,7 @@ int multifd_send_sync_main(QEMUFile *f)
         }
 
         p->packet_num = multifd_send_state->packet_num++;
-        p->flags |= MULTIFD_FLAG_SYNC;
+        p->sync_needed = true;
         p->pending_job++;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
@@ -656,7 +656,11 @@ static void *multifd_send_thread(void *opaque)
 
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
@@ -678,14 +682,13 @@ static void *multifd_send_thread(void *opaque)
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
@@ -713,7 +716,7 @@ static void *multifd_send_thread(void *opaque)
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
 
-            if (flags & MULTIFD_FLAG_SYNC) {
+            if (p->flags & MULTIFD_FLAG_SYNC) {
                 qemu_sem_post(&p->sem_sync);
             }
             qemu_sem_post(&multifd_send_state->channels_ready);
@@ -1090,7 +1093,7 @@ static void *multifd_recv_thread(void *opaque)
     rcu_register_thread();
 
     while (true) {
-        uint32_t flags;
+        bool sync_needed = false;
 
         if (p->quit) {
             break;
@@ -1112,11 +1115,11 @@ static void *multifd_recv_thread(void *opaque)
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
@@ -1128,7 +1131,7 @@ static void *multifd_recv_thread(void *opaque)
             }
         }
 
-        if (flags & MULTIFD_FLAG_SYNC) {
+        if (sync_needed) {
             qemu_sem_post(&multifd_recv_state->sem_sync);
             qemu_sem_wait(&p->sem_sync);
         }
-- 
2.35.3


