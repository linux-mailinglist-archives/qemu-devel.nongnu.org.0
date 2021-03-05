Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C532ECB6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:02:42 +0100 (CET)
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIB2P-00051l-8G
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lIAzN-0003MD-F2
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lIAzL-0000r4-4C
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614952768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBtE2wKn3WiUH4NU0al3FcDeXNAep4vDXGgeskZFJsU=;
 b=iqwi3vnQFCRygdPuzjngEbqjN8XTi7kHcaqDNEHHyAxRP2TNUDOI5zaFj5r/Qp6KluZaca
 uNDIeSESwPxOCCSsbQ7ccJqVHrnMYqNkwppwejWsXWnL776zAK4BKKiHLj1KMlCQ3jBKEH
 Iucit+3drzjzcpPVqZUL0FU7fDBEeEM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-WHHXC5VFOoedQazp_oIGeQ-1; Fri, 05 Mar 2021 08:59:26 -0500
X-MC-Unique: WHHXC5VFOoedQazp_oIGeQ-1
Received: by mail-qv1-f70.google.com with SMTP id n1so1555147qvi.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 05:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NBtE2wKn3WiUH4NU0al3FcDeXNAep4vDXGgeskZFJsU=;
 b=tF6d0jyiGch40SMrv4CF7L61vYwIsl/1wjFLFRIbpDufGBUPh010dWdGjRrcWBxhq4
 danuSjL+PTvTcj8t1dEYwnWAYpw81WaBCNXjOgD0OrQ7NGTrC3TG6qxR3z90llCymj2I
 F7b0cDjHfpQ/usmUqs0+k7v5p2nY8x/8AGlsoeBLJT52jDR4AhXExc/DK85sm+pgYlBi
 0T4F6LWLlbEIHa5MD5xOzyFWGclmUw3dSgqrGKI878RwuiWA4kQzQx7wt5b0cz2819ub
 kue8KUtZbb9aA3tYaMtk/QX3ipYaYjHdvT+0/ltaDItjM/Txu45lZPcwWtvF9CUd82rb
 rrhw==
X-Gm-Message-State: AOAM531pbECif3ZgfwsAeDr3bFyRx7CQ3H2raFNp6AgC4AfPqmmAGPuj
 BI80i55LJxhmbmzBxhwukvzTfFaou255YGCIxHD70BmvqppPfFlB5NqH6ABhPNxcUvsynVvolSO
 tltgvZaAdi5MwBmA=
X-Received: by 2002:a37:6888:: with SMTP id d130mr8926575qkc.368.1614952766021; 
 Fri, 05 Mar 2021 05:59:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp7csuqT4iJE3D5M2O6mUYj72mzL3f0Gm3q4faXz3MTubMKr5+zV0mvIHg9RotUunEbFtJ1A==
X-Received: by 2002:a37:6888:: with SMTP id d130mr8926555qkc.368.1614952765697; 
 Fri, 05 Mar 2021 05:59:25 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id e190sm1717077qkf.101.2021.03.05.05.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 05:59:25 -0800 (PST)
Date: Fri, 5 Mar 2021 08:59:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
Message-ID: <20210305135923.GD397383@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-2-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210305075035.1852-2-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 03:50:33PM +0800, Kunkun Jiang wrote:
> The ram_save_host_page() has been modified several times
> since its birth. But the comment hasn't been modified as it should
> be. It'd better to modify the comment to explain ram_save_host_page()
> more clearly.
> 
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..a168da5cdd 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1970,15 +1970,13 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>  }
>  
>  /**
> - * ram_save_host_page: save a whole host page
> + * ram_save_host_page: save a whole host page or the rest of a RAMBlock
>   *
> - * Starting at *offset send pages up to the end of the current host
> - * page. It's valid for the initial offset to point into the middle of
> - * a host page in which case the remainder of the hostpage is sent.
> - * Only dirty target pages are sent. Note that the host page size may
> - * be a huge page for this block.
> - * The saving stops at the boundary of the used_length of the block
> - * if the RAMBlock isn't a multiple of the host page size.
> + * Send dirty pages between pss->page and either the end of that page
> + * or the used_length of the RAMBlock, whichever is smaller.
> + *
> + * Note that if the host page is a huge page, pss->page may be in the
> + * middle of that page.

It reads more like a shorter version of original comment..  Could you point out
what's the major difference?  Since the original comment looks still good to me.

>   *
>   * Returns the number of pages written or negative on error
>   *
> @@ -2002,7 +2000,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      }
>  
>      do {
> -        /* Check the pages is dirty and if it is send it */
> +        /* Check if the page is dirty and send it if it is */

This line fixes some English issues, it seems.  Looks okay, but normally I
won't change it unless the wording was too weird, so as to keep the git record
or the original lines.  Here the original looks still okay, no strong opinion.

Thanks,

>          if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>              pss->page++;
>              continue;
> -- 
> 2.23.0
> 

-- 
Peter Xu


