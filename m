Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1135978C6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 23:15:02 +0200 (CEST)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOQNR-00085Q-3A
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 17:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOQLe-00066S-BJ; Wed, 17 Aug 2022 17:13:10 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:60078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOQLa-0005eQ-SW; Wed, 17 Aug 2022 17:13:09 -0400
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C36FC2E0C37;
 Thu, 18 Aug 2022 00:12:54 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4a5::1:13] (unknown
 [2a02:6b8:b081:b4a5::1:13])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 a3OUsp1Tsc-CrOm887R; Thu, 18 Aug 2022 00:12:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660770774; bh=zL0qu66e05lmV/+GWORtJja5ts1tPKNpolVi14yCkNo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=FY1MrXsh+4r+Mg7sgnRhwKdIu+i8VfoDW6zOSr/V1RZryNmgYvyrSM+Ho4VwfqoEd
 qYkaF1g+Trltoncct0JRlj+doZqGt2/0+BvIrRj3jHf+PEp6pkJf/VZQZiWFUV+xKz
 uzwVibidEwvBtIpkXKnBvZx3Sq98erNiKH9pkook=
Authentication-Results: vla5-d6d5ce7a4718.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <01310460-412d-32cf-4df8-8d3f6adb733c@yandex-team.ru>
Date: Thu, 18 Aug 2022 00:12:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 8/8] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-9-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220815090216.1818622-9-alexander.ivanov@virtuozzo.com>
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

On 8/15/22 12:02, Alexander Ivanov wrote:
> Replace the way we use mutex in parallels_co_check() for simplier
> and less error prone code.
> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
> v2: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.
> v3: Fix commit message.
> 
>   block/parallels.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index d0364182bb..e124a8bb7d 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -553,24 +553,22 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       BDRVParallelsState *s = bs->opaque;
>       int ret;
>   
> -    qemu_co_mutex_lock(&s->lock);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        parallels_check_unclean(bs, res, fix);
>   
> -    parallels_check_unclean(bs, res, fix);
> +        ret = parallels_check_outside_image(bs, res, fix);
> +        if (ret < 0) {
> +            return ret;
> +        }
>   
> -    ret = parallels_check_outside_image(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> -
> -    ret = parallels_check_leak(bs, res, fix);
> -    if (ret < 0) {
> -        goto out;
> -    }
> +        ret = parallels_check_leak(bs, res, fix);
> +        if (ret < 0) {
> +            return ret;
> +        }
>   
> -    parallels_collect_statistics(bs, res, fix);
> +        parallels_collect_statistics(bs, res, fix);
>   
> -out:
> -    qemu_co_mutex_unlock(&s->lock);
> +    }
>   
>       ret = bdrv_co_flush(bs);
>       if (ret < 0) {

Aha, and here you silently fix the problem I noted in patch 3. Still, all patches should be correct, so this should be rebased onto fixed patch 3.

The final look of parallels_co_check is good.


-- 
Best regards,
Vladimir

