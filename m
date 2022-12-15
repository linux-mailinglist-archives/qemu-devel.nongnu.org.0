Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9564D8C1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 10:40:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5kiB-00087e-Ro; Thu, 15 Dec 2022 04:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5ki9-00084R-Bd
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p5ki7-0000Zu-Ol
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671097167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MyOOzG/IByBPCSi/RuF6EO6mdBGoKRDsMNpVGRjYHyo=;
 b=SbuG386E2APLmVBL2rHyJC76F6LlzIy/BoSaaP866RSD5B+AKrEuOkFOOFYc2AanXKq6ZH
 UjRTJoLwJwe/mcCMTrzuAGSQiC5zDx5zRljuB23Suc1pdN1qYinT9dKqY5Mcfun0PJjOv8
 xN66IdVxfJpvU55YMxpjChWw3tSEphs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-YZbwd-jRNpCaKPnLOrez9A-1; Thu, 15 Dec 2022 04:39:24 -0500
X-MC-Unique: YZbwd-jRNpCaKPnLOrez9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F9323813F2C;
 Thu, 15 Dec 2022 09:39:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E094240C2064;
 Thu, 15 Dec 2022 09:39:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 09/19] migration: Remove RAMState.f references in compression
 code
Date: Thu, 15 Dec 2022 10:38:39 +0100
Message-Id: <20221215093849.4771-10-quintela@redhat.com>
In-Reply-To: <20221215093849.4771-1-quintela@redhat.com>
References: <20221215093849.4771-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

Removing referencing to RAMState.f in compress_page_with_multi_thread() and
flush_compressed_data().

Compression code by default isn't compatible with having >1 channels (or it
won't currently know which channel to flush the compressed data), so to
make it simple we always flush on the default to_dst_file port until
someone wants to add >1 ports support, as rs->f right now can really
change (after postcopy preempt is introduced).

There should be no functional change at all after patch applied, since as
long as rs->f referenced in compression code, it must be to_dst_file.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 41475431fc..6e3dc845c5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1461,6 +1461,7 @@ static bool save_page_use_compression(RAMState *rs);
 
 static void flush_compressed_data(RAMState *rs)
 {
+    MigrationState *ms = migrate_get_current();
     int idx, len, thread_count;
 
     if (!save_page_use_compression(rs)) {
@@ -1479,7 +1480,7 @@ static void flush_compressed_data(RAMState *rs)
     for (idx = 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
@@ -1498,11 +1499,11 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
     param->offset = offset;
 }
 
-static int compress_page_with_multi_thread(RAMState *rs, RAMBlock *block,
-                                           ram_addr_t offset)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 {
     int idx, thread_count, bytes_xmit = -1, pages = -1;
     bool wait = migrate_compress_wait_thread();
+    MigrationState *ms = migrate_get_current();
 
     thread_count = migrate_compress_threads();
     qemu_mutex_lock(&comp_done_lock);
@@ -1510,7 +1511,8 @@ retry:
     for (idx = 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
             comp_param[idx].done = false;
-            bytes_xmit = qemu_put_qemu_file(rs->f, comp_param[idx].file);
+            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
+                                            comp_param[idx].file);
             qemu_mutex_lock(&comp_param[idx].mutex);
             set_compress_params(&comp_param[idx], block, offset);
             qemu_cond_signal(&comp_param[idx].cond);
@@ -2263,7 +2265,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
         return false;
     }
 
-    if (compress_page_with_multi_thread(rs, block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset) > 0) {
         return true;
     }
 
-- 
2.38.1


