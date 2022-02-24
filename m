Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC234C325A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:57:06 +0100 (CET)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHQO-0007vo-U2
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNHOc-00077c-Oe
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNHOY-0002ps-Td
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645721707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9l0QycjUhjBvnKiFNUuUs8YOFAqf69284BLJD5vuHSs=;
 b=HSQuJlHVxTlBQbazXGgnCeeIEsTbjjwQM79Ypn494qNqMwDcx9NYuiRPbP8Uj1ZYrP7Bi6
 7dQeRPvrY99Ib/NBzbCaiJsO/09orK4Q5kTy8JMlmNNu5C5FrN0gvR4r/N20EM4y3r2nhL
 WUbn10p2uYNzcNcXaCo9vdpXMAv5udU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-y-V0XgxsPpWPAFrI0qfuGg-1; Thu, 24 Feb 2022 11:55:06 -0500
X-MC-Unique: y-V0XgxsPpWPAFrI0qfuGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020adfa1d1000000b001ed9d151569so117805wrv.21
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9l0QycjUhjBvnKiFNUuUs8YOFAqf69284BLJD5vuHSs=;
 b=H7QhqPXqzPOKtVioLFQ1/jcVW+7PMayOXwqzkXskFSNjtWztmBsOmE/VFAqlYpJKs/
 liCbjp4LQBNUgJaFx41Vc0EvvH7wW23o4/yAVE0C0WYxpp6mwZoZfhTSKGFXOwLtEjQ9
 BBG3N0vjh1h6+U0xjpSWFnuRZoGyV3TeYLD/dhkdnmlqa1yU6Qja6ZCNSeZncOpTwVPy
 FAjzfKwiL/htmD0vTrdhip3IhA9jFczRiQ7xiDtYKaMgn6lfsgaVbnk1e6exZmRtV7/w
 7QOm41Ea0ACeuwgE3arJPQm2liOMz8enbUk3ddre9TPKIFRtZ7GHhoFX0w/KU28iBVbd
 yLUQ==
X-Gm-Message-State: AOAM530lZLpjqMeDBEScv8P8DkkRJE5leDq6yp3DTqM062sJrgx0/SSk
 2VfYYYHO3CBqdOkdozdjqedRB4IOdl1JRH3R7t2s4SpJDAztXtaEkFSEttnaXum36j7puzkHbT/
 bomsxB33CxWioUqc=
X-Received: by 2002:a05:600c:4e13:b0:37c:fd8e:28d7 with SMTP id
 b19-20020a05600c4e1300b0037cfd8e28d7mr12405911wmq.51.1645721705476; 
 Thu, 24 Feb 2022 08:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+rWn8322sofMDTss33l5vshpf498AzHYdAwPvOWWQa6mlIYj47YlzUX/ZPozl8SmO6xCqHA==
X-Received: by 2002:a05:600c:4e13:b0:37c:fd8e:28d7 with SMTP id
 b19-20020a05600c4e1300b0037cfd8e28d7mr12405894wmq.51.1645721705241; 
 Thu, 24 Feb 2022 08:55:05 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id i13sm3495503wrp.87.2022.02.24.08.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:55:04 -0800 (PST)
Message-ID: <d7e80df1-20d8-9d75-a972-43a72c12faa0@redhat.com>
Date: Thu, 24 Feb 2022 17:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/20] jobs: protect jobs with job_lock/unlock
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-9-eesposit@redhat.com>
 <Yg5gTbnNsbUpwD7P@stefanha-x1.localdomain>
 <fe90032a-0fe1-a368-8ce9-084b338623e6@redhat.com>
 <Yhe2zihPZARQbEDJ@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yhe2zihPZARQbEDJ@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/02/2022 17:48, Stefan Hajnoczi wrote:
> On Thu, Feb 24, 2022 at 01:45:48PM +0100, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 17/02/2022 15:48, Stefan Hajnoczi wrote:
>>> On Tue, Feb 08, 2022 at 09:35:01AM -0500, Emanuele Giuseppe Esposito wrote:
>>>> diff --git a/block/replication.c b/block/replication.c
>>>> index 55c8f894aa..a03b28726e 100644
>>>> --- a/block/replication.c
>>>> +++ b/block/replication.c
>>>> @@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
>>>>      if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>>>>          commit_job = &s->commit_job->job;
>>>>          assert(commit_job->aio_context == qemu_get_current_aio_context());
>>>
>>> Is it safe to access commit_job->aio_context outside job_mutex?
>>
>> No, but it is currently not done. Patch 18 takes care of protecting
>> aio_context. Remember again that job lock API is still nop.
>>>
>>>> @@ -1838,7 +1840,9 @@ static void drive_backup_abort(BlkActionState *common)
>>>>          aio_context = bdrv_get_aio_context(state->bs);
>>>>          aio_context_acquire(aio_context);
>>>>  
>>>> -        job_cancel_sync(&state->job->job, true);
>>>> +        WITH_JOB_LOCK_GUARD() {
>>>> +            job_cancel_sync(&state->job->job, true);
>>>> +        }
>>>
>>> Maybe job_cancel_sync() should take the lock internally since all
>>> callers in this patch seem to need the lock?
>>
>> The _locked version is useful because it is used when lock guards are
>> already present, and cover multiple operations. There are only 3 places
>> where a lock guard is added to cover job_cance_sync_locked. Is it worth
>> defining another additional function?
>>
>>
>>>
>>> I noticed this patch does not add WITH_JOB_LOCK_GUARD() to
>>> tests/unit/test-blockjob.c:cancel_common(). Was that an oversight or is
>>> there a reason why job_mutex is not needed around the job_cancel_sync()
>>> call there?
>>
>> No, locks in unit tests are added in patch 10 "jobs: protect jobs with
>> job_lock/unlock".
> 
> I see, it's a question of how to split up the patches. When patches
> leave the code in a state with broken invariants it becomes difficult to
> review. I can't distinguish between actual bugs and temporary violations
> that will be fixed in a later patch (unless they are clearly marked).
> 
> If you can structure patches so they are self-contained and don't leave
> the broken invariants then that would make review easier, but in this
> case it is tricky so I'll do the best I can to review it if you cannot
> restructure the sequence of commits.

Yes, the main problem is that ideally we want to add job lock and remove
Aiocontext lock. But together this can't happen, and just adding proper
locks will create a ton of deadlocks, because in order to maintain
invariants sometimes job lock is inside aiocontext lock, and some other
times the opposite happens.

The way it is done in this serie is:
1) create job_lock/unlock as nop
2) make sure the nop job_lock is protecting the Job fields
3) do all API renaming, accoring with the locking used above
4) enable job_lock (not nop anymore) and at the same time remove the
AioContext

If you want, a more up-to-date branch with your feedbacks applied so far
is here:
https://gitlab.com/eesposit/qemu/-/commits/dp_jobs_reviewed

> 
>>>
>>>> @@ -252,7 +258,13 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>>>>  
>>>>  static void block_job_on_idle(Notifier *n, void *opaque)
>>>>  {
>>>> +    /*
>>>> +     * we can't kick with job_mutex held, but we also want
>>>> +     * to protect the notifier list.
>>>> +     */
>>>> +    job_unlock();
>>>>      aio_wait_kick();
>>>> +    job_lock();
>>>
>>> I don't understand this. aio_wait_kick() looks safe to call with a mutex
>>> held?
>> You are right. It should be safe.
>>
>>>
>>>> @@ -292,7 +304,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>>>>      job->speed = speed;
>>>>  
>>>>      if (drv->set_speed) {
>>>> +        job_unlock();
>>>>          drv->set_speed(job, speed);
>>>> +        job_lock();
>>>
>>> What guarantees that job stays alive during drv->set_speed(job)? We
>>> don't hold a ref here. Maybe the assumption is that
>>> block_job_set_speed() only gets called from the main loop thread and
>>> nothing else will modify the jobs list while we're in drv->set_speed()?
>>
>> What guaranteed this before? I am not sure.
> 
> I guess the reason is the one I suggested. It should be documented in
> the comments.
> 
>>
>>>
>>>> @@ -545,10 +566,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>>>>                                          action);
>>>>      }
>>>>      if (action == BLOCK_ERROR_ACTION_STOP) {
>>>> -        if (!job->job.user_paused) {
>>>> -            job_pause(&job->job);
>>>> -            /* make the pause user visible, which will be resumed from QMP. */
>>>> -            job->job.user_paused = true;
>>>> +        WITH_JOB_LOCK_GUARD() {
>>>> +            if (!job->job.user_paused) {
>>>> +                job_pause(&job->job);
>>>> +                /*
>>>> +                 * make the pause user visible, which will be
>>>> +                 * resumed from QMP.
>>>> +                 */
>>>> +                job->job.user_paused = true;
>>>> +            }
>>>>          }
>>>>          block_job_iostatus_set_err(job, error);
>>>
>>> Does this need the lock? If not, why is block_job_iostatus_reset()
>>> called with the hold?
>>>
>> block_job_iostatus_set_err does not touch any Job fields. On the other
>> hand block_job_iostatus_reset reads job.user_paused and job.pause_count.
> 
> BlockJob->iostatus requires no locking?
> 


