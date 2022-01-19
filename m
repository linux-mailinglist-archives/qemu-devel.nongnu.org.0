Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29A4937D6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:58:21 +0100 (CET)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7jQ-0008Rg-Bl
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7hW-0006dk-3i; Wed, 19 Jan 2022 04:56:22 -0500
Received: from [2a00:1450:4864:20::32b] (port=41520
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7hU-0006w5-HS; Wed, 19 Jan 2022 04:56:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4803166wme.0; 
 Wed, 19 Jan 2022 01:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dxup2uXOX3IJVCwJheyBCw3DSkbcpCWfPH1L2aEl1JM=;
 b=HYuJmvPgDvgC55tO8usvRnoOWOub0q0yM19iAm7PWXXYfLC+nu73tTKwzUpvi5JDZ9
 EyLnG1fW0+HcxSSZrCPZJRq1gKDMIJ3YKgsI/Td4yGPK3akJOu5ZjQ9T0P7YweN+Iknh
 LVTSZC8j7BOaF0W3o+HQRIzv6txNyr+CibeQD7TaG3xq9mB6qdzhT9uQzayHVlklI8LZ
 rY/otvalFP84lEryRho36k49jG/WEng0ublJ7I1NQyAHpJMqw7kbUL/wqUe/4wkCUF+R
 FdLMyrD0FlKi4/DnDpH6gG+JIaj67Lw4qKK+rUXR33rgwLAfX0zlV0QLwVsDh+aZFub5
 ARhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dxup2uXOX3IJVCwJheyBCw3DSkbcpCWfPH1L2aEl1JM=;
 b=juuy8HKmNP2zVQtQP2LG8cI9kCbmyaLsA+V7wwWh+G9sLeW7TQOxesV5l6Janhsqho
 sa7pEghB4GUJR21LFnI3gEVRzVSWCqb1F4FugXUYaacvnAo6GPVVU84tGbZeb9iDgySw
 EkjXkIrSgchT4v1Nr5IBPB7diaTpyzW4x5vVhDEb0SEVSU0YyayCZiSbe2J/jLMcHues
 ja3LTLHlnh3vQIl+cAOJhYQOlaLdbnUH1LkfxBk5cZhoPcnk9+KUyUmpDoG/u13hHGUQ
 lywOCVs0w51pPWjlxmA2VJwSu8+ts9QBGzvd/v7l7kE3wnQBbvOmevw9wQKRPGFxcWcq
 rzVg==
X-Gm-Message-State: AOAM531jlS/2a18USL4aRnjqGEarJEi9aJAlR4ZKqOWdXPe5r7aFuBAI
 M5buBJccJPdIzzwcXwjAXuw=
X-Google-Smtp-Source: ABdhPJzg0UmdhjeVsfhlnYIWBGpkd1n8/NAQTN9hiqdbhkAzePLLPcuSDLIXpoKNyhli6a/2aH2JdA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr19913165wrx.240.1642586175468; 
 Wed, 19 Jan 2022 01:56:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f16sm5593982wmg.48.2022.01.19.01.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:56:15 -0800 (PST)
Message-ID: <a353e5a5-2223-0bc6-325a-4c708dce24a9@redhat.com>
Date: Wed, 19 Jan 2022 10:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 01/16] job.c: make job_mutex and job_lock/unlock()
 public
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-2-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
> job mutex will be used to protect the job struct elements and list,
> replacing AioContext locks.
> 
> Right now use a shared lock for all jobs, in order to keep things
> simple. Once the AioContext lock is gone, we can introduce per-job
> locks.

Not even needed in my opinion, this is not a fast path.  But we'll see.

> To simplify the switch from aiocontext to job lock, introduce
> *nop* lock/unlock functions and macros. Once everything is protected
> by jobs, we can add the mutex and remove the aiocontext.
> 
> Since job_mutex is already being used, add static
> real_job_{lock/unlock}.

Out of curiosity, what breaks if the real job lock is used from the 
start?  (It probably should be mentioned in the commit message).


> -static void job_lock(void)
> +static void real_job_lock(void)
>   {
>       qemu_mutex_lock(&job_mutex);
>   }
>   
> -static void job_unlock(void)
> +static void real_job_unlock(void)
>   {
>       qemu_mutex_unlock(&job_mutex);
>   }

Would it work to

#define job_lock real_job_lock
#define job_unlock real_job_unlock

instead of having to do the changes below?

Paolo

> @@ -449,21 +460,21 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
>           return;
>       }
>   
> -    job_lock();
> +    real_job_lock();
>       if (job->busy) {
> -        job_unlock();
> +        real_job_unlock();
>           return;
>       }
>   
>       if (fn && !fn(job)) {
> -        job_unlock();
> +        real_job_unlock();
>           return;
>       }
>   
>       assert(!job->deferred_to_main_loop);
>       timer_del(&job->sleep_timer);
>       job->busy = true;
> -    job_unlock();
> +    real_job_unlock();
>       aio_co_enter(job->aio_context, job->co);
>   }
>   
> @@ -480,13 +491,13 @@ void job_enter(Job *job)
>    * called explicitly. */
>   static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
>   {
> -    job_lock();
> +    real_job_lock();
>       if (ns != -1) {
>           timer_mod(&job->sleep_timer, ns);
>       }
>       job->busy = false;
>       job_event_idle(job);
> -    job_unlock();
> +    real_job_unlock();
>       qemu_coroutine_yield();
>   
>       /* Set by job_enter_cond() before re-entering the coroutine.  */


