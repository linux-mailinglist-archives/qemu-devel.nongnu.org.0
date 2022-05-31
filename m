Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D84538F55
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:54:36 +0200 (CEST)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzWF-00033S-76
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLg-000377-2u
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLe-0004eK-CM
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653993817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlEVbx27k4NJKxFP5FmrzMb1eR3akXHSJ5ErDvKdWBU=;
 b=deKw+Nat13FDMwXFIf1kdTkjh5iAeKlgDfJjCHqWhQchPcxyHoEO8QqEnu1p7XLpHMnlN+
 MA7c4u1GDwf3Wv4sVBzyZlLceJ2mgYvewqjAMfPPWS2V39wtFF48aw2snsJEq6Sr41v061
 wEoP3LeiL7yfPpF+9yhDBRpjk1PBfG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-_vrRBAMMMGGlhG8rkHgYJw-1; Tue, 31 May 2022 06:43:34 -0400
X-MC-Unique: _vrRBAMMMGGlhG8rkHgYJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF73680A0B9;
 Tue, 31 May 2022 10:43:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF811131A;
 Tue, 31 May 2022 10:43:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v7 05/13] multifd: Count the number of bytes sent correctly
Date: Tue, 31 May 2022 12:43:10 +0200
Message-Id: <20220531104318.7494-6-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-1-quintela@redhat.com>
References: <20220531104318.7494-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
index 71f49b4063..8a45dda58c 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -102,6 +102,8 @@ typedef struct {
     uint32_t flags;
     /* global number of generated multifd packets */
     uint64_t packet_num;
+    /* How many bytes have we sent on the last packet */
+    uint64_t sent_bytes;
     /* thread has work to do */
     int pending_job;
     /* array of pages to sent.
diff --git a/migration/multifd.c b/migration/multifd.c
index 166246b9b7..eef47c274f 100644
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
 
@@ -605,9 +604,6 @@ int multifd_send_sync_main(QEMUFile *f)
         p->packet_num = multifd_send_state->packet_num++;
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
-        qemu_file_update_transfer(f, p->packet_len);
-        ram_counters.multifd_bytes += p->packet_len;
-        ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
 
@@ -712,6 +708,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
+            p->sent_bytes += p->packet_len;;
+            p->sent_bytes += p->next_packet_size;
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
 
-- 
2.35.3


