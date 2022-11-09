Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB587622DFE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 15:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osm6U-0004H6-2j; Wed, 09 Nov 2022 09:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osm5S-00048V-DZ; Wed, 09 Nov 2022 09:29:56 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osm5O-0004py-AW; Wed, 09 Nov 2022 09:29:54 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 28E8E60172;
 Wed,  9 Nov 2022 17:29:23 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Zc9TdBqAbL-TMNOftsD; Wed, 09 Nov 2022 17:29:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668004162; bh=ZODuOeFaxtyqTgtt2gYi4KMdbwdcldBLUkbZWcIQhF8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=JPlFpXnwUG7R5wsJRAaBRPehSMl+6AY6MswxtZWsnEJcz/Y0eFDMiM4cML8XzrUw+
 ZJurlImkwSOlnruVmG2VOEkKq4fcpvaM6KzlmizQDLwtXj1m0Vp5YzzlHuVr1Jtyqy
 nXQsMa7gwYunez2su36cYuogVB/xS/GjKwG7Upus=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <dae1878e-0311-adb0-5eb8-7dbbbf4644b9@yandex-team.ru>
Date: Wed, 9 Nov 2022 17:29:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 03/13] block: Revert .bdrv_drained_begin/end to
 non-coroutine_fn
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-4-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-4-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/8/22 15:37, Kevin Wolf wrote:
> Polling during bdrv_drained_end() can be problematic (and in the future,
> we may get cases for bdrv_drained_begin() where polling is forbidden,
> and we don't care about already in-flight requests, but just want to
> prevent new requests from arriving).
> 
> The .bdrv_drained_begin/end callbacks running in a coroutine is the only
> reason why we have to do this polling, so make them non-coroutine
> callbacks again. None of the callers actually yield any more.
> 
> This means that bdrv_drained_end() effectively doesn't poll any more,
> even if AIO_WAIT_WHILE() loops are still there (their condition is false
> from the beginning). This is generally not a problem, but in
> test-bdrv-drain, some additional explicit aio_poll() calls need to be
> added because the test case wants to verify the final state after BHs
> have executed.

So, drained_end_counter is always zero since this commit (and is removed in the next one).

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block_int-common.h | 10 ++++---
>   block.c                          |  4 +--
>   block/io.c                       | 49 +++++---------------------------
>   block/qed.c                      |  4 +--
>   block/throttle.c                 |  6 ++--
>   tests/unit/test-bdrv-drain.c     | 18 ++++++------
>   6 files changed, 30 insertions(+), 61 deletions(-)
> 

[..]

> --- a/block/qed.c
> +++ b/block/qed.c
> @@ -365,7 +365,7 @@ static void bdrv_qed_attach_aio_context(BlockDriverState *bs,
>       }
>   }
>   
> -static void coroutine_fn bdrv_qed_co_drain_begin(BlockDriverState *bs)
> +static void bdrv_qed_co_drain_begin(BlockDriverState *bs)
>   {
>       BDRVQEDState *s = bs->opaque;
>   
> @@ -1661,7 +1661,7 @@ static BlockDriver bdrv_qed = {
>       .bdrv_co_check            = bdrv_qed_co_check,
>       .bdrv_detach_aio_context  = bdrv_qed_detach_aio_context,
>       .bdrv_attach_aio_context  = bdrv_qed_attach_aio_context,
> -    .bdrv_co_drain_begin      = bdrv_qed_co_drain_begin,
> +    .bdrv_drain_begin         = bdrv_qed_co_drain_begin,

Rename to bdrv_qed_drain_begin without _co_, as for tests ?


>   };
>   
>   static void bdrv_qed_init(void)
> diff --git a/block/throttle.c b/block/throttle.c
> index 131eba3ab4..6e3ae1b355 100644
> --- a/block/throttle.c
> +++ b/block/throttle.c
> @@ -214,7 +214,7 @@ static void throttle_reopen_abort(BDRVReopenState *reopen_state)
>       reopen_state->opaque = NULL;
>   }
>   
> -static void coroutine_fn throttle_co_drain_begin(BlockDriverState *bs)
> +static void throttle_co_drain_begin(BlockDriverState *bs)

and here.

And you didn't drop coroutine_fn for throttle_co_drain_end

with that fixed:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


