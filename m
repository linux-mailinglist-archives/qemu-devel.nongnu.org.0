Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2F3F48C0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:35:27 +0200 (CEST)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI7Ib-0007P4-Q4
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI7HT-00061r-KV
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI7HQ-0004bL-4J
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629714850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgDlsPR7E6wDSuQkKvJtqiANX5xHQaG9OKseRImxNg8=;
 b=TkVvmmnUFteSVD0FPIR7V2Gml+Eqqo1PuHoHIP9HSDnOYVraxGNZcyCpQa8SHKAf0KU6PP
 5C+T6zxLxjRviSfVD5qX1C2HV+Kcv45MWuHX+nob4SSSQ9xdLZJHIdgLSR13i71dxnXj0k
 NdwdIWZpyTio6KbRm6Oqz3AIKNbm2FE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-tMQUMvrqOuiz3ieB6WKAQQ-1; Mon, 23 Aug 2021 06:34:08 -0400
X-MC-Unique: tMQUMvrqOuiz3ieB6WKAQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 b3-20020a1c80030000b02902e6a7296cb3so2827749wmd.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HgDlsPR7E6wDSuQkKvJtqiANX5xHQaG9OKseRImxNg8=;
 b=rZwAiDYvnZZk+3Yt1g17CdZdWBppfepxzQdrhCD0+/Beq/JMYUsPsjGEflml1+/qXx
 BrD1aupwkkUb7B3Nu0Qj35vloxtNLYC/EEvbxajvY9RR/kCZcmXN+KAOOaEEVb9VrIC3
 Ju5eZpzq/6hldjDq5eonVTVTY0fOhDKB7jFW6xF+RvY1PCiq4vVRMWyEh0OLiyus/dVB
 fBjW2SjvVAGJ2U7px4wwyUFR6RtqbpQheyC7MwXvvHedOkT2dfyo/tx3uKMAoll6/iKK
 edWAftAPpNEe90Y1IcAlS2RrEAii8l+JYA2NgRgTnQd9yarIIwBCVsUXWUStz9W6TTEJ
 IeBw==
X-Gm-Message-State: AOAM533ALX7hBP27AWr+k2dKiENFrb7JIYENOtAAqFVWvFabWb5qOJm3
 G1vT8gqqQBfTAxeFjyeWaqjpjH+n3S/bBZo9uhe5eexjnONa/tUTH9Oq6mB3Z33NiPSuIv3VQ+Y
 +pxzliJTkUhX0cmE=
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr12860936wrk.407.1629714847795; 
 Mon, 23 Aug 2021 03:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/LfjEw5eeeC4Izq+sD4++17/XIo3HqZe/xesJ+ByBcFxKit86oWoqd8IxFWIsS6GkqA5HkA==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr12860915wrk.407.1629714847585; 
 Mon, 23 Aug 2021 03:34:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k17sm18218481wmj.0.2021.08.23.03.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:34:07 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
 <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
 <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
 <628a7ee5-b88d-c043-2e67-67e791532c18@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e6245d98-173c-2d25-8587-b6690c5f9037@redhat.com>
Date: Mon, 23 Aug 2021 12:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <628a7ee5-b88d-c043-2e67-67e791532c18@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 12:24 PM, David Hildenbrand wrote:
> On 23.08.21 12:12, Philippe Mathieu-Daudé wrote:
>> On 8/23/21 11:29 AM, David Hildenbrand wrote:
>>> On 23.08.21 11:23, Peter Maydell wrote:
>>>> On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com>
>>>> wrote:
>>>>> Not opposed to printing the size, although I doubt that it will really
>>>>> stop similar questions/problems getting raised.
>>>>
>>>> The case that triggered this was somebody thinking
>>>> -m took a byte count, so very likely that an error message
>>>> saying "you tried to allocate 38TB" would have made their
>>>> mistake clear in a way that just "allocation failed" did not.
>>>> It also means that if a future user asks us for help then
>>>> we can look at the error message and immediately tell them
>>>> the problem, rather than going "hmm, what are all the possible
>>>> ways that allocation might have failed" and going off down
>>>> rabbitholes like VM overcommit settings...
>>>
>>> We've had similar issues recently where Linux memory overcommit handling
>>> rejected the allocation -- and the user was well aware about the actual
>>> size. You won't be able to catch such reports, because people don't
>>> understand how Linux memory overcommit handling works or was configured.
>>>
>>> "I have 3 GiB of free memory, why can't I create a 3 GiB VM". "I have 3
>>> GiB of RAM, why can't I create a 3 GiB VM even if it won't make use of
>>> all 3 GiB of memory".
>>>
>>> Thus my comment, it will only stop very basic usage issues. And I agree
>>> that looking at the error *might* help. It didn't help for the cases I
>>> just described, because we need much more system information to make a
>>> guess what the user error actually is.
>>
>> Is it possible to get the maximal overcommitable amount on Linux?
> 
> Not reliably I think.
> 
> In the "always" mode, there is none.
> 
> In the "guess"/"estimate" mode, the kernel takes a guess (currently
> implemented as checking if the mmap size <= total RAM + total SWAP).
>     Committable = MemTotal + SwapTotal
> 
> In the "never" mode:
>     Committable = CommitLimit - Committed_AS
> However, the value gets further reduced for !root applications by
> /proc/sys/vm/admin_reserve_kbytes.
> 
> Replicating these calculations in user space would be suboptimal IMHO.

What about simply giving a hint about memory overcommit and display
a link to documentation with longer description about how to check
and figure out this issue?


