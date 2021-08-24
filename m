Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352703F5A69
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:05:56 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISNX-00042d-5n
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mISC4-00048P-Fy
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mISC1-0008T6-MH
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629795240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jk6sZhYkDORWFOc+7tQW0RhObW7mithfPovgdAXa7RA=;
 b=XDgs9OyDj10DJNb4EwEa6hC/nw/hxwUBC++0d0IVtsPVJ8o8EJUF+JPIuClEPlea+A5Vo/
 hWoQzOyIVTpGpjj9VkB39mjGFpQOhLRng6MCY+jlYQPZMqTH+PjhyuqjwBuPbuNGdU+c4S
 82XA5veXmeMBrcz5ZLteH0ZKswyPizI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-ha6Kbz9YNxiJBdylQrDZxw-1; Tue, 24 Aug 2021 04:53:59 -0400
X-MC-Unique: ha6Kbz9YNxiJBdylQrDZxw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso5553362wri.18
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jk6sZhYkDORWFOc+7tQW0RhObW7mithfPovgdAXa7RA=;
 b=HUjos0wwVdlA3LZzANH+/tLZlxdFf71ojVA63f+oTgbrlxl6qP2lPbhOLP/qNr6h3V
 oVcoG2DEQ69ArSWYlVCEK7Sm+24bDSrc5WZxMlyoGPaJXcaCDjk1hHTOIoif/zmBnvm6
 aVVzitvFICa8OoVLwgwXnp8DRLEv6URcaW07CQ/Cdk5sJoOQjnlIqrHLSJagZzAuECpU
 N7D+QFBTvIcwE1HHkOH26HlFtiL9fYezOrwRe5ICkgVgoyP7nsBHlkHbNw94Ccz0p4fp
 4hNb1oTtupktOi4LdV8QzFJy3oz/kRKb86m8oy9PkmfSZkLcp6WCibvx6CP/YlJwf8Im
 CMDg==
X-Gm-Message-State: AOAM533H3wcCSYpEMEVNR20cz+1pH9VxhvPOO+qaPCo/OQXhleo5Vu89
 dRNatafYWC8MQ2Vk5NX92CTtTenxYt2v0gQGaaSiPNr+2VjF317ewj22KS/WTk7xPwdQGHW+n+Q
 KPzrEeyhS1apvhis=
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3113998wmj.48.1629795237908;
 Tue, 24 Aug 2021 01:53:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdrxqcGsm5FiWMmDSit0HaqfT9ukOapbkJ6wONX6OA43WAjQL9Rkq9OJBlO3ZiC/kTW7zBSA==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3113976wmj.48.1629795237667;
 Tue, 24 Aug 2021 01:53:57 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c4d.dip0.t-ipconnect.de. [79.242.60.77])
 by smtp.gmail.com with ESMTPSA id
 u8sm1796010wmq.45.2021.08.24.01.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:53:57 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
 <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
 <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
 <628a7ee5-b88d-c043-2e67-67e791532c18@redhat.com>
 <e6245d98-173c-2d25-8587-b6690c5f9037@redhat.com>
 <c0bbadf8-d834-168e-9aa5-b3cf1373aa91@redhat.com> <YSSv4vwfqDbwNWQI@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3d235b3e-9df1-de43-5d62-c214a4c44199@redhat.com>
Date: Tue, 24 Aug 2021 10:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSSv4vwfqDbwNWQI@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:37, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> On 23.08.21 12:34, Philippe Mathieu-Daudé wrote:
>>> On 8/23/21 12:24 PM, David Hildenbrand wrote:
>>>> On 23.08.21 12:12, Philippe Mathieu-Daudé wrote:
>>>>> On 8/23/21 11:29 AM, David Hildenbrand wrote:
>>>>>> On 23.08.21 11:23, Peter Maydell wrote:
>>>>>>> On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com>
>>>>>>> wrote:
>>>>>>>> Not opposed to printing the size, although I doubt that it will really
>>>>>>>> stop similar questions/problems getting raised.
>>>>>>>
>>>>>>> The case that triggered this was somebody thinking
>>>>>>> -m took a byte count, so very likely that an error message
>>>>>>> saying "you tried to allocate 38TB" would have made their
>>>>>>> mistake clear in a way that just "allocation failed" did not.
>>>>>>> It also means that if a future user asks us for help then
>>>>>>> we can look at the error message and immediately tell them
>>>>>>> the problem, rather than going "hmm, what are all the possible
>>>>>>> ways that allocation might have failed" and going off down
>>>>>>> rabbitholes like VM overcommit settings...
>>>>>>
>>>>>> We've had similar issues recently where Linux memory overcommit handling
>>>>>> rejected the allocation -- and the user was well aware about the actual
>>>>>> size. You won't be able to catch such reports, because people don't
>>>>>> understand how Linux memory overcommit handling works or was configured.
>>>>>>
>>>>>> "I have 3 GiB of free memory, why can't I create a 3 GiB VM". "I have 3
>>>>>> GiB of RAM, why can't I create a 3 GiB VM even if it won't make use of
>>>>>> all 3 GiB of memory".
>>>>>>
>>>>>> Thus my comment, it will only stop very basic usage issues. And I agree
>>>>>> that looking at the error *might* help. It didn't help for the cases I
>>>>>> just described, because we need much more system information to make a
>>>>>> guess what the user error actually is.
>>>>>
>>>>> Is it possible to get the maximal overcommitable amount on Linux?
>>>>
>>>> Not reliably I think.
>>>>
>>>> In the "always" mode, there is none.
>>>>
>>>> In the "guess"/"estimate" mode, the kernel takes a guess (currently
>>>> implemented as checking if the mmap size <= total RAM + total SWAP).
>>>>       Committable = MemTotal + SwapTotal
>>>>
>>>> In the "never" mode:
>>>>       Committable = CommitLimit - Committed_AS
>>>> However, the value gets further reduced for !root applications by
>>>> /proc/sys/vm/admin_reserve_kbytes.
>>>>
>>>> Replicating these calculations in user space would be suboptimal IMHO.
>>>
>>> What about simply giving a hint about memory overcommit and display
>>> a link to documentation with longer description about how to check
>>> and figure out this issue?
>>
>> That would be highly OS-specific -- for example, there is no memory
>> overcommit under Windows. Sure, we could add a Linux specific hint,
>> indication documentation. But I'm not sure if most end users stumbling into
>> such an error+hint would be able to make sense of memory overcommit details
>> (not to mention that they know what it even is) :)
>>
>> You can run into memory allocation issues with many applications. Let me
>> give you a simple example
>>
>> t480s: ~  $ dd if=/dev/zero of=/dev/null ibs=100G
>> dd: memory exhausted by input buffer of size 107374182400 bytes (100 GiB)
>>
>> So indicating the size of the failing allocation might be just good enough.
>> For the other parts it's usually just "the way the OS was configured, it
>> does not think it can allow this allocation".
> 
> Does it also get complicated by the use of CGroup?

Not in terms of memory overcommit AFAIU. cgroups only control actually 
memory consumption, not mmap() creation.

> 
> Dave


-- 
Thanks,

David / dhildenb


