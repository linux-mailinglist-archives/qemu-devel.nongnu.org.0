Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708B321E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:43:23 +0100 (CET)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFEw-0002Fj-7w
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEF8w-00030E-Tm
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEF8v-0000ZB-A1
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ispofPJQ2cI2x8CViiwAPsl/7z57cPCR5l9WLAzA8jw=;
 b=irPasKRjOjzhO6P3c8y6/5+IQRqH9QIf5O+DN04aW5CHlnZVTIMfrOSDEbdGFz3KYssI5b
 FjgwdrQn/+osGYwl2MofrCJUTYnZhun0bkRWKa+H96ZheqeWcFtHIplm05L11sL6BRe0xm
 Shy83jgAkyQqwx2DHE+Gh0pHwNQ0hv4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ohbqLqr0MoKLY21E_V6K1g-1; Mon, 22 Feb 2021 12:37:04 -0500
X-MC-Unique: ohbqLqr0MoKLY21E_V6K1g-1
Received: by mail-ej1-f71.google.com with SMTP id yh28so4291399ejb.11
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ispofPJQ2cI2x8CViiwAPsl/7z57cPCR5l9WLAzA8jw=;
 b=dCWYHZtbl2TiCxpSCri/8we5sO/keCbOGB0/YTmE8BWtcX3IiPm7TVmcBl7MIyrg0G
 GjXhLDBLkWGpOl3omd8aA7dp1QnY5tNRRq626b9yRsI+ngp7Rk4gdJr5rQG4dBcLf+eA
 JqQPlU4fAR2J/bxudBjYgoQ07jYONMX4bM7maGEnwOt6NdK61Ew1mR51sW1Y6OhN8LWa
 24ACvNlsCXglWTdErAGKKEjvLuUuuwlmCmAU6YE7/JHuUrasCaE8rAufYbcDOYxGzI6S
 EQKcVWwpr1WwwBjadAlvR4R4LgwJOfOK2vk9amq07Kyyh+kwysDuaMyDpgVtPc9x5LAP
 YqoQ==
X-Gm-Message-State: AOAM532FQT3rHQq4AglXUDfCT2FRuftStZYV8i6k4ajFIhkq89roG2wZ
 /j8NljnI4qyy/E9YSfLgtTcSC7tUbOi4aagqDa21rR1LGX79E56WnTF50bMtAP9NJutkvN+1hh3
 mUHufqwGt8MYMxcc=
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr23057598edd.5.1614015423081; 
 Mon, 22 Feb 2021 09:37:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+xiBrfezd1QHfGSD1IWlWbCCQ3KetP/YmToUb85iCEacN3tXLH3EUpg3w50V3W3//sgUJ3Q==
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr23057580edd.5.1614015422862; 
 Mon, 22 Feb 2021 09:37:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i18sm12501224eds.19.2021.02.22.09.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:37:02 -0800 (PST)
Subject: Re: [PATCH v6 01/12] memory: Introduce RamDiscardMgr for RAM memory
 regions
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-2-david@redhat.com>
 <7137d1ad-2741-7536-5a3c-58d0c4f8306b@redhat.com>
 <0277759d-bb9a-6bf3-0ca4-53d3f7ec98f5@redhat.com>
 <a6f7de7a-72c3-a6c6-0a14-3e21a0cc833b@redhat.com>
 <24562156-457f-90b5-dcaf-c55fba1e881b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <adedbbe8-cf77-7ede-1291-a1d6f6082451@redhat.com>
Date: Mon, 22 Feb 2021 18:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24562156-457f-90b5-dcaf-c55fba1e881b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 15:53, David Hildenbrand wrote:
>> Yes, but does it behave more like the IOMMU notifier in other regards?
>> :)  The IOMMU notifier is concerned with an iova concept that doesn't
>> exist at the MemoryRegion level, while RamDiscardListener works at the
>> (MemoryRegion, offset) level that can easily be represented by a
>> MemoryRegionSection.  Using MemoryRegionSection might even simplify the
>> listener code.
> 
> It's similarly concerned with rather small, lightweight updates I would 
> say.

Why does that matter?  I think if it's concerned with the MemoryRegion 
address space it should use MemoryListener and MemoryRegionSection.

>>> The main motivation is to let listener decide how it wants to handle the
>>> memory region. For example, for vhost, vdpa, kvm, ... I only want a
>>> single region, not separate ones for each and every populated range,
>>> punching out discarded ranges. Note that there are cases (i.e.,
>>> anonymous memory), where it's even valid for the guest to read discarded
>>> memory.
>>
>> Yes, I agree with that.  You would still have the same
>> region-add/region_nop/region_del callbacks for KVM and friends; on top
>> of that you would have region_populate/region_discard callbacks for VFIO.
> 
> I think instead of region_populate/region_discard we would want 
> individual region_add/region_del when populating/discarding for all 
> MemoryListeners that opt-in somehow (e.g., VFIO, dump-guest-memory, 
> ...). Similarly, we would want to call log_sync()/log_clear() then only 
> for these parts.
> 
> But what happens when I populate/discard some memory? I don't want to 
> trigger an address space transaction (begin()...region_nop()...commit()) 
> - whenever I populate/discard memory (e.g., in 2 MB granularity). 
> Especially not, if nothing might have changed for most other 
> MemoryListeners.

Right, that was the reason why I was suggesting different callbacks. 
For the VFIO listener, which doesn't have begin or commit callbacks, I 
think you could just rename region_add to region_populate, and point 
both region_del and region_discard to the existing region_del commit.

Calling log_sync/log_clear only for populated parts also makes sense. 
log_sync and log_clear do not have to be within begin/commit, so you can 
change the semantics to call them more than once.



Paolo


