Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02730C146
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:19:27 +0100 (CET)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wWc-0005PY-FR
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUy-00046p-82
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUw-0006mz-38
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIdyn9yx+1z/a/3059Ovl9kwho4b9sEXJ078QUJyfbE=;
 b=GJThuruboNzpwN4LuRvRb22XBUihtZ8vbmN+2A0J5YbEZujLUo1DkAeaqtpaYSyCke7SQJ
 6JHAVWqhe5NGmmzqHJ7T5wP8zv8lOnwDHX1A9stfSpEBKo/qYNbL/PPqEadEcOx4sLaQpP
 eqU9UovE4FzurPspPBBsO98irVlXGRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-vIrCsEfLMKuyap3ug6MSjg-1; Tue, 02 Feb 2021 09:17:36 -0500
X-MC-Unique: vIrCsEfLMKuyap3ug6MSjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 036A71800D50
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:17:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C808A5D9C6;
 Tue,  2 Feb 2021 14:17:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46DCC1138468; Tue,  2 Feb 2021 15:17:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] migration: Fix cache_init()'s "Failed to allocate"
 error messages
Date: Tue,  2 Feb 2021 15:17:33 +0100
Message-Id: <20210202141734.2488076-4-armbru@redhat.com>
In-Reply-To: <20210202141734.2488076-1-armbru@redhat.com>
References: <20210202141734.2488076-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: berrange@redhat.com, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cache_init() attempts to handle allocation failure..  The two error
messages are garbage, as untested error messages commonly are:

    Parameter 'cache size' expects Failed to allocate cache
    Parameter 'cache size' expects Failed to allocate page cache

Fix them to just

    Failed to allocate cache
    Failed to allocate page cache

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.26.2


