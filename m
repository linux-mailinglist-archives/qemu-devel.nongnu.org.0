Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690EE508C47
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:37:06 +0200 (CEST)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCO9-0003aM-GQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCKu-0000NR-Np
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhCKr-0000qT-Pk
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650468821;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vf4HCfRmFsrFQJR5OwLLL4KM0CMUf5OAzUIoHm7VIOg=;
 b=KlLCQQDRUD5KUov4Sij0WQx1RPtr3bInH8O4z4FDjBjdvRR8C/pMYpVjMvac/m1MomphM0
 1r8mm6u/nIYrDckJIznUlOeRCCTCAiL+zjU1xSLiI5Xo7RsBjlGqHmclji31OfTCxYNLSU
 72BWpLRBms2i5dqyv0TFdLAr9uXJ03c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-mwubf0ZVNWemhpYOEyvY3A-1; Wed, 20 Apr 2022 11:33:39 -0400
X-MC-Unique: mwubf0ZVNWemhpYOEyvY3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 130D318E5346;
 Wed, 20 Apr 2022 15:33:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35292572344;
 Wed, 20 Apr 2022 15:33:38 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:33:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 20/41] include: move qemu_msync() to osdep
Message-ID: <YmAnz/Bqd5lWSxUo@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-21-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-21-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:26:03PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The implementation depends on the OS. (and longer-term goal is to move
> cutils to a common subproject)

Common with what other thing(s) ?

IMHO alot of cutils should just go away in favour of using more glib
APIs, and/or be split up, since its a random bag of largely unrelated
bits.



> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/cutils.h |  1 -
>  include/qemu/osdep.h  | 13 +++++++++++++
>  util/cutils.c         | 38 --------------------------------------
>  util/oslib-posix.c    | 18 ++++++++++++++++++
>  util/oslib-win32.c    | 10 ++++++++++
>  5 files changed, 41 insertions(+), 39 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index e873bad36674..fb47ec931876 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -130,7 +130,6 @@ const char *qemu_strchrnul(const char *s, int c);
>  #endif
>  time_t mktimegm(struct tm *tm);
>  int qemu_fdatasync(int fd);
> -int qemu_msync(void *addr, size_t length, int fd);
>  int qemu_parse_fd(const char *param);
>  int qemu_strtoi(const char *nptr, const char **endptr, int base,
>                  int *result);
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 14b6b65a5fa9..bf4f75dcde8f 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -641,6 +641,19 @@ static inline void qemu_reset_optind(void)
>  #endif
>  }
>  
> +/**
> + * Sync changes made to the memory mapped file back to the backing
> + * storage. For POSIX compliant systems this will fallback
> + * to regular msync call. Otherwise it will trigger whole file sync
> + * (including the metadata case there is no support to skip that otherwise)
> + *
> + * @addr   - start of the memory area to be synced
> + * @length - length of the are to be synced
> + * @fd     - file descriptor for the file to be synced
> + *           (mandatory only for POSIX non-compliant systems)
> + */
> +int qemu_msync(void *addr, size_t length, int fd);
> +
>  /**
>   * qemu_get_host_name:
>   * @errp: Error object
> diff --git a/util/cutils.c b/util/cutils.c
> index a01a3a754049..c0775bb53c29 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -160,44 +160,6 @@ int qemu_fdatasync(int fd)
>  #endif
>  }
>  
> -/**
> - * Sync changes made to the memory mapped file back to the backing
> - * storage. For POSIX compliant systems this will fallback
> - * to regular msync call. Otherwise it will trigger whole file sync
> - * (including the metadata case there is no support to skip that otherwise)
> - *
> - * @addr   - start of the memory area to be synced
> - * @length - length of the are to be synced
> - * @fd     - file descriptor for the file to be synced
> - *           (mandatory only for POSIX non-compliant systems)
> - */
> -int qemu_msync(void *addr, size_t length, int fd)
> -{
> -#ifdef CONFIG_POSIX
> -    size_t align_mask = ~(qemu_real_host_page_size() - 1);
> -
> -    /**
> -     * There are no strict reqs as per the length of mapping
> -     * to be synced. Still the length needs to follow the address
> -     * alignment changes. Additionally - round the size to the multiple
> -     * of PAGE_SIZE
> -     */
> -    length += ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
> -    length = (length + ~align_mask) & align_mask;
> -
> -    addr = (void *)((uintptr_t)addr & align_mask);
> -
> -    return msync(addr, length, MS_SYNC);
> -#else /* CONFIG_POSIX */
> -    /**
> -     * Perform the sync based on the file descriptor
> -     * The sync range will most probably be wider than the one
> -     * requested - but it will still get the job done
> -     */
> -    return qemu_fdatasync(fd);
> -#endif /* CONFIG_POSIX */
> -}
> -
>  static int64_t suffix_mul(char suffix, int64_t unit)
>  {
>      switch (qemu_toupper(suffix)) {
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index c471c5bc9f8d..161f1123259f 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -950,3 +950,21 @@ int fcntl_setfl(int fd, int flag)
>      }
>      return 0;
>  }
> +
> +int qemu_msync(void *addr, size_t length, int fd)
> +{
> +    size_t align_mask = ~(qemu_real_host_page_size() - 1);
> +
> +    /**
> +     * There are no strict reqs as per the length of mapping
> +     * to be synced. Still the length needs to follow the address
> +     * alignment changes. Additionally - round the size to the multiple
> +     * of PAGE_SIZE
> +     */
> +    length += ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
> +    length = (length + ~align_mask) & align_mask;
> +
> +    addr = (void *)((uintptr_t)addr & align_mask);
> +
> +    return msync(addr, length, MS_SYNC);
> +}
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index f38b06914e12..1e05c316b311 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -596,3 +596,13 @@ size_t qemu_get_host_physmem(void)
>      }
>      return 0;
>  }
> +
> +int qemu_msync(void *addr, size_t length, int fd)
> +{
> +    /**
> +     * Perform the sync based on the file descriptor
> +     * The sync range will most probably be wider than the one
> +     * requested - but it will still get the job done
> +     */
> +    return qemu_fdatasync(fd);
> +}
> -- 
> 2.35.1.693.g805e0a68082a
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


