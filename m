Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6149CF55
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:16:02 +0100 (CET)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkxl-0004b2-4y
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCkso-0001Vz-87
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCksj-00009J-ME
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643213448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV1AQe4ZLMKwQaZoC2Rjt/slBpj7sj0d7Y/iHkyJ1UM=;
 b=MKPHRuqGBhK31zikMTw+Qo1L8ndgswqjAa9NSV0jZHgeS+JMVDQFBDNKrGcohs0EJ2SWvC
 TIRlNc6eTm14Q+MEETPWLHrAvJThlPH6k06odxdKpTXy+ZNQ5vo40NmMGq9x9OVYU4ILYu
 pm9chwPvk4cYwZ2zQaen1hJ+ct+cy1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-efHwBUTcOyWTS5Lr-rSR-Q-1; Wed, 26 Jan 2022 11:10:47 -0500
X-MC-Unique: efHwBUTcOyWTS5Lr-rSR-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 q71-20020a1ca74a000000b003507f38e330so2666986wme.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 08:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vV1AQe4ZLMKwQaZoC2Rjt/slBpj7sj0d7Y/iHkyJ1UM=;
 b=npnjR0EaVYsnhISeYvtNDUguo4+3aPq4vOOn5XS8Q2jHx+ct2lNy6UCD7uGtzz5k7t
 66g+zkEVEg9M6vvw5VeMvISaFZzCwiEaiKWWhDWRCLfehv9ga4cl8qx+pm/RaIODcdNp
 j9ZA4UWdv9yer2WzgCIkdplFPDVRKKopzr1NSU5+rSa+zXslfoAz9ibH6iZSAjd6NYV0
 +uI0+9azJ7GCP/jeH3+wxMw9iEN0zfdzhNLZj8GYa1sB4vc/LHP+7U6JeHDEag2gJDvg
 SVocndpwLnWHoO2kAZWT2cx1n2yGaMeEQjPoQVJZtNvlxMZQpauL3zY0/1swo5D+q1gO
 pb0w==
X-Gm-Message-State: AOAM530qqj4TVd41w/dfa4J62SbCfg7DRgcS29/Fz3FZzZQxKoqDPBV4
 Zo3UDEvbyWQFw8DKGz1QbDslryokFpjl9OOMuWkKj5FPR7AWCvhKfuK5mf+VSNz0ioGg9dVTvc+
 M7mXEujEYMqUikMk=
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr1447712wre.492.1643213446129; 
 Wed, 26 Jan 2022 08:10:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxELqPZn28HTZKojpu4BnNmKO7esyP9cy1RbOf+6dJJFf/1CV4RLq/lSRdYyoVDwpV5UiFDww==
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr1447667wre.492.1643213445680; 
 Wed, 26 Jan 2022 08:10:45 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id v3sm12379861wru.15.2022.01.26.08.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 08:10:45 -0800 (PST)
Message-ID: <49d12b8b-cf53-06cb-de26-d4e8f03a8e04@redhat.com>
Date: Wed, 26 Jan 2022 17:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 32/33] crypto: delegate permission functions to
 JobDriver .pre_run
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-33-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-33-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> block_crypto_amend_options_generic_luks uses the block layer
> permission API, therefore it should be called with the BQL held.
>
> However, the same function is being called by two BlockDriver
> callbacks: bdrv_amend_options (under BQL) and bdrv_co_amend (I/O).
>
> The latter is I/O because it is invoked by block/amend.c's
> blockdev_amend_run(), a .run callback of the amend JobDriver
>
> Therefore we want to 1) change block_crypto driver
> to use the permission API only when the BQL is held, and
> 2) use the .pre_run JobDriver callback to check for
> permissions before switching to the job aiocontext. This has also
> the benefit of applying the same permission operation to all
> amend implementations, not only luks.
>
> Remove the permission check in block_crypto_amend_options_generic_luks()
> and:
> - Add helper functions block_crypto_amend_options_{prepare/cleanup}
>    that take care of checking permissions in
>    block_crypto_amend_options_luks(), so when it is under BQL, and
>
> - Use job->pre_run() and job->clean() to do the same thing when
>    we are in an iothread, by performing these checks before the
>    job runs in its aiocontext. So far job->pre_run() is only defined
>    but not called in job_start(), now it is the moment to use it.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/crypto.c | 57 ++++++++++++++++++++++++++++++++------------------
>   job.c          | 13 ++++++++++++
>   2 files changed, 50 insertions(+), 20 deletions(-)
>
> diff --git a/block/crypto.c b/block/crypto.c
> index f5e0c7b7c0..bdb4ba5664 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -791,6 +791,28 @@ block_crypto_amend_cleanup(BlockDriverState *bs)
>       crypto->updating_keys = false;
>   }
>   
> +static int
> +block_crypto_amend_options_prepare(BlockDriverState *bs,
> +                                   Error **errp)
> +{
> +    BlockCrypto *crypto = bs->opaque;
> +
> +    /* apply for exclusive read/write permissions to the underlying file*/
> +    crypto->updating_keys = true;
> +    return bdrv_child_refresh_perms(bs, bs->file, errp);
> +}
> +
> +static int
> +block_crypto_amend_options_cleanup(BlockDriverState *bs,
> +                                   Error **errp)
> +{
> +    BlockCrypto *crypto = bs->opaque;
> +
> +    /* release exclusive read/write permissions to the underlying file*/
> +    crypto->updating_keys = false;
> +    return bdrv_child_refresh_perms(bs, bs->file, errp);
> +}
> +

Now that I have this patch applied, it does look like it would be nicer 
if we could skip adding these functions and just reuse 
block_crypto_amend_{pre_run,cleanup}() (which would require them to call 
bdrv_child_refresh_perms()).

>   static int
>   block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>                                           QCryptoBlockAmendOptions *amend_options,
> @@ -798,30 +820,17 @@ block_crypto_amend_options_generic_luks(BlockDriverState *bs,
>                                           Error **errp)
>   {
>       BlockCrypto *crypto = bs->opaque;
> -    int ret;
>   
>       assert(crypto);
>       assert(crypto->block);
>   
> -    /* apply for exclusive read/write permissions to the underlying file*/
> -    crypto->updating_keys = true;
> -    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
> -    if (ret) {
> -        goto cleanup;
> -    }
> -
> -    ret = qcrypto_block_amend_options(crypto->block,
> -                                      block_crypto_read_func,
> -                                      block_crypto_write_func,
> -                                      bs,
> -                                      amend_options,
> -                                      force,
> -                                      errp);
> -cleanup:
> -    /* release exclusive read/write permissions to the underlying file*/
> -    crypto->updating_keys = false;
> -    bdrv_child_refresh_perms(bs, bs->file, errp);
> -    return ret;
> +    return qcrypto_block_amend_options(crypto->block,
> +                                       block_crypto_read_func,
> +                                       block_crypto_write_func,
> +                                       bs,
> +                                       amend_options,
> +                                       force,
> +                                       errp);
>   }
>   
>   static int
> @@ -847,8 +856,16 @@ block_crypto_amend_options_luks(BlockDriverState *bs,
>       if (!amend_options) {
>           goto cleanup;
>       }
> +
> +    ret = block_crypto_amend_options_prepare(bs, errp);
> +    if (ret) {
> +        goto perm_cleanup;
> +    }
>       ret = block_crypto_amend_options_generic_luks(bs, amend_options,
>                                                     force, errp);
> +
> +perm_cleanup:
> +    block_crypto_amend_options_cleanup(bs, errp);

Uh, pre-existing but still dangerous.  We must not pass @errp here, 
because it may (and if we come from ..._prepare() failing, s/may/will/) 
already contain some error, and then, if this fails (which it very 
likely will not), we will get an assertion failure in error_setv().

We could decide that this must not fail and pass &error_abort (but then 
block_crypto_amend_options_cleanup() should do that), or we pass some 
new guaranteed-empty pointer and report it.

In any case, we should probably have 
block_crypto_amend_options_cleanup() (or block_crypto_amend_cleanup()) 
handle this and have that function return void and no error, so we don’t 
have to worry about that here at all.

>   cleanup:
>       qapi_free_QCryptoBlockAmendOptions(amend_options);
>       return ret;
> diff --git a/job.c b/job.c
> index 39bf511949..cf0dc9325a 100644
> --- a/job.c
> +++ b/job.c
> @@ -967,11 +967,24 @@ static void coroutine_fn job_co_entry(void *opaque)
>       aio_bh_schedule_oneshot(qemu_get_aio_context(), job_exit, job);
>   }
>   
> +static int job_pre_run(Job *job)
> +{
> +    assert(qemu_in_main_thread());
> +    if (job->driver->pre_run) {
> +        return job->driver->pre_run(job, &job->err);
> +    }
> +
> +    return 0;
> +}
> +
>   void job_start(Job *job)
>   {
>       assert(job && !job_started(job) && job->paused &&
>              job->driver && job->driver->run);
>       job->co = qemu_coroutine_create(job_co_entry, job);
> +    if (job_pre_run(job)) {
> +        return;

Do we not need to announce the error somehow?  Like, perhaps 
job_pre_run() should set job->ret to the value returned by .pre_run() 
(like job_co_entry() does it for .run()), and then call job_completed() 
on error (or even job_exit()? I’m not sure :/).

The way it is, it looks like the job will just basically leak on error, 
and never complete.

Hanna

> +    }
>       job->pause_count--;
>       job->busy = true;
>       job->paused = false;


