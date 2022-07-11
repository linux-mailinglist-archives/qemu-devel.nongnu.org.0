Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62385706B4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:11:32 +0200 (CEST)
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAv4N-0001S7-Gn
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAuUI-0001ta-RC; Mon, 11 Jul 2022 10:34:15 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAuUE-0007Gt-V4; Mon, 11 Jul 2022 10:34:13 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 274552E11B2;
 Mon, 11 Jul 2022 17:33:58 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id nQ1ihNXkTr-XuOWDnoL; Mon, 11 Jul 2022 17:33:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657550037; bh=5OnywEOA+waM6HhIGJ0HqwNJjMD0DyTuWElXP5z6BiU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=L2mPvbYJoWQjALrsD+U30qCUARrmW+1LVrHQDN44y3HBh3aVEdmjVOoZk8SMl9hry
 2wJ3FQprT/eP3R02NMnqCOItuzgSptGwRcr2XIuTtrq0I0K1D4S7qaffcaqkW39SHG
 XItsaWUgRarPe6mjHzuhm/bVLk/BPm08nHD0slgA=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8a559bf0-c7d4-cd76-cb42-875c685eb8bc@yandex-team.ru>
Date: Mon, 11 Jul 2022 17:33:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 15/21] job.c: enable job lock/unlock and remove
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
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-16-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-16-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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
> There is only one JobDriver callback, ->free() that assumes that
> the aiocontext lock is held (because it calls bdrv_unref), so for
> now keep that under aiocontext lock.
> 
> Also remove real_job_{lock/unlock}, as they are replaced by the
> public functions.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

[..]

>   static int job_finalize_single_locked(Job *job)
>   {
>       int job_ret;
> +    AioContext *ctx = job->aio_context;
>   
>       assert(job_is_completed_locked(job));
>   
>       /* Ensure abort is called for late-transactional failures */
>       job_update_rc_locked(job);
>   
> +    aio_context_acquire(ctx);

so here we acquire aio-context under job_mutex lock? Wouldn't that dead-lock?

> +
>       if (!job->ret) {
>           job_commit_locked(job);
>       } else {



-- 
Best regards,
Vladimir

