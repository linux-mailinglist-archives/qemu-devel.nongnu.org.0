Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CEA3FF72B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 00:30:56 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLvEV-0001gL-12
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 18:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLvCk-0000xJ-Df
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 18:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLvCg-0001eV-RS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 18:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630621741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MXenLShhbpbrev+DODHcVws/lPM1MZ2LWxJ/FMz+Phg=;
 b=YY3TL/eC+D1EWGKPWyUlS9nYet4e0wNdpZCqyO9Q7P17eFt8A87jwEuQDS2kqF3P2UMfq6
 l8iKdyg6kzffTX8yaM9xq2eD3zQbuF9T3BvH2pBSRtU+rUWyPqwOVOi/kD11OBdqvqW6jB
 Vx/Dj5thSr1RKCYkefD2tOaGMKit2M0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-2Vb_uOsaOlGlv-W0QIxqxA-1; Thu, 02 Sep 2021 18:29:00 -0400
X-MC-Unique: 2Vb_uOsaOlGlv-W0QIxqxA-1
Received: by mail-qk1-f199.google.com with SMTP id
 70-20020a370b49000000b003d2f5f0dcc6so4315065qkl.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 15:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MXenLShhbpbrev+DODHcVws/lPM1MZ2LWxJ/FMz+Phg=;
 b=Hwr+TwkPLfpCDvBcD+qYlm/EG/RC+Tvd1Vzx1uOmBgyJ2+J/nSGYqP5WCv0l38Hx2s
 6nv7kjgLXqq1wlTFrjffV95VJCOgfH9R9l8Uqd5E5ydjAv40dyztBjudFwVu5RfyrP+s
 9txZKuJyNmdwiL4gkXeMZAaXIH0zUOJihlK9QJWpVY3xbamX3sr7Q4l4xmQ11JBRMuS2
 FMZYZj8Yw6oOY53fc5ko15b1SsSbiAkv/S+73szv+0xSTVpkEbOVjwXkpgMXmZbDulSG
 idp0LINlGb9NiFkY5/ywHVlRkZ1uKKNVcE0co4hbPGnmOKTcgarVmvACjW+Gs5rOh6z8
 lF6g==
X-Gm-Message-State: AOAM533MkQY2l8gMybrnVw+P6OI0jRpDTgR9eE9ho+JkAwFvp0X5Sl/K
 1SDY4Kb3hF5qj0CBbK2BGPjdEP+mvHDucvjQ2Bwqs8OFWtuc2ZVQqkK08iuvyBxEX0w0v1uDbha
 7faygBnSeEfjNSkE=
X-Received: by 2002:ac8:118a:: with SMTP id d10mr698911qtj.101.1630621739752; 
 Thu, 02 Sep 2021 15:28:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzWhxJikmkDjVdIJi3srKGW7WfykoODi2Qq2XSB1kUg24fLKdP0PvXOXZo0f+YsDCVVJXbFA==
X-Received: by 2002:ac8:118a:: with SMTP id d10mr698890qtj.101.1630621739489; 
 Thu, 02 Sep 2021 15:28:59 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id t188sm2609677qkf.22.2021.09.02.15.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 15:28:58 -0700 (PDT)
Date: Thu, 2 Sep 2021 18:28:56 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
Message-ID: <YTFQKKPK3evHAMWN@t490s>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-9-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902131432.23103-9-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 03:14:31PM +0200, David Hildenbrand wrote:
> Let's factor out prefaulting/populating to make further changes easier to
> review. While at it, use the actual page size of the ramblock, which
> defaults to qemu_real_host_page_size for anonymous memory.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/ram.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index e1c158dc92..de47650c90 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1639,6 +1639,17 @@ out:
>      return ret;
>  }
>  
> +static inline void populate_range(RAMBlock *block, ram_addr_t offset,
> +                                  ram_addr_t size)
> +{
> +    for (; offset < size; offset += block->page_size) {
> +        char tmp = *((char *)block->host + offset);
> +
> +        /* Don't optimize the read out */
> +        asm volatile("" : "+r" (tmp));
> +    }
> +}

If to make it a common function, make it populate_range_read()?

Just to identify from RW, as we'll fill the holes with zero pages only, not
doing page allocations yet, so not a complete "populate".

That'll be good enough for live snapshot as uffd-wp works for zero pages,
however I'm just afraid it may stop working for some new users of it when zero
pages won't suffice.

Maybe some comment would help too?

-- 
Peter Xu


