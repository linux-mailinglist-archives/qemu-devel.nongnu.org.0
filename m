Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E766F1EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:16:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWM-0004uY-Bd; Fri, 28 Apr 2023 15:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWH-0004ra-Fe
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWF-000311-QR
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=su5i0UfNaL2XCe4Ha2zLPv/vFQSyMEgy7eGwIEg2rr4=;
 b=P0kJ47VIjz2k6vkNO+sN0q9DRjk1+E12RrZge0826x8obatk1y4uy7/PTrpNuKX0zLWU83
 s68SCHZCC+by2lCFmuFT8X7WzMuvlEQEt6bK1u0Qy2u0Z271QoM+OUYuAd7NLkSgsE/Cky
 I+9w5modE3LiK0UgFWLt/2LouHFjWY0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-0G-Xu9BvMkqvYQvkI7zwPQ-1; Fri, 28 Apr 2023 15:12:31 -0400
X-MC-Unique: 0G-Xu9BvMkqvYQvkI7zwPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DF953C025C0;
 Fri, 28 Apr 2023 19:12:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 060B02166B4F;
 Fri, 28 Apr 2023 19:12:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 15/21] ram.c: Call update_compress_thread_counts from
 compress_send_queued_data
Date: Fri, 28 Apr 2023 21:11:57 +0200
Message-Id: <20230428191203.39520-16-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

From: Lukas Straub <lukasstraub2@web.de>

This makes the core compress code more independend from ram.c.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 53aba37be9..f17f6581ff 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1540,12 +1540,14 @@ static int send_queued_data(CompressParam *param)
         abort();
     }
 
+    update_compress_thread_counts(param, len);
+
     return len;
 }
 
 static void flush_compressed_data(RAMState *rs)
 {
-    int idx, len, thread_count;
+    int idx, thread_count;
 
     if (!save_page_use_compression(rs)) {
         return;
@@ -1564,15 +1566,8 @@ static void flush_compressed_data(RAMState *rs)
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
             CompressParam *param = &comp_param[idx];
-            len = send_queued_data(param);
+            send_queued_data(param);
             compress_reset_result(param);
-
-            /*
-             * it's safe to fetch zero_page without holding comp_done_lock
-             * as there is no further request submitted to the thread,
-             * i.e, the thread should be waiting for a request at this point.
-             */
-            update_compress_thread_counts(param, len);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
     }
@@ -1588,7 +1583,7 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
 
 static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 {
-    int idx, thread_count, bytes_xmit = -1, pages = -1;
+    int idx, thread_count, pages = -1;
     bool wait = migrate_compress_wait_thread();
 
     thread_count = migrate_compress_threads();
@@ -1599,11 +1594,10 @@ retry:
             CompressParam *param = &comp_param[idx];
             qemu_mutex_lock(&param->mutex);
             param->done = false;
-            bytes_xmit = send_queued_data(param);
+            send_queued_data(param);
             compress_reset_result(param);
             set_compress_params(param, block, offset);
 
-            update_compress_thread_counts(param, bytes_xmit);
             qemu_cond_signal(&param->cond);
             qemu_mutex_unlock(&param->mutex);
             pages = 1;
-- 
2.40.0


