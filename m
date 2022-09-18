Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694355BBF08
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 18:56:06 +0200 (CEST)
Received: from localhost ([::1]:60080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZxaP-0001GC-I3
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 12:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZxZJ-0007qE-22
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:54:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZxZH-0007el-9a
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663520094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9KKEOxx1UGoPhxuBz/HQRfx2nUYXWlMibYD7w9gyig=;
 b=VdFXssnup4d7raXEP4qroy2iP1D/xTKJaX97RxELEYcPdR3aATIdLoyG9VBewT6H0whViu
 t3K8QOnX4Nf9486RuX6abECg4FHig0DSruoL6GfDw0NqNl9hwRy+m5Pf3kui0na1c2G1tB
 v4SZg3RDQI3G0AlH904IcwUvIDpgF54=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-gg-EDus6NW-cRJnZvyQnRA-1; Sun, 18 Sep 2022 12:54:53 -0400
X-MC-Unique: gg-EDus6NW-cRJnZvyQnRA-1
Received: by mail-qv1-f72.google.com with SMTP id
 f9-20020ad442c9000000b004ac7f4fde18so18216135qvr.14
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 09:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=g9KKEOxx1UGoPhxuBz/HQRfx2nUYXWlMibYD7w9gyig=;
 b=0lOPhY1/EByOvUow0DuLOgrqeQTcgKSqQY65TEWXXWTn7ytcp7YppwgZwMBglgOA8C
 vhRSqrV1Iqo2DDAonYtaBJTQzmT5UGUxPHK/Nuyw7mmbBmmaCLp818Hb7ftz74n0EREY
 a3FBTrZkO0jRfS4eBgGCiGjG6UbYS8vCNJJuNfqKclYdy7KOFMz5JeH1/l2wIEYmfMN/
 MpwG4FmNBm4rUTk30VcFnd/BitVir1BlHkbCyWDoYBF+fW7E7lLHd9A95MXDNPMmqYLX
 8TpbNQLBvtqtElO+f1dxZmUuuqcn/OZ7HhVUcjb0XYVnPNvgeDXlTiJ9OHrfNDw8jhnc
 LFAg==
X-Gm-Message-State: ACrzQf1NcynSHJfYEFyx5HE8cj4WznxpTQgoA1xulJ+jkq0RSOuSpuSm
 F9dqhxpTrKeSqEkGQ/3edvmvronVjjHCqwkdxBRnkhHhptKM7k3wcDmQVnIQQg6sQyO2RsW0UQw
 2xGIS++S/+ssZIrU=
X-Received: by 2002:a05:622a:1ba8:b0:35b:b64b:5c82 with SMTP id
 bp40-20020a05622a1ba800b0035bb64b5c82mr12161877qtb.95.1663520092911; 
 Sun, 18 Sep 2022 09:54:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4F/1rvcuzNwH2H/Ud8b6Uc3rarRf1NRchY1RpCyWOrTlY7hpLPLoXHr0VTmw4Ha05AgNbSEg==
X-Received: by 2002:a05:622a:1ba8:b0:35b:b64b:5c82 with SMTP id
 bp40-20020a05622a1ba800b0035bb64b5c82mr12161860qtb.95.1663520092681; 
 Sun, 18 Sep 2022 09:54:52 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bl10-20020a05620a1a8a00b006b5d9a1d326sm10290160qkb.83.2022.09.18.09.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 09:54:52 -0700 (PDT)
Message-ID: <4e96d073-f968-bffe-87e8-6e78d3798752@redhat.com>
Date: Sun, 18 Sep 2022 18:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 13/21] jobs: protect job.aio_context with BQL and
 job_mutex
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
 <20220826132104.3678958-14-eesposit@redhat.com>
 <6c7d735c-b473-c540-5bf6-db29794450d0@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6c7d735c-b473-c540-5bf6-db29794450d0@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 14/09/2022 um 15:25 schrieb Vladimir Sementsov-Ogievskiy:
> On 8/26/22 16:20, Emanuele Giuseppe Esposito wrote:
>> In order to make it thread safe, implement a "fake rwlock",
>> where we allow reads under BQL *or* job_mutex held, but
>> writes only under BQL *and* job_mutex.
>>
>> The only write we have is in child_job_set_aio_ctx, which always
>> happens under drain (so the job is paused).
>> For this reason, introduce job_set_aio_context and make sure that
>> the context is set under BQL, job_mutex and drain.
>> Also make sure all other places where the aiocontext is read
>> are protected.
>>
>> The reads in commit.c and mirror.c are actually safe, because always
>> done under BQL.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/replication.c |  7 +++++--
>>   blockjob.c          |  3 ++-
>>   include/qemu/job.h  | 23 ++++++++++++++++++++---
>>   job.c               | 12 ++++++++++++
>>   4 files changed, 39 insertions(+), 6 deletions(-)
>>
>> diff --git a/block/replication.c b/block/replication.c
>> index 55c8f894aa..6e02d98126 100644
>> --- a/block/replication.c
>> +++ b/block/replication.c
>> @@ -142,14 +142,17 @@ static void replication_close(BlockDriverState *bs)
>>   {
>>       BDRVReplicationState *s = bs->opaque;
>>       Job *commit_job;
>> +    GLOBAL_STATE_CODE();
>>         if (s->stage == BLOCK_REPLICATION_RUNNING) {
>>           replication_stop(s->rs, false, NULL);
>>       }
>>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>>           commit_job = &s->commit_job->job;
>> -        assert(commit_job->aio_context ==
>> qemu_get_current_aio_context());
>> -        job_cancel_sync(commit_job, false);
>> +        WITH_JOB_LOCK_GUARD() {
>> +            assert(commit_job->aio_context ==
>> qemu_get_current_aio_context());
>> +            job_cancel_sync_locked(commit_job, false);
>> +        }
> 
> As Kevin said, this hunk seems not needed.. Why to add locking for
> reading aio_context, when we have GLOBAL_STATE_CODE()?

Ok, getting rid of it.
> 
>>       }
>>         if (s->mode == REPLICATION_MODE_SECONDARY) {
>> diff --git a/blockjob.c b/blockjob.c
>> index 96fb9d9f73..c8919cef9b 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -162,12 +162,13 @@ static void child_job_set_aio_ctx(BdrvChild *c,
>> AioContext *ctx,
>>           bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>>       }
>>   -    job->job.aio_context = ctx;
>> +    job_set_aio_context(&job->job, ctx);
>>   }
>>     static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>>   {
>>       BlockJob *job = c->opaque;
>> +    GLOBAL_STATE_CODE();
>>         return job->job.aio_context;
>>   }
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 5709e8d4a8..cede227e67 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -74,11 +74,17 @@ typedef struct Job {
>>       /* ProgressMeter API is thread-safe */
>>       ProgressMeter progress;
>>   +    /**
>> +     * AioContext to run the job coroutine in.
>> +     * The job Aiocontext can be read when holding *either*
>> +     * the BQL (so we are in the main loop) or the job_mutex.
>> +     * It can only be written when we hold *both* BQL
>> +     * and the job_mutex.
>> +     */
>> +    AioContext *aio_context;
>>   -    /** Protected by AioContext lock */
>>   -    /** AioContext to run the job coroutine in */
>> -    AioContext *aio_context;
>> +    /** Protected by AioContext lock */
>>         /** Reference count of the block job */
>>       int refcnt;
>> @@ -741,4 +747,15 @@ int job_finish_sync(Job *job, void (*finish)(Job
>> *, Error **errp),
>>   int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error
>> **errp),
>>                              Error **errp);
>>   +/**
>> + * Sets the @job->aio_context.
>> + * Called with job_mutex *not* held.
>> + *
>> + * This function must run in the main thread to protect against
>> + * concurrent read in job_finish_sync_locked(), takes the job_mutex
>> + * lock to protect against the read in job_do_yield_locked(), and must
>> + * be called when the coroutine is quiescent.
> 
> May be "job is quiscent" or "job is doing nothing", "no in-flight io
> operations in job".
> 
> For example, backup has several running coroutines in contest of
> block_copy process, and main coroutine of the job
> is almost always "quescent"..

"job is quiescent" seems ok

> 
>> + */
>> +void job_set_aio_context(Job *job, AioContext *ctx);
>> +
>>   #endif
>> diff --git a/job.c b/job.c
>> index 85ae843f03..9f2fb2e73b 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -396,6 +396,17 @@ Job *job_get(const char *id)
>>       return job_get_locked(id);
>>   }
>>   +void job_set_aio_context(Job *job, AioContext *ctx)
>> +{
>> +    /* protect against read in job_finish_sync_locked and job_start */
>> +    GLOBAL_STATE_CODE();
>> +    /* protect against read in job_do_yield_locked */
>> +    JOB_LOCK_GUARD();
>> +    /* ensure the coroutine is quiescent while the AioContext is
>> changed */
> 
> same not here.

Ok

Thank you,
Emanuele
> 
>> +    assert(job->paused || job_is_completed_locked(job));
>> +    job->aio_context = ctx;
>> +}
>> +
>>   /* Called with job_mutex *not* held. */
>>   static void job_sleep_timer_cb(void *opaque)
>>   {
>> @@ -1379,6 +1390,7 @@ int job_finish_sync_locked(Job *job,
>>   {
>>       Error *local_err = NULL;
>>       int ret;
>> +    GLOBAL_STATE_CODE();
>>         job_ref_locked(job);
>>   
> 
> 


