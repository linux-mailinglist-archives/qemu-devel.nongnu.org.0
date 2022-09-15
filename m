Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995495B9DCF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 16:55:17 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqGq-000619-7p
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 10:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYqE0-0003wQ-M4; Thu, 15 Sep 2022 10:52:20 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:57398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYqDw-0003t6-Fo; Thu, 15 Sep 2022 10:52:19 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 056AB2E0A35;
 Thu, 15 Sep 2022 17:52:03 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1208::1:d] (unknown
 [2a02:6b8:b081:1208::1:d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 VTWsTzRoFo-q1PWdACH; Thu, 15 Sep 2022 17:52:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663253522; bh=hIxniqLkDZSIvbvdb1wa3js3zwfJjzdbMfWGxU+SBPE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=V6VGMREVdAVe7MzqoSCxCgcqZvFQMOrBbHY9TAZl/aLe4cddZWFWpBXf5/lUokL4F
 zcwBW1TtPawTjYwIknbgCNtnqcjtwidhvRh+U6gD7JPwxqrNdptKtzet3C05s22emT
 GoJNi/sjjM7VUBCGvD1norVIF+uYNj8nSbiGC8eI=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
Date: Thu, 15 Sep 2022 17:52:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
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
 <20220826132104.3678958-19-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220826132104.3678958-19-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/26/22 16:21, Emanuele Giuseppe Esposito wrote:
> Change the job_{lock/unlock} and macros to use job_mutex.
> 
> Now that they are not nop anymore, remove the aiocontext
> to avoid deadlocks.
> 
> Therefore:
> - when possible, remove completely the aiocontext lock/unlock pair
> - if it is used by some other function too, reduce the locking
>    section as much as possible, leaving the job API outside.
> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>    are not using the aiocontext lock anymore
> 
> The only functions that still need the aiocontext lock are the JobDriver
> callbacks, already documented in job.h. Reduce the locking section to
> only cover the callback invocation and document the functions that
> take the AioContext lock, to avoid taking it twice.
> 
> Also remove real_job_{lock/unlock}, as they are replaced by the
> public functions.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

[..]

> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -911,7 +911,6 @@ static void run_block_job(BlockJob *job, Error **errp)
>       AioContext *aio_context = block_job_get_aio_context(job);
>       int ret = 0;
>   
> -    aio_context_acquire(aio_context);
>       job_lock();
>       job_ref_locked(&job->job);
>       do {

aio_poll() call here, doesn't require aio_context to be acquired?

> @@ -936,7 +935,6 @@ static void run_block_job(BlockJob *job, Error **errp)
>       }
>       job_unref_locked(&job->job);
>       job_unlock();
> -    aio_context_release(aio_context);
>   
>       /* publish completion progress only when success */
>       if (!ret) {

[..]

In replication_stop, we call job_cancel_sync() inside aio_context_acquire - aio_context_release section. Should it be fixed?

Another question, sometimes you move job_start out of aio-context-acquire critical section, sometimes not. As I understand, it's of for job_start to be called both with acquired aio-context or not acquired?


Otherwise looks good to me!

-- 
Best regards,
Vladimir

