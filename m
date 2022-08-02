Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC34587781
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 09:07:18 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlzk-00011V-AA
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 03:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlZ5-0003yo-Hf
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlZ3-0006By-Qz
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659422377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqSKwBl1Lj03FgccrlDouwvURsMXTaeos2WOpfs/ILw=;
 b=Qxh2ZOt9dYSZwmGFna2Zd5pVL7Nku7748eaM5+pG0+jDhCjC+mihjqSTFM5hnQOKL25zrw
 Djfz7EQ8dcV16GXLTyBB8xbP2UH0nANe/QHHv0xnqqPfSUvd6iXXpF/IrWwx6QLQ8Ej3Dz
 AL+dZRjNGjREKNrYA8hy4qdlIwLsOFg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-DKGpRXJiNSmrbI4Gq-AI4Q-1; Tue, 02 Aug 2022 02:39:34 -0400
X-MC-Unique: DKGpRXJiNSmrbI4Gq-AI4Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C45471C0BDFC;
 Tue,  2 Aug 2022 06:39:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0EFA492CA4;
 Tue,  2 Aug 2022 06:39:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 11/12] multifd: Zero pages transmission
Date: Tue,  2 Aug 2022 08:39:06 +0200
Message-Id: <20220802063907.18882-12-quintela@redhat.com>
In-Reply-To: <20220802063907.18882-1-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

This implements the zero page dection and handling.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Add comment for offset (dave)
Use local variables for offset/block to have shorter lines
---
 migration/multifd.h |  5 +++++
 migration/multifd.c | 41 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index a1b852200d..5931de6f86 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -52,6 +52,11 @@ typedef struct {
     uint32_t unused32[1];    /* Reserved for future use */
     uint64_t unused64[3];    /* Reserved for future use */
     char ramblock[256];
+    /*
+     * This array contains the pointers to:
+     *  - normal pages (initial normal_pages entries)
+     *  - zero pages (following zero_pages entries)
+     */
     uint64_t offset[];
 } __attribute__((packed)) MultiFDPacket_t;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 4473d9f834..89811619d8 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/rcu.h"
 #include "exec/target_page.h"
 #include "sysemu/sysemu.h"
@@ -275,6 +276,12 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 
         packet->offset[i] = cpu_to_be64(temp);
     }
+    for (i = 0; i < p->zero_num; i++) {
+        /* there are architectures where ram_addr_t is 32 bit */
+        uint64_t temp = p->zero[i];
+
+        packet->offset[p->normal_num + i] = cpu_to_be64(temp);
+    }
 }
 
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
@@ -358,6 +365,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         p->normal[i] = offset;
     }
 
+    for (i = 0; i < p->zero_num; i++) {
+        uint64_t offset = be64_to_cpu(packet->offset[p->normal_num + i]);
+
+        if (offset > (block->used_length - p->page_size)) {
+            error_setg(errp, "multifd: offset too long %" PRIu64
+                       " (max " RAM_ADDR_FMT ")",
+                       offset, block->used_length);
+            return -1;
+        }
+        p->zero[i] = offset;
+    }
+
     return 0;
 }
 
@@ -648,6 +667,8 @@ static void *multifd_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
+    /* qemu older than 7.0 don't understand zero page on multifd channel */
+    bool use_zero_page = migrate_use_multifd_zero_page();
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
 
@@ -670,6 +691,7 @@ static void *multifd_send_thread(void *opaque)
         qemu_mutex_lock(&p->mutex);
 
         if (p->pending_job) {
+            RAMBlock *rb = p->pages->block;
             uint64_t packet_num = p->packet_num;
             p->flags = 0;
             if (p->sync_needed) {
@@ -688,8 +710,16 @@ static void *multifd_send_thread(void *opaque)
             }
 
             for (int i = 0; i < p->pages->num; i++) {
-                p->normal[p->normal_num] = p->pages->offset[i];
-                p->normal_num++;
+                uint64_t offset = p->pages->offset[i];
+                if (use_zero_page &&
+                    buffer_is_zero(rb->host + offset, p->page_size)) {
+                    p->zero[p->zero_num] = offset;
+                    p->zero_num++;
+                    ram_release_page(rb->idstr, offset);
+                } else {
+                    p->normal[p->normal_num] = offset;
+                    p->normal_num++;
+                }
             }
 
             if (p->normal_num) {
@@ -1152,6 +1182,13 @@ static void *multifd_recv_thread(void *opaque)
             }
         }
 
+        for (int i = 0; i < p->zero_num; i++) {
+            void *page = p->host + p->zero[i];
+            if (!buffer_is_zero(page, p->page_size)) {
+                memset(page, 0, p->page_size);
+            }
+        }
+
         if (sync_needed) {
             qemu_sem_post(&multifd_recv_state->sem_sync);
             qemu_sem_wait(&p->sem_sync);
-- 
2.37.1


