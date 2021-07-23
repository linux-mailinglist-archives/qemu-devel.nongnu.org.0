Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE93D361D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:05:57 +0200 (CEST)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qBw-0001po-6V
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6q9O-0007js-4s
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6q9M-00047V-L3
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627027396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/kDh7ZKYgoQIgvnpN7VgBGd0aTtWE8zYzSfbc1bDHU=;
 b=HRxeU92aRUHcvSp8QvnzB4ePd3Us3W3qK4iQGOW05MQjRQyvqjD3Rkc4QJmq7TGSOfLzRu
 TLqwXPyyKZ5197X9wVVgPdr6Tm5pML5OY4+5+ODcI5Yb/LNTgoY7i2BRno36WM6gY7pJxc
 7QsSPnqp2MeK/UFJH0b5FmwugsV6IaY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-_VP7KN-wMfGr7W-hTEYf2A-1; Fri, 23 Jul 2021 04:03:12 -0400
X-MC-Unique: _VP7KN-wMfGr7W-hTEYf2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so699353wrs.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 01:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=h/kDh7ZKYgoQIgvnpN7VgBGd0aTtWE8zYzSfbc1bDHU=;
 b=HBbq6cAit8AQ0RX8FQTAWSpnDYfLPUZKBJ+Fs8c+cp6GkhVY94iN8KPJ8ox1HAHDBX
 SKYhoqSIQ2Qm6gno34ddCVBB4PUUuatqcd34Y9ULVGbhZBsHrCRJrFi9EdFsLmrZ/JBH
 nXREKj/boNNAbmffDxV6/UawERUB0KXyAs3sA9bRksrYhwu++y9c6Jd0jiArjmrxIUlp
 kehxnhQW1dOqNfWOeMgXSlxjdgP7haQCljPCmw9wOPw2ORr80d25oGnc3WPtxevtVkao
 VquUtgR/S2WjUr65MXiaR2FW7s58uiCU+RZHeLo4u5yvsO0WESQjjJkGwYkwyd6LhmTP
 tlbA==
X-Gm-Message-State: AOAM5324IV/+EI/o4D6K0TIHDepNr6rDuYhQIRK4mFE7xykUJVeiY1Se
 jP/yG24a3qNsPQloAExGPzMk+mF+2ptKxY6mLquLpQ7Vz+tKbhYX7LkfgE0wHwTOH0jHHcYEVSM
 oub7oBPnpnS/dpbc=
X-Received: by 2002:a5d:6849:: with SMTP id o9mr4064603wrw.250.1627027391481; 
 Fri, 23 Jul 2021 01:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ3SCzsh+c9nUO1vXvs3gECKr7OHGsUy6VnBaRkqyYelXSo2S1A5WOwOCCHbRL3lD8jeW0Jw==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr4064577wrw.250.1627027391269; 
 Fri, 23 Jul 2021 01:03:11 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id p11sm31539182wro.78.2021.07.23.01.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 01:03:10 -0700 (PDT)
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
To: Peter Xu <peterx@redhat.com>, "Wang, Wei W" <wei.w.wang@intel.com>
References: <20210722083055.23352-1-wei.w.wang@intel.com>
 <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
 <b39f279ef6634325ab2be8d903e41001@intel.com> <YPmF1BAHA059yYln@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5a276434-a59d-bdaf-6a1b-f66e9e9b36e7@redhat.com>
Date: Fri, 23 Jul 2021 10:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPmF1BAHA059yYln@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.21 16:51, Peter Xu wrote:
> On Thu, Jul 22, 2021 at 09:57:13AM +0000, Wang, Wei W wrote:
>> On Thursday, July 22, 2021 5:48 PM, David Hildenbrand wrote:
>>> On 22.07.21 10:30, Wei Wang wrote:
>>>> When skipping free pages to send, their corresponding dirty bits in
>>>> the memory region dirty bitmap need to be cleared. Otherwise the
>>>> skipped pages will be sent in the next round after the migration
>>>> thread syncs dirty bits from the memory region dirty bitmap.
>>>>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Peter Xu <peterx@redhat.com>
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> Reported-by: David Hildenbrand <david@redhat.com>
>>>> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
>>>> ---
>>>>    migration/ram.c | 74
>>> +++++++++++++++++++++++++++++++++++++------------
>>>>    1 file changed, 56 insertions(+), 18 deletions(-)
>>>>
>>>
>>> LGTM, thanks
>>>
>>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>>
>>
>> Thanks. Please remember to have a regression test together with Peterx's that patch when you get a chance.
> 
> I can continue to try that; but it's slightly low priority to me so it could be
> a bit delayed.  If either of you could help that would be great, as I still
> don't know last time why I didn't use free-page-hint right (note: I definitely
> checked lsmod for sure; so it's there).  So I'll need to figure that out first.

Just for the records:

Add the following to your QEMU cmdline to make it work:

     -object iothread,id=t0 \
     -device virtio-balloon-pci,id=balloon,iothread=t0,free-page-hint=on

Most upstream distributions (e.g., Fedora) should have virtio-balloon 
build as module and there is no action inside the guest required to get 
it running. Just wait until Linux in the guest booted up.

-- 
Thanks,

David / dhildenb


