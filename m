Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FBC4D4CCC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:37:12 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKqm-00060u-3L
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKoo-0003U3-Qy
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKom-0004Fm-N5
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646926507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9RNk449/r7UeIupda5e3cnhwEkEAuC+chXFgMfufp8=;
 b=NW0fynw44MAj3IvQjlrjDGFitVQfZ1LpPzwQCtkpEVrk+uyi+iq+lGvgw3pRYSmXpVHVZn
 q98HPoLzd4fPcQNjvtjAtMocD6SHHn0lvy4wDyMvuAZHh7r2DNBsz2b/s2tu8cTXtd8IxR
 3roUFGDsTx8ePSFFgjCiu1jZNNL33Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-_lE18LwHOA-7LVLMDcIzSQ-1; Thu, 10 Mar 2022 10:35:04 -0500
X-MC-Unique: _lE18LwHOA-7LVLMDcIzSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 291161091DA0;
 Thu, 10 Mar 2022 15:35:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 157F88379D;
 Thu, 10 Mar 2022 15:35:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/8] multifd: Count the number of sent bytes correctly
Date: Thu, 10 Mar 2022 16:34:48 +0100
Message-Id: <20220310153454.3929-3-quintela@redhat.com>
In-Reply-To: <20220310153454.3929-1-quintela@redhat.com>
References: <20220310153454.3929-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current code asumes that all pages are whole.  That is not true for
example for compression already.  Fix it for creating a new field
->sent_bytes that includes it.

All ram_counters are used only from the migration thread, so we have
two options:
- put a mutex and fill everything when we sent it (not only
ram_counters, also qemu_file->xfer_bytes).
- Create a local variable that implements how much has been sent
through each channel.  And when we push another packet, we "add" the
previous stats.

I choose two due to less changes overall.  On the previous code we
increase transferred and then we sent.  Current code goes the other
way around.  It sents the data, and after the fact, it updates the
counters.  Notice that each channel can have a maximum of half a
megabyte of data without counting, so it is not very important.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h |  2 ++
 migration/multifd.c | 15 ++++++---------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..3afba8a198 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -119,6 +119,8 @@ typedef struct {
     uint32_t normal_num;
     /* used for compression methods */
     void *data;
+    /* How many bytes have we sent on the last packet */
+    uint64_t sent_bytes;
 }  MultiFDSendParams;
 
 typedef struct {
diff --git a/migration/multifd.c b/migration/multifd.c
index 76b57a7177..ab87879471 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -398,7 +398,6 @@ static int multifd_send_pages(QEMUFile *f)
     static int next_channel;
     MultiFDSendParams *p = NULL; /* make happy gcc */
     MultiFDPages_t *pages = multifd_send_state->pages;
-    uint64_t transferred;
 
     if (qatomic_read(&multifd_send_state->exiting)) {
         return -1;
@@ -433,11 +432,10 @@ static int multifd_send_pages(QEMUFile *f)
     p->packet_num = multifd_send_state->packet_num++;
     multifd_send_state->pages = p->pages;
     p->pages = pages;
-    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
-                + p->packet_len;
-    qemu_file_update_transfer(f, transferred);
-    ram_counters.multifd_bytes += transferred;
-    ram_counters.transferred += transferred;
+    ram_transferred_add(p->sent_bytes);
+    ram_counters.multifd_bytes += p->sent_bytes;
+    qemu_file_update_transfer(f, p->sent_bytes);
+    p->sent_bytes = 0;
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
@@ -597,9 +595,6 @@ void multifd_send_sync_main(QEMUFile *f)
         p->packet_num = multifd_send_state->packet_num++;
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
-        qemu_file_update_transfer(f, p->packet_len);
-        ram_counters.multifd_bytes += p->packet_len;
-        ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
     }
@@ -675,6 +670,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
+            p->sent_bytes += p->packet_len;;
+            p->sent_bytes += p->next_packet_size;
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
 
-- 
2.34.1


