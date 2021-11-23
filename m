Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5345AAAB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:58:51 +0100 (CET)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa4A-0003zm-6F
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwy-0006O4-00
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwv-0006kj-VY
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWvUReG9PBYfl0CBgjMfHAgClU2nxHR6oMGRiZua6v4=;
 b=OkkHq9ezaeQ6cvw3PxIWyBUXj1M/qB9hCyzcHAcXgLIkJIdG+ZIR8rVzLygpbWrFCJ3IrS
 VA32zulTPCODeEcPFF6j0NpiMhYdRdroSyKujauN/ZRti8zRxl17vDP1V/YBDcZ/0scI+f
 MnQrQJIqlwxDYbvPY6SREUfp1UIwzH4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-404ZUPPnPsaMpkSxnOKFTg-1; Tue, 23 Nov 2021 12:51:20 -0500
X-MC-Unique: 404ZUPPnPsaMpkSxnOKFTg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so3865729wrw.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWvUReG9PBYfl0CBgjMfHAgClU2nxHR6oMGRiZua6v4=;
 b=4a5fsIFrDR41aKbrZ8EvdHRkPDhwRc1256KQDOr74BQpo1oweedPRbIi5LhaILUoL0
 n4Y5gHTCiEfwDGyZSuStjkDeWKt3BGoT/SlG7xDIjm5hBndF0MF6l3og8U/8OrahOgTa
 lAcL5IioyWDX4y3TlFrvX9b9Sdu/cBe4ytrP32C+6Kfi7z1uto74ULfk0ySaa0d6BxPa
 Mk8Of0lFYP+U2AeiXeTXBfEvTVLIeQ54AYZWrIfdjt49ghmF7UttCf03n9ySZ6MRAlpj
 3PxTW+ucEBQqMexL7RmvYYBazVCyCjYcnXudi3nNzbY7PKcZSTuJu3mQ+tYQiLR66XWY
 8c7A==
X-Gm-Message-State: AOAM532yXsSGOLpYOKVDAgYNc+LU3rve4AE3ny4Irlxg6a61YLr8I00f
 Y8QqWTcfYK7vgWwtpH2345S0eQYifINxwSbWQIfn237aTFDBAGWVWkcNQEniEJl6gsODy1OErsW
 UVeJ+/+MHWjcAb2PlPpe9QmnrAABr9Lglr5Dikq2PTMWt/rTQ1Z24v0gbSPmcU7Wo0vY=
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr9942403wrb.50.1637689878815;
 Tue, 23 Nov 2021 09:51:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUUCvIsAtwJZ65EYoXKLbyB1vxkPflCpxBmVDEjmOataCSZm6ltSROX6ZBJ9dRs0D4f6vWSA==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr9942372wrb.50.1637689878616;
 Tue, 23 Nov 2021 09:51:18 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id d6sm12548525wrx.60.2021.11.23.09.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/23] migration: Never call twice qemu_target_page_size()
Date: Tue, 23 Nov 2021 18:50:52 +0100
Message-Id: <20211123175113.35569-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
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


