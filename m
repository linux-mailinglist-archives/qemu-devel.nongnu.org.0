Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906D596D71
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 13:24:16 +0200 (CEST)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOH9i-00027p-1y
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 07:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOH2b-0004qL-5U
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOH2Y-00004w-Cm
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660735008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5+u2m92NOmWNLkZuPTiTGgwazv+n+ce+ZqN/n5eku4=;
 b=PvaM1oXgrm+8W0DfqUlpGfNj6Hap+E5/TUWEvIFr1S4lNe90aj4xeBbeJKy5NjPyyMWoSr
 ZhOAzbaQ/y66a3uxL8hbGMgXTloIjjSzN+K6THfMJBdrv/UoXZ56jKG2yB8WMzGE3k8qMj
 6YjVb3RNyNqzmgckPE40BxGrybSUPJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-lH9Tq0JFN1qWsQH52fMZIA-1; Wed, 17 Aug 2022 07:16:47 -0400
X-MC-Unique: lH9Tq0JFN1qWsQH52fMZIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v64-20020a1cac43000000b003a4bea31b4dso930014wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 04:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=J5+u2m92NOmWNLkZuPTiTGgwazv+n+ce+ZqN/n5eku4=;
 b=znbkN+570b4U4dC/OGNdViTJT+9XNbT997yFlfH8KmxInFwhqx2QRcgDPA0rnrd4B1
 4AOLcqhuTtwTUaepCUvht3J0lorhNBSay5BlgurDgjeYMqSdeKz2OzZUBzKIWu+s3gfA
 G+8aB8XlEVMNesEKb0gdU0WEvG3YZfAaXrT8JYjzw8kLzXJpo6wpvi0Y4zo+eIgNaNPK
 l5GNN7G6IIt23t8S0FSOb0XpNbaP+c95AjNXc5pRwbPBJ0zKoGpbQ/vi3IOEohjVopmo
 PmWOlZruV6CccvNqHL0BYIB3hoU4uLoAfJApWhNrX/7q+nuha5JKEfQPxow7Iw4FWryX
 372w==
X-Gm-Message-State: ACgBeo0VSL+r4vOBMT6C6+koE9rhxax69V+N3yylyx5nLBGuAhXT6aDs
 7lKEDB0m/9VrerIN3XMuFU4wkTin+ztDl3DFCk4hCq83HwU4tWmkruGjM1JwU9tbfj8tiNZhhcf
 j5A3XZI7vimrF/YM=
X-Received: by 2002:a05:600c:4fcb:b0:3a5:f2cc:2f19 with SMTP id
 o11-20020a05600c4fcb00b003a5f2cc2f19mr1767950wmq.142.1660735006329; 
 Wed, 17 Aug 2022 04:16:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SxW2878dQGknGs7rSV5uPb9iPSch7JLvY0cDsi9MfPHNop1c0dC/hcQ66h71f+WkCyzNZZw==
X-Received: by 2002:a05:600c:4fcb:b0:3a5:f2cc:2f19 with SMTP id
 o11-20020a05600c4fcb00b003a5f2cc2f19mr1767929wmq.142.1660735005985; 
 Wed, 17 Aug 2022 04:16:45 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 m18-20020adfe0d2000000b0021ea1bcc300sm12544061wri.56.2022.08.17.04.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 04:16:45 -0700 (PDT)
Message-ID: <6998a596-b752-c3ec-8f59-8977b727d10c@redhat.com>
Date: Wed, 17 Aug 2022 13:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 13/21] job: detect change of aiocontext within job
 coroutine
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-14-eesposit@redhat.com> <YuzWy1wQPf6HXl+0@redhat.com>
 <85f03feb-0502-b32d-9bdf-f3239d759c87@redhat.com>
 <YvyoDpWPINx6IwPu@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YvyoDpWPINx6IwPu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 17/08/2022 um 10:34 schrieb Kevin Wolf:
> Am 16.08.2022 um 17:09 hat Emanuele Giuseppe Esposito geschrieben:
>>
>>
>> Am 05/08/2022 um 10:37 schrieb Kevin Wolf:
>>> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>>
>>>> We want to make sure access of job->aio_context is always done
>>>> under either BQL or job_mutex.
>>>
>>> Is this the goal of this series? If so, it would have been useful to
>>> state somewhere more obvious, because I had assumed that holding the BQL
>>> would not be considered enough, but everyone needs to hold the job_mutex.
>>
>> It is the goal for this patch :)
>> The whole job API can't rely on BQL since there are coroutines running
>> in another aiocontext.
> 
> Yes, as I saw in patch 14, which describes the goal more clearly in the
> commit message and also adds the corresponding documentation to
> Job.aio_context. Maybe it would have been clearer if the documentation
> were already in this patch.
> 

I don't understand what you mean here, sorry. You mean
job_set_aiocontext documentation? I don't see what is confusing here,
could you please clarify?

>>>> The problem is that using
>>>> aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
>>>> makes the coroutine immediately resume, so we can't hold the job lock.
>>>> And caching it is not safe either, as it might change.
>>>>
>>>> job_start is under BQL, so it can freely read job->aiocontext, but
>>>> job_enter_cond is not. In order to fix this, use aio_co_wake():
>>>> the advantage is that it won't use job->aiocontext, but the
>>>> main disadvantage is that it won't be able to detect a change of
>>>> job AioContext.
>>>>
>>>> Calling bdrv_try_set_aio_context() will issue the following calls
>>>> (simplified):
>>>> * in terms of  bdrv callbacks:
>>>>   .drained_begin -> .set_aio_context -> .drained_end
>>>> * in terms of child_job functions:
>>>>   child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
>>>> * in terms of job functions:
>>>>   job_pause_locked -> job_set_aio_context -> job_resume_locked
>>>>
>>>> We can see that after setting the new aio_context, job_resume_locked
>>>> calls again job_enter_cond, which then invokes aio_co_wake(). But
>>>> while job->aiocontext has been set in job_set_aio_context,
>>>> job->co->ctx has not changed, so the coroutine would be entering in
>>>> the wrong aiocontext.
>>>>
>>>> Using aio_co_schedule in job_resume_locked() might seem as a valid
>>>> alternative, but the problem is that the bh resuming the coroutine
>>>> is not scheduled immediately, and if in the meanwhile another
>>>> bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
>>>> test-block-iothread.c), we would have the first schedule in the
>>>> wrong aiocontext, and the second set of drains won't even manage
>>>> to schedule the coroutine, as job->busy would still be true from
>>>> the previous job_resume_locked().
>>>>
>>>> The solution is to stick with aio_co_wake(), but then detect every time
>>>> the coroutine resumes back from yielding if job->aio_context
>>>> has changed. If so, we can reschedule it to the new context.
>>>
>>> Hm, but with this in place, what does aio_co_wake() actually buy us
>>> compared to aio_co_enter()?
>>>
>>> I guess it's a bit simpler code because you don't have to explicitly
>>> specify the AioContext, but we're still going to enter the coroutine in
>>> the wrong AioContext occasionally and have to reschedule it, just like
>>> in the existing code (except that the rescheduling doesn't exist there
>>> yet).
>>>
>>> So while I don't disagree with the change, I don't think the
>>> justification in the commit message is right for this part.
>>
>> What do you suggest to change?
> 
> The commit message shouldn't pretend that aio_co_wake() solves the
> problem (it says "In order to fix this, use aio_co_wake"), even if
> that's what you thought at first before you saw that the problem wasn't
> fully fixed by it.
> 
> I would move the real solution up in the commit message ("In order to
> fix this, detect every time..."), and then maybe mention why
> aio_co_wake() doesn't solve the problem, but you're leaving it in anyway
> because it's nicer than the previous sequence or something like that.

I think the issue is "In order to fix this", meaning what "this" refers
to. It is not the fix, it is the problem stated in the previous sentence.

Since job_enter_cond is not under BQL, we can't read job->aiocontext,
therefore use aio_co_wake to avoid doing that.

Would it be ok if I replace the paragraph with:

job_start is under BQL, so it can freely read job->aiocontext, but
job_enter_cond is not. In order to avoid reading the job aiocontext, use
aio_co_wake(), since it resorts so job->co->ctx. The
only disadvantage is that it won't be able to detect a change of
job AioContext, as explained below.

Emanuele
> 
>>>> Check for the aiocontext change in job_do_yield_locked because:
>>>> 1) aio_co_reschedule_self requires to be in the running coroutine
>>>> 2) since child_job_set_aio_context allows changing the aiocontext only
>>>>    while the job is paused, this is the exact place where the coroutine
>>>>    resumes, before running JobDriver's code.
>>>>
>>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Kevin
> 


