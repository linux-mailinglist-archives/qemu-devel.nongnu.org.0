Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24352B1973
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:01:26 +0100 (CET)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWpZ-0006Af-62
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdWo4-0005iu-7K
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdWo0-0002fe-W7
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605265187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjOwi1gtfFaDSecHid7U/ROl8B6Gg/EZ0CZoJWOTc4Y=;
 b=CJwEcMaT01bDx6ZsQTquVHedQ3d0qHmK4Hd+lSeRf7WuRSTISn0BJ8r1dNHN1j6AhyJi9J
 0UfIl7coVmnr0WYU/hkJJNJMrg44GjAW7NiXfQfJwH2sPUmmViKtxXe0fzTNyBNB4O0L2d
 4ZlCaebd8oxIMOxz/fpklmCaZClmhXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30--Rm5cthqPG-wc9lTX9q9Gw-1; Fri, 13 Nov 2020 05:59:45 -0500
X-MC-Unique: -Rm5cthqPG-wc9lTX9q9Gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 842FA188C13E
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 10:59:44 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 608D75D9E8;
 Fri, 13 Nov 2020 10:59:43 +0000 (UTC)
Date: Fri, 13 Nov 2020 10:59:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/6] migration: Check xbzrle-cache-size more carefully
Message-ID: <20201113105940.GC3251@work-vm>
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113065236.2644169-5-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> migrate-set-parameters passes the size to xbzrle_cache_resize().
> xbzrle_cache_resize() checks it fits into size_t before it passes it
> on to cache_init().  cache_init() checks it is a power of two no
> smaller than @page_size.
> 
> cache_init() is also called from xbzrle_init(), bypassing
> xbzrle_cache_resize()'s check.
> 
> Drop xbzrle_cache_resize()'s check, and check more carefully in
> cache_init().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/page_cache.c | 15 ++++-----------
>  migration/ram.c        |  7 -------
>  2 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/page_cache.c b/migration/page_cache.c
> index b384f265fb..e07f4ad1dc 100644
> --- a/migration/page_cache.c
> +++ b/migration/page_cache.c
> @@ -41,17 +41,10 @@ struct PageCache {
>  PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
>  {
>      int64_t i;
> -    size_t num_pages = new_size / page_size;
> +    uint64_t num_pages = new_size / page_size;
>      PageCache *cache;
>  
> -    if (new_size < page_size) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
> -                   "is smaller than one target page size");
> -        return NULL;
> -    }
> -
> -    /* round down to the nearest power of 2 */
> -    if (!is_power_of_2(num_pages)) {
> +    if (num_pages != (size_t)num_pages || !is_power_of_2(num_pages)) {
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
>                     "is not a power of two number of pages");

That error message is now wrong since it includes a whole bunch of
reasons.
Also, the comparison is now on the divided num_pages, it's not that
obvious to me that checking the num_pages makes sense in acomparison to
checking the actual cache size.

(Arguably the check should also happen in migrate_params_test_apply)

Dave

>          return NULL;
> @@ -71,8 +64,8 @@ PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
>      trace_migration_pagecache_init(cache->max_num_items);
>  
>      /* We prefer not to abort if there is no memory */
> -    cache->page_cache = g_try_malloc((cache->max_num_items) *
> -                                     sizeof(*cache->page_cache));
> +    cache->page_cache = g_try_malloc_n(cache->max_num_items,
> +                                       sizeof(*cache->page_cache));
>      if (!cache->page_cache) {
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
>                     "Failed to allocate page cache");
> diff --git a/migration/ram.c b/migration/ram.c
> index a84425d04f..d632ae694c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -131,13 +131,6 @@ int xbzrle_cache_resize(uint64_t new_size, Error **errp)
>      PageCache *new_cache;
>      int64_t ret = 0;
>  
> -    /* Check for truncation */
> -    if (new_size != (size_t)new_size) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
> -                   "exceeding address space");
> -        return -1;
> -    }
> -
>      if (new_size == migrate_xbzrle_cache_size()) {
>          /* nothing to do */
>          return 0;
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


