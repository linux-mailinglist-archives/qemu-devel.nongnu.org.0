Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46C5829B1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:34:19 +0200 (CEST)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGj3B-0004Sj-GC
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGiyj-0001ce-LY; Wed, 27 Jul 2022 11:29:41 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:47168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGiyf-0005a8-Fd; Wed, 27 Jul 2022 11:29:40 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 808F72E1FC5;
 Wed, 27 Jul 2022 18:29:24 +0300 (MSK)
Received: from [10.211.19.155] (10.211.19.155-vpn.dhcp.yndx.net
 [10.211.19.155])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 X2qXzrLaWw-TMPajtEf; Wed, 27 Jul 2022 18:29:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658935763; bh=S6myq1jqoV6qyYRnkUw2e1OYQEIBdz/DnTEoU4xd35E=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=aWmIDjG73h5Sxb1sKrD3itwT1ofYDwkA+r4BhLHU2V5b/bo8aH/Ca3+dsynxuSkJc
 5Ml45mznTFNa6EIZAtr2NK6WWJ7GIkTM/zEEwgTVyiFDw/K3Lqivm2YY3i03E5JmhC
 V12F+6XuXsVb50fGfjaSeBQLmAsNeBr8tZHalcT0=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <41d4b19d-f0c1-99dd-b5c5-735694241dcc@yandex-team.ru>
Date: Wed, 27 Jul 2022 18:29:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v10 17/21] blockjob: protect iostatus field in BlockJob
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
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-18-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220725073855.76049-18-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

On 7/25/22 10:38, Emanuele Giuseppe Esposito wrote:
> iostatus is the only field (together with .job) that needs
> protection using the job mutex.
> 
> It is set in the main loop (GLOBAL_STATE functions) but read
> in I/O code (block_job_error_action).

Hmm, block_job_error_action doesn't read iostatus..

Also, iostatus is read by by mirror_run, which is not protected.

> 
> In order to protect it, change block_job_iostatus_set_err
> to block_job_iostatus_set_err_locked(), always called under
> job lock.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockjob.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index 0663faee2c..448bdb5a53 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -363,7 +363,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
>       return block_job_query_locked(job, errp);
>   }
>   
> -static void block_job_iostatus_set_err(BlockJob *job, int error)
> +/* Called with job lock held */
> +static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
>   {
>       if (job->iostatus == BLOCK_DEVICE_IO_STATUS_OK) {
>           job->iostatus = error == ENOSPC ? BLOCK_DEVICE_IO_STATUS_NOSPACE :
> @@ -577,8 +578,8 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
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

