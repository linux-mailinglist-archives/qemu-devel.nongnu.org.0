Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E430F988
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:24:23 +0100 (CET)
Received: from localhost ([::1]:32954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iMf-0002ta-1g
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hh5-0002Fk-W9
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hh3-0005Ev-MR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjLOWmZArq6FQ4QbVsGRrFuusXByKswK9vWyVZhQ+2g=;
 b=D8TXqc8UiikI2hlYV1T87qHx5Dg1r7PPRx8JEeD02LuGNwIKOKUdzluxDov0Z1VTAFUjWV
 rdjzNfzq4Eba1zRlZGh2xJbncAZaxMXIgGeBqQsB68H7f3YyhRYvAZjFATuoEatMfZ4J4r
 OXbhTLKJiO3ptyckTEX+PrHr0CqtWng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-XZwG0sI6NIS41_HZ7JDDqA-1; Thu, 04 Feb 2021 11:41:19 -0500
X-MC-Unique: XZwG0sI6NIS41_HZ7JDDqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E726980403B;
 Thu,  4 Feb 2021 16:41:17 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF4AE19708;
 Thu,  4 Feb 2021 16:41:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 12/27] migration: Fix cache_init()'s "Failed to allocate" error
 messages
Date: Thu,  4 Feb 2021 16:39:44 +0000
Message-Id: <20210204163959.377618-13-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


