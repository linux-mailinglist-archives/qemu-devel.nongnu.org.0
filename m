Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9247571D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:59:46 +0100 (CET)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS0f-0007RW-D9
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRat-0003qp-L7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRas-0007OB-02
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5sZynob5e7ZwKiDY9uVFFmgy+epw9wVO5qAWBQ6UOE=;
 b=PT1NpeFNtTxLKGAys+gqfHMgQTI1hPJeZrKrvklhnDN6zzoK6ZzX5rYYxOINbIzlO3KgrI
 UQ796XPKRoTe2su3T+SiGgtTDOgyv1I2nFP+X/oCzboI4/zjrJfwXCEYw1p3zFHgIcpYhk
 STG+0aXlp0jOgihliA9Mv7QvoT3ULPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-ImfLjs0POSyPHbGglKbBBw-1; Wed, 15 Dec 2021 05:33:02 -0500
X-MC-Unique: ImfLjs0POSyPHbGglKbBBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 180AA81EE61;
 Wed, 15 Dec 2021 10:33:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B052575C47;
 Wed, 15 Dec 2021 10:32:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] multifd: Make zlib compression method not use iovs
Date: Wed, 15 Dec 2021 11:32:18 +0100
Message-Id: <20211215103218.17527-19-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zlib.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index e85ef8824d..da6201704c 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include <zlib.h>
 #include "qemu/rcu.h"
+#include "exec/ramblock.h"
 #include "exec/target_page.h"
 #include "qapi/error.h"
 #include "migration.h"
@@ -98,8 +99,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    struct iovec *iov = p->pages->iov;
     struct zlib_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t out_size = 0;
     int ret;
@@ -113,8 +114,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_in = iov[i].iov_len;
-        zs->next_in = iov[i].iov_base;
+        zs->avail_in = page_size;
+        zs->next_in = p->pages->block->host + p->pages->offset[i];
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
@@ -235,6 +236,7 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
 static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
+    size_t page_size = qemu_target_page_size();
     z_stream *zs = &z->zs;
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
@@ -259,7 +261,6 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
     zs->next_in = z->zbuff;
 
     for (i = 0; i < p->pages->num; i++) {
-        struct iovec *iov = &p->pages->iov[i];
         int flush = Z_NO_FLUSH;
         unsigned long start = zs->total_out;
 
@@ -267,8 +268,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
-        zs->avail_out = iov->iov_len;
-        zs->next_out = iov->iov_base;
+        zs->avail_out = page_size;
+        zs->next_out = p->pages->block->host + p->pages->offset[i];
 
         /*
          * Welcome to inflate semantics
@@ -281,8 +282,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
         do {
             ret = inflate(zs, flush);
         } while (ret == Z_OK && zs->avail_in
-                             && (zs->total_out - start) < iov->iov_len);
-        if (ret == Z_OK && (zs->total_out - start) < iov->iov_len) {
+                             && (zs->total_out - start) < page_size);
+        if (ret == Z_OK && (zs->total_out - start) < page_size) {
             error_setg(errp, "multifd %d: inflate generated too few output",
                        p->id);
             return -1;
-- 
2.33.1


