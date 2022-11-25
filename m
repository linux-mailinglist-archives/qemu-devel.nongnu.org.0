Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758EE638E12
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 17:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oybFH-0008Le-L3; Fri, 25 Nov 2022 11:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oybFE-0008Ks-KG; Fri, 25 Nov 2022 11:08:04 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oybF7-00088l-T9; Fri, 25 Nov 2022 11:08:03 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 3DB315FEE6;
 Fri, 25 Nov 2022 19:07:46 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id i7P1810NpKo1-1INB6PgF; Fri, 25 Nov 2022 19:07:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669392465; bh=HTSYWA1QmdrYR1iMv4mzE+Q9t4Wp50ZwXIhgIxS1wGE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=r44BihrexuogwIutbEdfVA91msw/G/oeU4baDWqHPsmLmDCY8EQB5DXMrqc+SaBdB
 It2t4kH+aOy04lZZNekE4UTF/VkFMuclHJR+osokc8gQnfvQRMtG0FNkRnyNoUc6Be
 QKa8/V/UPLttXihzcodIyH2SXmKObFMwI03eHBbI=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <cb7e7810-549c-adba-1eaa-184fd67bd71a@yandex-team.ru>
Date: Fri, 25 Nov 2022 19:07:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-15-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221118174110.55183-15-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 11/18/22 20:41, Kevin Wolf wrote:
> In order to make sure that bdrv_replace_child_noperm() doesn't have to
> poll any more, get rid of the bdrv_parent_drained_begin_single() call.
> 
> This is possible now because we can require that the parent is already
> drained through the child in question when the function is called and we
> don't call the parent drain callbacks more than once.
> 
> The additional drain calls needed in callers cause the test case to run
> its code in the drain handler too early (bdrv_attach_child() drains
> now), so modify it to only enable the code after the test setup has
> completed.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

It's still hard to keep this all in mind, so weak:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   include/block/block-io.h     |   8 +++
>   block.c                      | 103 ++++++++++++++++++++++++++++++-----
>   block/io.c                   |   2 +-
>   tests/unit/test-bdrv-drain.c |  10 ++++
>   4 files changed, 108 insertions(+), 15 deletions(-)
> 
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 8f5e75756a..65e6d2569b 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -292,6 +292,14 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>    */
>   void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
>   
> +/**
> + * bdrv_parent_drained_poll_single:
> + *
> + * Returns true if there is any pending activity to cease before @c can be
> + * called quiesced, false otherwise.
> + */
> +bool bdrv_parent_drained_poll_single(BdrvChild *c);
> +
>   /**
>    * bdrv_parent_drained_end_single:
>    *
> diff --git a/block.c b/block.c
> index d18512944d..3f12aba6ce 100644
> --- a/block.c
> +++ b/block.c

[..]

> @@ -2863,11 +2905,9 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>       }
>   
>       /*
> -     * If the old child node was drained but the new one is not, allow
> -     * requests to come in only after the new node has been attached.
> -     *
> -     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
> -     * polls, which could have changed the value.
> +     * If the parent was drained through this BdrvChild previously, but new_bs
> +     * is not drained, allow requests to come in only after the new node has
> +     * been attached.

As I understand,the main reason why we MUST do this automatic undrain, is the contract with the user:

User things that:

1. It's enough to drain node X to drain all its parents (thanks to recursion)
2. User should undrain exactly same nodes that was drained by hand, everything that was drained automatically would be automatically undrained.

So here we break the connection between X and its parent, therefore recursion will not help on final undrain. So, we should do the automation here.



I have an idea how to (probably) make things even more simple.

1. drop .quiesced_parent

2. consider the Full graph, including non-bds parents, and support having .quiesce_counter for non-bds parents. (probably need some structure to unify bds and non-bds nodes of the Full graph - Generic ndoe, that's not the first time we are saying about that)

3. drop any recursion and automatic drain/undrain

4. user is responsible to drain all the nodes and their parents as needed to proceed with some block graph modification

5. user keeps the list of all nodes that was drained to undrain them in the end

6. node may be drained only when all its parents are already drained (add an assertion)


And of course we need helpers for the user to do 4-6. That should work similar to permissions update. Add a function to produce a topologically sorted list of Generic nodes (starting from some node and include all its parents and their parents and so on), and  simple functions that to drain/undrain of such list in a loop.



-- 
Best regards,
Vladimir


