Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984945F9D80
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 13:21:41 +0200 (CEST)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqqq-0001z3-8Q
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 07:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ohqoN-0000Q4-Vf
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 07:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ohqoJ-0006Pd-Vp
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 07:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665400741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1bVLAUOkrEpnjIrp9O6fBFBOyDbHzbm1kBlv85AtGQ=;
 b=LgILdJRRGy7BI6jmCBlgftHwF0RQJlB6MYPy/M8vmwBZ5RYlGOB5NPjdrDVKXNa6M/LqmK
 y3dH2nkd1GFyRnrdE0ObpO1/C49IKBtziR47w3Jkp0dtTDTDcEOzPRMubFeL9Yzq84cgzh
 dYf/D5GijMuaHbuxrjGYGhUnKakz8+0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-Nnceu62WM_STcYz2VbXR3w-1; Mon, 10 Oct 2022 07:18:59 -0400
X-MC-Unique: Nnceu62WM_STcYz2VbXR3w-1
Received: by mail-wr1-f70.google.com with SMTP id
 d22-20020adfa356000000b0022e224b21c0so2608856wrb.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 04:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l1bVLAUOkrEpnjIrp9O6fBFBOyDbHzbm1kBlv85AtGQ=;
 b=uTlwLg6aS9jckdv2Hqzw+SA14Hgt4gTUqtfKkT0e5QmXwV1fnLTuZxtVdvuCpLK/K8
 Y1P3HU839hUEZymdooSsy4UjGlMD94w5HDvt3PmR7TJFjBkVMPpNeRvxIGPdLDpBhMPd
 O1oJ5FckVzLadHhTKOb4Be2seIuq1Ta9XdSKPhTEkwJZr0qOWuYYLAY5ctrjU9Fsx1A7
 XvWMCXU5dHQljGc19iCL6zAqcJB4gU8a+Mtkj1AdrtjJHQixNdc8ahoK8KkPDIxfsOb7
 EcBu751wqjlEmWzFZ2ALFHkH3ikLvlnYSl1oZjG9rpUikX2aXy5z7JLYGPzxUydD2g90
 qzmw==
X-Gm-Message-State: ACrzQf1z5yDG7sJo6E4GGjmkP2vu3zWv4oOQPoKhJDBSs3THKXv6idtp
 cx1eyJ8wH9N17JehldwTxCBpp88ZChk6udyYve/z05GeuHtbbLQ/O/BqgIdKTlX7fB6GVmQflSV
 e45Wuzgj+yPi1KyE=
X-Received: by 2002:a1c:4b0d:0:b0:3b4:76ae:f7a5 with SMTP id
 y13-20020a1c4b0d000000b003b476aef7a5mr12792630wma.23.1665400737733; 
 Mon, 10 Oct 2022 04:18:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6N8kuOG7h+L0o7+rhH0XT/nwWD2dQHObZkoWkRe5AdowbwOgtiv0Tr9rT8T8euA6HTKZSJ0Q==
X-Received: by 2002:a1c:4b0d:0:b0:3b4:76ae:f7a5 with SMTP id
 y13-20020a1c4b0d000000b003b476aef7a5mr12792594wma.23.1665400737444; 
 Mon, 10 Oct 2022 04:18:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:e600:3a4a:f000:b085:4839?
 (p200300cbc704e6003a4af000b0854839.dip0.t-ipconnect.de.
 [2003:cb:c704:e600:3a4a:f000:b085:4839])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003a5f54e3bbbsm15847406wmo.38.2022.10.10.04.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 04:18:57 -0700 (PDT)
Message-ID: <23dd0ce0-5393-3aa0-affe-11277c6a123b@redhat.com>
Date: Mon, 10 Oct 2022 13:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221010091117.88603-1-david@redhat.com>
 <Y0P2mQcHpXlXbEY1@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y0P2mQcHpXlXbEY1@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.007, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.10.22 12:40, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
>> Michal.
>>
>> Setting the CPU affinity of threads from inside QEMU usually isn't
>> easily possible, because we don't want QEMU -- once started and running
>> guest code -- to be able to mess up the system. QEMU disallows relevant
>> syscalls using seccomp, such that any such invocation will fail.
>>
>> Especially for memory preallocation in memory backends, the CPU affinity
>> can significantly increase guest startup time, for example, when running
>> large VMs backed by huge/gigantic pages, because of NUMA effects. For
>> NUMA-aware preallocation, we have to set the CPU affinity, however:
>>
>> (1) Once preallocation threads are created during preallocation, management
>>      tools cannot intercept anymore to change the affinity. These threads
>>      are created automatically on demand.
>> (2) QEMU cannot easily set the CPU affinity itself.
>> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>>      might not necessarily be exactly the CPUs we actually want to use
>>      (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
>>
>> There is an easy "workaround". If we have a thread with the right CPU
>> affinity, we can simply create new threads on demand via that prepared
>> context. So, all we have to do is setup and create such a context ahead
>> of time, to then configure preallocation to create new threads via that
>> environment.
>>
>> So, let's introduce a user-creatable "thread-context" object that
>> essentially consists of a context thread used to create new threads.
>> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
>> "node-affinity" property), or upper layers can extract the thread id
>> ("thread-id" property) to configure it externally.
>>
>> Make memory-backends consume a thread-context object
>> (via the "prealloc-context" property) and use it when preallocating to
>> create new threads with the desired CPU affinity. Further, to make it
>> easier to use, allow creation of "thread-context" objects, including
>> setting the CPU affinity directly from QEMU, before enabling the
>> sandbox option.
>>
>>
>> Quick test on a system with 2 NUMA nodes:
>>
>> Without CPU affinity:
>>      time qemu-system-x86_64 \
>>          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>>          -nographic -monitor stdio
>>
>>      real    0m5.383s
>>      real    0m3.499s
>>      real    0m5.129s
>>      real    0m4.232s
>>      real    0m5.220s
>>      real    0m4.288s
>>      real    0m3.582s
>>      real    0m4.305s
>>      real    0m5.421s
>>      real    0m4.502s
>>
>>      -> It heavily depends on the scheduler CPU selection
>>
>> With CPU affinity:
>>      time qemu-system-x86_64 \
>>          -object thread-context,id=tc1,node-affinity=0 \
>>          -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>>          -sandbox enable=on,resourcecontrol=deny \
>>          -nographic -monitor stdio
>>
>>      real    0m1.959s
>>      real    0m1.942s
>>      real    0m1.943s
>>      real    0m1.941s
>>      real    0m1.948s
>>      real    0m1.964s
>>      real    0m1.949s
>>      real    0m1.948s
>>      real    0m1.941s
>>      real    0m1.937s
>>
>> On reasonably large VMs, the speedup can be quite significant.
>>
>> While this concept is currently only used for short-lived preallocation
>> threads, nothing major speaks against reusing the concept for other
>> threads that are harder to identify/configure -- except that
>> we need additional (idle) context threads that are otherwise left unused.
>>
>> This series does not yet tackle concurrent preallocation of memory
>> backends. Memory backend objects are created and memory is preallocated one
>> memory backend at a time -- and there is currently no way to do
>> preallocation asynchronously.

Hi Dave,

> 
> Since you seem to have a full set of r-b's - do you intend to merge this
> as-is or do the cuncurrenct preallocation first?

I intent to merge this as is, as it provides a benefit as it stands and 
concurrent preallcoation might not require user interface changes.

I do have some ideas on how to implement concurrent preallocation, but 
it needs more thought (and more importantly, time).

-- 
Thanks,

David / dhildenb


