Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9B49FEB4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:11:56 +0100 (CET)
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUmx-0004ZR-LA
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDUZb-00041B-EE
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDUZS-0002Wb-Im
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643389077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2NAPP8T41sFgAETIyeFHWc26qvD8R4PYNixUz6xdzU=;
 b=hVdShSmtm3zZanNFN1n5rWoTXDndDij/rm47zBfrUBnGgcI1z0KLcTPA5dl4kAFApGTpuM
 ae7A5j3d4vFxu6UyXim/R67EJbeKHcJJKtztn75otavrVreB91S677JCugMJy4Wx0ToqzY
 lrif37x/LkCQELV0I9YMsv9S1W0zmDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-go7umeuEOLGkpnWhUjY-eg-1; Fri, 28 Jan 2022 11:57:55 -0500
X-MC-Unique: go7umeuEOLGkpnWhUjY-eg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h12-20020adfa4cc000000b001d474912698so2457111wrb.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R2NAPP8T41sFgAETIyeFHWc26qvD8R4PYNixUz6xdzU=;
 b=poXxQlVdU3H4uSIdsYkhmrNV3mZutrvYTLV76WKTqClBXN7f/9WGIetftsxpO5ykqb
 y5D0TROSg4rLuGoOgfTqFOmRWLPSqiUMeX8bIxl5wECfDP6ZZ8bOWoAQW+PX5lT83Abc
 Pkr6XtLfX/S0JtXdWZLb7WRGyzCB6SM7aY0clRi0TpTl3agRvvWINVL5GFWVO8qjIlx2
 aFAO21tvKBMthCLy+5B/9yUd5teet6EUb8AjMzOpryBJaco9PF1tS+42O0SBJowPzoH6
 tdsaPkx1GB+grpkn38PP31+Sp3lZBsXQwy+dGy6zvb0Y41JhYhbk5t33KLcGjkmk1b4f
 pAHA==
X-Gm-Message-State: AOAM530wjvmLyBBZa4whhmMCz3nKHp/h+TtkMXYS74jNuoM24nGNbeXZ
 wRV8f0V0VB9wwqIBge9Zt05BFmwN7UM1kXOuZC2KPwr8uHYosCqRxvl2IqetEK5ZSL/msstcaJ+
 kOaR7OwiD8QVAErY=
X-Received: by 2002:a5d:4406:: with SMTP id z6mr7604233wrq.125.1643389074648; 
 Fri, 28 Jan 2022 08:57:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwUmMCiDHrQE793VaTmzeqjczlSvAzdly2MQBi872nt9w26xWP7sDhCHSHjWLaci3JfOP1cg==
X-Received: by 2002:a5d:4406:: with SMTP id z6mr7604203wrq.125.1643389074325; 
 Fri, 28 Jan 2022 08:57:54 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id v3sm4887588wru.15.2022.01.28.08.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 08:57:53 -0800 (PST)
Message-ID: <eeec5f93-f38f-4f83-632e-a6f574e82b06@redhat.com>
Date: Fri, 28 Jan 2022 17:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 32/33] crypto: delegate permission functions to
 JobDriver .pre_run
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-33-eesposit@redhat.com>
 <49d12b8b-cf53-06cb-de26-d4e8f03a8e04@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <49d12b8b-cf53-06cb-de26-d4e8f03a8e04@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/01/2022 17:10, Hanna Reitz wrote:
> On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
>> block_crypto_amend_options_generic_luks uses the block layer
>> permission API, therefore it should be called with the BQL held.
>>
>> However, the same function is being called by two BlockDriver
>> callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).
>>
>> The latter is I/O because it is invoked by block/amend.c's
>> blockdev_amend_run(), a .run callback of the amend JobDriver
>>
>> Therefore we want to 1) change block_crypto driver
>> to use the permission API only when the BQL is held, and
>> 2) use the .pre_run JobDriver callback to check for
>> permissions before switching to the job aiocontext. This has also
>> the benefit of applying the same permission operation to all
>> amend implementations, not only luks.
>>
>> Remove the permission check in block_crypto_amend_options_generic_luks()
>> and:
>> - Add helper functions block_crypto_amend_options_{prepare/cleanup}
>>    that take care of checking permissions in
>>    block_crypto_amend_options_luks(), so when it is under BQL, and
>>
>> - Use job->pre_run() and job->clean() to do the same thing when
>>    we are in an iothread, by performing these checks before the
>>    job runs in its aiocontext. So far job->pre_run() is only defined
>>    but not called in job_start(), now it is the moment to use it.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/crypto.c | 57 ++++++++++++++++++++++++++++++++------------------
>>   job.c          | 13 ++++++++++++
>>   2 files changed, 50 insertions(+), 20 deletions(-)
>>
>> diff --git a/block/crypto.c b/block/crypto.c
>> index f5e0c7b7c0..bdb4ba5664 100644
>> --- a/block/crypto.c
>> +++ b/block/crypto.c
>> @@ -791,6 +791,28 @@ block_crypto_amend_cleanup(BlockDriverState *bs)
>>       crypto->updating_keys = false;
>>   }
>>   +static int
>> +block_crypto_amend_options_prepare(BlockDriverState *bs,
>> +                                   Error **errp)
>> +{
>> +    BlockCrypto *crypto = bs->opaque;
>> +
>> +    /* apply for exclusive read/write permissions to the underlying
>> file*/
>> +    crypto->updating_keys = true;
>> +    return bdrv_child_refresh_perms(bs, bs->file, errp);
>> +}
>> +
>> +static int
>> +block_crypto_amend_options_cleanup(BlockDriverState *bs,
>> +                                   Error **errp)
>> +{
>> +    BlockCrypto *crypto = bs->opaque;
>> +
>> +    /* release exclusive read/write permissions to the underlying file*/
>> +    crypto->updating_keys = false;
>> +    return bdrv_child_refresh_perms(bs, bs->file, errp);
>> +}
>> +
> 
> Now that I have this patch applied, it does look like it would be nicer
> if we could skip adding these functions and just reuse
> block_crypto_amend_{pre_run,cleanup}() (which would require them to call
> bdrv_child_refresh_perms()).
> 
>>   static int
>>   block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>>                                           QCryptoBlockAmendOptions
>> *amend_options,
>> @@ -798,30 +820,17 @@
>> block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>>                                           Error **errp)
>>   {
>>       BlockCrypto *crypto = bs->opaque;
>> -    int ret;
>>         assert(crypto);
>>       assert(crypto->block);
>>   -    /* apply for exclusive read/write permissions to the underlying
>> file*/
>> -    crypto->updating_keys = true;
>> -    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
>> -    if (ret) {
>> -        goto cleanup;
>> -    }
>> -
>> -    ret = qcrypto_block_amend_options(crypto->block,
>> -                                      block_crypto_read_func,
>> -                                      block_crypto_write_func,
>> -                                      bs,
>> -                                      amend_options,
>> -                                      force,
>> -                                      errp);
>> -cleanup:
>> -    /* release exclusive read/write permissions to the underlying file*/
>> -    crypto->updating_keys = false;
>> -    bdrv_child_refresh_perms(bs, bs->file, errp);
>> -    return ret;
>> +    return qcrypto_block_amend_options(crypto->block,
>> +                                       block_crypto_read_func,
>> +                                       block_crypto_write_func,
>> +                                       bs,
>> +                                       amend_options,
>> +                                       force,
>> +                                       errp);
>>   }
>>     static int
>> @@ -847,8 +856,16 @@ block_crypto_amend_options_luks(BlockDriverState
>> *bs,
>>       if (!amend_options) {
>>           goto cleanup;
>>       }
>> +
>> +    ret = block_crypto_amend_options_prepare(bs, errp);
>> +    if (ret) {
>> +        goto perm_cleanup;
>> +    }
>>       ret = block_crypto_amend_options_generic_luks(bs, amend_options,
>>                                                     force, errp);
>> +
>> +perm_cleanup:
>> +    block_crypto_amend_options_cleanup(bs, errp);
> 
> Uh, pre-existing but still dangerous.  We must not pass @errp here,
> because it may (and if we come from ..._prepare() failing, s/may/will/)
> already contain some error, and then, if this fails (which it very
> likely will not), we will get an assertion failure in error_setv().
> 
> We could decide that this must not fail and pass &error_abort (but then
> block_crypto_amend_options_cleanup() should do that), or we pass some
> new guaranteed-empty pointer and report it.
> 
> In any case, we should probably have
> block_crypto_amend_options_cleanup() (or block_crypto_amend_cleanup())
> handle this and have that function return void and no error, so we don’t
> have to worry about that here at all.

Applied all feedback on crypto and amend (patches 30, 31, 32).
All what you said makes sense.

> 
>>   cleanup:
>>       qapi_free_QCryptoBlockAmendOptions(amend_options);
>>       return ret;
>> diff --git a/job.c b/job.c
>> index 39bf511949..cf0dc9325a 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -967,11 +967,24 @@ static void coroutine_fn job_co_entry(void *opaque)
>>       aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
>>   }
>>   +static int job_pre_run(Job *job)
>> +{
>> +    assert(qemu_in_main_thread());
>> +    if (job->driver->pre_run) {
>> +        return job->driver->pre_run(job, &job->err);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   void job_start(Job *job)
>>   {
>>       assert(job && !job_started(job) && job->paused &&
>>              job->driver && job->driver->run);
>>       job->co = qemu_coroutine_create(job_co_entry, job);
>> +    if (job_pre_run(job)) {
>> +        return;
> 
> Do we not need to announce the error somehow?  Like, perhaps
> job_pre_run() should set job->ret to the value returned by .pre_run()
> (like job_co_entry() does it for .run()), and then call job_completed()
> on error (or even job_exit()? I’m not sure :/).
> 
> The way it is, it looks like the job will just basically leak on error,
> and never complete.
> 

I will do something like this:

1. move job_pre_run to run just before aio_co_enter() in job_start(),
because it must be in JOB_STATUS_RUNNING otherwise the transition status
in job_exit functions won't probably work.
Basically simulate as .run() just finished and failed.

2. change in this

+        ret = job->driver->pre_run(job, &job->err);
+        if (ret) {
+            job->ret = ret;
+            job_exit(job);
+            return ret;
+        }

basically cache the reply of pre_run, and if it's non-zero, set job->ret
and exit, just as job_co_entry does.

Thank you,
Emanuele

> Hanna
> 
>> +    }
>>       job->pause_count--;
>>       job->busy = true;
>>       job->paused = false;
> 


