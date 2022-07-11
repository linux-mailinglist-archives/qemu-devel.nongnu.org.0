Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8B5706C3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:13:40 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAv6R-0004gJ-2x
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAuee-0008BJ-7b; Mon, 11 Jul 2022 10:44:56 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:55940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oAueb-0000wa-DI; Mon, 11 Jul 2022 10:44:55 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 7CC082E128A;
 Mon, 11 Jul 2022 17:44:42 +0300 (MSK)
Received: from [10.211.6.101] (10.211.6.101-vpn.dhcp.yndx.net [10.211.6.101])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id YTYBxNItZG-ieOiZZUp; Mon, 11 Jul 2022 17:44:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657550681; bh=KZoLfSanT7YOhZUejBr9CKZNQjsaL1CBEFn0e/NMbLE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=f3Xvlq260Lii1EEjV2yfcwjr20G9e8mr4lkRpTWkuWL1rhu+JcocYGcQuEjns/QJZ
 364V2EL+h5YFbOIZap0F+Bg/IkhByFDPZsLEjweXLl0f6DOvpI1LCnNXUP//c9si8M
 B3L+h3LJKT7dNOcrDt68TEaRTBD1KJXJYGIDTNiM=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <35baa5a3-2427-8268-a699-4db6c3f73e37@yandex-team.ru>
Date: Mon, 11 Jul 2022 17:44:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 17/21] blockjob.h: categorize fields in struct BlockJob
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
 <20220706201533.289775-18-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220706201533.289775-18-eesposit@redhat.com>
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
> The same job lock is being used also to protect some of blockjob fields.
> Categorize them just as done in job.h.

Thanks!

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/block/blockjob.h | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> index 8b65d3949d..912e10b083 100644
> --- a/include/block/blockjob.h
> +++ b/include/block/blockjob.h
> @@ -40,10 +40,16 @@ typedef struct BlockJobDriver BlockJobDriver;
>    * Long-running operation on a BlockDriverState.
>    */
>   typedef struct BlockJob {
> -    /** Data belonging to the generic Job infrastructure */
> +    /**
> +     * Data belonging to the generic Job infrastructure.
> +     * Protected by job mutex.
> +     */
>       Job job;
>   
> -    /** Status that is published by the query-block-jobs QMP API */
> +    /**
> +     * Status that is published by the query-block-jobs QMP API.
> +     * Protected by job mutex.
> +     */
>       BlockDeviceIoStatus iostatus;
>   
>       /** Speed that was set with @block_job_set_speed.  */
> @@ -55,6 +61,8 @@ typedef struct BlockJob {
>       /** Block other operations when block job is running */
>       Error *blocker;
>   
> +    /** All notifiers are set once in block_job_create() and never modified. */
> +
>       /** Called when a cancelled job is finalised. */
>       Notifier finalize_cancelled_notifier;
>   
> @@ -70,7 +78,10 @@ typedef struct BlockJob {
>       /** Called when the job coroutine yields or terminates */
>       Notifier idle_notifier;
>   
> -    /** BlockDriverStates that are involved in this block job */
> +    /**
> +     * BlockDriverStates that are involved in this block job.
> +     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE)
> +     */
>       GSList *nodes;
>   } BlockJob;
>   

Can we also add GLOBAL_STATE_CODE();  marker into child_job_can_set_aio_ctx() and child_job_set_aio_ctx() ?

Anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

