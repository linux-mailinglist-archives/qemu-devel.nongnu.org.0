Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF202B197A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:02:52 +0100 (CET)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWqx-0007V6-I9
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdWpU-0006aJ-7J
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdWpS-0003Gv-1B
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605265269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fsTg4XtlUP7ZDOYS++ggo5H0m1RYFoWwIneaq+B6UOw=;
 b=Kox61q7bElQWIOc1g+NAcOfuZ3+n+zJl90Wm3ZlhwMRnT9LUG+JwT4WTjl45ktMB7L0Ta1
 oDELHGN2tzr/w4dydwr/SZNJjvPLsQnD06631CSQ8Q3nAupwZBXWc0jl1luRxi7Tl3s4kN
 TRiJRoH7sLgRSLQ6pDnKaNs7MSCreq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-22_i2mVqPyafsdY-bKZNXw-1; Fri, 13 Nov 2020 06:01:07 -0500
X-MC-Unique: 22_i2mVqPyafsdY-bKZNXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48C7957240
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 11:01:06 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16ED560C15;
 Fri, 13 Nov 2020 11:01:04 +0000 (UTC)
Date: Fri, 13 Nov 2020 11:01:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 5/6] migration: Fix cache_init()'s "Failed to allocate"
 error messages
Message-ID: <20201113110102.GD3251@work-vm>
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-6-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113065236.2644169-6-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> cache_init() attempts to handle allocation failure..  The two error
> messages are garbage, as untested error messages commonly are:
> 
>     Parameter 'cache size' expects Failed to allocate cache
>     Parameter 'cache size' expects Failed to allocate page cache
> 
> Fix them to just
> 
>     Failed to allocate cache
>     Failed to allocate page cache
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/page_cache.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/page_cache.c b/migration/page_cache.c
> index e07f4ad1dc..ed979eeb45 100644
> --- a/migration/page_cache.c
> +++ b/migration/page_cache.c
> @@ -53,8 +53,7 @@ PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
>      /* We prefer not to abort if there is no memory */
>      cache = g_try_malloc(sizeof(*cache));
>      if (!cache) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
> -                   "Failed to allocate cache");
> +        error_setg(errp, "Failed to allocate cache");
>          return NULL;
>      }
>      cache->page_size = page_size;
> @@ -67,8 +66,7 @@ PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
>      cache->page_cache = g_try_malloc_n(cache->max_num_items,
>                                         sizeof(*cache->page_cache));
>      if (!cache->page_cache) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
> -                   "Failed to allocate page cache");
> +        error_setg(errp, "Failed to allocate page cache");
>          g_free(cache);
>          return NULL;
>      }
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


