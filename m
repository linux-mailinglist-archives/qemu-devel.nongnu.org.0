Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0657044E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:29:33 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtTg-0002Le-BD
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAtRO-00076l-0J; Mon, 11 Jul 2022 09:27:10 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:60002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAtRJ-0006fE-2I; Mon, 11 Jul 2022 09:27:07 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 728612E1260;
 Mon, 11 Jul 2022 16:26:53 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id rOdXfnTBgZ-QpOOgNSG; Mon, 11 Jul 2022 16:26:52 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657546012; bh=8yJT0gAhbaK9FBLsa6sYRzt8apkiUnung2166VTH0Mg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=0oqvTkFn4EMfjBt0uFjE0XeAHyfJ4baFT+NUNroBlnDEs0S/TbbStZ5yd7s9ZT5iI
 C97+WNGDbmgyl4fkm1hbpvjRwiFxeT5K9JqBpZAfwfC8wjfMsyOFeHjdOAbs/SIrow
 YJX0PquF7nXe9jSNy6Bb+gSx3oQKK86oFe+mIsuA=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1925769b-7fc1-a5f3-b9bf-9799a0656b69@yandex-team.ru>
Date: Mon, 11 Jul 2022 16:26:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 11/21] jobs: group together API calls under the same
 job lock
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
 <20220706201533.289775-12-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-12-eesposit@redhat.com>
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
> Now that the API offers also _locked() functions, take advantage
> of it and give also the caller control to take the lock and call
> _locked functions.
> 
> This makes sense especially when we have for loops, because it
> makes no sense to have:
> 
> for(job = job_next(); ...)
> 
> where each job_next() takes the lock internally.
> Instead we want
> 
> JOB_LOCK_GUARD();
> for(job = job_next_locked(); ...)
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---

[..]

>   
> diff --git a/blockjob.c b/blockjob.c
> index 0d59aba439..bce05a9096 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -99,7 +99,9 @@ static char *child_job_get_parent_desc(BdrvChild *c)
>   static void child_job_drained_begin(BdrvChild *c)
>   {
>       BlockJob *job = c->opaque;
> -    job_pause(&job->job);
> +    WITH_JOB_LOCK_GUARD() {
> +        job_pause_locked(&job->job);
> +    }

What's the reason for it? I'd keep job_pause().

(and it doesn't correspond to what commit subject presents.)

>   }
>   
>   static bool child_job_drained_poll(BdrvChild *c)
> @@ -111,8 +113,10 @@ static bool child_job_drained_poll(BdrvChild *c)
>       /* An inactive or completed job doesn't have any pending requests. Jobs
>        * with !job->busy are either already paused or have a pause point after
>        * being reentered, so no job driver code will run before they pause. */
> -    if (!job->busy || job_is_completed(job)) {
> -        return false;
> +    WITH_JOB_LOCK_GUARD() {
> +        if (!job->busy || job_is_completed_locked(job)) {
> +            return false;
> +        }
>       }

This doesn't correspond to commit subject. I'd put such things to separate commit "correct use of job_mutex in blockjob.c".

>   
>       /* Otherwise, assume that it isn't fully stopped yet, but allow the job to
> @@ -127,7 +131,9 @@ static bool child_job_drained_poll(BdrvChild *c)
>   static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
>   {
>       BlockJob *job = c->opaque;
> -    job_resume(&job->job);
> +    WITH_JOB_LOCK_GUARD() {
> +        job_resume_locked(&job->job);
> +    }
>   }

Again, don't see a reason for such change.


[my comments relate to more similar cases in the patch]


-- 
Best regards,
Vladimir

