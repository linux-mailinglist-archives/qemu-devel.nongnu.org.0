Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8356C113
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 21:28:05 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9te0-0004iP-1c
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 15:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o9tbq-0003dP-3G; Fri, 08 Jul 2022 15:25:50 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:33248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o9tbm-0000fP-Ba; Fri, 08 Jul 2022 15:25:48 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 4B6742E1320;
 Fri,  8 Jul 2022 22:25:32 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8001::1:0] (unknown
 [2a02:6b8:b081:8001::1:0])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vzlv8o23Fq-PUOK4KPh; Fri, 08 Jul 2022 22:25:31 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657308331; bh=1ylztOPu/Zxrszb7YtwIiU7UWznr1/E0Sn7Y4lHqXNg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=p8wY5IHwqv1QqvOAZxi62op23ukOGLj0GpJ5VVtpV47vCcsW8CCRpU2zzHrGeKo5K
 vgwR4GqtPnHYomkMmdqJG71hJ/P19U6a7bzUFAb1Qma/OpDxJHeeQcnU8Et9luJ9sy
 wsLfDljqyn07uNqebiXdOvkeOjE6ms4gv75WCupA=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1c7b5083-01eb-f53d-4b3e-fae0e630cea2@yandex-team.ru>
Date: Fri, 8 Jul 2022 22:25:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 05/21] job.c: add job_lock/unlock while keeping job.h
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
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-6-eesposit@redhat.com>
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

On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
> With "intact" we mean that all job.h functions implicitly
> take the lock. Therefore API callers are unmodified.
> 
> This means that:
> - many static functions that will be always called with job lock held
>    become _locked, and call _locked functions
> - all public functions take the lock internally if needed, and call _locked
>    functions
> - all public functions called internally by other functions in job.c will have a
>    _locked counterpart (sometimes public), to avoid deadlocks (job lock already taken).
>    These functions are not used for now.
> - some public functions called only from exernal files (not job.c) do not
>    have _locked() counterpart and take the lock inside. Others won't need
>    the lock at all because use fields only set at initialization and
>    never modified.
> 
> job_{lock/unlock} is independent from real_job_{lock/unlock}.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

I think, we still lack some comments on function lock-related interface, but it may be improved later.

[..]

>   
> -static int job_txn_apply(Job *job, int fn(Job *))
> +/* Called with job_mutex held, but releases it temporarily. */

Hmm. Yes, it may release it temprorarily when fn() release it.. Not very clear but OK..

> +static int job_txn_apply_locked(Job *job, int fn(Job *))
>   {
>       AioContext *inner_ctx;
>       Job *other_job, *next;
> @@ -170,7 +182,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
>        * we need to release it here to avoid holding the lock twice - which would
>        * break AIO_WAIT_WHILE from within fn.
>        */
> -    job_ref(job);
> +    job_ref_locked(job);
>       aio_context_release(job->aio_context);
>   

[..]

> +
>   static bool job_started(Job *job)

So we can call it both with mutex locked and without. Hope it never race with job_start.

>   {
>       return job->co;
>   }
>   
> -static bool job_should_pause(Job *job)
> +/* Called with job_mutex held. */

[..]

>   
> -/** Useful only as a type shim for aio_bh_schedule_oneshot. */
> +/**
> + * Useful only as a type shim for aio_bh_schedule_oneshot.
> + * Called with job_mutex *not* held, but releases it temporarily.

", but releases it temprorarily" is misleading for me. If called with mutext not held, then "releases it temprorarily" is not part of function interface.. Many functions that take some mutex internally do release it temporarily and callers should not care of it.

So, better just "Called with job_mutex *not* held."

> + */
>   static void job_exit(void *opaque)
>   {
>       Job *job = (Job *)opaque;
>       AioContext *ctx;
> +    JOB_LOCK_GUARD();
>   



-- 
Best regards,
Vladimir

