Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7124C2C39
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:55:50 +0100 (CET)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDev-0007k4-AF
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNDVO-0000R2-08
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNDVK-0000Uw-QJ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645706753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOujF0/zB9S4zcRc1q5vMzSBiCYrRRjuoC6dFEIQzAM=;
 b=HS/29NHfObZqWu5mE+E4rlnhEIppaOJRyqlpVWLEQqLQELodxxy1Y7AFrzBr4QB2PA6YSk
 GBqVcGT/utyKRs3e7ZgoD+vexOUr/5+jR/mWiTIwLZ7g3Q9ELL2i0cle3wDTAp9DNmjpmc
 O+E0KCc/w3qIwbwdftEYmoebtqlkYBs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-z9EjuodaOESM4zfdhYxQrg-1; Thu, 24 Feb 2022 07:45:52 -0500
X-MC-Unique: z9EjuodaOESM4zfdhYxQrg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e26-20020adfa45a000000b001ea860cd35cso719116wra.4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bOujF0/zB9S4zcRc1q5vMzSBiCYrRRjuoC6dFEIQzAM=;
 b=ZUeSTEezVQ7Zlx2G7VeRmIGzzIFVNwlTL0u64xVsGzzq90+KyiBe1fvFEHlB0VFskW
 IAdSh1XUEsmA1Goa0JC9YuK/prnzX5edmITaKvxbVEpsj5XftrnbI/7qDtKGrP0LKwoM
 m9y3iJEXioRKMSm1wvch80JKgZqn2NPTdyODBkQh8tc+vFTcIYKS62yyyx7RrllQXrhY
 TvdINYpii8rGGXFCBlU6wc8atYK2XrIhAYAzZN3QdFPGjEJRN3nZyxSbl/YKHt7KmDGg
 Xmj0Bswm8BslC4C+WB47t588CZosOzzBDC5FVOQUMy6S8mCOnfoCaT8lnsIuHaZ84ZZO
 oGaA==
X-Gm-Message-State: AOAM533EAP8yA/Lk+eZpqsoXngSq446H4gwZGGakpgrrspyT6bg70Lcp
 ftOcreV97ktju83b8A/bh/lIoL5t0Cu8h4ueGco0FogFYOVnSIUSFwztQprJG8AwTGJwhgQSc8Y
 /6zRY0fJHqX+s7T4=
X-Received: by 2002:a5d:5983:0:b0:1e5:7dd6:710 with SMTP id
 n3-20020a5d5983000000b001e57dd60710mr2184047wri.392.1645706750575; 
 Thu, 24 Feb 2022 04:45:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaPaSRx8K4diqBcvweRYxpVQI1CwW+XQEbN44pquZ1UsmFF1pPuD8Hlb83elmuXLzBwyNZqA==
X-Received: by 2002:a5d:5983:0:b0:1e5:7dd6:710 with SMTP id
 n3-20020a5d5983000000b001e57dd60710mr2184023wri.392.1645706750334; 
 Thu, 24 Feb 2022 04:45:50 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b00352cdcdd7b2sm12260333wmq.0.2022.02.24.04.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:45:50 -0800 (PST)
Message-ID: <fe90032a-0fe1-a368-8ce9-084b338623e6@redhat.com>
Date: Thu, 24 Feb 2022 13:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/20] jobs: protect jobs with job_lock/unlock
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-9-eesposit@redhat.com>
 <Yg5gTbnNsbUpwD7P@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yg5gTbnNsbUpwD7P@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 17/02/2022 15:48, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 09:35:01AM -0500, Emanuele Giuseppe Esposito wrote:
>> diff --git a/block/replication.c b/block/replication.c
>> index 55c8f894aa..a03b28726e 100644
>> --- a/block/replication.c
>> +++ b/block/replication.c
>> @@ -149,7 +149,9 @@ static void replication_close(BlockDriverState *bs)
>>      if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>>          commit_job = &s->commit_job->job;
>>          assert(commit_job->aio_context == qemu_get_current_aio_context());
> 
> Is it safe to access commit_job->aio_context outside job_mutex?

No, but it is currently not done. Patch 18 takes care of protecting
aio_context. Remember again that job lock API is still nop.
> 
>> @@ -1838,7 +1840,9 @@ static void drive_backup_abort(BlkActionState *common)
>>          aio_context = bdrv_get_aio_context(state->bs);
>>          aio_context_acquire(aio_context);
>>  
>> -        job_cancel_sync(&state->job->job, true);
>> +        WITH_JOB_LOCK_GUARD() {
>> +            job_cancel_sync(&state->job->job, true);
>> +        }
> 
> Maybe job_cancel_sync() should take the lock internally since all
> callers in this patch seem to need the lock?

The _locked version is useful because it is used when lock guards are
already present, and cover multiple operations. There are only 3 places
where a lock guard is added to cover job_cance_sync_locked. Is it worth
defining another additional function?


> 
> I noticed this patch does not add WITH_JOB_LOCK_GUARD() to
> tests/unit/test-blockjob.c:cancel_common(). Was that an oversight or is
> there a reason why job_mutex is not needed around the job_cancel_sync()
> call there?

No, locks in unit tests are added in patch 10 "jobs: protect jobs with
job_lock/unlock".

> 
>> @@ -252,7 +258,13 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>>  
>>  static void block_job_on_idle(Notifier *n, void *opaque)
>>  {
>> +    /*
>> +     * we can't kick with job_mutex held, but we also want
>> +     * to protect the notifier list.
>> +     */
>> +    job_unlock();
>>      aio_wait_kick();
>> +    job_lock();
> 
> I don't understand this. aio_wait_kick() looks safe to call with a mutex
> held?
You are right. It should be safe.

> 
>> @@ -292,7 +304,9 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>>      job->speed = speed;
>>  
>>      if (drv->set_speed) {
>> +        job_unlock();
>>          drv->set_speed(job, speed);
>> +        job_lock();
> 
> What guarantees that job stays alive during drv->set_speed(job)? We
> don't hold a ref here. Maybe the assumption is that
> block_job_set_speed() only gets called from the main loop thread and
> nothing else will modify the jobs list while we're in drv->set_speed()?

What guaranteed this before? I am not sure.

> 
>> @@ -545,10 +566,15 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>>                                          action);
>>      }
>>      if (action == BLOCK_ERROR_ACTION_STOP) {
>> -        if (!job->job.user_paused) {
>> -            job_pause(&job->job);
>> -            /* make the pause user visible, which will be resumed from QMP. */
>> -            job->job.user_paused = true;
>> +        WITH_JOB_LOCK_GUARD() {
>> +            if (!job->job.user_paused) {
>> +                job_pause(&job->job);
>> +                /*
>> +                 * make the pause user visible, which will be
>> +                 * resumed from QMP.
>> +                 */
>> +                job->job.user_paused = true;
>> +            }
>>          }
>>          block_job_iostatus_set_err(job, error);
> 
> Does this need the lock? If not, why is block_job_iostatus_reset()
> called with the hold?
> 
block_job_iostatus_set_err does not touch any Job fields. On the other
hand block_job_iostatus_reset reads job.user_paused and job.pause_count.

Emanuele


