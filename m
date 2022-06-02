Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E509953B650
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:44:58 +0200 (CEST)
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwhNx-0004lv-G8
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwhJg-0002SB-FW
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwhJY-0000pF-Ed
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654162823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52LjxcDCDPkycB4f7TfSZD4ZH4TRdf/5KkEsxrmPS+E=;
 b=gwJDCCIrF9E/uFFJm6jj+fgAXOwXmU7yFVe/tITq0MGCMBVP15GXGAF3lJdy5heByH9QAv
 hMn6b7Y9rZDIZe9I4xscCpkl9dXQhEbS+ipqgGjLhu1rhqfZ5wgSbHs2ScL+oZPSd/TTJV
 qe8As28a0NCIhS5js/Jmi5tVCqRtnC4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-jyO1YWXbNdyCDEMyew2beQ-1; Thu, 02 Jun 2022 05:40:21 -0400
X-MC-Unique: jyO1YWXbNdyCDEMyew2beQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso4870705wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 02:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=52LjxcDCDPkycB4f7TfSZD4ZH4TRdf/5KkEsxrmPS+E=;
 b=n89WSYJ5Ut/tb09hhO9/urb5/y5fsuQHxdXeVzBG+ZgY0Xt4itnlZiiacZDkGTvOb2
 MgoYFFaAFxuyTVZTp7mlcIgecwamgPnm5TCu50NDiyJmS2xXEwFl7LXJ9rwqNSF/xoDa
 k1i+e818CeUPw3OuG8N53QZ6ErwEp/5eD9+E8G6qU0uKbqHxooG8TEPBJjZMNeCbyJf5
 TOrcDXdmkD3EwXI8Z1x+TqKU+7kGrFMuV0Sdir96raP5cYui85KwLXifaJj6bF5grRc0
 5IvLZT3WTjZ9eaXGrWrHc8UAYMvIIioD6VENtFcDeTtRFhGmezjXWXrLjjLy9HhmWm5B
 TJrg==
X-Gm-Message-State: AOAM532e/hC4UeU1iG1oqkZx5owokhRZSoYRTVM/lDE5SzRiPTxTHmXx
 Em4INrSBS29E3RhqOofPTOAk2Ms//lePa6/od1PfdB2wIDWVeuNpfDqmuUvDeFx4HS+4GW/kIaW
 soR2XL0kJ4WMrHJo=
X-Received: by 2002:a05:600c:5126:b0:39a:eede:5bf4 with SMTP id
 o38-20020a05600c512600b0039aeede5bf4mr3176150wms.81.1654162820620; 
 Thu, 02 Jun 2022 02:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHYaDjNFGZohw0FilN1sHRbTenO2UBUUNE+T3ndq17x5ElP+Hjk2H4wgNC7lGgcxhyEKxNTg==
X-Received: by 2002:a05:600c:5126:b0:39a:eede:5bf4 with SMTP id
 o38-20020a05600c512600b0039aeede5bf4mr3176113wms.81.1654162820283; 
 Thu, 02 Jun 2022 02:40:20 -0700 (PDT)
Received: from [192.168.178.20] (p57a1a7d6.dip0.t-ipconnect.de.
 [87.161.167.214]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfef8d000000b0020fc40d006bsm3830184wro.17.2022.06.02.02.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 02:40:19 -0700 (PDT)
Message-ID: <8e4ffc3f-62c3-636e-e65b-af4b5bbc6c99@redhat.com>
Date: Thu, 2 Jun 2022 11:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?=
 <naoya.horiguchi@nec.com>
Cc: Peter Xu <peterx@redhat.com>, Jue Wang <juew@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jasowang@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
 <Yo/I3oLkd9OU0ice@xz-m1.local>
 <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
 <0d266c61-605d-ce0c-4274-b0c7e10f845a@redhat.com>
 <4b0c3e37-b882-681a-36fc-16cee7e1fff0@bytedance.com>
 <YpTngZ5Qr0KIvL0H@xz-m1.local>
 <CAPcxDJ5UMfpys8KyLQVnkV9BPO1vaubxbhc7f4XC_TdNO7jr7g@mail.gmail.com>
 <5f622a65-8348-8825-a167-414f2a8cd2eb@bytedance.com>
 <484546da-16cc-8070-2a2c-868717b8a75a@redhat.com>
 <fc4ade80-a40a-d24d-d44d-16b48232b89f@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <fc4ade80-a40a-d24d-d44d-16b48232b89f@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.06.22 11:28, zhenwei pi wrote:
> On 6/1/22 15:59, David Hildenbrand wrote:
>> On 01.06.22 04:17, zhenwei pi wrote:
>>> On 5/31/22 12:08, Jue Wang wrote:
>>>> On Mon, May 30, 2022 at 8:49 AM Peter Xu <peterx@redhat.com> wrote:
>>>>>
>>>>> On Mon, May 30, 2022 at 07:33:35PM +0800, zhenwei pi wrote:
>>>>>> A VM uses RAM of 2M huge page. Once a MCE(@HVAy in [HVAx,HVAz)) occurs, the
>>>>>> 2M([HVAx,HVAz)) of hypervisor becomes unaccessible, but the guest poisons 4K
>>>>>> (@GPAy in [GPAx, GPAz)) only, it may hit another 511 MCE ([GPAx, GPAz)
>>>>>> except GPAy). This is the worse case, so I want to add
>>>>>>    '__le32 corrupted_pages' in struct virtio_balloon_config, it is used in the
>>>>>> next step: reporting 512 * 4K 'corrupted_pages' to the guest, the guest has
>>>>>> a chance to isolate the other 511 pages ahead of time. And the guest
>>>>>> actually loses 2M, fixing 512*4K seems to help significantly.
>>>>>
>>>>> It sounds hackish to teach a virtio device to assume one page will always
>>>>> be poisoned in huge page granule.  That's only a limitation to host kernel
>>>>> not virtio itself.
>>>>>
>>>>> E.g. there're upstream effort ongoing with enabling doublemap on hugetlbfs
>>>>> pages so hugetlb pages can be mapped in 4k with it.  It provides potential
>>>>> possibility to do page poisoning with huge pages in 4k too.  When that'll
>>>>> be ready the assumption can go away, and that does sound like a better
>>>>> approach towards this problem.
>>>>
>>>> +1.
>>>>
>>>> A hypervisor should always strive to minimize the guest memory loss.
>>>>
>>>> The HugeTLB double mapping enlightened memory poisoning behavior (only
>>>> poison 4K out of a 2MB huge page and 4K in guest) is a much better
>>>> solution here. To be completely transparent, it's not _strictly_
>>>> required to poison the page (whatever the granularity it is) on the
>>>> host side, as long as the following are true:
>>>>
>>>> 1. A hypervisor can emulate the _minimized_ (e.g., 4K) the poison to the guest.
>>>> 2. The host page with the UC error is "isolated" (could be PG_HWPOISON
>>>> or in some other way) and prevented from being reused by other
>>>> processes.
>>>>
>>>> For #2, PG_HWPOISON and HugeTLB double mapping enlightened memory
>>>> poisoning is a good solution.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> I assume when talking about "the performance memory drops a lot", you
>>>>>>> imply that this patch set can mitigate that performance drop?
>>>>>>>
>>>>>>> But why do you see a performance drop? Because we might lose some
>>>>>>> possible THP candidates (in the host or the guest) and you want to plug
>>>>>>> does holes? I assume you'll see a performance drop simply because
>>>>>>> poisoning memory is expensive, including migrating pages around on CE.
>>>>>>>
>>>>>>> If you have some numbers to share, especially before/after this change,
>>>>>>> that would be great.
>>>>>>>
>>>>>>
>>>>>> The CE storm leads 2 problems I have even seen:
>>>>>> 1, the memory bandwidth slows down to 10%~20%, and the cycles per
>>>>>> instruction of CPU increases a lot.
>>>>>> 2, the THR (/proc/interrupts) interrupts frequently, the CPU has to use a
>>>>>> lot time to handle IRQ.
>>>>>
>>>>> Totally no good knowledge on CMCI, but if 2) is true then I'm wondering
>>>>> whether it's necessary to handle the interrupts that frequently.  When I
>>>>> was reading the Intel CMCI vector handler I stumbled over this comment:
>>>>>
>>>>> /*
>>>>>    * The interrupt handler. This is called on every event.
>>>>>    * Just call the poller directly to log any events.
>>>>>    * This could in theory increase the threshold under high load,
>>>>>    * but doesn't for now.
>>>>>    */
>>>>> static void intel_threshold_interrupt(void)
>>>>>
>>>>> I think that matches with what I was thinking..  I mean for 2) not sure
>>>>> whether it can be seen as a CMCI problem and potentially can be optimized
>>>>> by adjust the cmci threshold dynamically.
>>>>
>>>> The CE storm caused performance drop is caused by the extra cycles
>>>> spent by the ECC steps in memory controller, not in CMCI handling.
>>>> This is observed in the Google fleet as well. A good solution is to
>>>> monitor the CE rate closely in user space via /dev/mcelog and migrate
>>>> all VMs to another host once the CE rate exceeds some threshold.
>>>>
>>>> CMCI is a _background_ interrupt that is not handled in the process
>>>> execution context and its handler is setup to switch to poll (1 / 5
>>>> min) mode if there are more than ~ a dozen CEs reported via CMCI per
>>>> second.
>>>>>
>>>>> --
>>>>> Peter Xu
>>>>>
>>>
>>> Hi, Andrew, David, Naoya
>>>
>>> According to the suggestions, I'd give up the improvement of memory
>>> failure on huge page in this series.
>>>
>>> Is it worth recovering corrupted pages for the guest kernel? I'd follow
>>> your decision.
>>
>> Well, as I said, I am not sure if we really need/want this for a handful
>> of 4k poisoned pages in a VM. As I suspected, doing so might primarily
>> be interesting for some sort of de-fragmentation (allow again a higher
>> order page to be placed at the affected PFNs), not because of the slight
>> reduction of available memory. A simple VM reboot would get the job
>> similarly done.
>>
> 
> Sure, Let's drop this idea. Thanks to all for the suggestions.

Thanks for the interesting idea + discussions.

Just a note that if you believe that we want/need something like that,
and there is a reasonable use case, please tell us we're wrong and push
back :)

-- 
Thanks,

David / dhildenb


