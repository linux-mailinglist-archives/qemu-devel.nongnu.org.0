Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B76F0A08
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:38:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4aZ-0005Fw-H9; Thu, 27 Apr 2023 12:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aX-0005Fe-Sg
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aV-0006kr-S2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZOknDHkrqErhjtulmRkjLzOJj3FFNiXAvfxSmzwR3g=;
 b=ffgwNmjHaDX1P31rXZe+TnUrdNv3/ji8/65gpQV+hzy5RL9YyEbYVzL6lIMxRtcgIrCpvj
 HqmtE6ExVOtEqACZR8PCulcIFxWo2RHQiaYq8cCxSuH4w+IZyhn+/Xov9hhmsXQtGOmWTC
 9H5gNf3rpckgSHwydUyVOuNj5Ec9B7g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-IGc1tWcUP1mnyMnqn6wLCg-1; Thu, 27 Apr 2023 12:35:12 -0400
X-MC-Unique: IGc1tWcUP1mnyMnqn6wLCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 908F03855597
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:35:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C549D63F52;
 Thu, 27 Apr 2023 16:35:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 14/19] migration/rdma: Remove all uses of RAM_CONTROL_HOOK
Date: Thu, 27 Apr 2023 18:34:44 +0200
Message-Id: <20230427163449.27473-15-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 migration/rdma.c      | 5 +----
 migration/rdma.h      | 2 ++
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index fac26d7869..7623e3c475 100644
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
index 67ba2d7f7e..c0110ca8cb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4467,7 +4467,10 @@ static int ram_load_precopy(QEMUFile *f)
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
index d7fdc963fd..e72584483a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3527,7 +3527,7 @@ static int dest_ram_sort_func(const void *a, const void *b)
  *
  * Keep doing this until the source tells us to stop.
  */
-static int qemu_rdma_registration_handle(QEMUFile *f)
+int qemu_rdma_registration_handle(QEMUFile *f)
 {
     RDMAControlHeader reg_resp = { .len = sizeof(RDMARegisterResult),
                                .type = RDMA_CONTROL_REGISTER_RESULT,
@@ -3851,9 +3851,6 @@ static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
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


