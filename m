Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3962428804
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 09:45:29 +0200 (CEST)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZq00-0001ND-91
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 03:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZpyd-0000hM-8r
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZpya-0002D5-4d
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 03:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633938239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPh0AP+ozz2hNqOK1cI25AL/ppGBJR5TFp8AObSt+ow=;
 b=WOLISzlbD3RcZIt6I+OgFrEGUoMq3SQPM1BVO8fJ15daXx0s0BgMV8UOx+0bGprKBKXBLE
 vva0BjZA2+tl6W3gu3YOTmtHUAfddgtfVcPyK43Gi+oos25oI6vzwdZXVr1rbyhZ/rnX7g
 jGyEsFRG/u5MagNezTfUP1zfsLYM9+c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-1itWOOx8M0eJDDFqNMKGcQ-1; Mon, 11 Oct 2021 03:43:56 -0400
X-MC-Unique: 1itWOOx8M0eJDDFqNMKGcQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso12630184wrg.7
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 00:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bPh0AP+ozz2hNqOK1cI25AL/ppGBJR5TFp8AObSt+ow=;
 b=c7rqhI0G0EUQcA7bEM7Srp9qr9pUjn67UJif6XcQIM43y7SLlz6j36wlJS/MqOHpUz
 iWYDIWdlLOk2qQJruJfhtCWrlZIc0NzMjT1GsCa56+9P/bAERN1vT0Sk/PIZjhElk55z
 RGhuHvXtun2e+Q/dl/5Rvospfap4ezLdJW/b1bQ6LAEiefJiBQNSihth1oXLOrQw75Vu
 dpSwTbc3CuQIMs7o4EywBN6uAgYVnHcK8DVSLvUZVaCI2KGdi2lbd6vIj7MAriBffQXM
 9J/iNdrP1uBDXwbHA20Gpzm6lKQ4WZihngduElBVFnbuElp14BW1cRy+YF43p04V5xtj
 DR+w==
X-Gm-Message-State: AOAM530lgQ1CQiKLHzJc8lJkEEk5JCOdj8nC4V9p2yCUHx3vYsywpQko
 rIfB/FsiWwp2NCO8RMUdnIunpdbbQ2DhunrTyxqbICbPv+ZQiszgSJkRmOMUMIyXUSU+7WpUu1h
 oNGbhtcI7vLwEO6s=
X-Received: by 2002:adf:bb93:: with SMTP id q19mr23454034wrg.423.1633938235030; 
 Mon, 11 Oct 2021 00:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUc9vhtxXcIZApcIlekgXUpAmcJAlSx6ZPNzVcKqVocuoJLCWLrYW4Iyc5gl+wZwD1XiWLZg==
X-Received: by 2002:adf:bb93:: with SMTP id q19mr23454006wrg.423.1633938234782; 
 Mon, 11 Oct 2021 00:43:54 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id s2sm6689833wrn.77.2021.10.11.00.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 00:43:54 -0700 (PDT)
To: "david.dai" <david.dai@montage-tech.com>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
 <20210930094007.GA239054@tianmu-host-sw-01>
 <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
 <20211009094233.GA13867@tianmu-host-sw-01>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <ea36815e-0b79-b5b2-9735-367404c9b8f6@redhat.com>
Date: Mon, 11 Oct 2021 09:43:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211009094233.GA13867@tianmu-host-sw-01>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> virito-mem currently relies on having a single sparse memory region (anon
>> mmap, mmaped file, mmaped huge pages, mmap shmem) per VM. Although we can
>> share memory with other processes, sharing with other VMs is not intended.
>> Instead of actually mmaping parts dynamically (which can be quite
>> expensive), virtio-mem relies on punching holes into the backend and
>> dynamically allocating memory/file blocks/... on access.
>>
>> So the easy way to make it work is:
>>
>> a) Exposing the CXL memory to the buddy via dax/kmem, esulting in device
>> memory getting managed by the buddy on a separate NUMA node.
>>
> 
> Linux kernel buddy system? how to guarantee other applications don't apply memory
> from it

Excellent question. Usually, you would online the memory to ZONE_MOVABLE,
such that even if some other allocation ended up there, that it could
get migrated somewhere else.

For example, "daxctl reconfigure-device" tries doing that as default:

https://pmem.io/ndctl/daxctl-reconfigure-device.html

However, I agree that we might actually want to tell the system to not
use this CPU-less node as fallback for other allocations, and that we
might not want to swap out such memory etc.


But, in the end all that virtio-mem needs to work in the hypervisor is

a) A sparse memmap (anonymous RAM, memfd, file)
b) A way to populate memory within that sparse memmap (e.g., on fault,
    using madvise(MADV_POPULATE_WRITE), fallocate())
c) A way to discard memory (madvise(MADV_DONTNEED),
    fallocate(FALLOC_FL_PUNCH_HOLE))

So instead of using anonymous memory+mbind, you can also mmap a sparse file
and rely on populate-on-demand. One alternative for your use case would be
to create a DAX  filesystem on that CXL memory (IIRC that should work) and
simply providing virtio-mem with a sparse file located on that filesystem.

Of course, you can also use some other mechanism as you might have in
your approach, as long as it supports a,b,c.

> 
>>
>> b) (optional) allocate huge pages on that separate NUMA node.
>> c) Use ordinary memory-device-ram or memory-device-memfd (for huge pages),
>> *bidning* the memory backend to that special NUMA node.
>>
>   
> "-object memory-backend/device-ram or memory-device-memfd, id=mem0, size=768G"
> How to bind backend memory to NUMA node
> 

I think the syntax is "policy=bind,host-nodes=X"

whereby X is a node mask. So for node "0" you'd use "host-nodes=0x1" for "5"
"host-nodes=0x20" etc.

>>
>> This will dynamically allocate memory from that special NUMA node, resulting
>> in the virtio-mem device completely being backed by that device memory,
>> being able to dynamically resize the memory allocation.
>>
>>
>> Exposing an actual devdax to the virtio-mem device, shared by multiple VMs
>> isn't really what we want and won't work without major design changes. Also,
>> I'm not so sure it's a very clean design: exposing memory belonging to other
>> VMs to unrelated QEMU processes. This sounds like a serious security hole:
>> if you managed to escalate to the QEMU process from inside the VM, you can
>> access unrelated VM memory quite happily. You want an abstraction
>> in-between, that makes sure each VM/QEMU process only sees private memory:
>> for example, the buddy via dax/kmem.
>>
> Hi David
> Thanks for your suggestion, also sorry for my delayed reply due to my long vacation.
> How does current virtio-mem dynamically attach memory to guest, via page fault?

Essentially you have a large sparse mmap. Withing that mmap, memory is
populated on demand. Instead if mmap/munmap you perform a single large
mmap and then dynamically populate memory/discard memory.

Right now, memory is populated via page faults on access. This is
sub-optimal when dealing with limited resources (i.e., hugetlbfs,
file blocks) and you might run out of backend memory.

I'm working on a "prealloc" mode, which will preallocate/populate memory
necessary for exposing the next block of memory to the VM, and which
fails gracefully if preallocation/population fails in the case of such
limited resources.

The patch resides on:
	https://github.com/davidhildenbrand/qemu/tree/virtio-mem-next

commit ded0e302c14ae1b68bdce9059dcca344e0a5f5f0
Author: David Hildenbrand <david@redhat.com>
Date:   Mon Aug 2 19:51:36 2021 +0200

     virtio-mem: support "prealloc=on" option
     
     Especially for hugetlb, but also for file-based memory backends, we'd
     like to be able to prealloc memory, especially to make user errors less
     severe: crashing the VM when there are not sufficient huge pages around.
     
     A common option for hugetlb will be using "reserve=off,prealloc=off" for
     the memory backend and "prealloc=on" for the virtio-mem device. This
     way, no huge pages will be reserved for the process, but we can recover
     if there are no actual huge pages when plugging memory.
     
     Signed-off-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


