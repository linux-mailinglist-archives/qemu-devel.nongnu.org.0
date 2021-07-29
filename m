Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D73DA925
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:33:19 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98yE-0005bO-4b
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m98wG-0004Y0-NY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m98wD-00014q-RI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627576272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TRlj+qwE7HIUgzzMhZPIUiun0nI/x4ZopDbEaWGGcI=;
 b=M+sBfTsPTmcU+kC8ZYevDcSq/OTSQHqS8QFoHqXWgC2w0PwypGvsYWq3Oup9acWLjr3lAc
 qHTmOrnAMc2N1uZ/qeeAUVzyHVbr5tHVpqgTWeJw1poeMH1et5ASxXZ3brfIgv2puCHSeo
 G1uE5VbHgVCDLbwZdM46yQNUHIs7L08=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-45FslfonMM6Cm_HFdpu4zg-1; Thu, 29 Jul 2021 12:16:01 -0400
X-MC-Unique: 45FslfonMM6Cm_HFdpu4zg-1
Received: by mail-wr1-f71.google.com with SMTP id
 c5-20020adfed850000b02901537ecbecc6so2380240wro.19
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 09:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5TRlj+qwE7HIUgzzMhZPIUiun0nI/x4ZopDbEaWGGcI=;
 b=R2Tbu0v/PZyQ41rRzyHsD+msw3SxFvwUdxRd1CPRdhSg9Vi0zHv6E8eyQx5QwmTTCT
 /fFiPC3LeiT9I/3YWFgJqpbRyx9yp/yVhNNrAEHWivBUAsSLsEHdDHS9/js19MIQx92X
 40B+0kLjVkJeVIuFi1bsgL+Kkbv7uAWVvEXT5lgmTetnQE1vyFs9mmnOWUmotKGypF7H
 GAAv/JCNuufOaZHxp43gokb/X3of3xoDkqK82dP0SN35HvVyJEWLKU98nnsrOunTRiZw
 Jvl6gWNPWCWbvCKNm8/q4dZ/2eqtNaP/ZbezamuZMR1vkRNZd3xIU7/GLcScEr/vRb4b
 1rqQ==
X-Gm-Message-State: AOAM5313KZxWg2DoiDekBDKzf5jAz5O6LGNy5eBMlwKnn8F1gldqgGGl
 uvz4FJzR+aMo1gcUrtRnmeQ/WFj7ARr8Llgf74Ngi0avSwNXIuM3bQMJ53SIzSj59HVOTQbWGbc
 yzCMdvhVeUaK3z4Q=
X-Received: by 2002:a05:600c:3b9b:: with SMTP id
 n27mr15564008wms.188.1627575359993; 
 Thu, 29 Jul 2021 09:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/P95lPCTKoK1f+fe2kP60woWhhnvIwRcZ0P4yxLkoYZCjUusu7BdOOid0e+RWX0NFs6e3OA==
X-Received: by 2002:a05:600c:3b9b:: with SMTP id
 n27mr15563968wms.188.1627575359698; 
 Thu, 29 Jul 2021 09:15:59 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id z3sm9712829wmf.6.2021.07.29.09.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 09:15:59 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: Peter Xu <peterx@redhat.com>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com> <YPsP8+STD836MO3L@t490s>
 <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com> <YPs+cO7u1eXMomE0@t490s>
 <de4bd533-efaa-a6e5-c73c-01016d0f229c@redhat.com> <YQLO1QoOIu8dlaEq@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5ede7b00-1048-c124-e239-eeff21d9adb0@redhat.com>
Date: Thu, 29 Jul 2021 18:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQLO1QoOIu8dlaEq@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 17:52, Peter Xu wrote:
> On Thu, Jul 29, 2021 at 02:14:41PM +0200, David Hildenbrand wrote:
>> On 24.07.21 00:10, Peter Xu wrote:
>>> On Fri, Jul 23, 2021 at 09:01:42PM +0200, David Hildenbrand wrote:
>>>> It can happen in corner cases and is valid: with the current virtio-mem
>>>> spec, guests are allowed to read unplugged memory. This will, for example,
>>>> happen on older Linux guests when reading /proc/kcore or (with even older
>>>> guests) when dumping guest memory via kdump. These corner cases were the
>>>> main reason why the spec allows for it -- until we have guests properly
>>>> adjusted such that it won't happen even in corner cases.
>>>>
>>>> A future feature bit will disallow it for the guest: required for supporting
>>>> shmem/hugetlb cleanly. With that in place, I agree that we would want to
>>>> warn in this case!
>>>
>>> OK that makes sense; with the page_size change, feel free to add:
>>
>> I just realized that relying on the page_size would be wrong.
>>
>> We migrate TARGET_PAGE_SIZE chunks and the offset might not be page_size
>> aligned. So if we were to replace TARGET_PAGE_SIZE by rb->page_size, we
>> might accidentally cover a "too big" range.
> 
> I'm wondering whether we should make the offset page size aligned instead.  For
> example, note that postcopy_place_page_zero() should only take page_size
> aligned host addr or UFFDIO_COPY could fail (hugetlb doesn't support
> UFFDIO_ZEROPAGE yet).

That is true indeed. I'd assume in that case that we would get called 
with the proper offset already, right? Because uffd would only report 
properly aligned pages IIRC.

> 
> Btw, does virtio-mem supports hugetlbfs now?  When with it, the smallest unit
> to plug/unplug would the huge page size (e.g., for 1g huge page, sounds not
> helpful to unplug 2M memory), am I right?

It supports it to 99.9 % I'd say (especially with the dump/tpm/migration 
fixes upstream). The units are handled properly: the unit is at least as 
big as the page size.

So with 1 GiB pages, you have a unit of 1 GiB.


-- 
Thanks,

David / dhildenb


