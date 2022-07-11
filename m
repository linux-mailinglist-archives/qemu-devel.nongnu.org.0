Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D154757068D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:04:00 +0200 (CEST)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAux5-0006NS-DN
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAulO-0001y3-U8; Mon, 11 Jul 2022 10:51:54 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAulN-0002Pb-4z; Mon, 11 Jul 2022 10:51:54 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2E0592E127F;
 Mon, 11 Jul 2022 17:51:43 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id fAOXqL5dKr-pfOWasLq; Mon, 11 Jul 2022 17:51:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657551102; bh=uAUTjHKrRCLIhQe0kG/FRRocxSkAZTw8IZu6S8PsTa4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=zn3itA0/u3HxtOtvA0xGzdhN84yQ3FKWwn5+3LkajCuHpBeGqS1+Tn1q3Sj1LU0la
 LI5CG4MfiGtuymiHCUMY1NXUszMyCWRYqEYdKjf0jeN2+WqMOvbEYhuiu2W5BQLNau
 zLVEBjyYsdq0M5qiH0sllldSLGa3MkmTysNdgW7Q=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <00b8b101-b36f-2204-0e49-1c605268b793@yandex-team.ru>
Date: Mon, 11 Jul 2022 17:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 19/21] blockjob: protect iostatus field in BlockJob
 struct
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
 <20220706201533.289775-20-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-20-eesposit@redhat.com>
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
> iostatus is the only field (together with .job) that needs
> protection using the job mutex.
> 
> It is set in the main loop (GLOBAL_STATE functions) but read
> in I/O code (block_job_error_action).
> 
> In order to protect it, change block_job_iostatus_set_err
> to block_job_iostatus_set_err_locked(), always called under
> job lock.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Seems, that (and previous) patch should go before 15.

> ---
>   blockjob.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index a2559b97a7..893c8ff08e 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -367,7 +367,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>       return block_job_query_locked(job, errp);
>   }
>   
> -static void block_job_iostatus_set_err(BlockJob *job, int error)
> +/* Called with job lock held */
> +static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
>   {
>       if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>           job->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
> @@ -586,8 +587,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
>                    */
>                   job->job.user_paused = true;
>               }
> +            block_job_iostatus_set_err_locked(job, error);
>           }
> -        block_job_iostatus_set_err(job, error);
>       }
>       return action;
>   }


-- 
Best regards,
Vladimir

