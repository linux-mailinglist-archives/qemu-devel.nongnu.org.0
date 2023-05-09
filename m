Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117656FCD8D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:17:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRsF-0001Zf-Mw; Tue, 09 May 2023 14:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwRs7-0001YV-U6
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwRs5-0003f0-SN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683656132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wst7X7jWzbrGd3if81XGSbEknCUYee7TxXrXbkDxCRs=;
 b=Y7nrzGbh1bldLCEMZOWcGkyKC6SubmzW0sLFcmge118KIfIa7RfrJHMHn4slvN2MqDaEtc
 3MdFXa5jtkMm7LTwOgWwIt2cmy7PSe9vS8bz7Zob/fji/uu9fgMx/UNKC3ffm2hfZMufzs
 8or5UYzD0LssBmqmxnpAQwkXbBz7q1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-HRt4gxR_NViYq1dbL6-KeA-1; Tue, 09 May 2023 14:15:31 -0400
X-MC-Unique: HRt4gxR_NViYq1dbL6-KeA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E26380C8CE;
 Tue,  9 May 2023 18:15:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2628D492C13;
 Tue,  9 May 2023 18:15:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org,
	Lukas Straub <lukasstraub2@web.de>
Cc: Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] multifd: Add colo support
Date: Tue,  9 May 2023 20:15:28 +0200
Message-Id: <20230509181528.84212-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

From: Lukas Straub <lukasstraub2@web.de>

Like in the normal ram_load() path, put the received pages into the
colo cache and mark the pages in the bitmap so that they will be
flushed to the guest later.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>

---

Hi Lukas

What about this instead of your other three patches?  I think it is
clearer, and I don't think that we are going to have anything else
that is going to hook there anytime soon.

Notice that I put CONFIG_COLO waiting for Vladimir changes to get in
before I merge this.

Notice also that I "lost" the line:

  p->host = p->block->host;

In the error case.  But in that case we are aborting the migration, so
we don't care.

Can you check if it works for you?
Here it compiles, so it must be perfect.

Thanks, Juan.
---
 migration/meson.build    |  2 +-
 migration/multifd-colo.c | 49 ++++++++++++++++++++++++++++++++++++++++
 migration/multifd-colo.h | 24 ++++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 migration/multifd-colo.c
 create mode 100644 migration/multifd-colo.h

diff --git a/migration/meson.build b/migration/meson.build
index 75de868bb7..c9db40d4d4 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -23,7 +23,7 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
-  'multifd-zlib.c',
+  'multifd-colo.c',
   'ram-compress.c',
   'options.c',
   'postcopy-ram.c',
diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c
new file mode 100644
index 0000000000..10fa1467fa
--- /dev/null
+++ b/migration/multifd-colo.c
@@ -0,0 +1,49 @@
+/*
+ * multifd colo implementation
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/target_page.h"
+#include "exec/ramblock.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "ram.h"
+#include "multifd.h"
+#include "options.h"
+#include "io/channel-socket.h"
+#include "migration/colo.h"
+#include "multifd-colo.h"
+
+void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p)
+{
+    if (migrate_colo()) {
+        /*
+         * While we're still in precopy mode, we copy received pages to both guest
+         * and cache. No need to set dirty bits, since guest and cache memory are
+         * in sync.
+         */
+        if (migration_incoming_in_colo_state()) {
+            colo_record_bitmap(p->block, p->normal, p->normal_num);
+        }
+        p->host = p->block->colo_cache;
+    }
+}
+
+void multifd_colo_process_recv_pages(MultiFDRecvParams *p)
+{
+    if (migrate_colo()) {
+        if (!migration_incoming_in_colo_state()) {
+            for (int i = 0; i < p->normal_num; i++) {
+                void *guest = p->block->host + p->normal[i];
+                void *cache = p->host + p->normal[i];
+                memcpy(guest, cache, p->page_size);
+            }
+        }
+        p->host = p->block->host;
+    }
+}
diff --git a/migration/multifd-colo.h b/migration/multifd-colo.h
new file mode 100644
index 0000000000..1636c617fc
--- /dev/null
+++ b/migration/multifd-colo.h
@@ -0,0 +1,24 @@
+/*
+ * multifd colo header
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_MIGRATION_MULTIFD_COLO_H
+#define QEMU_MIGRATION_MULTIFD_COLO_H
+
+#ifndef CONFIG_COLO
+
+void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p);
+void multifd_colo_process_recv_pages(MultiFDRecvParams *p);
+
+#else
+
+static inline void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p) {}
+static inline void multifd_colo_process_recv_pages(MultiFDRecvParams *p) {}
+
+#endif /* CONFIG_COLO */
+#endif
-- 
2.40.0


