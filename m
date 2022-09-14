Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6F5B8988
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:55:54 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSrp-0006lT-7z
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYRdd-0002eN-Gs; Wed, 14 Sep 2022 08:37:09 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:60420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYRdZ-0000hX-3D; Wed, 14 Sep 2022 08:37:08 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 608782E1308;
 Wed, 14 Sep 2022 15:36:52 +0300 (MSK)
Received: from [172.31.103.133] (172.31.103.133-vpn.dhcp.yndx.net
 [172.31.103.133])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 36nxhuGh1d-apOSw7RN; Wed, 14 Sep 2022 15:36:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663159011; bh=clTQshszlYk7bRW2bUKnSLJO1a/UQNWLHrNHS6Kpduk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=xSswUkJbCXwTLUhL3+K30WrFkRZjv80n3TKEZUhOFIka8Yqk25oYOUDp88tcn0Blk
 q0h/rvmQN3us0mM3IWUvmTgUaXAdIVp45zKje15gXRBZDo5HTPwKzNgKtpTrjBGDkF
 C88UkzqP2Jo3r53z7aY1/sFwbvR+UDwBzxXK5E2g=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7f6282ea-b2ce-ac87-b099-446bfccbd194@yandex-team.ru>
Date: Wed, 14 Sep 2022 15:36:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 11/21] jobs: group together API calls under the same
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
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-12-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220826132104.3678958-12-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 8/26/22 16:20, Emanuele Giuseppe Esposito wrote:
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
> In addition, protect also direct field accesses, by either creating a
> new critical section or widening the existing ones.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   block.c            | 17 ++++++++++-------
>   blockdev.c         | 14 ++++++++++----
>   blockjob.c         | 35 ++++++++++++++++++++++-------------
>   job-qmp.c          |  9 ++++++---
>   job.c              |  7 +++++--
>   monitor/qmp-cmds.c |  7 +++++--
>   qemu-img.c         | 17 +++++++++++------
>   7 files changed, 69 insertions(+), 37 deletions(-)
> 

[..]

> diff --git a/job.c b/job.c
> index dcd561fd46..e336af0c1c 100644
> --- a/job.c
> +++ b/job.c

job.c hunks are unrelated in this patch, they should go to patch 05.

> @@ -672,7 +672,7 @@ void coroutine_fn job_pause_point(Job *job)
>       job_pause_point_locked(job);
>   }
>   
> -void job_yield_locked(Job *job)
> +static void job_yield_locked(Job *job)
>   {
>       assert(job->busy);
>   
> @@ -1046,11 +1046,14 @@ static void job_completed_txn_abort_locked(Job *job)
>   /* Called with job_mutex held, but releases it temporarily */
>   static int job_prepare_locked(Job *job)
>   {
> +    int ret;
> +
>       GLOBAL_STATE_CODE();
>       if (job->ret == 0 && job->driver->prepare) {
>           job_unlock();
> -        job->ret = job->driver->prepare(job);
> +        ret = job->driver->prepare(job);
>           job_lock();
> +        job->ret = ret;
>           job_update_rc_locked(job);
>       }
>       return job->ret;
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 7314cd813d..81c8fdadf8 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -135,8 +135,11 @@ void qmp_cont(Error **errp)
>           blk_iostatus_reset(blk);
>       }
>   
> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> -        block_job_iostatus_reset(job);
> +    WITH_JOB_LOCK_GUARD() {
> +        for (job = block_job_next_locked(NULL); job;
> +             job = block_job_next_locked(job)) {
> +            block_job_iostatus_reset_locked(job);
> +        }
>       }
>   
>       /* Continuing after completed migration. Images have been inactivated to
> diff --git a/qemu-img.c b/qemu-img.c
> index 7d4b33b3da..c8ae704166 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **errp)
>       int ret = 0;
>   
>       aio_context_acquire(aio_context);
> -    job_ref(&job->job);
> +    job_lock();
> +    job_ref_locked(&job->job);
>       do {
>           float progress = 0.0f;
> +        job_unlock();
>           aio_poll(aio_context, true);
>   
>           progress_get_snapshot(&job->job.progress, &progress_current,
> -                              &progress_total);
> +                                &progress_total);

broken indentation

>           if (progress_total) {
>               progress = (float)progress_current / progress_total * 100.f;
>           }
>           qemu_progress_print(progress, 0);
> -    } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
> +        job_lock();
> +    } while (!job_is_ready_locked(&job->job) &&
> +                !job_is_completed_locked(&job->job));

and here

>   
> -    if (!job_is_completed(&job->job)) {
> -        ret = job_complete_sync(&job->job, errp);
> +    if (!job_is_completed_locked(&job->job)) {
> +        ret = job_complete_sync_locked(&job->job, errp);
>       } else {
>           ret = job->job.ret;
>       }
> -    job_unref(&job->job);
> +    job_unref_locked(&job->job);
> +    job_unlock();
>       aio_context_release(aio_context);
>   
>       /* publish completion progress only when success */


-- 
Best regards,
Vladimir

