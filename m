Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0F496228
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:34:24 +0100 (CET)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAvvj-0002Dg-3k
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:34:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAvgp-00008y-Nz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:19:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAvgW-0006r0-Rx
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642778319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktA4RTRUfjdiy1NPS50BGAq3Bs0guBwhrCNlFYn967E=;
 b=RauWTTcNK1BSeZGgaDKmgpfe0XngtmQJ6vJMZnZK+aqCvt85DyaNRRlEsNnPyl+9GrVyBl
 kQrZHnaeXIfagdN/5BohdRPFwlS4TEpmgT33g3UVLbpIaMs4Fvkn/RmRa3MYIPx7OoSeGS
 AdldxUOeeZlo9cmYFf6MjS3/VSxqmZw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-ow153zlJP4-6JV3Zmycqag-1; Fri, 21 Jan 2022 10:18:38 -0500
X-MC-Unique: ow153zlJP4-6JV3Zmycqag-1
Received: by mail-ej1-f71.google.com with SMTP id
 p8-20020a1709060e8800b006b39ade8c12so157512ejf.10
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ktA4RTRUfjdiy1NPS50BGAq3Bs0guBwhrCNlFYn967E=;
 b=j+CgMUHVE2QHfqDrYPVT3g/Crq4yh8biSbmAklImCW84VE/ENglYIowYPpc+XhetuR
 g70ErWA7WuTWBE0+EDKeFMAHhKlTi1PS2FHWDMYkxv28UhWI8ldJ9/RcTVZGdyzeDlmX
 3H20PE1XFcHNi++RGBrl/j9ahfz9Qa4LeIKfqgbBRlS198H+zZtq079oe1llnGWCg37D
 IeZRswQxqTiKadFW3Je95f7Msk+R6gcByRZfPFfxwukWpaIVVzeRzzs9521E3wSLEdz2
 m91fXVeH33DsB65GNVsLDVzm0gypt4fzH4BAUEdq6IlwV9bbX7//UkZOmrT4ahvUyXUY
 49qw==
X-Gm-Message-State: AOAM532Qqf6gw+KpxaacNQ2hUsQDtZSRAC2LSI9Q6VebxBNQ4pnGggBb
 dRvgHisHoz2uWRND7hxJnMeC2ant+NDtlGzljwPG2lL30hkbOcGeZY5Zn2h9k7EagsAlumngQhr
 ZjaeNn7fTzI1Vj6c=
X-Received: by 2002:a05:6402:849:: with SMTP id
 b9mr4744599edz.51.1642778317456; 
 Fri, 21 Jan 2022 07:18:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjx0fMYPob2UxiJwwerCmiI/L9nfHylwX497Ht4kQDobBHk+4w7Fe9shd+tmcCpFElLT/nSg==
X-Received: by 2002:a05:6402:849:: with SMTP id
 b9mr4744571edz.51.1642778317145; 
 Fri, 21 Jan 2022 07:18:37 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id u18sm2134305eje.37.2022.01.21.07.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 07:18:36 -0800 (PST)
Message-ID: <4565cc3c-f472-e261-7ae3-e92253f1f3d6@redhat.com>
Date: Fri, 21 Jan 2022 16:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 14/16] job.c: use job_get_aio_context()
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-15-eesposit@redhat.com>
 <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/01/2022 11:31, Paolo Bonzini wrote:
> 
>> diff --git a/job.c b/job.c
>> index f16a4ef542..8a5b710d9b 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -566,7 +566,7 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job 
>> *job))
>>       job->busy = true;
>>       real_job_unlock();
>>       job_unlock();
>> -    aio_co_enter(job->aio_context, job->co);
>> +    aio_co_enter(job_get_aio_context(job), job->co);
>>       job_lock();
>>   }
> 
> If you replace aio_co_enter with aio_co_schedule, you can call it 
> without dropping the lock.  The difference being that aio_co_schedule 
> will always go through a bottom half.
> 
>> @@ -1138,7 +1138,6 @@ static void coroutine_fn job_co_entry(void *opaque)
>>       Job *job = opaque;
>>       int ret;
>> -    assert(job->aio_context == qemu_get_current_aio_context());
>>       assert(job && job->driver && job->driver->run);
>>       job_pause_point(job);
>>       ret = job->driver->run(job, &job->err);
>> @@ -1177,7 +1176,7 @@ void job_start(Job *job)
>>           job->paused = false;
>>           job_state_transition_locked(job, JOB_STATUS_RUNNING);
>>       }
>> -    aio_co_enter(job->aio_context, job->co);
>> +    aio_co_enter(job_get_aio_context(job), job->co);
> 
> Better to use aio_co_schedule here, too, and move it under the previous 
> WITH_JOB_LOCK_GUARD.

Unfortunately this does not work straightforward: aio_co_enter invokes 
aio_co_schedule only if the context is different from the main loop, 
otherwise it can directly enter the coroutine with 
qemu_aio_coroutine_enter. So always replacing it with aio_co_schedule 
breaks the unit tests assumptions, as they expect that when control is 
returned the job has already executed.

A possible solution is to aio_poll() on the condition we want to assert, 
waiting for the bh to be scheduled. But I don't know if this is then 
useful to test something.

Thank you,
Emanuele


