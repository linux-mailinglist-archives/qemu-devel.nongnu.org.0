Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1A3D54A1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 09:52:40 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7vPj-0007I1-DW
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 03:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m7vOv-0006bG-QJ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m7vOn-0006K1-Os
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 03:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627285900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYPhxYSsxX50ZEWswkfSQFBKssFfnAUqVs0WWAN32Y0=;
 b=M2Q5HrW4UqvBCHRvmRiEAx2qH1vE2GAOYEGr/2OYg1DWbDZg0qz1OFrq7Qk48qesbnGzxn
 4c+GCeoRG1rzRac8sKenkAV6nawvvUxat6bNqoc11wdtJsrM08FJdEZxJxr6AYl9Cc2qUQ
 0pxxzLiOlbHcCP/FhpguFwMk7lasXuw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-i5i-OZk8MJG5SqrWpQCNgA-1; Mon, 26 Jul 2021 03:51:38 -0400
X-MC-Unique: i5i-OZk8MJG5SqrWpQCNgA-1
Received: by mail-wm1-f69.google.com with SMTP id
 85-20020a1c01580000b02902511869b403so381144wmb.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 00:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nYPhxYSsxX50ZEWswkfSQFBKssFfnAUqVs0WWAN32Y0=;
 b=OfoBy89slrKhLEanETgCWlTsBeqjjacumW69n+zaKcgmXel0nhf7KZtor7NzO8Ag8I
 XRaekChAkClGDMVb3cFG+HXYyolOWDtsQYYwkAlnIsYsfJQJ4x5X4gPif1o7zvxdh5ZP
 qJkEJdgQRLfQcQyZEU27MjenGKlPvWbUj9BLi5hexC3qxbR2rKfJ9l2NbaVOM25CJcfU
 +W8dTspBXQISu6rzVf8/X6DMhZxUNgITwrSSsGfCp205foLBhevrmKZBAxaURmwZS87v
 u7TF9Qg2ro+wDdNpbhs9Vp+D/tIqmMV5ZYPZzYykD3nfj8STEkkjtWPe5VicC/uMD1WN
 cuaA==
X-Gm-Message-State: AOAM530lJnEwsVW8KES/+wEjfTFT2EgLDOnytJIkIMphBa9ZSPtjbRwD
 2mZwjDeqm3k6TXhbcxFpVu537KuYT5zCmmqM89nfSklQZP8QdRPlmXWJt0dv8ZNi+e2QzM8ggJu
 pUk6Yat5ZgSpAAag=
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr6352367wrr.291.1627285897643; 
 Mon, 26 Jul 2021 00:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7YJmw0vriZcc3ZmXwP5f5a077tD5eh8o/5GC2e8zcfJ9x8SmdQfG3K2QGRZ0+s1dOhouG3A==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr6352338wrr.291.1627285897429; 
 Mon, 26 Jul 2021 00:51:37 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b33.dip0.t-ipconnect.de. [79.242.59.51])
 by smtp.gmail.com with ESMTPSA id
 f11sm12323386wmb.14.2021.07.26.00.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:51:36 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-6-david@redhat.com> <YPrgEXkl2wsXYs03@t490s>
 <32088854-3df2-cdc8-0a1a-ce6cf2289adb@redhat.com> <YPtDsQxJcy4Am2wG@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH resend v2 5/5] softmmu/memory_mapping: optimize for
 RamDiscardManager sections
Message-ID: <162c3460-a8a3-4f7c-c85b-4d423bbbb40a@redhat.com>
Date: Mon, 26 Jul 2021 09:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPtDsQxJcy4Am2wG@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.07.21 00:33, Peter Xu wrote:
> On Fri, Jul 23, 2021 at 08:56:54PM +0200, David Hildenbrand wrote:
>>>
>>> As I've asked this question previously elsewhere, it's more or less also
>>> related to the design decision of having virtio-mem being able to sparsely
>>> plugged in such a small granularity rather than making the plug/unplug still
>>> continuous within GPA range (so we move page when unplug).
>>
>> Yes, in an ideal world that would be optimal solution. Unfortunately, we're
>> not living in an ideal world :)
>>
>> virtio-mem in Linux guests will as default try unplugging highest-to-lowest
>> address, and I have on my TODO list an item to shrink the usable region (->
>> later, shrinking the actual RAMBlock) once possible.
>>
>> So virtio-mem is prepared for that, but it will only apply in some cases.
>>
>>>
>>> There's definitely reasons there and I believe you're the expert on that (as
>>> you mentioned once: some guest GUPed pages cannot migrate so cannot get those
>>> ranges offlined otherwise), but so far I still not sure whether that's a kernel
>>> issue to solve on GUP, although I agree it's a complicated one anyway!
>>
>> To do something like that reliably, you have to manage hotplugged memory in
>> a special way, for example, in a movable zone.
>>
>> We have a at least 4 cases:
>>
>> a) The guest OS supports the movable zone and uses it for all hotplugged
>>     memory
>> b) The guest OS supports the movable zone and uses it for some
>>     hotplugged memory
>> c) The guest OS supports the movable zone and uses it for no hotplugged
>>     memory
>> d) The guest OS does not support the concept of movable zones
>>
>>
>> a) is the dream but only applies in some cases if Linux is properly
>> configured (e.g., never hotplug more than 3 times boot memory)
>> b) will be possible under Linux soon (e.g., when hotplugging more than 3
>> times boot memory)
>> c) is the default under Linux for most Linux distributions
>> d) Is Windows
>>
>> In addition, we can still have random unplug errors when using the movable
>> zone, for example, if someone references a page just a little too long.
>>
>> Maybe that helps.
> 
> Yes, thanks.
> 
>>
>>>
>>> Maybe it's a trade-off you made at last, I don't have enough knowledge to tell.
>>
>> That's the precise description of what virtio-mem is. It's a trade-off
>> between which OSs we want to support, what the guest OS can actually do, how
>> we can manage memory in the hypervisor efficiently, ...
>>
>>>
>>> The patch itself looks okay to me, there's just a slight worry on not sure how
>>> long would the list be at last; if it's chopped in 1M/2M small chunks.
>>
>> I don't think that's really an issue: take a look at
>> qemu_get_guest_memory_mapping(), which will create as many entries as
>> necessary to express the guest physical mapping of the guest virtual (!)
>> address space with such chunks. That can be a lot :)
> 
> I'm indeed a bit surprised by the "paging" parameter.. I gave it a try, the
> list grows into tens of thousands.

Yes, and the bigger the VM, the more entries you should get ... like 
with virtio-mem.

> 
> One last question: will virtio-mem still do best-effort to move the pages, so
> as to grant as less holes as possible?

That depends on the guest OS.

Linux guests will unplug highest-to-lowest addresses. They will try 
migrating pages away (alloc_contig_range()) to minimize fragmentation. 
Further, when (un)plugging, they will try a) unplug within already 
fragmented Linux memory blocks (e.g., 128 MiB) b) plugging within 
already fragmented Linux memory blocks first. Because the goal is to 
require as little as possible Linux memory blocks to reduce metadata 
(memmap) overhead.

I recall that the Windows prototype also tries unplug highest-to-lowest 
using the Windows range allocator, however, I have no idea what that 
range allcoator actually does (if it only grabs free pages or if it can 
actually move around busy pages).

For Linux guests, there is a work item to continue defragmenting the 
layout to free up complete Linux memory blocks over time.


With a 1 TiB virtio-mem device and a 2 MiB block size (default), in the 
worst case we would get 262144 individual blocks (every second one 
plugged). While this is far from realistic, I assume we can get 
something comparable when dumping a huge VM in paging mode.

With 262144 entires, with ~48 byte (6*8 byte) per element, we'd consume 
12 MiB for the whole list. Not perfect, but not too bad.

-- 
Thanks,

David / dhildenb


