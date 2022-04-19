Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721F5068A0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:20:08 +0200 (CEST)
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkxr-0003ki-1w
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ngksv-0000DT-Kw
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ngkss-0001BC-UM
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650363297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVPmS6dohAyM2PLsEtb+SKOkO5Oasan0Q26Lh9lIpwc=;
 b=OD4bczd9l0Jv7ipudMRT5lNKsneb4aIt4aHhj8uWR6yQWJt/Ppb4VIoZxGdHJ3cthLUiTR
 V9yfccQoX/okuamCB6tX4jdVRSSKe/LdKAmdH+F68eRHTISac3QETrwLUxz8fl2aAirT6S
 XnsGjFvZfAQg0OI8TUFYtc+7ydPuNYw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-fivxhpoxOW2ZNf6-CE2xlg-1; Tue, 19 Apr 2022 06:14:56 -0400
X-MC-Unique: fivxhpoxOW2ZNf6-CE2xlg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r204-20020a1c44d5000000b0038eaca2b8c9so1091801wma.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 03:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=PVPmS6dohAyM2PLsEtb+SKOkO5Oasan0Q26Lh9lIpwc=;
 b=fsETVh8t8KMOMY3KjSCSeZaJLuocNdPBuyPC383ZE/IThb0OseUG/IqH8MTVCSGgIo
 t/ms4n2apDCa97wwvni1IOKgVz/XauekGiYz6GnP492DMb2xiY5zGfBXGpFFcVn4UfWU
 V2+L9Pfuhuu4JeWXDZUMN6qsnMOmDmAYKyk0Ry51g/rwuI553+PGxNBnIuqDZwPOpyeS
 yMvlmJ8Vslx1/jzjrfdo0GgeMH8Y0L9OJyvNWiwYgEsaVY6f6O0wap7MH7wjhDmbVAA9
 wf4BpNWS/wC86CALWqHGUMl62wfcCFbqLfv4fP7IAkmh+XL7zMQS09u6zC8nvXwO7Zo4
 Z/MA==
X-Gm-Message-State: AOAM531KbIeJQapg2FC9O91pzyE0PPG0DnTWhSByXAJqNStoPA3H8Yxm
 RO3MhSyoAXEBh7ji7GEGOta9R4gsihfqrWJVcmFhMA+ImJVObVr5iDR8zDyHbKpRRrrQLRrixFg
 4xucrcjx8dyrY05o=
X-Received: by 2002:a05:6000:18d0:b0:209:199b:77bd with SMTP id
 w16-20020a05600018d000b00209199b77bdmr11570759wrq.537.1650363294759; 
 Tue, 19 Apr 2022 03:14:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmd1+TqTMzOe5HaL1dWQWRNaeEet0zROT9I7Id+uGD+XPg7ftYx/HvmO78NZ0iBDRB6PNDlg==
X-Received: by 2002:a05:6000:18d0:b0:209:199b:77bd with SMTP id
 w16-20020a05600018d000b00209199b77bdmr11570741wrq.537.1650363294468; 
 Tue, 19 Apr 2022 03:14:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:5d00:d8c2:fbf6:a608:957a?
 (p200300cbc7045d00d8c2fbf6a608957a.dip0.t-ipconnect.de.
 [2003:cb:c704:5d00:d8c2:fbf6:a608:957a])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600002cb00b0020a88c4ecb5sm7963174wry.3.2022.04.19.03.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 03:14:54 -0700 (PDT)
Message-ID: <5c10cfb8-6312-316a-3226-11a8a92b91be@redhat.com>
Date: Tue, 19 Apr 2022 12:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: chenxiang <chenxiang66@hisilicon.com>, eric.auger@redhat.com,
 pbonzini@redhat.com, peterx@redhat.com, f4bug@amsat.org
References: <1650098041-127062-1-git-send-email-chenxiang66@hisilicon.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] softmmu/memory: Skip translation size instead of fixed
 granularity if translate() successfully
In-Reply-To: <1650098041-127062-1-git-send-email-chenxiang66@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linuxarm@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.04.22 10:34, chenxiang via wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Currently memory_region_iommu_replay() does full page table walk with
> fixed granularity (page size) no matter translate() succeeds or not.
> Actually if translate() successfully, we can skip translation size
> (iotlb.addr_mask + 1) instead of fixed granularity.
> 
>  Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  softmmu/memory.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfa5d5178c..ccfa19cf71 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1924,7 +1924,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>  {
>      MemoryRegion *mr = MEMORY_REGION(iommu_mr);
>      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> -    hwaddr addr, granularity;
> +    hwaddr addr, granularity, def_granu;
>      IOMMUTLBEntry iotlb;
>  
>      /* If the IOMMU has its own replay callback, override */
> @@ -1933,12 +1933,15 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>          return;
>      }
>  
> -    granularity = memory_region_iommu_get_min_page_size(iommu_mr);
> +    def_granu = memory_region_iommu_get_min_page_size(iommu_mr);

"granu" sounds weird. I'd suggest calling this "min_granularity".

>  
>      for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
>          iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
>          if (iotlb.perm != IOMMU_NONE) {
>              n->notify(n, &iotlb);
> +            granularity = iotlb.addr_mask + 1;
> +        } else {
> +            granularity = def_granu;
>          }

I do wonder if there are cases where we would actually have to round up
the addr instead of simply adding the granularity if we suddenly use
bigger steps then the min granularity.

i.e., there would be a difference between

addr += granularity

and

addr = QEMU_ALIGN_UP(addr + min_granularity, granularity);

I wonder if there are corner cases where translate() could fail on the
first part of a granularity increment but succeed on the second part. My
gut feeling is that it should be fine,

-- 
Thanks,

David / dhildenb


