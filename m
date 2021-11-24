Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3B45B860
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:30:43 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppY2-0006TU-Li
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:30:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppCo-0003bQ-Rj
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppCm-0007US-ME
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHmXpk+ZVRbhpA6PDwrLC0W/S4sg8OR0VfUtrYBV4JY=;
 b=W4au+Q/N7iAnVRue18PVnr6s5WvwQwnIAjb0CHxQ/+kE+R5Moertv+FYC96eOB59NVUK3N
 CW7Wwcxpd7jTE8rod/pbg/JAnCdwjC0AlBDJGBBntKSaDLIqZTwFz/P++XVQ0FZuc3PgvY
 W4zsRf7C8N0iMaMsX4Jhj+BTHFLb/Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-8bcAsEgYNCmCFEBJqMUJzg-1; Wed, 24 Nov 2021 05:08:42 -0500
X-MC-Unique: 8bcAsEgYNCmCFEBJqMUJzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA8F192AB6D
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:08:42 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2BAB60843;
 Wed, 24 Nov 2021 10:08:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/23] multifd: Zero pages transmission
Date: Wed, 24 Nov 2021 11:06:16 +0100
Message-Id: <20211124100617.19786-23-quintela@redhat.com>
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

This implements the zero page dection and handling.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 2e4dffd6c6..5c1fc70ce3 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/rcu.h"
 #include "exec/target_page.h"
 #include "sysemu/sysemu.h"
@@ -277,6 +278,12 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 
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
@@ -362,6 +369,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         p->normal[i] = offset;
     }
 
+    for (i = 0; i < p->zero_num; i++) {
+        uint64_t offset = be64_to_cpu(packet->offset[p->normal_num + i]);
+
+        if (offset > (block->used_length - page_size)) {
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
 
@@ -652,8 +671,14 @@ static void *multifd_send_thread(void *opaque)
             p->zero_num = 0;
 
             for (int i = 0; i < p->pages->num; i++) {
-                p->normal[p->normal_num] = p->pages->offset[i];
-                p->normal_num++;
+                if (buffer_is_zero(p->pages->block->host + p->pages->offset[i],
+                                   qemu_target_page_size())) {
+                    p->zero[p->zero_num] = p->pages->offset[i];
+                    p->zero_num++;
+                } else {
+                    p->normal[p->normal_num] = p->pages->offset[i];
+                    p->normal_num++;
+                }
             }
 
             if (p->normal_num) {
@@ -1112,6 +1137,10 @@ static void *multifd_recv_thread(void *opaque)
             }
         }
 
+        for (int i = 0; i < p->zero_num; i++) {
+            memset(p->host + p->zero[i], 0, qemu_target_page_size());
+        }
+
         if (flags & MULTIFD_FLAG_SYNC) {
             qemu_sem_post(&multifd_recv_state->sem_sync);
             qemu_sem_wait(&p->sem_sync);
-- 
2.33.1


