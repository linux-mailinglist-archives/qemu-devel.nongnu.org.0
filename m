Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661342B8CF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:17:09 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYVg-0000lA-90
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maYTN-0007wO-8s
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maYTJ-0001cQ-6k
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634109279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xN86qgN7ALAd3hBR2hKdE9w20ggbhcn0JNd/A/ct2Ek=;
 b=ILJXz5JPSUTb/asbqTp0qKsqjObBGbWhYJypRXeXfYKjVHSojo+j1uY3lFuz1RRYRgRY92
 L2Xe+7l2IIFIDC+e98+LBpnYfcsjCurkUgBxN/axT9O43chH2vr4X6hV4WNAnz+FJvPU7C
 sJbYemjYq8kU3KqUs/Bht802MADi7oo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-mcNuwgC5Ohy0OdqdE7DcDA-1; Wed, 13 Oct 2021 03:14:38 -0400
X-MC-Unique: mcNuwgC5Ohy0OdqdE7DcDA-1
Received: by mail-wr1-f72.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso1151246wrb.23
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xN86qgN7ALAd3hBR2hKdE9w20ggbhcn0JNd/A/ct2Ek=;
 b=jc9M3i1QMQHjdRDT27XxCDWBUJThMVhT39xGIcY1Hkw42nZdr+pkC6/SSLzO5onvMT
 t9HADgS/MIVioP/nsnRufTntfHSaoXaYYFd+39cSBMDqinX6MZsfoeUPVPe7nqWEAUh8
 Y9vOy4kqwGuObxvLtq4Ol3CEXbL5uaBEdvTu+3JYle7y43V4rCEycSf/xDe02cPLna+r
 SdgUBikiW2L0pRIGNgRg+hejkZLRiSUAda798CGpc7124WG1XsZQbPoTv+b5R63w6B6A
 1LGLLZVjN+NtURO+tUKCoFdELQ5aBECG7vth69CYAhOwrt90KzhGWr04qgugNQnTSxnt
 yYOA==
X-Gm-Message-State: AOAM532oydtTPVQKT7RyEiFbXZwC3HcJta+42i3AxPVq0Ik/+p1nsr5c
 TFF5lDRtB8sDcAKv7supdXD27fvQP5V/eTXH+E+A2HVUv4rni8oOvktkqzL7vzLrFzHZHgRcR25
 DxTPf5PEkMtIy8mU=
X-Received: by 2002:adf:bc48:: with SMTP id a8mr38561804wrh.397.1634109276909; 
 Wed, 13 Oct 2021 00:14:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXuyxN63dfp81WwzgV+sxR7pDowSmHvRLIGPjSqnt4/yq/HBHu1hvH9aH239OPPTXbWZQg4g==
X-Received: by 2002:adf:bc48:: with SMTP id a8mr38561787wrh.397.1634109276682; 
 Wed, 13 Oct 2021 00:14:36 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6774.dip0.t-ipconnect.de. [91.12.103.116])
 by smtp.gmail.com with ESMTPSA id x7sm5111331wrq.69.2021.10.13.00.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:14:36 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
From: David Hildenbrand <david@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
 <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
 <20211012105300.1ef25440@redhat.com>
 <a2078241-1dc9-782e-38a3-eab06c1b162c@redhat.com>
 <20211012120059.14e19dc1@redhat.com>
 <84adb9d1-6e30-7d5e-a362-0a81ea4b8b01@redhat.com>
Organization: Red Hat
Message-ID: <067a10ee-0897-df8d-2eff-b347c5958b03@redhat.com>
Date: Wed, 13 Oct 2021 09:14:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <84adb9d1-6e30-7d5e-a362-0a81ea4b8b01@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.10.21 12:09, David Hildenbrand wrote:
>>
>> The less confusing would be one where check works for any memory region
>> involved.
> 
> Exactly, so for any alias, even in-between another alias and the target.
> 
>>    
>>>>
>>>>     
>>>>>         I am not aware of actual issues, this is rather a cleanup.
>>>>>         
>>>>>         Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>
>>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>>> index 75b4f600e3..93d0190202 100644
>>>>> --- a/include/exec/memory.h
>>>>> +++ b/include/exec/memory.h
>>>>> @@ -728,6 +728,7 @@ struct MemoryRegion {
>>>>>          const MemoryRegionOps *ops;
>>>>>          void *opaque;
>>>>>          MemoryRegion *container;
>>>>> +    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
>>>>>          Int128 size;
>>>>>          hwaddr addr;
>>>>>          void (*destructor)(MemoryRegion *mr);
>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>> index 3bcfc3899b..1168a00819 100644
>>>>> --- a/softmmu/memory.c
>>>>> +++ b/softmmu/memory.c
>>>>> @@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
>>>>>                                                     hwaddr offset,
>>>>>                                                     MemoryRegion *subregion)
>>>>>      {
>>>>> +    MemoryRegion *alias;
>>>>> +
>>>>>          assert(!subregion->container);
>>>>>          subregion->container = mr;
>>>>> +    for (alias = subregion->alias; alias; alias = alias->alias) {
>>>>> +       alias->mapped_via_alias++;
>>>>
>>>> it it necessary to update mapped_via_alias for intermediate aliases?
>>>> Why not just update on counter only on leaf (aliased region)?
>>>
>>> Assume we have alias0 -> alias1 -> region and map alias0.
>>>
>>> Once alias0 is mapped it will have ->container set and
>>> memory_region_is_mapped(alias0) will return "true".
>>>
>>> With my patch, both, "alias1" and the region will be marked
>>> "mapped_via_alias" and memory_region_is_mapped() will succeed on both of
>>> them. With what you propose, memory_region_is_mapped() would only
>>> succeed on the region (well, and on alias 0) but not on alias1.
>>
>> as long as add_subregion increments counter on leaf it doesn't matter
>> how many intermediate aliases are there. Check on every one of them
>> should end up at the leaf counter (at expense of traversing
>> chain on every check but less state to track/think about).
>>
> 
> Sure, we could also let memory_region_is_mapped() walk all aliases to
> the leaf. Not sure though, if it really simplifies things. It merely
> adds another loop and doesn't get rid of the others :) But I don't
> particularly care.
> 

I just realized that this might not be what we want: we could get false 
positives when a memory region is referenced via multiple alias and only 
one of them is mapped. memory_region_is_mapped() could return "true" for 
an alias that isn't actually mapped.

-- 
Thanks,

David / dhildenb


