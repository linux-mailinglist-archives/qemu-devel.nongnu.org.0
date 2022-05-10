Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2E3522744
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 00:53:32 +0200 (CEST)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noYjT-0004pt-Qa
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 18:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYa2-0004Rn-NT
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYZz-0006Ii-6s
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652222622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hi/qoHoZ2fBQsuMOS4nAvKLfTubjT+5SOaaavsjdjJ8=;
 b=EH1DkzF4eUe/5U78hP7gb7aVLoqI6fvQekJtct7BCt8CRG0+KqbL8CntSYjhKgIRJ6Z/uM
 TDmWy87VRZ85SybYMTqi1sVDJtcyfswSaRL0it9rJ7kME2Jv+V0VZOwQRKcHlksbEUDEF+
 IFxPjegxSA6yPVKykLrUJ3mDInMUswI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-kZaHiY2CNR6b3Jf6crLunw-1; Tue, 10 May 2022 18:42:35 -0400
X-MC-Unique: kZaHiY2CNR6b3Jf6crLunw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F98C101AA42;
 Tue, 10 May 2022 22:42:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 114E040CFD06;
 Tue, 10 May 2022 22:42:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 05/13] multifd: Count the number of bytes sent correctly
Date: Wed, 11 May 2022 00:42:12 +0200
Message-Id: <20220510224220.5912-6-quintela@redhat.com>
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
 migration/multifd.c | 14 ++++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index f707e2a8b8..b29be5de06 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -100,6 +100,8 @@ typedef struct {
     uint32_t flags;
     /* global number of generated multifd packets */
     uint64_t packet_num;
+    /* How many bytes have we sent on the last packet */
+    uint64_t sent_bytes;
     /* thread has work to do */
     int pending_job;
     /* array of pages to sent.
diff --git a/migration/multifd.c b/migration/multifd.c
index 893b90072d..427cbe2ceb 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -394,7 +394,6 @@ static int multifd_send_pages(QEMUFile *f)
     static int next_channel;
     MultiFDSendParams *p = NULL; /* make happy gcc */
     MultiFDPages_t *pages = multifd_send_state->pages;
-    uint64_t transferred;
 
     if (qatomic_read(&multifd_send_state->exiting)) {
         return -1;
@@ -429,10 +428,10 @@ static int multifd_send_pages(QEMUFile *f)
     p->packet_num = multifd_send_state->packet_num++;
     multifd_send_state->pages = p->pages;
     p->pages = pages;
-    transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
-    qemu_file_update_transfer(f, transferred);
-    ram_counters.multifd_bytes += transferred;
-    ram_counters.transferred += transferred;
+    ram_transferred_add(p->sent_bytes);
+    ram_counters.multifd_bytes += p->sent_bytes;
+    qemu_file_update_transfer(f, p->sent_bytes);
+    p->sent_bytes = 0;
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
@@ -590,9 +589,6 @@ void multifd_send_sync_main(QEMUFile *f)
         p->packet_num = multifd_send_state->packet_num++;
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
-        qemu_file_update_transfer(f, p->packet_len);
-        ram_counters.multifd_bytes += p->packet_len;
-        ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
     }
@@ -668,6 +664,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
+            p->sent_bytes += p->packet_len;;
+            p->sent_bytes += p->next_packet_size;
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
 
-- 
2.35.1


