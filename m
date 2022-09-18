Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55485BBF06
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 18:52:54 +0200 (CEST)
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZxXJ-0007H0-Ao
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 12:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZxVi-0004iM-VW
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZxVf-00077x-Bt
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663519869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkRMjDIpcMNUGK1vJp9cWx8mMTTc+QTYKePWr3eFY44=;
 b=VqL2XK/F3vdHgYalG35u79CgzYyfha7TAlU3FdIa5MArl1qf4rIoIHmmCYivodyAORozry
 46YGN2uWBFgll5GmeNdAmi/qevmpR25NHS9DFyyCvuB3ySsxTCdjpRhzm1uQP4MO1ixC4Z
 TmY44K/C9z+mo9GQ8TN3AUS2SIE9jYo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-MJlHi98KPgaNH_DroN-wQA-1; Sun, 18 Sep 2022 12:51:07 -0400
X-MC-Unique: MJlHi98KPgaNH_DroN-wQA-1
Received: by mail-qk1-f199.google.com with SMTP id
 n15-20020a05620a294f00b006b5768a0ed0so22468230qkp.7
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 09:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SkRMjDIpcMNUGK1vJp9cWx8mMTTc+QTYKePWr3eFY44=;
 b=ZVzm+PtN6/rLkf7BR44az1roz9Pt6Rn6cQhZF4PdlKn+ZgCsOjZulkD6E1Z1IMpyVM
 3bwuOUoh4ELmD6KBGf7vnXkABrbyt1MAPEhyIVVTsC0ZkuX7ODqfGbQ4RYta/1yGdbLF
 dN1JKXYdPlap/1+w12boaIgujybAoAeXDXnbdAzxJ6vkWDZ6gRkZjkP00/fL6B8qO7Wk
 YaKVserQuZgba9XisGpq/eCwRbo6SMPMk3jsP+KVQHf396hKwdS+oQA5lyHsJSRn9O2/
 t8QsmOZ02Q85z5FrsInwjmt+qKv1rvxONnuPmEjqKRp21YVsxbcyTiFHWtT1A6LuCzoQ
 7roA==
X-Gm-Message-State: ACrzQf3UWRfOEQApph7da0/Yp8GQD/N+u77kKUrKtn5hFfj2dswxsR7j
 yZY/AotmiVnIfEmWjANcij3P5w+3P8yPefrBxzAe8p2dZKFjOvuxDHoXNe3Eppa40TDwCXNQita
 E409mQ5lXWOnVGPo=
X-Received: by 2002:a05:622a:105:b0:35c:d63e:3452 with SMTP id
 u5-20020a05622a010500b0035cd63e3452mr9435319qtw.668.1663519867294; 
 Sun, 18 Sep 2022 09:51:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VjlN2jW+2RCIoIN4BKNYbaIzKTSkEhHVGV+oZ4WBHf/ZSs+mqTfgYCpBeoxMKjljL2nKBtA==
X-Received: by 2002:a05:622a:105:b0:35c:d63e:3452 with SMTP id
 u5-20020a05622a010500b0035cd63e3452mr9435302qtw.668.1663519867060; 
 Sun, 18 Sep 2022 09:51:07 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05620a268800b006ce60296f97sm10534103qkp.68.2022.09.18.09.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 09:51:06 -0700 (PDT)
Message-ID: <a93f8516-8de4-a78a-047d-7ad39a941aeb@redhat.com>
Date: Sun, 18 Sep 2022 18:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 11/21] jobs: group together API calls under the same
 job lock
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-12-eesposit@redhat.com>
 <7f6282ea-b2ce-ac87-b099-446bfccbd194@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7f6282ea-b2ce-ac87-b099-446bfccbd194@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 14/09/2022 um 14:36 schrieb Vladimir Sementsov-Ogievskiy:
> On 8/26/22 16:20, Emanuele Giuseppe Esposito wrote:
>> Now that the API offers also _locked() functions, take advantage
>> of it and give also the caller control to take the lock and call
>> _locked functions.
>>
>> This makes sense especially when we have for loops, because it
>> makes no sense to have:
>>
>> for(job = job_next(); ...)
>>
>> where each job_next() takes the lock internally.
>> Instead we want
>>
>> JOB_LOCK_GUARD();
>> for(job = job_next_locked(); ...)
>>
>> In addition, protect also direct field accesses, by either creating a
>> new critical section or widening the existing ones.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   block.c            | 17 ++++++++++-------
>>   blockdev.c         | 14 ++++++++++----
>>   blockjob.c         | 35 ++++++++++++++++++++++-------------
>>   job-qmp.c          |  9 ++++++---
>>   job.c              |  7 +++++--
>>   monitor/qmp-cmds.c |  7 +++++--
>>   qemu-img.c         | 17 +++++++++++------
>>   7 files changed, 69 insertions(+), 37 deletions(-)
>>
> 
> [..]
> 
>> diff --git a/job.c b/job.c
>> index dcd561fd46..e336af0c1c 100644
>> --- a/job.c
>> +++ b/job.c
> 
> job.c hunks are unrelated in this patch, they should go to patch 05.
> 
>> @@ -672,7 +672,7 @@ void coroutine_fn job_pause_point(Job *job)
>>       job_pause_point_locked(job);
>>   }
>>   -void job_yield_locked(Job *job)
>> +static void job_yield_locked(Job *job)
>>   {
>>       assert(job->busy);
>>   @@ -1046,11 +1046,14 @@ static void
>> job_completed_txn_abort_locked(Job *job)
>>   /* Called with job_mutex held, but releases it temporarily */
>>   static int job_prepare_locked(Job *job)
>>   {
>> +    int ret;
>> +
>>       GLOBAL_STATE_CODE();
>>       if (job->ret == 0 && job->driver->prepare) {
>>           job_unlock();
>> -        job->ret = job->driver->prepare(job);
>> +        ret = job->driver->prepare(job);
>>           job_lock();
>> +        job->ret = ret;
>>           job_update_rc_locked(job);
>>       }
>>       return job->ret;
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 7314cd813d..81c8fdadf8 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -135,8 +135,11 @@ void qmp_cont(Error **errp)
>>           blk_iostatus_reset(blk);
>>       }
>>   -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>> -        block_job_iostatus_reset(job);
>> +    WITH_JOB_LOCK_GUARD() {
>> +        for (job = block_job_next_locked(NULL); job;
>> +             job = block_job_next_locked(job)) {
>> +            block_job_iostatus_reset_locked(job);
>> +        }
>>       }
>>         /* Continuing after completed migration. Images have been
>> inactivated to
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 7d4b33b3da..c8ae704166 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error
>> **errp)
>>       int ret = 0;
>>         aio_context_acquire(aio_context);
>> -    job_ref(&job->job);
>> +    job_lock();
>> +    job_ref_locked(&job->job);
>>       do {
>>           float progress = 0.0f;
>> +        job_unlock();
>>           aio_poll(aio_context, true);
>>             progress_get_snapshot(&job->job.progress, &progress_current,
>> -                              &progress_total);
>> +                                &progress_total);
> 
> broken indentation
> 
>>           if (progress_total) {
>>               progress = (float)progress_current / progress_total *
>> 100.f;
>>           }
>>           qemu_progress_print(progress, 0);
>> -    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
>> +        job_lock();
>> +    } while (!job_is_ready_locked(&job->job) &&
>> +                !job_is_completed_locked(&job->job));
> 
> and here

Makes sense, I'll fix it.

Thank you,
Emanuele
> 
>>   -    if (!job_is_completed(&job->job)) {
>> -        ret = job_complete_sync(&job->job, errp);
>> +    if (!job_is_completed_locked(&job->job)) {
>> +        ret = job_complete_sync_locked(&job->job, errp);
>>       } else {
>>           ret = job->job.ret;
>>       }
>> -    job_unref(&job->job);
>> +    job_unref_locked(&job->job);
>> +    job_unlock();
>>       aio_context_release(aio_context);
>>         /* publish completion progress only when success */
> 
> 


