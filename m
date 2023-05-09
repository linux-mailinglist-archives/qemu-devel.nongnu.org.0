Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7146FC5D4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:08:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM7f-0006Id-FI; Tue, 09 May 2023 08:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwM7d-0006Hh-4B
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwM7b-0007M0-J3
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683634030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmgif8DVfJrkv9QRWejmAQYS+0o+Z4PYLh2BsXtfm2E=;
 b=TBcE7W/nMy2UfrphVB0fzi6bOF/kdkWcpWxpRzy9kNwV/aEDvSMJT5npv7g4jkmsUOh9f9
 wWq0lOpFxwe3fz84qNzuDGIDEt65kJVBtTJ3XSLjVrVU+By45VdvSLUEIdaJA7Fx0N1sUH
 vPFf2Y1012oNFfI1Bd4/+VC6CZy0cr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-ImD2yLOJPZ2w0EXs-RnEMQ-1; Tue, 09 May 2023 08:07:07 -0400
X-MC-Unique: ImD2yLOJPZ2w0EXs-RnEMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05CAB805F58
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 12:07:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40E3863F84;
 Tue,  9 May 2023 12:07:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v3 04/10] migration/rdma: Remove all uses of RAM_CONTROL_HOOK
Date: Tue,  9 May 2023 14:06:54 +0200
Message-Id: <20230509120700.78359-5-quintela@redhat.com>
In-Reply-To: <20230509120700.78359-1-quintela@redhat.com>
References: <20230509120700.78359-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of going trhough ram_control_load_hook(), call
qemu_rdma_registration_handle() directly.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.h | 1 -
 migration/ram.c       | 5 ++++-
 migration/rdma.c      | 9 +++++----
 migration/rdma.h      | 2 ++
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 323af5682f..7cfc20825e 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -41,7 +41,6 @@ typedef int (QEMURamHookFunc)(QEMUFile *f, uint64_t flags, void *data);
  */
 #define RAM_CONTROL_SETUP     0
 #define RAM_CONTROL_ROUND     1
-#define RAM_CONTROL_HOOK      2
 #define RAM_CONTROL_FINISH    3
 #define RAM_CONTROL_BLOCK_REG 4
 
diff --git a/migration/ram.c b/migration/ram.c
index 2b36e802c4..e967cc06bb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4053,7 +4053,10 @@ static int ram_load_precopy(QEMUFile *f)
             }
             break;
         case RAM_SAVE_FLAG_HOOK:
-            ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
+            ret = qemu_rdma_registration_handle(f);
+            if (ret < 0) {
+                qemu_file_set_error(f, ret);
+            }
             break;
         default:
             error_report("Unknown combination of migration flags: 0x%x", flags);
diff --git a/migration/rdma.c b/migration/rdma.c
index 3707230554..821646b4c1 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3531,7 +3531,7 @@ static int dest_ram_sort_func(const void *a, const void *b)
  *
  * Keep doing this until the source tells us to stop.
  */
-static int qemu_rdma_registration_handle(QEMUFile *f)
+int qemu_rdma_registration_handle(QEMUFile *f)
 {
     RDMAControlHeader reg_resp = { .len = sizeof(RDMARegisterResult),
                                .type = RDMA_CONTROL_REGISTER_RESULT,
@@ -3558,6 +3558,10 @@ static int qemu_rdma_registration_handle(QEMUFile *f)
     int count = 0;
     int i = 0;
 
+    if (!migrate_rdma()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmain);
 
@@ -3855,9 +3859,6 @@ static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
     case RAM_CONTROL_BLOCK_REG:
         return rdma_block_notification_handle(f, data);
 
-    case RAM_CONTROL_HOOK:
-        return qemu_rdma_registration_handle(f);
-
     default:
         /* Shouldn't be called with any other values */
         abort();
diff --git a/migration/rdma.h b/migration/rdma.h
index a16a8d8bc6..8d0253047c 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -24,9 +24,11 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp);
 
 
 #ifdef CONFIG_RDMA
+int qemu_rdma_registration_handle(QEMUFile *f);
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags);
 int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags);
 #else
+int qemu_rdma_registration_handle(QEMUFile *f) { return 0; }
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags) { return 0; }
 int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags) { return 0; }
 #endif
-- 
2.40.0


