Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA745B82D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:16:25 +0100 (CET)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppKC-0008HR-6x
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppAd-0007cK-WF
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppAZ-0006gI-68
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWvUReG9PBYfl0CBgjMfHAgClU2nxHR6oMGRiZua6v4=;
 b=P8EglN9ivj3MvTrgwBb5bmwb3ESXeQjVai5nLr6srwN9uwWvFRMDT0ECM+SVcDkHfUJUha
 RIKMnUyt1dsAtafATt7mEygCKcJ6kxO5e9jxZM+NMwg/fKZQ05E5uGnSO3RWcAzDm82ec5
 fPLfEbp1DTecjG1kIvWJtvCF2DULu38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-vYzXu_fTM2msa3NYjyYuIQ-1; Wed, 24 Nov 2021 05:06:24 -0500
X-MC-Unique: vYzXu_fTM2msa3NYjyYuIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9DD583DD20
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:06:23 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5318960843;
 Wed, 24 Nov 2021 10:06:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/23] migration: Never call twice qemu_target_page_size()
Date: Wed, 24 Nov 2021 11:05:56 +0100
Message-Id: <20211124100617.19786-3-quintela@redhat.com>
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
References: <20211124100617.19786-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 7 ++++---
 migration/multifd.c   | 7 ++++---
 migration/savevm.c    | 5 +++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2c1edb2cb9..3de11ae921 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -996,6 +996,8 @@ static void populate_time_info(MigrationInfo *info, MigrationState *s)
 
 static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 {
+    size_t page_size = qemu_target_page_size();
+
     info->has_ram = true;
     info->ram = g_malloc0(sizeof(*info->ram));
     info->ram->transferred = ram_counters.transferred;
@@ -1004,12 +1006,11 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
     info->ram->normal = ram_counters.normal;
-    info->ram->normal_bytes = ram_counters.normal *
-        qemu_target_page_size();
+    info->ram->normal_bytes = ram_counters.normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
-    info->ram->page_size = qemu_target_page_size();
+    info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
     info->ram->pages_per_second = s->pages_per_second;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 7c9deb1921..8125d0015c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -289,7 +289,8 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
-    uint32_t pages_max = MULTIFD_PACKET_SIZE / qemu_target_page_size();
+    size_t page_size = qemu_target_page_size();
+    uint32_t pages_max = MULTIFD_PACKET_SIZE / page_size;
     RAMBlock *block;
     int i;
 
@@ -358,14 +359,14 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
     for (i = 0; i < p->pages->used; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
-        if (offset > (block->used_length - qemu_target_page_size())) {
+        if (offset > (block->used_length - page_size)) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
                        offset, block->used_length);
             return -1;
         }
         p->pages->iov[i].iov_base = block->host + offset;
-        p->pages->iov[i].iov_len = qemu_target_page_size();
+        p->pages->iov[i].iov_len = page_size;
     }
 
     return 0;
diff --git a/migration/savevm.c b/migration/savevm.c
index d59e976d50..0bef031acb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1685,6 +1685,7 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_ADVISE);
     uint64_t remote_pagesize_summary, local_pagesize_summary, remote_tps;
+    size_t page_size = qemu_target_page_size();
     Error *local_err = NULL;
 
     trace_loadvm_postcopy_handle_advise();
@@ -1741,13 +1742,13 @@ static int loadvm_postcopy_handle_advise(MigrationIncomingState *mis,
     }
 
     remote_tps = qemu_get_be64(mis->from_src_file);
-    if (remote_tps != qemu_target_page_size()) {
+    if (remote_tps != page_size) {
         /*
          * Again, some differences could be dealt with, but for now keep it
          * simple.
          */
         error_report("Postcopy needs matching target page sizes (s=%d d=%zd)",
-                     (int)remote_tps, qemu_target_page_size());
+                     (int)remote_tps, page_size);
         return -1;
     }
 
-- 
2.33.1


