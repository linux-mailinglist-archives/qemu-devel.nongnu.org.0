Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090196FB3CC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:29:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2lj-0004be-7L; Mon, 08 May 2023 11:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2lg-0004Wc-R5
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2lc-0004Ys-R1
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683559632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK/Bi+9ummnPzvwITUO6ZTsthFw23cO8qAA9Zcc0/Rg=;
 b=cnbq42BqoIEn3yRpYeiOXmQ7xmqdyQrGSHjoTs8HxZWqlapZJs87mq1vesOpV6TpSwx99X
 lwDxg6S0jMacGWsxvp9lOFr1HbAvi4IMNSAh1V7i1Mp46zCwPcU9/u2yKpk3zLvheHBty5
 ryxrqPt238dCbFEdUQQdnHFflxRKDuQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-B8FXqV0AMiyCnxyuHx6fjg-1; Mon, 08 May 2023 11:27:11 -0400
X-MC-Unique: B8FXqV0AMiyCnxyuHx6fjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD0872807D7B;
 Mon,  8 May 2023 15:27:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41E1040C6F41;
 Mon,  8 May 2023 15:27:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH 05/13] ram.c: Reset result after sending queued data
Date: Mon,  8 May 2023 17:26:49 +0200
Message-Id: <20230508152657.66701-6-quintela@redhat.com>
In-Reply-To: <20230508152657.66701-1-quintela@redhat.com>
References: <20230508152657.66701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

And take the param->mutex lock for the whole section to ensure
thread-safety.
Now, it is explicitly clear if there is no queued data to send.
Before, this was handled by param->file stream being empty and thus
qemu_put_qemu_file() not sending anything.

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b552a9e538..4e14e3bb94 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1508,6 +1508,13 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 
 static bool save_page_use_compression(RAMState *rs);
 
+static inline void compress_reset_result(CompressParam *param)
+{
+    param->result = RES_NONE;
+    param->block = NULL;
+    param->offset = 0;
+}
+
 static void flush_compressed_data(RAMState *rs)
 {
     MigrationState *ms = migrate_get_current();
@@ -1529,13 +1536,16 @@ static void flush_compressed_data(RAMState *rs)
     for (idx = 0; idx < thread_count; idx++) {
         qemu_mutex_lock(&comp_param[idx].mutex);
         if (!comp_param[idx].quit) {
-            len = qemu_put_qemu_file(ms->to_dst_file, comp_param[idx].file);
+            CompressParam *param = &comp_param[idx];
+            len = qemu_put_qemu_file(ms->to_dst_file, param->file);
+            compress_reset_result(param);
+
             /*
              * it's safe to fetch zero_page without holding comp_done_lock
              * as there is no further request submitted to the thread,
              * i.e, the thread should be waiting for a request at this point.
              */
-            update_compress_thread_counts(&comp_param[idx], len);
+            update_compress_thread_counts(param, len);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
     }
@@ -1560,15 +1570,17 @@ static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
 retry:
     for (idx = 0; idx < thread_count; idx++) {
         if (comp_param[idx].done) {
-            comp_param[idx].done = false;
-            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file,
-                                            comp_param[idx].file);
-            qemu_mutex_lock(&comp_param[idx].mutex);
-            set_compress_params(&comp_param[idx], block, offset);
-            qemu_cond_signal(&comp_param[idx].cond);
-            qemu_mutex_unlock(&comp_param[idx].mutex);
+            CompressParam *param = &comp_param[idx];
+            qemu_mutex_lock(&param->mutex);
+            param->done = false;
+            bytes_xmit = qemu_put_qemu_file(ms->to_dst_file, param->file);
+            compress_reset_result(param);
+            set_compress_params(param, block, offset);
+
+            update_compress_thread_counts(param, bytes_xmit);
+            qemu_cond_signal(&param->cond);
+            qemu_mutex_unlock(&param->mutex);
             pages = 1;
-            update_compress_thread_counts(&comp_param[idx], bytes_xmit);
             break;
         }
     }
-- 
2.40.0


