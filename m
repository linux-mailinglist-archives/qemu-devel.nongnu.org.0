Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B845B7F9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:02:41 +0100 (CET)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpp6u-0006sJ-93
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozd-00023u-Ki
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpozb-0004NM-KL
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWvUReG9PBYfl0CBgjMfHAgClU2nxHR6oMGRiZua6v4=;
 b=dw3B6+QnOaE2mFDVkymPrE9xb6SoePKQkoWWS3TasBHPErL4UUze/Hr86QRX2EyngvA1bk
 MYc7vrPfXXw0SBMUYQGEp7N0Pq/ue/L1OyKLfOhMHOM5PxyQzU5oC6ToWLULReLlimWykg
 J5wmWawqMZykYqGEgniDlhdbsefHPHg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-IyJeh3KfNJ-BrRTAxwOaLA-1; Wed, 24 Nov 2021 04:55:06 -0500
X-MC-Unique: IyJeh3KfNJ-BrRTAxwOaLA-1
Received: by mail-wm1-f70.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso1083198wme.0
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWvUReG9PBYfl0CBgjMfHAgClU2nxHR6oMGRiZua6v4=;
 b=pnTbUgWIVirjsi0LWAcUZeDOS1QEKYQ9DrpoQkZ4aaqy57bvRFDFihM0cz/0Cdfasx
 VZSpSoep2ooT17k0NWei/CPqCzbCZg8bHqSnnvt7JRr3QjfylHXpt21kvMGAhtfDoJdD
 q7Ip1XuEwH5iFN5REpxev+z52JCspijL6y5V3VZrLhCnn4zFVsRm29Tfe2MdMOr0RYj8
 WZRqsVuBjHO0KJ8oXtBeiG6LT5f7++k6TTtv8IgyFcF8/lV+pDGdZ2yIEsiVd/QXMnMI
 KcjW77pc3MyVD1Q4JL56LUfwMu3lFYEw5OmVTcbNoVB9XsXmJBhFKPY17wRr20PJ2euy
 A1hA==
X-Gm-Message-State: AOAM531oj5fCTooGkLjr4sjdzCehEpZ+UmF0FMXW0fBucRfdr2sffOGM
 mjH7VSeHByK4oKrm2u57GsZPRcNCjASivwP5zaleeeOGsa9oGq3wTevtthUy3D89JovK3Yf8wKD
 Lr4XXq+6mVpubt0PFNVfjdluSugtcR0zY7Mw3TJPPNb4wsZrbuOmr8IZwDQT7rDYTFI8=
X-Received: by 2002:a1c:208b:: with SMTP id
 g133mr13328466wmg.128.1637747704400; 
 Wed, 24 Nov 2021 01:55:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye0ntqHd3u1zR7KX4vq2NfzRS0eMe5jyocR2+CCyXWRiWpfwLyN5YKOPw0cKdg4NYFwYJR+w==
X-Received: by 2002:a1c:208b:: with SMTP id
 g133mr13328425wmg.128.1637747704130; 
 Wed, 24 Nov 2021 01:55:04 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id j8sm14280778wrh.16.2021.11.24.01.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:03 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] migration: Never call twice qemu_target_page_size()
Date: Wed, 24 Nov 2021 10:54:39 +0100
Message-Id: <20211124095500.42078-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
MIME-Version: 1.0
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


