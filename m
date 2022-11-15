Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AED629DDA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxyq-0005sz-8R; Tue, 15 Nov 2022 10:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyR-0005ke-0s
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:35:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyO-0008J1-DI
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRJB00U1eajSFPXYRkB2Bk91LEyEFNOX/e2zd/Sy/DQ=;
 b=D+cVqutBK+hBQRJUjaXlMl+u5lNgmVvWD9VrzGn/4NahU4JApBabm9ON8OFiMLBpHucCMz
 hzfKrGUd12QBBGzzSTc37S3LmR/9/Vjm6SanAPg5DKIPP/VWByWTfUW2PRStbN8dvxJ3mU
 2sgmaM8OBziIQpXDieAeitk5MLSxJV8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-Y6j8LQNrNWeTuHKcJ1-lJQ-1; Tue, 15 Nov 2022 10:35:36 -0500
X-MC-Unique: Y6j8LQNrNWeTuHKcJ1-lJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27BA63C0F7EA;
 Tue, 15 Nov 2022 15:35:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5432B2166B2C;
 Tue, 15 Nov 2022 15:35:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Leonardo Bras <leobras@redhat.com>
Subject: [PULL 05/30] multifd: Create page_count fields into both MultiFD{Recv,
 Send}Params
Date: Tue, 15 Nov 2022 16:34:49 +0100
Message-Id: <20221115153514.28003-6-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We were recalculating it left and right.  We plan to change that
values on next patches.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h | 4 ++++
 migration/multifd.c | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 941563c232..ff3aa2e2e9 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -82,6 +82,8 @@ typedef struct {
     uint32_t packet_len;
     /* guest page size */
     uint32_t page_size;
+    /* number of pages in a full packet */
+    uint32_t page_count;
     /* multifd flags for sending ram */
     int write_flags;
 
@@ -147,6 +149,8 @@ typedef struct {
     uint32_t packet_len;
     /* guest page size */
     uint32_t page_size;
+    /* number of pages in a full packet */
+    uint32_t page_count;
 
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
diff --git a/migration/multifd.c b/migration/multifd.c
index b32fe7edaf..c40d98ad5c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -279,7 +279,6 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
-    uint32_t page_count = MULTIFD_PACKET_SIZE / p->page_size;
     RAMBlock *block;
     int i;
 
@@ -306,10 +305,10 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
      * If we received a packet that is 100 times bigger than expected
      * just stop migration.  It is a magic number.
      */
-    if (packet->pages_alloc > page_count) {
+    if (packet->pages_alloc > p->page_count) {
         error_setg(errp, "multifd: received packet "
                    "with size %u and expected a size of %u",
-                   packet->pages_alloc, page_count) ;
+                   packet->pages_alloc, p->page_count) ;
         return -1;
     }
 
@@ -944,6 +943,7 @@ int multifd_save_setup(Error **errp)
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
         p->page_size = qemu_target_page_size();
+        p->page_count = page_count;
 
         if (migrate_use_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
@@ -1191,6 +1191,7 @@ int multifd_load_setup(Error **errp)
         p->name = g_strdup_printf("multifdrecv_%d", i);
         p->iov = g_new0(struct iovec, page_count);
         p->normal = g_new0(ram_addr_t, page_count);
+        p->page_count = page_count;
         p->page_size = qemu_target_page_size();
     }
 
-- 
2.38.1


