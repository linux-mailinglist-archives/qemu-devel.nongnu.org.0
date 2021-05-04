Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B16372921
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:40:25 +0200 (CEST)
Received: from localhost ([::1]:54350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsTY-0003kq-Cy
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldsBH-0000vG-Vu
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldsBG-00053s-7W
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620123689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sysRs/FwLpMpGDObnlHjccol0CFCK9W7nI3AwqwYA/M=;
 b=MMIXFprBTZJ49zu7tXT4EEVzsXDGa9oPUbhMmE15b5q7qDUD6goK8pVV2B38VwXXmIlr8L
 sEKrMyK9r6LYHnJY4vxZL/70cWhWoeUJbprCIJkjqv8US9S6i8IDIyvOoQbuDqn/vx3kG1
 yBKYOn0y9Tt/IYSHchL9G8QRKQ2gzKE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-jWk-lxn7NJi8bReY_omJkQ-1; Tue, 04 May 2021 06:21:28 -0400
X-MC-Unique: jWk-lxn7NJi8bReY_omJkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z9-20020a1c65090000b029014b497b2d98so534414wmb.8
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sysRs/FwLpMpGDObnlHjccol0CFCK9W7nI3AwqwYA/M=;
 b=I6Yx2nAenRCQ0YllAPPJam26SY9SlpcUW5qgzPyx8NCC6ogLNdlKE6blyMmy8+RBLs
 9WOdd7Oy8HG0OdI6Rdvi9mMKYQNikycUgEY+QGpyrkiVk1LJF8GP+LfJ4Zcwafp1KfqX
 LJj9jmOSwpfzbpv+Nya11CV2iQTG+KDQUl5rXT2Ua1oa0C1+KaaQJuqQXj8UERGDuqHL
 qyAmLxeUGPv3BUN53NwZdxPnXy0wCtlFEUWliqozWDmgfMONl2MP8lHYQl8Mrpwn+3pR
 4EjBlFWF2fTPgFw48VN6xYBQSsLk0WO7cTyFGO2p6uWbGUvLgACII2gd7MU8rY7ZtfIH
 4oYQ==
X-Gm-Message-State: AOAM533mnRjZ0RayL8EKH8ADOZ+PhkGd5JQJfDNe3oOmqUBPlEk7FiSy
 wlNY2CQEOvbZkg5wBPI2ywy17fMTSTBQEM4TS1TqDp++ATr5imAgx7TopPg9eBPgV1wrA9AaO/7
 0K2gSobqn0kl+k+E=
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr26397413wmq.50.1620123686670; 
 Tue, 04 May 2021 03:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRk8z9VzaxAzELGzYwNIBt+fpHXx314DHasOJW/J5LeqV1N+V0TsPXAh73ZIQUxzgsQz3iAg==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr26397396wmq.50.1620123686391; 
 Tue, 04 May 2021 03:21:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6fae.dip0.t-ipconnect.de. [91.12.111.174])
 by smtp.gmail.com with ESMTPSA id z6sm2203119wmf.9.2021.05.04.03.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 03:21:26 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-10-david@redhat.com> <YJEddjCsFgXa4tiR@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 09/15] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE under Linux
Message-ID: <477b3679-1218-87bb-29d6-9b1b6079ab78@redhat.com>
Date: Tue, 4 May 2021 12:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJEddjCsFgXa4tiR@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 12:09, Daniel P. Berrangé wrote:
> On Wed, Apr 28, 2021 at 03:37:48PM +0200, David Hildenbrand wrote:
>> Let's support RAM_NORESERVE via MAP_NORESERVE on Linux. The flag has no
>> effect on most shared mappings - except for hugetlbfs and anonymous memory.
>>
>> Linux man page:
>>    "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
>>    space is reserved, one has the guarantee that it is possible to modify
>>    the mapping. When swap space is not reserved one might get SIGSEGV
>>    upon a write if no physical memory is available. See also the discussion
>>    of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
>>    2.6, this flag had effect only for private writable mappings."
>>
>> Note that the "guarantee" part is wrong with memory overcommit in Linux.
>>
>> Also, in Linux hugetlbfs is treated differently - we configure reservation
>> of huge pages from the pool, not reservation of swap space (huge pages
>> cannot be swapped).
>>
>> The rough behavior is [1]:
>> a) !Hugetlbfs:
>>
>>    1) Without MAP_NORESERVE *or* with memory overcommit under Linux
>>       disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
>>       accounting/reservation happens:
>>        For a file backed map
>>         SHARED or READ-only - 0 cost (the file is the map not swap)
>>         PRIVATE WRITABLE - size of mapping per instance
>>
>>        For an anonymous or /dev/zero map
>>         SHARED   - size of mapping
>>         PRIVATE READ-only - 0 cost (but of little use)
>>         PRIVATE WRITABLE - size of mapping per instance
>>
>>    2) With MAP_NORESERVE, no accounting/reservation happens.
>>
>> b) Hugetlbfs:
>>
>>    1) Without MAP_NORESERVE, huge pages are reserved.
>>
>>    2) With MAP_NORESERVE, no huge pages are reserved.
>>
>> Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
>> to configure it for !hugetlbfs globally; this toggle now allows
>> configuring it more fine-grained, not for the whole system.
>>
>> The target use case is virtio-mem, which dynamically exposes memory
>> inside a large, sparse memory area to the VM.
> 
> Can you explain this use case in more real world terms, as I'm not
> understanding what a mgmt app would actually do with this in
> practice ?

Let's consider huge pages for simplicity. Assume you have 128 free huge 
pages in your hypervisor that you want to dynamically assign to VMs.

Further assume you have two VMs running. A workflow could look like

1. Assign all huge pages to VM 0
2. Reassign 64 huge pages to VM 1
3. Reassign another 32 huge pages to VM 1
4. Reasssign 16 huge pages to VM 0
5. ...

Basically what we're used to doing with "ordinary" memory.

For that to work with virtio-mem, you'll have to disable reservation of 
huge pages for the virtio-mem managed memory region.

(prealloction of huge pages in virtio-mem to protect from user mistakes 
is a separate work item)

reserve=off will be the default for virtio-mem, and actual 
reservation/preallcoation will be done within virtio-mem. There could be 
use for "reserve=off" for virtio-balloon use cases as well, but I'd like 
to exclude that from the discussion for now.

Hope that answers your question, thanks.

-- 
Thanks,

David / dhildenb


