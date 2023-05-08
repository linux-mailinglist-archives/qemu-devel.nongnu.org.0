Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC556FB675
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:53:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5yF-0004BI-D7; Mon, 08 May 2023 14:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5yC-0004Aj-GS
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5yB-0005zI-1s
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683571942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lANJAnuQcfwj3tIvtmJW8wGJt/YsnwLqI/q4w1snX5o=;
 b=WsOrUUAc+F0rEDv38IkluaCCm5qrlC391Qec7V4qvZNbfmH8/y/aB76UbwDX9bJgA4u68w
 Rw97gqdMsM8X0gICQCBjRrToglWfeUK5zZCgGjsCBVVwSz9ctBJKv+2g/BSd+BpoUnCa7A
 RG+kr5zcVyQa3b25/HXq5w0mQEtiB3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-UyFlqnANNCC5PJEv4_uPsA-1; Mon, 08 May 2023 14:52:18 -0400
X-MC-Unique: UyFlqnANNCC5PJEv4_uPsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EDE23C16E84;
 Mon,  8 May 2023 18:52:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D80C61402C06;
 Mon,  8 May 2023 18:52:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 04/13] ram.c: Dont change param->block in the compress thread
Date: Mon,  8 May 2023 20:52:00 +0200
Message-Id: <20230508185209.68604-5-quintela@redhat.com>
In-Reply-To: <20230508185209.68604-1-quintela@redhat.com>
References: <20230508185209.68604-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Instead introduce a extra parameter to trigger the compress thread.
Now, when the compress thread is done, we know what RAMBlock and
offset it did compress.

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7bc05fc034..b552a9e538 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -492,6 +492,7 @@ typedef enum CompressResult CompressResult;
 struct CompressParam {
     bool done;
     bool quit;
+    bool trigger;
     CompressResult result;
     QEMUFile *file;
     QemuMutex mutex;
@@ -565,10 +566,10 @@ static void *do_data_compress(void *opaque)
 
     qemu_mutex_lock(&param->mutex);
     while (!param->quit) {
-        if (param->block) {
+        if (param->trigger) {
             block = param->block;
             offset = param->offset;
-            param->block = NULL;
+            param->trigger = false;
             qemu_mutex_unlock(&param->mutex);
 
             result = do_compress_ram_page(param->file, &param->stream,
@@ -1545,6 +1546,7 @@ static inline void set_compress_params(CompressParam *param, RAMBlock *block,
 {
     param->block = block;
     param->offset = offset;
+    param->trigger = true;
 }
 
 static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset)
-- 
2.40.0


