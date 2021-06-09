Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E313A0FBF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 11:37:03 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqudy-0006nx-2p
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 05:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lquci-0005yR-Dp
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqucg-0004X7-G6
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623231341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KcuHoheAESFnWT+Sw+RKowaD2ZwNDLy/YIfb2G/9qk=;
 b=JxdnbXTC96zpLh+8D4RODA1B/TZiXwFqvZ/GCjDsajt1KUOPdGTtwvPzNs173HHBii8sxI
 HDwdb95tPGMG/aiJqQ6/0/IXf8ereTkLt6Hshoj00wjuu0tKUhwsRZh/0KqSlOEZN7sjNZ
 8BMjfNzYhAJB+KcBSG3zPSZhMiYVKsE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-Q8hR4G2YPqms-KiFEZU2AA-1; Wed, 09 Jun 2021 05:35:40 -0400
X-MC-Unique: Q8hR4G2YPqms-KiFEZU2AA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso10519866wrh.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KcuHoheAESFnWT+Sw+RKowaD2ZwNDLy/YIfb2G/9qk=;
 b=jPyE3SA8xNUmS3il4T7xptTsDdzzDmDF4X7Ne5mwv6oOWeYVI2EyzRHsbGRS92w51h
 8OyPmtZALokHZ5M/DTK9j66iMIdVuYMHdKxCcXwWPSv50o3LPuzm8MXH0UFxNnGvrO5P
 RBJ7E2kS+qHz/DvS8Vzom2TpdHp8tmw6rKaBro1e3nre6zTT65JE0qCY9gKe4uuyxYXl
 VKJ1/WnyELjB6HX/krxop1FlhYW92eIlC2UXIP9nmaypIkRIkTd8sDf7lMeiWeTVjt6d
 BOCKMjUOGSPjnaM/iqbuiqzl9LX2ycAh78L6ULFQ+riGkLeO+ukBbx5UZOfRMr1gfHoi
 V3mg==
X-Gm-Message-State: AOAM5321qEdyIX7vG15gXN9dA41euA8JX563b9dL8DcE68wwN0Gtl3yR
 V1M+HgIVmh4Ic14RLVMp5qynKak87cGIs0zsJVKKZi298fBQfGpT2jmErWW8Qy5YKqzks+XRi+g
 COU0AMDDgyEZ/u/Y=
X-Received: by 2002:a1c:808c:: with SMTP id b134mr8926774wmd.187.1623231338503; 
 Wed, 09 Jun 2021 02:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUmGdNUauY5HBxQwTlHPDffGR2MmoyYmOBmzwktdORt5gLCe4XbBE/5tubuSPDdyU9B6SzZw==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr8926745wmd.187.1623231338228; 
 Wed, 09 Jun 2021 02:35:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e17sm25946728wre.79.2021.06.09.02.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 02:35:37 -0700 (PDT)
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
 <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
 <52ba34c5-1de8-21b3-a31c-bf51676c29af@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <154cff7e-3552-5cb1-4d96-8dae3c1607cb@redhat.com>
Date: Wed, 9 Jun 2021 11:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <52ba34c5-1de8-21b3-a31c-bf51676c29af@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/21 20:45, Vladimir Sementsov-Ogievskiy wrote:
> 14.05.2021 00:04, Paolo Bonzini wrote:
>> On 12/05/21 09:15, Vladimir Sementsov-Ogievskiy wrote:
>>>>>
>>>>
>>>> I don't understand.  Why doesn't aio_co_enter go through the ctx != 
>>>> qemu_get_current_aio_context() branch and just do aio_co_schedule? 
>>>> That was at least the idea behind aio_co_wake and aio_co_enter.
>>>>
>>>
>>> Because ctx is exactly qemu_get_current_aio_context(), as we are not 
>>> in iothread but in nbd connection thread. So, 
>>> qemu_get_current_aio_context() returns qemu_aio_context.
>>
>> So the problem is that threads other than the main thread and
>> the I/O thread should not return qemu_aio_context.  The vCPU thread
>> may need to return it when running with BQL taken, though.
>>
>> Something like this (untested):
>>
>> diff --git a/include/block/aio.h b/include/block/aio.h
>> index 5f342267d5..10fcae1515 100644
>> --- a/include/block/aio.h
>> +++ b/include/block/aio.h
>> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct 
>> Coroutine *co);
>>    * Return the AioContext whose event loop runs in the current thread.
>>    *
>>    * If called from an IOThread this will be the IOThread's 
>> AioContext.  If
>> - * called from another thread it will be the main loop AioContext.
>> + * called from the main thread or with the "big QEMU lock" taken it
>> + * will be the main loop AioContext.
>>    */
>>   AioContext *qemu_get_current_aio_context(void);
>>
>> +void qemu_set_current_aio_context(AioContext *ctx);
>> +
>>   /**
>>    * aio_context_setup:
>>    * @ctx: the aio context
>> diff --git a/iothread.c b/iothread.c
>> index 7f086387be..22b967e77c 100644
>> --- a/iothread.c
>> +++ b/iothread.c
>> @@ -39,11 +39,23 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>>   #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
>>   #endif
>>
>> -static __thread IOThread *my_iothread;
>> +static __thread AioContext *my_aiocontext;
>> +
>> +void qemu_set_current_aio_context(AioContext *ctx)
>> +{
>> +    assert(!my_aiocontext);
>> +    my_aiocontext = ctx;
>> +}
>>
>>   AioContext *qemu_get_current_aio_context(void)
>>   {
>> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
>> +    if (my_aiocontext) {
>> +        return my_aiocontext;
>> +    }
>> +    if (qemu_mutex_iothread_locked()) {
>> +        return qemu_get_aio_context();
>> +    }
>> +    return NULL;
>>   }
>>
>>   static void *iothread_run(void *opaque)
>> @@ -56,7 +68,7 @@ static void *iothread_run(void *opaque)
>>        * in this new thread uses glib.
>>        */
>>       g_main_context_push_thread_default(iothread->worker_context);
>> -    my_iothread = iothread;
>> +    qemu_set_current_aio_context(iothread->ctx);
>>       iothread->thread_id = qemu_get_thread_id();
>>       qemu_sem_post(&iothread->init_done_sem);
>>
>> diff --git a/stubs/iothread.c b/stubs/iothread.c
>> index 8cc9e28c55..25ff398894 100644
>> --- a/stubs/iothread.c
>> +++ b/stubs/iothread.c
>> @@ -6,3 +6,7 @@ AioContext *qemu_get_current_aio_context(void)
>>   {
>>       return qemu_get_aio_context();
>>   }
>> +
>> +void qemu_set_current_aio_context(AioContext *ctx)
>> +{
>> +}
>> diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
>> index afde12b4ef..cab38b3da8 100644
>> --- a/tests/unit/iothread.c
>> +++ b/tests/unit/iothread.c
>> @@ -30,13 +30,26 @@ struct IOThread {
>>       bool stopping;
>>   };
>>
>> -static __thread IOThread *my_iothread;
>> +static __thread AioContext *my_aiocontext;
>> +
>> +void qemu_set_current_aio_context(AioContext *ctx)
>> +{
>> +    assert(!my_aiocontext);
>> +    my_aiocontext = ctx;
>> +}
>>
>>   AioContext *qemu_get_current_aio_context(void)
>>   {
>> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
>> +    if (my_aiocontext) {
>> +        return my_aiocontext;
>> +    }
>> +    if (qemu_mutex_iothread_locked()) {
>> +        return qemu_get_aio_context();
>> +    }
>> +    return NULL;
>>   }
>>
>> +
>>   static void iothread_init_gcontext(IOThread *iothread)
>>   {
>>       GSource *source;
>> @@ -54,7 +67,7 @@ static void *iothread_run(void *opaque)
>>
>>       rcu_register_thread();
>>
>> -    my_iothread = iothread;
>> +    qemu_set_current_aio_context(iothread->ctx);
>>       qemu_mutex_lock(&iothread->init_done_lock);
>>       iothread->ctx = aio_context_new(&error_abort);
>>
>> diff --git a/util/main-loop.c b/util/main-loop.c
>> index d9c55df6f5..4ae5b23e99 100644
>> --- a/util/main-loop.c
>> +++ b/util/main-loop.c
>> @@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
>>       if (!qemu_aio_context) {
>>           return -EMFILE;
>>       }
>> +    qemu_set_current_aio_context(qemu_aio_context);
>>       qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
>>       gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
>>       src = aio_get_g_source(qemu_aio_context);
>>
>> If it works for you, I can post it as a formal patch.
>>
> 
> This doesn't work for iotests.. qemu-io goes through version in stub. It 
> works if I add:

Great, thanks.  I'll try the patch, also with the test that broke with 
the earlier version, and post if it works.

Paolo

> diff --git a/stubs/iothread.c b/stubs/iothread.c
> index 8cc9e28c55..967a01c4f0 100644
> --- a/stubs/iothread.c
> +++ b/stubs/iothread.c
> @@ -2,7 +2,18 @@
>   #include "block/aio.h"
>   #include "qemu/main-loop.h"
> 
> +static __thread AioContext *my_aiocontext;
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +    assert(!my_aiocontext);
> +    my_aiocontext = ctx;
> +}
> +
>   AioContext *qemu_get_current_aio_context(void)
>   {
> -    return qemu_get_aio_context();
> +    if (my_aiocontext) {
> +        return my_aiocontext;
> +    }
> +    return NULL;
>   }
> 
> 
> 


