Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55423313C3F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:05:24 +0100 (CET)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AuZ-0005kj-9X
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kK-0001nP-Ak
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kG-0002O0-G0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjLOWmZArq6FQ4QbVsGRrFuusXByKswK9vWyVZhQ+2g=;
 b=RF0RlpRnaX0NxOhuxlWUHdbQKuNG33gbIGTSkFH/9NCaDZgol0DrJkBHBbvtGmDdy8xpZb
 CE5zQ1ENaBYPiMzKjGDaWU0iiqJNTCrUmCN8Eul2dxO91Epi/EC5gIwlAFa+NzLfx6Cxw0
 +wRaBVbRy8pNqT09RVBJkJdCSWHaSYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-szLyQgACOWSAEO_Ge0GHQA-1; Mon, 08 Feb 2021 06:30:17 -0500
X-MC-Unique: szLyQgACOWSAEO_Ge0GHQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A6CF804036;
 Mon,  8 Feb 2021 11:30:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 801321002393;
 Mon,  8 Feb 2021 11:30:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 11/27] migration: Fix cache_init()'s "Failed to allocate" error
 messages
Date: Mon,  8 Feb 2021 11:29:02 +0000
Message-Id: <20210208112918.185058-12-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

cache_init() attempts to handle allocation failure.  The two error
messages are garbage, as untested error messages commonly are:

    Parameter 'cache size' expects Failed to allocate cache
    Parameter 'cache size' expects Failed to allocate page cache

Fix them to just

    Failed to allocate cache
    Failed to allocate page cache

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210202141734.2488076-4-armbru@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/page_cache.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/migration/page_cache.c b/migration/page_cache.c
index b384f265fb..6d4f7a9bbc 100644
--- a/migration/page_cache.c
+++ b/migration/page_cache.c
@@ -60,8 +60,7 @@ PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
     /* We prefer not to abort if there is no memory */
     cache = g_try_malloc(sizeof(*cache));
     if (!cache) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
-                   "Failed to allocate cache");
+        error_setg(errp, "Failed to allocate cache");
         return NULL;
     }
     cache->page_size = page_size;
@@ -74,8 +73,7 @@ PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
     cache->page_cache = g_try_malloc((cache->max_num_items) *
                                      sizeof(*cache->page_cache));
     if (!cache->page_cache) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
-                   "Failed to allocate page cache");
+        error_setg(errp, "Failed to allocate page cache");
         g_free(cache);
         return NULL;
     }
-- 
2.29.2


