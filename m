Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9345B82C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:16:10 +0100 (CET)
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppJx-0007Bq-5I
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:16:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppC8-0001ZC-SQ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppC6-000727-RX
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecGKG2KT/0wE+CS/G8N8mQBoyFf+eL4MejwMzy5o5GQ=;
 b=VhlsPRsGny2lOicP4GGbGGue2X2dHAMZX9xNGJ8teyGb6KjU5C8w1CGXbxBS9WP/FYzIis
 SRRRLum9ILk5Jc+uuvrvCgM2fiDsztN9wBOxT5z/1vBlu0DkCSKbbUSuhgRjQ50kmJdboB
 jeeasyOCGaUwy5AXtBbtQN8dzvOU9rU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-7HQDHRSjMvi2wCwcHsmJMw-1; Wed, 24 Nov 2021 05:08:01 -0500
X-MC-Unique: 7HQDHRSjMvi2wCwcHsmJMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576D11800D41
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:08:00 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E14560843;
 Wed, 24 Nov 2021 10:07:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/23] multifd: recv side only needs the RAMBlock host
 address
Date: Wed, 24 Nov 2021 11:06:13 +0100
Message-Id: <20211124100617.19786-20-quintela@redhat.com>
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

So we can remove the MultiFDPages.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h      | 4 ++--
 migration/multifd-zlib.c | 2 +-
 migration/multifd-zstd.c | 2 +-
 migration/multifd.c      | 7 ++-----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 9fbcb7bb9a..ab32baebd7 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -136,8 +136,8 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
-    /* array of pages to receive */
-    MultiFDPages_t *pages;
+    /* ramblock host address */
+    uint8_t *host;
     /* packet allocated len */
     uint32_t packet_len;
     /* pointer to the packet */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index cc143b829d..bf4d87fa16 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -253,7 +253,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         }
 
         zs->avail_out = page_size;
-        zs->next_out = p->pages->block->host + p->normal[i];
+        zs->next_out = p->host + p->normal[i];
 
         /*
          * Welcome to inflate semantics
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 93d504ce0f..dd64ac3227 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -264,7 +264,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
     z->in.pos = 0;
 
     for (i = 0; i < p->normal_num; i++) {
-        z->out.dst = p->pages->block->host + p->normal[i];
+        z->out.dst = p->host + p->normal[i];
         z->out.size = page_size;
         z->out.pos = 0;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 3ffb1aba64..dc76322137 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -147,7 +147,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
     for (int i = 0; i < p->normal_num; i++) {
-        p->iov[i].iov_base = p->pages->block->host + p->normal[i];
+        p->iov[i].iov_base = p->host + p->normal[i];
         p->iov[i].iov_len = page_size;
     }
     return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
@@ -340,7 +340,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    p->pages->block = block;
+    p->host = block->host;
     for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
@@ -1004,8 +1004,6 @@ int multifd_load_cleanup(Error **errp)
         qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
-        multifd_pages_clear(p->pages);
-        p->pages = NULL;
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
@@ -1146,7 +1144,6 @@ int multifd_load_setup(Error **errp)
         qemu_sem_init(&p->sem_sync, 0);
         p->quit = false;
         p->id = i;
-        p->pages = multifd_pages_init(page_count);
         p->packet_len = sizeof(MultiFDPacket_t)
                       + sizeof(uint64_t) * page_count;
         p->packet = g_malloc0(p->packet_len);
-- 
2.33.1


