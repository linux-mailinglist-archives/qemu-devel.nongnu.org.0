Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826183D8D88
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 14:12:45 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iQW-0001IM-Hu
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 08:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8iPh-0000U1-JP
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8iPf-00079W-Ur
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627474310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXV3YiTwJpROCOqV7kSEvZjL3jN3lPYK8F4W1wZGwIs=;
 b=BcJoxMeBRyJpBDl3VxS+gEGK39Fw+5Xwv/cHcYbrgkdTAGvYPKIe6xzJX/c97yCiVJtJ9L
 AAukRe/EmxyLfHTv6StjOeAg6QCcVlLvG04NL9PuZwV32Kz+LUM1NxEKcTrOh/LI5ZA7Kf
 +sOLSWsy1BN5Fka7+70QfSJIjDhvEwk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-5NofeHRFOSeOWWsWg6xZxA-1; Wed, 28 Jul 2021 08:11:49 -0400
X-MC-Unique: 5NofeHRFOSeOWWsWg6xZxA-1
Received: by mail-wr1-f70.google.com with SMTP id
 z10-20020adfdf8a0000b02901536d17cd63so869732wrl.21
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pXV3YiTwJpROCOqV7kSEvZjL3jN3lPYK8F4W1wZGwIs=;
 b=eJSlvwXBFPvhHXjcOP0E5e2XozCSBYgl/Cy2QWBTzmO9X+ejt58ue1IUG51euYlSqz
 0eRuv/Opxzbvx4fDG6I2NATsBfKsHgLvE4BjyDnFxT33ctQEMKlAX27HRi8rh1kj/Wge
 RrQfZseMvR4hLcDibd7XHfphwrixKBFTrOrHSu9vvEoQ3XuPCHHIufhszSm8HtTQYRNx
 XJoQNySopQMApmahTd+o05rHy1N4nBA21HEvfpNZGAYZ+/VIes59Ux52UnTumAOQ9nUY
 n2CFOTgU9NLWWaXiNu+0wIBgNliSfoykBziVgw4/iSWFK8UBnPK0PzHFYy0n5lXi5BP5
 j+uA==
X-Gm-Message-State: AOAM532PKB5XobLqS0/0MgfXGyqOAfkmxhdG9ltRp5In4PyntzpfnnWm
 Vv57JxxV/NRnFTVghDnSDXXTohwqTwwVN4V5hls7F7Z8Ly5B9uCOB2osP81RR8C5LC2XAgYsqlR
 JRA9njSwpaXHCeVg=
X-Received: by 2002:adf:e846:: with SMTP id d6mr29822679wrn.241.1627474308517; 
 Wed, 28 Jul 2021 05:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8akV4zd9lCRx0Z7aR9JqCuJeJO/M1C2p172eX1gZevVgH80PEemKu4wpJaoH8VixyDyNL3g==
X-Received: by 2002:adf:e846:: with SMTP id d6mr29822665wrn.241.1627474308353; 
 Wed, 28 Jul 2021 05:11:48 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id f26sm6725561wrd.41.2021.07.28.05.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 05:11:47 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] cpus: Introduce
 qemu_mutex_unlock_iothread_prepare()
To: Peter Xu <peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-8-peterx@redhat.com>
 <0fb73c64-f915-7630-ba64-0524c6b8ed40@redhat.com> <YQAveIvA2SB1SmSI@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2d3c9a08-a0f8-11bb-eb47-cc12f7db7884@redhat.com>
Date: Wed, 28 Jul 2021 14:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQAveIvA2SB1SmSI@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.21 18:08, Peter Xu wrote:
> On Tue, Jul 27, 2021 at 02:59:26PM +0200, David Hildenbrand wrote:
>> On 23.07.21 21:34, Peter Xu wrote:
>>> The prepare function before unlocking BQL.  There're only three places that can
>>> release the BQL: unlock(), cond_wait() or cond_timedwait().
>>>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>    softmmu/cpus.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>>> index 9131f77f87..6085f8edbe 100644
>>> --- a/softmmu/cpus.c
>>> +++ b/softmmu/cpus.c
>>> @@ -66,6 +66,10 @@
>>>    static QemuMutex qemu_global_mutex;
>>> +static void qemu_mutex_unlock_iothread_prepare(void)
>>> +{
>>> +}
>>> +
>>>    bool cpu_is_stopped(CPUState *cpu)
>>>    {
>>>        return cpu->stopped || !runstate_is_running();
>>> @@ -523,16 +527,19 @@ void qemu_mutex_unlock_iothread(void)
>>>    {
>>>        g_assert(qemu_mutex_iothread_locked());
>>>        iothread_locked = false;
>>> +    qemu_mutex_unlock_iothread_prepare();
>>>        qemu_mutex_unlock(&qemu_global_mutex);
>>>    }
>>>    void qemu_cond_wait_iothread(QemuCond *cond)
>>>    {
>>> +    qemu_mutex_unlock_iothread_prepare();
>>>        qemu_cond_wait(cond, &qemu_global_mutex);
>>>    }
>>>    void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
>>>    {
>>> +    qemu_mutex_unlock_iothread_prepare();
>>>        qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
>>>    }
>>>
>>
>> I'd squash this patch into the next one.
>>
>> I don't quite like the function name, but don't really have a better
>> suggestion .... maybe qemu_mutex_might_unlock_iothread(), similar to
>> might_sleep() or might_fault() in the kernel. (although here it's pretty
>> clear and not a "might"; could be useful in other context where we might
>> conditionally unlock the BQL at some point in the future, though)
> 
> Yes, IMHO "might" describes a capability of doing something, here it's not
> (this one should only be called right before releasing bql, not within any
> context of having some capability).  The other option I thought was "pre" but
> it will be just a short version of "prepare".
> 
> Let me know if you have a better suggestion on naming. :) Otherwise I'll keep
> the naming, squash this patch into the next and keep your r-b for that.

Fine with me :)


-- 
Thanks,

David / dhildenb


