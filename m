Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E614D32ED27
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:32:47 +0100 (CET)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBVW-0004YG-D1
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lIBTY-0003k3-23
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lIBTV-0007Pm-JW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614954639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2q6P2ajC6U9+v+FZQDP2qFGdYteHBGJasFJrQxBTna8=;
 b=AQKGE90/mnjPJjtmBUzjvuN0dJhc1h0e/yj+CDnfB7SMoLLS2GOmNTi/F6TiBcNhd1rAoP
 5vG4TL90YlHcxaepxfl3erujEHj7U5UJlJ5YVncb3Sh5bnN2gsH6gUnhAFD4D32AAQvso9
 nzWNWLeXNqgWXf5TzGDeGDarFoZtVx0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209--bOkuUaGMbeqeehw_OONtQ-1; Fri, 05 Mar 2021 09:30:38 -0500
X-MC-Unique: -bOkuUaGMbeqeehw_OONtQ-1
Received: by mail-qv1-f70.google.com with SMTP id n1so1636505qvi.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2q6P2ajC6U9+v+FZQDP2qFGdYteHBGJasFJrQxBTna8=;
 b=mOk84qDCDWWL45qylK3lc9eZbzp8mX9WAjkzh7lkz8fHoBPs8WCHge13HQMq7Tvdw3
 Ue54TBpay65j/JfjV9WeE5NFDNbguVVOgW/75dr2ymWFPYFymXCYQGFq5s/Pch60dwNx
 Y9LjeWTBg/KKkcwQlqCZGyCOXaSOIq+Gqz20JSa4kzPY9im76EIwlaAcJShNwtVqOyD8
 nfv+7XKbcZaYJzsHxTodNzMEUHfqyktsN/OWHQ3WmHba9VzvpI4yEySTeQFfla9HOcYs
 Oe8azSUi3//Suhrh8b1INdpvguwXAZ1ti81XQU+wP30zeZR2xaEG4RpTgYVI+6rwOiom
 KrJQ==
X-Gm-Message-State: AOAM531nSRPtpbZCXWXwmKGEO+ZqvspFGGQCdiROn2MP1CX0ge1/Ltni
 xZxPHT1d5bMc59ruWbx/Vd8GSDGXtmCgCfstSJw+Z8FLAOf29go1wfoTp9hUHrvRUT8YLQGCSva
 peWLonKtcFOixyHU=
X-Received: by 2002:a05:620a:21ce:: with SMTP id
 h14mr9083245qka.22.1614954636810; 
 Fri, 05 Mar 2021 06:30:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwduWt0pWdXsC4L05cFaPN0hAmi6oqGrTonDy4qt/nY1tAXdzLfSKii3UflvUlQsHZR4sgbzA==
X-Received: by 2002:a05:620a:21ce:: with SMTP id
 h14mr9083203qka.22.1614954636497; 
 Fri, 05 Mar 2021 06:30:36 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id d84sm1833904qke.53.2021.03.05.06.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 06:30:36 -0800 (PST)
Date: Fri, 5 Mar 2021 09:30:33 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 3/3] migration/ram: Optimize ram_save_host_page()
Message-ID: <20210305143033.GF397383@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-4-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210305075035.1852-4-jiangkunkun@huawei.com>
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

On Fri, Mar 05, 2021 at 03:50:35PM +0800, Kunkun Jiang wrote:
> Starting from pss->page, ram_save_host_page() will check every page
> and send the dirty pages up to the end of the current host page or
> the boundary of used_length of the block. If the host page size is
> a huge page, the step "check" will take a lot of time.
> 
> This will improve performance to use migration_bitmap_find_dirty().

Is there any measurement done?

This looks like an optimization, but to me it seems to have changed a lot
context that it doesn't need to... Do you think it'll also work to just look up
dirty again and update pss->page properly if migration_bitmap_clear_dirty()
returned zero?

Thanks,

> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 39 +++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 9fc5b2997c..28215aefe4 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1991,6 +1991,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      int pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> +    unsigned long hostpage_boundary =
> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>      unsigned long start_page = pss->page;
>      int res;
>  
> @@ -2003,30 +2005,27 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>          int pages_this_iteration = 0;
>  
>          /* Check if the page is dirty and send it if it is */
> -        if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> -            pss->page++;
> -            continue;
> -        }
> -
> -        pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
> -        if (pages_this_iteration < 0) {
> -            return pages_this_iteration;
> -        }
> +        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> +            pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
> +            if (pages_this_iteration < 0) {
> +                return pages_this_iteration;
> +            }
>  
> -        pages += pages_this_iteration;
> -        pss->page++;
> -        /*
> -         * Allow rate limiting to happen in the middle of huge pages if
> -         * something is sent in the current iteration.
> -         */
> -        if (pagesize_bits > 1 && pages_this_iteration > 0) {
> -            migration_rate_limit();
> +            pages += pages_this_iteration;
> +            /*
> +             * Allow rate limiting to happen in the middle of huge pages if
> +             * something is sent in the current iteration.
> +             */
> +            if (pagesize_bits > 1 && pages_this_iteration > 0) {
> +                migration_rate_limit();
> +            }
>          }
> -    } while ((pss->page & (pagesize_bits - 1)) &&
> +        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> +    } while ((pss->page < hostpage_boundary) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> -    /* The offset we leave with is the last one we looked at */
> -    pss->page--;
> +    /* The offset we leave with is the min boundary of host page and block */
> +    pss->page = MIN(pss->page, hostpage_boundary) - 1;
>  
>      res = ram_save_release_protection(rs, pss, start_page);
>      return (res < 0 ? res : pages);
> -- 
> 2.23.0
> 

-- 
Peter Xu


