Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D735A623209
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 19:07:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ospSN-0004nI-De; Wed, 09 Nov 2022 13:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ospSL-0004n1-GB; Wed, 09 Nov 2022 13:05:45 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ospSI-0008CZ-Tc; Wed, 09 Nov 2022 13:05:45 -0500
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 03E9E5F92A;
 Wed,  9 Nov 2022 21:05:21 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HSrJdC9NyM-5JN8JtG6; Wed, 09 Nov 2022 21:05:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668017120; bh=wk6/1S1WjLiMo7lT7X7yb+VKKFGfnGHIHgsmylnfJQg=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Gc8XuuXTIDt6j8vYOfJaJEXAhFvdFA1jvuIXbYa/283QpDEcOALsViJZ/WtyIR+M1
 jTI+E8zKpK0Roo/mqG0z+PSi+tJdkk+Y5LY4TvlG8qQN/uTAp5n7mnAc6eyC890FPU
 PCVE+qE1rcen0XjZGGJ6kpGtM0sJ9iuk8a3axDAo=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <9fc70d98-24de-0461-cb13-864c7d77e90c@yandex-team.ru>
Date: Wed, 9 Nov 2022 21:05:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 10/13] block: Call drain callbacks only once
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-11-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-11-kwolf@redhat.com>
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
> We only need to call both the BlockDriver's callback and the parent
> callbacks when going from undrained to drained or vice versa. A second
> drain section doesn't make a difference for the driver or the parent,
> they weren't supposed to send new requests before and after the second
> drain.
> 
> One thing that gets in the way is the 'ignore_bds_parents' parameter in
> bdrv_do_drained_begin_quiesce() and bdrv_do_drained_end(): If it is true
> for the first drain, bs->quiesce_counter will be non-zero, but the
> parent callbacks still haven't been called, so a second drain where it
> is false would still have to call them.
> 
> Instead of keeping track of this, let's just get rid of the parameter.
> It was introduced in commit 6cd5c9d7b2d as an optimisation so that
> during bdrv_drain_all(), we wouldn't recursively drain all parents up to
> the root for each node, resulting in quadratic complexity. As it happens,
> calling the callbacks only once solves the same problem, so as of this
> patch, we'll still have O(n) complexity and ignore_bds_parents is not
> needed any more.
> 
> This patch only ignores the 'ignore_bds_parents' parameter. It will be
> removed in a separate patch.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c                      | 13 ++++++-------
>   block/io.c                   | 24 +++++++++++++-----------
>   tests/unit/test-bdrv-drain.c | 16 ++++++++++------
>   3 files changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 9d082631d9..8878586f6e 100644
> --- a/block.c
> +++ b/block.c
> @@ -2816,7 +2816,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>   {
>       BlockDriverState *old_bs = child->bs;
>       int new_bs_quiesce_counter;
> -    int drain_saldo;
>   
>       assert(!child->frozen);
>       assert(old_bs != new_bs);
> @@ -2827,15 +2826,13 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>       }
>   
>       new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
> -    drain_saldo = new_bs_quiesce_counter - child->parent_quiesce_counter;
>   
>       /*
>        * If the new child node is drained but the old one was not, flush
>        * all outstanding requests to the old child node.
>        */
> -    while (drain_saldo > 0 && child->klass->drained_begin) {
> +    if (new_bs_quiesce_counter && !child->parent_quiesce_counter) {

Looks like checking for child->klass->drained_begin was a wrong thing even prepatch?

Also, parent_quiesce_counter actually becomes a boolean variable.. Should we stress it by new type and name?

>           bdrv_parent_drained_begin_single(child, true);
> -        drain_saldo--;
>       }
>   
>       if (old_bs) {
> @@ -2859,7 +2856,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>            * more often.
>            */

the comment above ^^^ should be updated, we are not going to call drained_end more than once anyway

>           assert(new_bs->quiesce_counter <= new_bs_quiesce_counter);

do we still need this assertion and the comment at all?

> -        drain_saldo += new_bs->quiesce_counter - new_bs_quiesce_counter;
>   
>           if (child->klass->attach) {
>               child->klass->attach(child);
> @@ -2869,10 +2865,13 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>       /*
>        * If the old child node was drained but the new one is not, allow
>        * requests to come in only after the new node has been attached.
> +     *
> +     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
> +     * polls, which could have changed the value.
>        */
> -    while (drain_saldo < 0 && child->klass->drained_end) {
> +    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
> +    if (!new_bs_quiesce_counter && child->parent_quiesce_counter) {
>           bdrv_parent_drained_end_single(child);
> -        drain_saldo++;
>       }
>   }
>   
> diff --git a/block/io.c b/block/io.c
> index 870a25d7a5..87c7a92f15 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -62,7 +62,7 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
>   {
>       IO_OR_GS_CODE();
>   
> -    assert(c->parent_quiesce_counter > 0);
> +    assert(c->parent_quiesce_counter == 1);
>       c->parent_quiesce_counter--;
>       if (c->klass->drained_end) {
>           c->klass->drained_end(c);
> @@ -109,6 +109,7 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
>   void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
>   {
>       IO_OR_GS_CODE();
> +    assert(c->parent_quiesce_counter == 0);
>       c->parent_quiesce_counter++;
>       if (c->klass->drained_begin) {
>           c->klass->drained_begin(c);
> @@ -352,16 +353,16 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
>                                      BdrvChild *parent, bool ignore_bds_parents)
>   {
>       IO_OR_GS_CODE();
> -    assert(!qemu_in_coroutine());

why that is dropped? seems unrelated to the commit

>   
>       /* Stop things in parent-to-child order */
>       if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
>           aio_disable_external(bdrv_get_aio_context(bs));
> -    }
>   
> -    bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
> -    if (bs->drv && bs->drv->bdrv_drain_begin) {
> -        bs->drv->bdrv_drain_begin(bs);
> +        /* TODO Remove ignore_bds_parents, we don't consider it any more */
> +        bdrv_parent_drained_begin(bs, parent, false);
> +        if (bs->drv && bs->drv->bdrv_drain_begin) {
> +            bs->drv->bdrv_drain_begin(bs);
> +        }
>       }
>   }
>   
> @@ -412,13 +413,14 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
>       assert(bs->quiesce_counter > 0);
>   
>       /* Re-enable things in child-to-parent order */

the comment should be moved too, I think

> -    if (bs->drv && bs->drv->bdrv_drain_end) {
> -        bs->drv->bdrv_drain_end(bs);
> -    }
> -    bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
> -
>       old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
>       if (old_quiesce_counter == 1) {
> +        if (bs->drv && bs->drv->bdrv_drain_end) {
> +            bs->drv->bdrv_drain_end(bs);
> +        }
> +        /* TODO Remove ignore_bds_parents, we don't consider it any more */
> +        bdrv_parent_drained_end(bs, parent, false);
> +
>           aio_enable_external(bdrv_get_aio_context(bs));
>       }
>   }
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index dda08de8db..172bc6debc 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -296,7 +296,11 @@ static void test_quiesce_common(enum drain_type drain_type, bool recursive)
>   
>       do_drain_begin(drain_type, bs);
>   
> -    g_assert_cmpint(bs->quiesce_counter, ==, 1);
> +    if (drain_type == BDRV_DRAIN_ALL) {
> +        g_assert_cmpint(bs->quiesce_counter, ==, 2);
> +    } else {
> +        g_assert_cmpint(bs->quiesce_counter, ==, 1);
> +    }
>       g_assert_cmpint(backing->quiesce_counter, ==, !!recursive);
>   
>       do_drain_end(drain_type, bs);
> @@ -348,8 +352,8 @@ static void test_nested(void)
>   
>       for (outer = 0; outer < DRAIN_TYPE_MAX; outer++) {
>           for (inner = 0; inner < DRAIN_TYPE_MAX; inner++) {
> -            int backing_quiesce = (outer != BDRV_DRAIN) +
> -                                  (inner != BDRV_DRAIN);
> +            int backing_quiesce = (outer == BDRV_DRAIN_ALL) +
> +                                  (inner == BDRV_DRAIN_ALL);
>   
>               g_assert_cmpint(bs->quiesce_counter, ==, 0);
>               g_assert_cmpint(backing->quiesce_counter, ==, 0);
> @@ -359,10 +363,10 @@ static void test_nested(void)
>               do_drain_begin(outer, bs);
>               do_drain_begin(inner, bs);
>   
> -            g_assert_cmpint(bs->quiesce_counter, ==, 2);
> +            g_assert_cmpint(bs->quiesce_counter, ==, 2 + !!backing_quiesce);
>               g_assert_cmpint(backing->quiesce_counter, ==, backing_quiesce);
> -            g_assert_cmpint(s->drain_count, ==, 2);
> -            g_assert_cmpint(backing_s->drain_count, ==, backing_quiesce);
> +            g_assert_cmpint(s->drain_count, ==, 1);
> +            g_assert_cmpint(backing_s->drain_count, ==, !!backing_quiesce);
>   
>               do_drain_end(inner, bs);
>               do_drain_end(outer, bs);

-- 
Best regards,
Vladimir


