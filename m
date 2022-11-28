Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02863A5A9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:05:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozb0L-0002yg-Nt; Mon, 28 Nov 2022 05:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0H-0002xT-B2
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0F-0002ny-MQ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669629878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nrttlUkeWUCUeZTCFJcNgV+aZerbaTBDZYkffNlJhk=;
 b=OqP2VtRkvdTCYZmBiwPRZVGVRSieKLtb516OCxYIPUGisTkTzNVQSMJ6KB2ohijTQfpsDU
 ybb+owlEZxmaM5c+ByHyTUOn2GeSEPVsTUQ5VCRkzSTMSHjLVlh3uj08cFPW6bmO1dyR7g
 IQPld7if4b9muD8I2TzKKgtsaXjzovU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13--rhE3MsgNGq3_SIDsyrFMg-1; Mon, 28 Nov 2022 05:04:34 -0500
X-MC-Unique: -rhE3MsgNGq3_SIDsyrFMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A1B185A5A6;
 Mon, 28 Nov 2022 10:04:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3D142024CB7;
 Mon, 28 Nov 2022 10:04:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/11] multifd: Count the number of bytes sent correctly
Date: Mon, 28 Nov 2022 11:04:15 +0100
Message-Id: <20221128100422.13522-5-quintela@redhat.com>
In-Reply-To: <20221128100422.13522-1-quintela@redhat.com>
References: <20221128100422.13522-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
 migration/multifd.h | 2 ++
 migration/multifd.c | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index e2802a9ce2..36f899c56f 100644
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
index 61cafe4c76..cd26b2fda9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -394,7 +394,6 @@ static int multifd_send_pages(QEMUFile *f)
     static int next_channel;
     MultiFDSendParams *p = NULL; /* make happy gcc */
     MultiFDPages_t *pages = multifd_send_state->pages;
-    uint64_t transferred;
 
     if (qatomic_read(&multifd_send_state->exiting)) {
         return -1;
@@ -429,7 +428,8 @@ static int multifd_send_pages(QEMUFile *f)
     p->packet_num = multifd_send_state->packet_num++;
     multifd_send_state->pages = p->pages;
     p->pages = pages;
-    transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
+    uint64_t transferred = p->sent_bytes;
+    p->sent_bytes = 0;
     qemu_file_acct_rate_limit(f, transferred);
     qemu_mutex_unlock(&p->mutex);
     stat64_add(&ram_atomic_counters.multifd_bytes, transferred);
@@ -719,6 +719,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             qemu_mutex_lock(&p->mutex);
+            p->sent_bytes += p->packet_len;
+            p->sent_bytes += p->next_packet_size;
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
 
-- 
2.38.1


