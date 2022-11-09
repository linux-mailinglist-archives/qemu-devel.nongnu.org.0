Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C52622E42
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 15:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osmKK-0000F8-H2; Wed, 09 Nov 2022 09:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osmKH-0000Eo-7R; Wed, 09 Nov 2022 09:45:13 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osmKF-0001q5-7N; Wed, 09 Nov 2022 09:45:12 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E1EC15DC20;
 Wed,  9 Nov 2022 17:44:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 hcddJe3CZ1-imOu7AHR; Wed, 09 Nov 2022 17:44:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668005089; bh=6dVm1lfcOT6R9X2zd9pZ6wDot3EJPdICvA8mnLP5/JE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=PDKQtqW7g44wjPtwmIb107Ie1o4RkD2DnL/3LML8OBubSc97O8FaDLYDy+RRxYA+7
 /Ui+BL3ay7cCruwKt2/b69zC2q3oKfb7eIvlWXSgbcQdpwcPMGsn+UILsneod1eJ9g
 eCKvBc2sgvSnIG8xyIcmfp6b082+vNB17vCrDzyk=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <bf93bcbc-a6cd-95ff-dee1-7f7171a5d2de@yandex-team.ru>
Date: Wed, 9 Nov 2022 17:44:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/13] block: Remove drained_end_counter
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-5-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-5-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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
> drained_end_counter is unused now, nobody changes its value any more. It
> can be removed.
> 
> In cases where we had two almost identical functions that only differed
> in whether the caller passes drained_end_counter, or whether they would
> poll for a local drained_end_counter to reach 0, these become a single
> function.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

[..]

>   
>   /* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */

Not about this patch, but what is recursive in bdrv_drain_invoke() ?

> -static void bdrv_drain_invoke(BlockDriverState *bs, bool begin,
> -                              int *drained_end_counter)
> +static void bdrv_drain_invoke(BlockDriverState *bs, bool begin)
>   {
>       if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
>               (!begin && !bs->drv->bdrv_drain_end)) {

[..]

>   
>   /**
>    * This function does not poll, nor must any of its recursively called
> - * functions.  The *drained_end_counter pointee will be incremented
> - * once 

Seems that is wrong already after previous commit.. Not critical

> for every background operation scheduled, and decremented once
> - * the operation settles.  Therefore, the pointer must remain valid
> - * until the pointee reaches 0.  That implies that whoever sets up the
> - * pointee has to poll until it is 0.
> - *
> - * We use atomic operations to access *drained_end_counter, because
> - * (1) when called from bdrv_set_aio_context_ignore(), the subgraph of
> - *     @bs may contain nodes in different AioContexts,
> - * (2) bdrv_drain_all_end() uses the same counter for all nodes,
> - *     regardless of which AioContext they are in.
> + * functions.
>    */
>   static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
> -                                BdrvChild *parent, bool ignore_bds_parents,
> -                                int *drained_end_counter)
> +                                BdrvChild *parent, bool ignore_bds_parents)
>   {
>       BdrvChild *child;
>       int old_quiesce_counter;
>   
> -    assert(drained_end_counter != NULL);
> -

[..]

-- 
Best regards,
Vladimir


