Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E23D8D90
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 14:15:20 +0200 (CEST)
Received: from localhost ([::1]:58180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iT2-000386-2y
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 08:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8iRB-0002IQ-D4
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8iR9-00084u-O6
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627474403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0PTUmHjsXq9cs1dEa7sNWJjHhn6ohDoPdIOD1PRcZM=;
 b=GY9vDlINzROIQBxZvQEcstiVc3qvluf2z731HKWGH67ZZ7zlKPZNOs5umDqM/FruRu2inR
 tFH4j4NkALhLGwEBWvWpzVnFmifkEtSJrRZO5JvLfWlO+Njd3JNs4iBEtFcM64GJyi601/
 RVi25K5vgSzc3M/avFyzFEMcD8ywY3o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-u_g0T7R-NO-1X_hbCr1hmw-1; Wed, 28 Jul 2021 08:13:19 -0400
X-MC-Unique: u_g0T7R-NO-1X_hbCr1hmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c41-20020a05600c4a29b0290253935d0f82so1360332wmp.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 05:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r0PTUmHjsXq9cs1dEa7sNWJjHhn6ohDoPdIOD1PRcZM=;
 b=jKyX1IjL371znFLYKuMS/S1IHYb6gXXRTDIGMUfsrzSgW1v7bBJd/IVMb/oO73RjSO
 kxv2Pgksa1R08Rd8bqtgx68jfPzJ/7Fp8Ej2JoD+ySjcovLJiC+vsWJzPmLL65h38Xpi
 p5/Y12wwR+1mwaROuW8EZbb6imqUv3hWiaEnaHDM2I4aWLZ5qaxJQDOycIVASbK5sc+x
 VDCM0F/GU1RCUiaQ9G3St5/pzxfGkEw3uZKdcLkxrj2VvF7GMrsc1khtCoYkXONh0is+
 sAqcvFiq69D8WolXF021M/3ziswOimsLf/Y5Y8L8VKJ5bRtuAtgg9EMKjeJodUrQ1JW9
 bSkw==
X-Gm-Message-State: AOAM5328lzp/HcwUiMxvvHDPL2q0ezK9M3OClWKA1mvWWMXd/kkYLHwS
 e0ZTYf6NzokQZE3T0z3n6n2GOmXE2/pdtE+7AVOfhl/wIITx/NfLtLJkm1T3tgsQrXcUHFGhN51
 V5WSMRs5+65f2CLA=
X-Received: by 2002:adf:f710:: with SMTP id r16mr29860684wrp.124.1627474398399; 
 Wed, 28 Jul 2021 05:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzblBSmKTTcgj3xBEXu1fHUPJkuU+iGDX8ikhq8rUm6On6/7FPHDwWPhMq5QGixV2moX4jD6A==
X-Received: by 2002:adf:f710:: with SMTP id r16mr29860670wrp.124.1627474398193; 
 Wed, 28 Jul 2021 05:13:18 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id z6sm6126834wmp.1.2021.07.28.05.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 05:13:17 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] memory: Don't do topology update in memory
 finalize()
To: Peter Xu <peterx@redhat.com>
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-5-peterx@redhat.com>
 <1ced8a81-18a2-85fe-0323-03dbc606f73e@redhat.com> <YQAt/V06OZgjhpI6@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5fb63e79-7a75-d7bc-2c62-9149f91c5d83@redhat.com>
Date: Wed, 28 Jul 2021 14:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQAt/V06OZgjhpI6@t490s>
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

On 27.07.21 18:02, Peter Xu wrote:
> On Tue, Jul 27, 2021 at 03:21:31PM +0200, David Hildenbrand wrote:
>> On 23.07.21 21:34, Peter Xu wrote:
>>> Topology update could be wrongly triggered in memory region finalize() if
>>> there's bug somewhere else.  It'll be a very confusing stack when it
>>> happens (e.g., sending KVM ioctl within the RCU thread, and we'll observe it
>>> only until it fails!).
>>>
>>> Instead of that, we use the push()/pop() helper to avoid memory transaction
>>> commit, at the same time we use assertions to make sure there's no pending
>>> updates or it's a nested transaction, so it could fail even earlier and in a
>>> more explicit way.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>    softmmu/memory.c | 23 +++++++++++++++++++++--
>>>    1 file changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>> index 1a3e9ff8ad..dfce4a2bda 100644
>>> --- a/softmmu/memory.c
>>> +++ b/softmmu/memory.c
>>> @@ -170,6 +170,12 @@ struct MemoryRegionIoeventfd {
>>>        EventNotifier *e;
>>>    };
>>> +/* Returns whether there's any pending memory updates */
>>> +static bool memory_region_has_pending_update(void)
>>> +{
>>> +    return memory_region_update_pending || ioeventfd_update_pending;
>>> +}
>>> +
>>>    static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
>>>                                               MemoryRegionIoeventfd *b)
>>>    {
>>> @@ -1756,12 +1762,25 @@ static void memory_region_finalize(Object *obj)
>>>         * and cause an infinite loop.
>>>         */
>>>        mr->enabled = false;
>>> -    memory_region_transaction_begin();
>>> +
>>> +    /*
>>> +     * Use push()/pop() instead of begin()/commit() to make sure below block
>>> +     * won't trigger any topology update (which should never happen, but it's
>>> +     * still a safety belt).
>>> +     */
>>
>> Hmm, I wonder if we can just keep the begin/end semantics and just do an
>> assertion before doing the commit? Does anything speak against that?
> 
> That sounds working too for the case of run_on_cpu and similar, but I think
> this patch should be able to cover more.  For example, it's possible depth==0
> when enter memory_region_finalize(), but some removal of subregions could
> further cause memory layout changes.  IMHO we should also bail out early for
> those cases too.  Thanks,
> 

Do we really have to switch to push/pop to catch these cases early? I'd 
assume we'd just have to formulate the right assertions :)

-- 
Thanks,

David / dhildenb


