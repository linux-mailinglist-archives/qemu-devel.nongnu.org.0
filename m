Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F463A5BD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozb0R-0002zG-MZ; Mon, 28 Nov 2022 05:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0I-0002xq-Ht
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0F-0002oX-QO
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669629883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yz85oIz1G0MWjp4dGoyl80IX4Z5bi+wS5qJVWzLgY1s=;
 b=i0kt8VZe2WEf8MCpN5kqcPZ4B67NoRU3L4W1zrqXJlR/aON4Y7K+OU7tyInJqG7fjYELOU
 Ox8VyArHY33FP4JQkBNk8tPMbM5zDKD6sRviKKgTXqC/7DqeSf0+BKMYwREBebpH/ge+LJ
 bLRkNwzBJD1e52Rqpu7CdbpbUBC56Es=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-4I7mWdN4PNSMPCkfI52owg-1; Mon, 28 Nov 2022 05:04:39 -0500
X-MC-Unique: 4I7mWdN4PNSMPCkfI52owg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59DDA85A59D;
 Mon, 28 Nov 2022 10:04:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E60B12027061;
 Mon, 28 Nov 2022 10:04:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/11] multifd: Prepare to send a packet without the mutex held
Date: Mon, 28 Nov 2022 11:04:18 +0100
Message-Id: <20221128100422.13522-8-quintela@redhat.com>
In-Reply-To: <20221128100422.13522-1-quintela@redhat.com>
References: <20221128100422.13522-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

We do the send_prepare() and the fill of the head packet without the
mutex held.  It will help a lot for compression and later in the
series for zero pages.

Notice that we can use p->pages without holding p->mutex because
p->pending_job == 1.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h |  2 ++
 migration/multifd.c | 12 ++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index a67cefc0a2..cd389d18d2 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -109,7 +109,9 @@ typedef struct {
     /* array of pages to sent.
      * The owner of 'pages' depends of 'pending_job' value:
      * pending_job == 0 -> migration_thread can use it.
+     *                     No need for mutex lock.
      * pending_job != 0 -> multifd_channel can use it.
+     *                     No need for mutex lock.
      */
     MultiFDPages_t *pages;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 77196a55b4..7ebaca6e55 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -672,6 +672,8 @@ static void *multifd_send_thread(void *opaque)
                 p->flags |= MULTIFD_FLAG_SYNC;
                 p->sync_needed = false;
             }
+            qemu_mutex_unlock(&p->mutex);
+
             p->normal_num = 0;
 
             if (use_zero_copy_send) {
@@ -688,16 +690,10 @@ static void *multifd_send_thread(void *opaque)
             if (p->normal_num) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
                 if (ret != 0) {
-                    qemu_mutex_unlock(&p->mutex);
                     break;
                 }
             }
             multifd_send_fill_packet(p);
-            p->num_packets++;
-            p->total_normal_pages += p->normal_num;
-            p->pages->num = 0;
-            p->pages->block = NULL;
-            qemu_mutex_unlock(&p->mutex);
 
             trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
                                p->next_packet_size);
@@ -722,6 +718,10 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
+            p->num_packets++;
+            p->total_normal_pages += p->normal_num;
+            p->pages->num = 0;
+            p->pages->block = NULL;
             p->sent_bytes += p->packet_len;
             p->sent_bytes += p->next_packet_size;
             p->pending_job--;
-- 
2.38.1


