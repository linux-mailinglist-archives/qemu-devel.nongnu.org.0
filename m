Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56C33F489D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:26:19 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI79m-0000aM-Nk
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI781-0008Ko-38
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI77u-0004fn-UV
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629714260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1vVYPyZ4wqgZTRYbz5e8OJV4Hpdj2JzCDEn+WtG7Lc=;
 b=RYVzYA6WVGtlPPXObuSlOY/i7s8Tu2yCxSEUOHl441EyVDtQ9/Y9BSxboiqUjCme6GfBBC
 c9PIbi6ipGPdAJ2LAZVzqwLElso/4hfWvRxDNb1MFJj2wfCCFzHWi4iz34m6npszWH3DwR
 /HobkkqrNieqTdXn34CvhnUcTl46Wv4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-l8doOZA7MLK4_hIIyBreGQ-1; Mon, 23 Aug 2021 06:24:18 -0400
X-MC-Unique: l8doOZA7MLK4_hIIyBreGQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso4950246wri.18
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=J1vVYPyZ4wqgZTRYbz5e8OJV4Hpdj2JzCDEn+WtG7Lc=;
 b=TeFlUflq8pEiLBLFh2h9fY6owMR2MA5sJyXkXOC8FNtEutNRoLPuFOTmNxTorBbEE+
 gm5L6EA87wBidlGqTWWDc8NLnWrpeTqMdHhdc70MPvxosRM9J/maBv6MusfcSGYmF+36
 uF/KQ8i7STyYPyHPcZ/cgGc6kyMAY0IMEJXCtbazhyUQUIEE/YUwos0oYoq1eXOwKJiu
 8+HyO6yQ7CpOYgRfPi47MGCXGkfu5CqENRVioQeOeSYvaGdanCBnV8FQw8NxBcpBdHsi
 kJO0pc6KL33w3pcqP3F8gDoLud5FEDRVgE0fxykEcqOV+jcfl21CM3yj6fyla4G2O7Mj
 8Osw==
X-Gm-Message-State: AOAM533eNMBTaaC++D/k5I8x/1pt6qsJctV4Cer+LiLi17kR6nz1zGvt
 2R28AjxJRyOhXfV7hJwHrndJTdpjPgdCRdbq0ssAOvCqcavGqiLIlkTyNv6zAIbVtqkJBYFAACc
 Ly//mgftP5u1ACXU=
X-Received: by 2002:a1c:7d44:: with SMTP id y65mr14472611wmc.6.1629714257732; 
 Mon, 23 Aug 2021 03:24:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyXsgoO0MVSy83sfyRMtlGH3M8uCNivmxlbPd/YtJikPgNYLyt9Hjruvl11nJZYUbpoH1XEg==
X-Received: by 2002:a1c:7d44:: with SMTP id y65mr14472578wmc.6.1629714257455; 
 Mon, 23 Aug 2021 03:24:17 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id r10sm17959868wrq.32.2021.08.23.03.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:24:17 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
 <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
 <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
Message-ID: <628a7ee5-b88d-c043-2e67-67e791532c18@redhat.com>
Date: Mon, 23 Aug 2021 12:24:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

On 23.08.21 12:12, Philippe Mathieu-Daudé wrote:
> On 8/23/21 11:29 AM, David Hildenbrand wrote:
>> On 23.08.21 11:23, Peter Maydell wrote:
>>> On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com> wrote:
>>>> Not opposed to printing the size, although I doubt that it will really
>>>> stop similar questions/problems getting raised.
>>>
>>> The case that triggered this was somebody thinking
>>> -m took a byte count, so very likely that an error message
>>> saying "you tried to allocate 38TB" would have made their
>>> mistake clear in a way that just "allocation failed" did not.
>>> It also means that if a future user asks us for help then
>>> we can look at the error message and immediately tell them
>>> the problem, rather than going "hmm, what are all the possible
>>> ways that allocation might have failed" and going off down
>>> rabbitholes like VM overcommit settings...
>>
>> We've had similar issues recently where Linux memory overcommit handling
>> rejected the allocation -- and the user was well aware about the actual
>> size. You won't be able to catch such reports, because people don't
>> understand how Linux memory overcommit handling works or was configured.
>>
>> "I have 3 GiB of free memory, why can't I create a 3 GiB VM". "I have 3
>> GiB of RAM, why can't I create a 3 GiB VM even if it won't make use of
>> all 3 GiB of memory".
>>
>> Thus my comment, it will only stop very basic usage issues. And I agree
>> that looking at the error *might* help. It didn't help for the cases I
>> just described, because we need much more system information to make a
>> guess what the user error actually is.
> 
> Is it possible to get the maximal overcommitable amount on Linux?

Not reliably I think.

In the "always" mode, there is none.

In the "guess"/"estimate" mode, the kernel takes a guess (currently 
implemented as checking if the mmap size <= total RAM + total SWAP).
	Committable = MemTotal + SwapTotal

In the "never" mode:
	Committable = CommitLimit - Committed_AS
However, the value gets further reduced for !root applications by 
/proc/sys/vm/admin_reserve_kbytes.

Replicating these calculations in user space would be suboptimal IMHO.

-- 
Thanks,

David / dhildenb


