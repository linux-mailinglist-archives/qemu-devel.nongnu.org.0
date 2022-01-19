Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9E493AF1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 14:18:11 +0100 (CET)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAAqn-0006JL-NZ
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 08:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAAYA-0008A7-Iq
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAAY6-0001Ga-BQ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642597125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ovzGS4bDhx9QyphiHWpb/DWxBKA2OaVrq9/BJMqSlvw=;
 b=P4tESjjA2jAuOSd5WsAJcn81X3RnfS+LIKZHnFrPXP1y1iANfQ8yHQ6XwLxZGGjqVUCjn6
 c3D4JU2skFufm0BBSB3hdo3CCYo0T0OLboKT2ZNz/1KFUYrz4VyASU9VUKLQuTXkTU+aPM
 pXvZTEZlUowsL/i2C92FVBhbnhEexnI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-x42gWhJON1aAJZqIXC6MTg-1; Wed, 19 Jan 2022 07:58:45 -0500
X-MC-Unique: x42gWhJON1aAJZqIXC6MTg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so4302780wme.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 04:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ovzGS4bDhx9QyphiHWpb/DWxBKA2OaVrq9/BJMqSlvw=;
 b=E0DPPUIl8qgmPyPNhl8xh4oRv2J0nTcqcNK2NO2iqMhHxpvQqLf2YYPjDOrEhBwKaH
 7Mfef3ymstGQGL+SUM9p3yXtWK40YRNEP18twZjBNRfh70E/1OxQyBmTan3hzH//tZvW
 nOmFO7cNkvT2H4zjYrFmsCATGjmg+lWngnJyJ/f2Ug2oicOc7edlhTDD9NW0KfHpRmz0
 5o2rFHEIQGpfeBXGmXNvGEVnean3D+uik5iDAuFd0ZgtaePtvny97E9z3Q97RryhwcgB
 KqOiQj94yklQjOBvXim28e89J/jJMDIp6C4+5kRaYIf6RFgawUj+IFQyvAUcWTEjucRA
 YKvQ==
X-Gm-Message-State: AOAM530EuqfP864Qc0DqzSPM10yxoUy0ZKJofIxCwPz4IZvf0fPraMsP
 CiiRWjB038iOuU123FOh6v2XfyqrlYzFOKNVRedWfMNXU9oSHv0qyRNdhyTFmR6xVQWCz9DqNhB
 8a6kjULD11OVqMeA=
X-Received: by 2002:a05:6000:1842:: with SMTP id
 c2mr28908723wri.482.1642597123572; 
 Wed, 19 Jan 2022 04:58:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSJFxF93HHpQmEkWG0MnwX6d1GkLzi1xfSne37ncp5cHRn5ScQ3f/2fFzbqiokPC4MpKWBZw==
X-Received: by 2002:a05:6000:1842:: with SMTP id
 c2mr28908705wri.482.1642597123336; 
 Wed, 19 Jan 2022 04:58:43 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n15sm19344246wrf.79.2022.01.19.04.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 04:58:42 -0800 (PST)
Date: Wed, 19 Jan 2022 12:58:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 01/15] migration: No off-by-one for pss->page update
 in host page size
Message-ID: <YegLADO94Zjhn1Gz@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-2-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We used to do off-by-one fixup for pss->page when finished one host huge page
> transfer.  That seems to be unnecesary at all.  Drop it.
> 
> Cc: Keqian Zhu <zhukeqian1@huawei.com>
> Cc: Kunkun Jiang <jiangkunkun@huawei.com>
> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes, I think so - I guess the -1 and +1 cancel so it works, and in
practice ram_save_host_page then points to 1 page inside the hugepage
which is then always clean (because it just sent it) so probably
survives.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 5234d1ece1..381ad56d26 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1611,7 +1611,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
>      /* Check if page is from UFFD-managed region. */
>      if (pss->block->flags & RAM_UF_WRITEPROTECT) {
>          void *page_address = pss->block->host + (start_page << TARGET_PAGE_BITS);
> -        uint64_t run_length = (pss->page - start_page + 1) << TARGET_PAGE_BITS;
> +        uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
>  
>          /* Flush async buffers before un-protect. */
>          qemu_fflush(rs->f);
> @@ -2230,7 +2230,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
>      /* The offset we leave with is the min boundary of host page and block */
> -    pss->page = MIN(pss->page, hostpage_boundary) - 1;
> +    pss->page = MIN(pss->page, hostpage_boundary);
>  
>      res = ram_save_release_protection(rs, pss, start_page);
>      return (res < 0 ? res : pages);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


