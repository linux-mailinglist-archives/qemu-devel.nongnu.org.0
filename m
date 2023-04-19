Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F906E739E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 09:03:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp1p2-0000Xm-8Q; Wed, 19 Apr 2023 03:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pp1p0-0000XC-8j
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pp1oy-000162-0I
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681887698;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qA8Zf98TBjT9Zm/oZt+WvS6o2/uR22/cd/q0m9ouWEU=;
 b=LsfJWxRASXxGigr4wKQ7XvzFgkob7L8Sf6Gfk9nxDqLFhDRA1wvSB+Tl9qQ+ksockke+Fp
 igVg1mXcw7WosVdFbNZRVutXEJbVh0uQ7HGDARbMN9ptRZnsJ+hWLAvfcpyXv6hJYTX+ab
 kuFStr3wArmX0bLPUL+Ifk7fH1t3HCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-qpzW-jeoM_uopy_O94r35w-1; Wed, 19 Apr 2023 03:01:37 -0400
X-MC-Unique: qpzW-jeoM_uopy_O94r35w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED424811E7C
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 07:01:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 194EBC16024;
 Wed, 19 Apr 2023 07:01:35 +0000 (UTC)
Date: Wed, 19 Apr 2023 08:01:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 1/3] hostmem: Detect and cache fs type for file hostmem
Message-ID: <ZD+RzsSiNX/lIyGI@redhat.com>
References: <20230418225749.1049185-1-peterx@redhat.com>
 <20230418225749.1049185-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418225749.1049185-2-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 18, 2023 at 06:57:47PM -0400, Peter Xu wrote:
> Detect the file system for a memory-backend-file object and cache it within
> the object if possible when CONFIG_LINUX (using statfs).
> 
> Only support the two important types of memory (tmpfs, hugetlbfs) and keep
> the rest as "unknown" for now.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  backends/hostmem-file.c  | 37 ++++++++++++++++++++++++++++++++++++-
>  include/sysemu/hostmem.h |  1 +
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index 25141283c4..2484e45a11 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -18,13 +18,17 @@
>  #include "sysemu/hostmem.h"
>  #include "qom/object_interfaces.h"
>  #include "qom/object.h"
> +#ifdef CONFIG_LINUX
> +#include <sys/vfs.h>
> +#include <linux/magic.h>
> +#endif
>  
>  OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendFile, MEMORY_BACKEND_FILE)
>  
>  
>  struct HostMemoryBackendFile {
>      HostMemoryBackend parent_obj;
> -
> +    __fsword_t fs_type;
>      char *mem_path;
>      uint64_t align;
>      bool discard_data;
> @@ -52,6 +56,15 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>          return;
>      }
>  
> +#ifdef CONFIG_LINUX
> +    struct statfs fs;
> +    if (!statfs(fb->mem_path, &fs)) {
> +        fb->fs_type = fs.f_type;
> +    } else {
> +        fb->fs_type = 0;
> +    }
> +#endif
> +
>      name = host_memory_backend_get_name(backend);
>      ram_flags = backend->share ? RAM_SHARED : 0;
>      ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
> @@ -181,6 +194,28 @@ static void file_backend_unparent(Object *obj)
>      }
>  }
>  
> +const char *file_memory_backend_get_fs_type(Object *obj)
> +{
> +#ifdef CONFIG_LINUX
> +    HostMemoryBackendFile *fb = (HostMemoryBackendFile *)
> +        object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_FILE);
> +
> +    if (!fb) {
> +        goto out;
> +    }
> +
> +    switch (fb->fs_type) {
> +    case TMPFS_MAGIC:
> +        return "tmpfs";
> +    case HUGETLBFS_MAGIC:
> +        return "hugetlbfs";
> +    }
> +
> +out:
> +#endif
> +    return "unknown";
> +}

I rather feel this should be returning an enm, not strings, so
the caller just does a plain equality test rather than string
comparisons


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


