Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78670671B65
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:01:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI77W-0002ci-Kd; Wed, 18 Jan 2023 07:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pI77T-0002cG-Js
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:00:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pI77S-00059B-1p
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674043241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jyDdsMWq/Tew/XVa4sezS41oqMYaYnm1s2wOc6MSAY0=;
 b=EO8e8Mxsb8B2f9UNFzaiV9wwieuJfgKBxUGUx9nra/kxYKlS+lrMIe1QrgqxFsxZUK06zb
 Gbb8ZPlbRkwkRMvAiRvBX3U0UrgjDooqfwZfP7E9XVIKLom8ja0NJTGAR1wSZphbQqU7Rf
 DKQe5Z/sEiRT0tirFD0gvp0irnqFdys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-VKEUUhq6PXidqFMdOD_axw-1; Wed, 18 Jan 2023 07:00:37 -0500
X-MC-Unique: VKEUUhq6PXidqFMdOD_axw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003da1f6a7b2dso1110484wmb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jyDdsMWq/Tew/XVa4sezS41oqMYaYnm1s2wOc6MSAY0=;
 b=62nFED/g5fuqD4kxNhkcyr7Aq7Lgte745qWV3FvZ78N3F1gaxxr/clCCCHs4O3ws1G
 Tc84Ht2pGW7pkxWPS+R1bZ6m4flsXq+JNuqQg6GrR2bzMkRGczLa4NOtrEsfLTcctpQW
 /laulpLplmSzOjohNH4gdAv2UV5/oLmqWoDORDdzTv1uBCLbq/9SWSksriJQq1F1blvH
 ey8jZoxjbGSAEysKrO2kV5bb31yaIhABefpnxVKUujIxlCxlrMfEEUkRtjD4RDtG0aGo
 +j1nEgcQwfXzZgpHD33TS29hQecbVey2xl/j2+gGsbg/r09yj+govpq/ob5tTKt70IGO
 /TAw==
X-Gm-Message-State: AFqh2kphZQ7j2akRWUiS4SWtd/Lcin97WkbXTrS5DwfHSDkQn4gXu1L0
 7ZrPIV5d0TG2zV7KdF/R9vajFmfs+q0IeQFGvhsg6EJQG57+dAFYQbUzGf0vFPg1ZDSOmmp/sk6
 6pXAbdapyHPs0Fd8=
X-Received: by 2002:a05:6000:25c:b0:295:6a4f:4183 with SMTP id
 m28-20020a056000025c00b002956a4f4183mr6068488wrz.5.1674043236621; 
 Wed, 18 Jan 2023 04:00:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuOUnqjdX26HY7HB/nohpI81LwwP6cIanjYAmJgXUm4+FMHa/6FfhMSAGa6WOoxOhxHJQqC7w==
X-Received: by 2002:a05:6000:25c:b0:295:6a4f:4183 with SMTP id
 m28-20020a056000025c00b002956a4f4183mr6068468wrz.5.1674043236381; 
 Wed, 18 Jan 2023 04:00:36 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b002bb28209744sm30992783wrm.31.2023.01.18.04.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:00:35 -0800 (PST)
Date: Wed, 18 Jan 2023 12:00:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 02/21] util: Include osdep.h first in util/mmap-alloc.c
Message-ID: <Y8ffYTobBIcr1FZR@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-3-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Peter Xu (peterx@redhat.com) wrote:
> Without it, we never have CONFIG_LINUX defined even if on linux, so
> linux/mman.h is never really included.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  util/mmap-alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 5ed7d29183..040599b0e3 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -9,6 +9,7 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or
>   * later.  See the COPYING file in the top-level directory.
>   */
> +#include "qemu/osdep.h"
>  
>  #ifdef CONFIG_LINUX
>  #include <linux/mman.h>
> @@ -17,7 +18,6 @@
>  #define MAP_SHARED_VALIDATE   0x0
>  #endif /* CONFIG_LINUX */
>  
> -#include "qemu/osdep.h"
>  #include "qemu/mmap-alloc.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/cutils.h"
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


