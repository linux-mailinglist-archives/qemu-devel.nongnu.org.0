Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027403A4110
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:14:44 +0200 (CEST)
Received: from localhost ([::1]:48836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrf7b-0002Pi-21
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrf6D-000125-50
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrf67-0006qv-Nb
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623409987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHy1q+qir7K71GO9btncB3sfZRfU+k4mfUlIpYsVtkk=;
 b=VspNkoXvfK+XybYDTOU+hJFLGbe95Z8FrSk2iJ3KL+dEIQD/JXVoTFPXxdq31Jz7HhU1Ou
 2YYPG7bFj6yjJovjALbCYJjjYA80fy14uSEOi/ncmb5lxhn+3/WFpiBwdVibKRBdDBC152
 e5CKvwFYIcA22qq4hiFU9U2wH02kOvQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-jNBQFt01OaejZvyw0q6_tQ-1; Fri, 11 Jun 2021 07:13:06 -0400
X-MC-Unique: jNBQFt01OaejZvyw0q6_tQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso2461296wrz.21
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oHy1q+qir7K71GO9btncB3sfZRfU+k4mfUlIpYsVtkk=;
 b=i08Vz/r6j9I9PWR1/F6v37qbpaNpdbdkWfPTQykW4NO+R4EB9TJvGvKYbArePfx2q/
 NWPSumVS7VOiHKKsQfKRsqERHt7u2FNNTWzArjIY6OKSwe4jQpbC06RgXJa2AwvDNM/w
 nHkwKw8fnHlKCmMzLLNgOy8Wh5FYhvppvSOehPwBupWq2w+oA2n0zMJBuDWSkZTCnUkN
 bPr6ZCogdelW6cGImFCIAbCQiiYQ8sHxavuu9wNcOjXFwnyLIFEo/uwTxQSFoKdHT41A
 mhsZCT+ZBKBj6fIq0qQK510M+Ue6a87zNWGMzt0C/6lYY4MVQVUdZD9eMouYUE5Ixl8N
 HRTA==
X-Gm-Message-State: AOAM533gv0axkFHbkM6ODou2bfsk4ElYmVaB63TjararGEHxTe5KYKO1
 OpzGK08UJVRy68MlZ5gEVVYFeefzbRFSbuQt8jbzm+Shjo95+9kz0fs7T6+0vhFcKIaOX8BGXmR
 k1lzKcUkjUdEuIDQ=
X-Received: by 2002:a5d:47af:: with SMTP id 15mr3346816wrb.289.1623409985504; 
 Fri, 11 Jun 2021 04:13:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfX+Oml3bsRJPRDumHtnTqVbkFLCInarEi2oXvXhCISwt3CEEEDXzPR5liUbq9U8Jl0IHTVA==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr3346797wrb.289.1623409985304; 
 Fri, 11 Jun 2021 04:13:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm7660922wrg.92.2021.06.11.04.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:13:04 -0700 (PDT)
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
To: Kevin Wolf <kwolf@redhat.com>
References: <20210609122234.544153-1-pbonzini@redhat.com>
 <YMC7z/86LurXvAQ6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0cc60d50-c047-4978-7fd6-49559044d84b@redhat.com>
Date: Fri, 11 Jun 2021 13:13:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMC7z/86LurXvAQ6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 15:02, Kevin Wolf wrote:
> Am 09.06.2021 um 14:22 hat Paolo Bonzini geschrieben:
>> If we want to wake up a coroutine from a worker thread, aio_co_wake()
>> currently does not work.  In that scenario, aio_co_wake() calls
>> aio_co_enter(), but there is no current AioContext and therefore
>> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
>> then attempts to call aio_context_acquire() instead of going through
>> aio_co_schedule().
>>
>> The default case of qemu_get_current_aio_context() was added to cover
>> synchronous I/O started from the vCPU thread, but the main and vCPU
>> threads are quite different.  The main thread is an I/O thread itself,
>> only running a more complicated event loop; the vCPU thread instead
>> is essentially a worker thread that occasionally calls
>> qemu_mutex_lock_iothread().  It is only in those critical sections
>> that it acts as if it were the home thread of the main AioContext.
>>
>> Therefore, this patch detaches qemu_get_current_aio_context() from
>> iothreads, which is a useless complication.  The AioContext pointer
>> is stored directly in the thread-local variable, including for the
>> main loop.  Worker threads (including vCPU threads) optionally behave
>> as temporary home threads if they have taken the big QEMU lock,
>> but if that is not the case they will always schedule coroutines
>> on remote threads via aio_co_schedule().
>>
>> With this change, qemu_mutex_iothread_locked() must be changed from
>> true to false.  The previous value of true was needed because the
>> main thread did not have an AioContext in the thread-local variable,
>> but now it does have one.
>>
>> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> The commit message doesn't specify, but in the buggy case, are we
> talking about calling aio_co_wake() for a coroutine in the main context
> specifically, right? Could we have a unit test for this scenario?

Yes, that's the scenario.  I will try to write a unit test indeed.

Paolo


