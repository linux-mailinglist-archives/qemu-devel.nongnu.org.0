Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844D4756D4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:47:57 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRpE-0005bS-4u
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:47:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaY-000300-RB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaU-0007I6-Ou
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbVOmwHr7tIyfVfQFBVLUvLhoZTHq87yY1Kqzu6JrQM=;
 b=cbBoMFNTp2jWAof5sXEFpkDpUH2J2JTiuH5z2bKnVCrcXRbu84vEBLMECahxnS1cSgHhee
 o4gRKPDiBprRrs8M/PdnI1f9ES3YwFefim/DlkggtdSefeMponh0lvggbI4Qzhr+ZzY2p7
 DZYxnSfu0nTbva241OOLxHsdTMtyGiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-Ci_qlZg8PYadheY0hl6WBg-1; Wed, 15 Dec 2021 05:32:37 -0500
X-MC-Unique: Ci_qlZg8PYadheY0hl6WBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 446C210B7440;
 Wed, 15 Dec 2021 10:32:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C1C6E978;
 Wed, 15 Dec 2021 10:32:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] multifd: Delete useless operation
Date: Wed, 15 Dec 2021 11:32:07 +0100
Message-Id: <20211215103218.17527-8-quintela@redhat.com>
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

We are dividing by page_size to multiply again in the only use.
Once there, improve the comments.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zlib.c | 13 ++++---------
 migration/multifd-zstd.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index ab4ba75d75..3fc7813b44 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -42,7 +42,6 @@ struct zlib_data {
  */
 static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
     z_stream *zs = &z->zs;
 
@@ -54,9 +53,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
         error_setg(errp, "multifd %d: deflate init failed", p->id);
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         deflateEnd(&z->zs);
@@ -180,7 +178,6 @@ static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
     z_stream *zs = &z->zs;
 
@@ -194,10 +191,8 @@ static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
         error_setg(errp, "multifd %d: inflate init failed", p->id);
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    /* We know compression "could" use more space */
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         inflateEnd(zs);
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 693bddf8c9..cc3b8869c0 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -47,7 +47,6 @@ struct zstd_data {
  */
 static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zstd_data *z = g_new0(struct zstd_data, 1);
     int res;
 
@@ -67,9 +66,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
                    p->id, ZSTD_getErrorName(res));
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeCStream(z->zcs);
@@ -191,7 +189,6 @@ static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zstd_data *z = g_new0(struct zstd_data, 1);
     int ret;
 
@@ -212,10 +209,8 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    /* We know compression "could" use more space */
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeDStream(z->zds);
-- 
2.33.1


