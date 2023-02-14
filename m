Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EB696B88
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:31:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRz7Z-0007QK-OJ; Tue, 14 Feb 2023 12:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRz7Y-0007PM-Kv
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:29:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRz7W-0007OX-Pr
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676395772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPXLGD4k1c2NljaKb8hpce0U6AXPyoKSF3QOFqzpHYU=;
 b=CKfAveXv+nYpYyDgphQyy4Go9GofLI+PYgsAeBciiVN7XSldEBDwhTNOFUJIi2SA4PHDEl
 aTJ7qDnWpuxtoNBbqZskDdVY+Qqcgs6J8ckebAp7AcSOcvgrPe/cFHCDu6M9u7GHlPuYuY
 39YFQnk50E789lroP7iD7FfARcZO8CU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133--o3Tu_HRNImjYB_XHQVTbA-1; Tue, 14 Feb 2023 12:29:31 -0500
X-MC-Unique: -o3Tu_HRNImjYB_XHQVTbA-1
Received: by mail-qt1-f199.google.com with SMTP id
 he22-20020a05622a601600b003ba3c280fabso9616767qtb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676395771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPXLGD4k1c2NljaKb8hpce0U6AXPyoKSF3QOFqzpHYU=;
 b=xy3YQ/k4DO/9dX3Y4f8qoid2OAAwfmtRNzqU4GJ0LVpMtc2I9J1PO6RY6GRtpoguIC
 MtgDV+9L7KVrTYllz6yBR138ozSFShCe2G+0ce49hhW7f/p7tdD1OE8hrY2qBkWwzNp4
 yiIFqpycy8OGs4PvxynJiYWyg0Lpko9cdvE2Apg0Pq4iKP76AQj2IeQ/xeN3UsD769+S
 fr8T2B2HetnJoTfCWjFgeOVpGIZBISW7kYmQgtc2F+wIA6UPCe9TquUPrgI3lqDQjq6n
 DVk5ZU05H77mlO+ucw7RidKt9CsVV6Ch6ihEZRDTmdD3wRw5pjCYzjuz9W4PZXEOZ/cZ
 orzQ==
X-Gm-Message-State: AO0yUKWKRT8nu5qCd+2tk/JvTItOO0aayA/nKxUaQ/f/rfg89LcBk74N
 zNhnVFLmIeG4ONo/WTewbYs+/tLmS7lU4BHnZzmAp8Cej4+VhiX1t/myrZVc0runOsztIs0t8Dd
 XC2KxqWl8EoImCKI=
X-Received: by 2002:a05:622a:14cb:b0:3a5:f916:1d2c with SMTP id
 u11-20020a05622a14cb00b003a5f9161d2cmr6021330qtx.5.1676395770795; 
 Tue, 14 Feb 2023 09:29:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+eTYn6alRUlmJBEzPeI5pCxmDJ6dueMLMbnCy4y2EjSR2uukBBNwSIMKxOAUD66Q2jz9BqxA==
X-Received: by 2002:a05:622a:14cb:b0:3a5:f916:1d2c with SMTP id
 u11-20020a05622a14cb00b003a5f9161d2cmr6021306qtx.5.1676395770580; 
 Tue, 14 Feb 2023 09:29:30 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 o185-20020a375ac2000000b0073b575f3603sm2272444qkb.101.2023.02.14.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:29:29 -0800 (PST)
Date: Tue, 14 Feb 2023 12:29:28 -0500
From: Peter Xu <peterx@redhat.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "david@redhat.com" <david@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Subject: Re: [PATCH] memory: Optimize replay of guest mapping
Message-ID: <Y+vE+ICe2zycdlqX@x1n>
References: <20230214034211.683203-1-zhenzhong.duan@intel.com>
 <CACGkMEse_BFRaTV0NkvsGD_ptsTzrBGKLBZg59NtSCR_Z-=V1w@mail.gmail.com>
 <SJ0PR11MB6744F710B0E621272A35060892A29@SJ0PR11MB6744.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB6744F710B0E621272A35060892A29@SJ0PR11MB6744.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 14, 2023 at 07:04:56AM +0000, Duan, Zhenzhong wrote:
> >> @@ -1936,7 +1935,7 @@ void
> >> memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr,
> >IOMMUNotifier
> >> *n)
> >>
> >>      granularity = memory_region_iommu_get_min_page_size(iommu_mr);
> >>
> >> -    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
> >> +    for (addr = n->start; addr < n->end; addr += granularity) {
> >
> >Is [n->start, n->end] guaranteed to be the subset of memory_region_size(mr)?
> 
> In current implementation it is.
> [n->start, n->end] of notifier is derived from iommu memory region's section
> which is a subset of iommu memory region itself.

Yes, currently it seems to be guaranteed by the callers assuming they're
always doing the right thing.

Maybe it'll worth it to have memory_region_register_iommu_notifier() assert
properly to make sure it always hold true?

The patch itself looks good here, thanks.

-- 
Peter Xu


