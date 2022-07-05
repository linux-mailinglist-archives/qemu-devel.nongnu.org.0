Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A654E5667D3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:24:55 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fji-0000jl-M8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8fiG-0008LA-Fk; Tue, 05 Jul 2022 06:23:24 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:50200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8fiC-0003fz-IT; Tue, 05 Jul 2022 06:23:23 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 705472E130F;
 Tue,  5 Jul 2022 13:23:10 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 cF2XQeWYrz-N8J4OvEJ; Tue, 05 Jul 2022 13:23:10 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657016590; bh=eB8rou8DIlPCOOhwUePvYbgZmIQu038VeLZ8nCFYT/4=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=WfIR+ebaO+ZnJnb6iFBnp2Kz81P5I0hREEaDcIFSPV8uFwArPphIk40mZt0eVoe+6
 Tv0w2BzGnlxaasfKBV5WyhqRmfgy2JskvKJ7cOoKtyzd8soiBO3fYQS3HXzm0sc7D9
 1ytO84qPLvj1S4eiSgXW0HDLTHbBMeHmHb03xwIw=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [10.211.91.215] (10.211.91.215-vpn.dhcp.yndx.net
 [10.211.91.215])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 gfT2DxtDvS-N7Pqqv8Y; Tue, 05 Jul 2022 13:23:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <df24032a-bbf6-72d3-a307-5a4771be843d@yandex-team.ru>
Date: Tue, 5 Jul 2022 13:23:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 05/20] job.c: add job_lock/unlock while keeping job.h
 intact
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220629141538.3400679-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In general looks good to me.

On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
> With "intact" we mean that all job.h functions implicitly
> take the lock. Therefore API callers are unmodified.
> 
> This means that:
> - all static functions become _locked, and call _locked functions

Some static functions don't have _locked prefix.. That's, maybe, not wrong. But it contradicts with commit message and looks inconsistent.

For example job_started and job_should_pause are similar simple getters, job_shoud_pause is updated to be _locked, but job_started is not updated..



job_exit, job_co_entry are correct exclusions

> - all public functions take the lock internally, and call _locked
>    functions

may be just, "all public function take the lock internally if needed", as some public funcitons don't need the lock, like job_txn_new or job_progress_* functions

> - all public functions called internally by other functions in job.c will have a
>    _locked counterpart, to avoid deadlocks (job lock already taken)

counterparts sometimes made public and are unused for now. That's OK, just mention.

> - public functions called only from exernal files (not job.c) do not
>    have _locked() counterpart and take the lock inside

Some small public functions still don't take the lock inside and don't have _locked() prefix.

job_is_internal
job_type
job_type_str


job_sleep_timer_cb is static, but it's called only by external source, so it should take lock inside, like public functions. (and like job_exit)

job_pause_point_locked, job_user_resume_locked, job_complete_locked: need to mention in a comment, that function may temporarily unlock the mutex

Also, the commennt "realeases it temporarily" should be propagated to all _locked callers of the function

> 
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*
> 
> .Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/job.h |  73 +++++-
>   job.c              | 607 +++++++++++++++++++++++++++++++--------------

[..]

>   
> -    AIO_WAIT_WHILE(job->aio_context,
> -                   (job_enter(job), !job_is_completed(job)));
> +    job_unlock();
> +    AIO_WAIT_WHILE_UNLOCKED(job->aio_context,
> +                            (job_enter(job), !job_is_completed(job)));

Is it correct here to move to UNLOCKED wait? We don't touch any other aio-context related things in this patch..

Even if it's OK, it should be in another commit I think.

> +    job_lock();
>   
> -    ret = (job_is_cancelled(job) && job->ret == 0) ? -ECANCELED : job->ret;
> -    job_unref(job);
> +    ret = (job_is_cancelled_locked(job) && job->ret == 0)
> +          ? -ECANCELED : job->ret;
> +    job_unref_locked(job);
>       return ret;
>   }
> +
> +int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
> +{
> +    JOB_LOCK_GUARD();
> +    return job_finish_sync_locked(job, finish, errp);
> +}
> \ No newline at end of file

No newline at end of file... I think, good to add one)

-- 
Best regards,
Vladimir

