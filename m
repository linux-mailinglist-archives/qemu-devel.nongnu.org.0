Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7843D7E3A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 21:03:10 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8SM9-0006NZ-0V
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 15:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8SKb-0005Sm-2u
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 15:01:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8SKW-0004Zv-1H
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 15:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627412482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uU0rOmAbzrbCdo150tpK41MwSL+LBq6RpQUCTlaigeI=;
 b=jSVRAU833NJfHmCypDnZ9Wg+4mmabjAfybGd/2Z8f8bG14wV5VbIQvJxfxPVyHEo8akRsh
 ut7lBKfHMUtEHFiJsNo07NJ5qUcdGrgxWdyZhcOGKCopUQ0cssOUTazBFql/5afXLy6x2Q
 jcwyAH5QXzzZD65i4fIr9Cq5Z9ZrQKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-53Zrf8rnOa6aKrbLa8GFyQ-1; Tue, 27 Jul 2021 15:01:20 -0400
X-MC-Unique: 53Zrf8rnOa6aKrbLa8GFyQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so6301037wrs.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 12:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uU0rOmAbzrbCdo150tpK41MwSL+LBq6RpQUCTlaigeI=;
 b=rQhe58YDwP0hP9Sk/+dnZE0WF/kQ1prTLoPCixTprPCkonJ64y0cujrU/hafaGSzPC
 d6qh3Vp8BQBXk5Mw/c+CXlQpgzjR5PECPta9x1RlnOLzVKSp8M8F6AhUi5u31N+/6xkr
 yQAeXZdFs2Gg8GaL8OsCX07amN4JFFpuddt/aH94hSsu1jd7Ks7oQI9FP1z4fv4bY258
 BWvCSzvrY2738b9UG5tYjwYdyvhNQvOGCa3Z+SdIhwxMmOQcICbVIZiomxThU5r2XXI7
 pbzUDwr7RFud5kNdj9AZdTZrGyPtsEs2BOSxEKZXbCMJZBzV/t2KTVZuIiVgaIeCVVv4
 HYWQ==
X-Gm-Message-State: AOAM531eMradR38F41YFsixzu3ZPEg+41bf/utod5Hk8bOoK9qv6EByi
 VNzXFa0EIaP6LyXZ/KfcuLmeV38iuVrKArXy+8EL3+pDM9tIYVDP5NxKX2qwwDoBVaxU8q9fI9w
 ICmy0LX+RODJmMbw=
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr12199196wmi.149.1627412479012; 
 Tue, 27 Jul 2021 12:01:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO8pscu9DVQUoYTv5VcQrZNinzLFujq58dSDLuJpA9PiRahXZLcfpFa3xpTAk17jDP+r8YUw==
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr12199161wmi.149.1627412478722; 
 Tue, 27 Jul 2021 12:01:18 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id f5sm2664602wrs.5.2021.07.27.12.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 12:01:18 -0700 (PDT)
Date: Tue, 27 Jul 2021 20:01:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 3/6] util/oslib-posix: Don't create too many threads
 with small memory or little pages
Message-ID: <YQBX+3teXvfsZaXJ@work-vm>
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722123635.60608-4-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> Let's limit the number of threads to something sane, especially that
> - We don't have more threads than the number of pages we have
> - We don't have threads that initialize small (< 64 MiB) memory
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  util/oslib-posix.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 2ae6c3aaab..a1d309d495 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -40,6 +40,7 @@
>  #include <libgen.h>
>  #include "qemu/cutils.h"
>  #include "qemu/compiler.h"
> +#include "qemu/units.h"
>  
>  #ifdef CONFIG_LINUX
>  #include <sys/syscall.h>
> @@ -529,7 +530,8 @@ static void *do_madv_populate_write_pages(void *arg)
>      return NULL;
>  }
>  
> -static inline int get_memset_num_threads(int smp_cpus)
> +static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
> +                                         int smp_cpus)
>  {
>      long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
>      int ret = 1;
> @@ -537,6 +539,12 @@ static inline int get_memset_num_threads(int smp_cpus)
>      if (host_procs > 0) {
>          ret = MIN(MIN(host_procs, MAX_MEM_PREALLOC_THREAD_COUNT), smp_cpus);
>      }
> +
> +    /* Especially with gigantic pages, don't create more threads than pages. */
> +    ret = MIN(ret, numpages);
> +    /* Don't start threads to prealloc comparatively little memory. */
> +    ret = MIN(ret, MAX(1, hpagesize * numpages / (64 * MiB)));
> +
>      /* In case sysconf() fails, we fall back to single threaded */
>      return ret;
>  }
> @@ -546,7 +554,7 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>  {
>      static gsize initialized = 0;
>      MemsetContext context = {
> -        .num_threads = get_memset_num_threads(smp_cpus),
> +        .num_threads = get_memset_num_threads(hpagesize, numpages, smp_cpus),
>      };
>      size_t numpages_per_thread, leftover;
>      void *(*touch_fn)(void *);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


