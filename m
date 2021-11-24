Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428E845B81F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:13:00 +0100 (CET)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppGt-0001NA-CH
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppAu-0007iT-3C
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppAn-0006mJ-Aq
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCdDh3ludzQAxMfzS4ktrQ1Cbf8eu31L+AmHakZVN3Q=;
 b=JDzbVUI6ZbxBKb2qTWV+1h40w6yAB6vEsDE0RILGfnahNBg+fGGud0S1NQzQEGeFQUX0qg
 PswfcD3dUK3GbtxBlr5dYP2FB8W1ZJWe6V6vrHY7Cepbw9jMH5IKjLFNvaDHU5WQiin3FE
 89zm6s4GLqlt/EA/MTrDW93NsV5KDa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-EvbiIp0vMx2-2il3ShUnjg-1; Wed, 24 Nov 2021 05:06:36 -0500
X-MC-Unique: EvbiIp0vMx2-2il3ShUnjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A076581EE61
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:06:35 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D3EA60843;
 Wed, 24 Nov 2021 10:06:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/23] multifd: Make zstd compression method not use iovs
Date: Wed, 24 Nov 2021 11:06:03 +0100
Message-Id: <20211124100617.19786-10-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zstd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index a8b104f4ee..2d5b61106c 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include <zstd.h>
 #include "qemu/rcu.h"
+#include "exec/ramblock.h"
 #include "exec/target_page.h"
 #include "qapi/error.h"
 #include "migration.h"
@@ -111,8 +112,8 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    struct iovec *iov = p->pages->iov;
     struct zstd_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     int ret;
     uint32_t i;
 
@@ -126,8 +127,8 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
         if (i == p->pages->num - 1) {
             flush = ZSTD_e_flush;
         }
-        z->in.src = iov[i].iov_base;
-        z->in.size = iov[i].iov_len;
+        z->in.src = p->pages->block->host + p->pages->offset[i];
+        z->in.size = page_size;
         z->in.pos = 0;
 
         /*
@@ -256,7 +257,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t in_size = p->next_packet_size;
     uint32_t out_size = 0;
-    uint32_t expected_size = p->pages->num * qemu_target_page_size();
+    size_t page_size = qemu_target_page_size();
+    uint32_t expected_size = p->pages->num * page_size;
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
     int ret;
@@ -278,10 +280,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     z->in.pos = 0;
 
     for (i = 0; i < p->pages->num; i++) {
-        struct iovec *iov = &p->pages->iov[i];
-
-        z->out.dst = iov->iov_base;
-        z->out.size = iov->iov_len;
+        z->out.dst = p->pages->block->host + p->pages->offset[i];
+        z->out.size = page_size;
         z->out.pos = 0;
 
         /*
@@ -295,8 +295,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
         } while (ret > 0 && (z->in.size - z->in.pos > 0)
-                         && (z->out.pos < iov->iov_len));
-        if (ret > 0 && (z->out.pos < iov->iov_len)) {
+                         && (z->out.pos < page_size));
+        if (ret > 0 && (z->out.pos < page_size)) {
             error_setg(errp, "multifd %d: decompressStream buffer too small",
                        p->id);
             return -1;
-- 
2.33.1


