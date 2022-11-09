Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B677A622911
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osig7-0001m9-89; Wed, 09 Nov 2022 05:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osifp-0001ft-4d; Wed, 09 Nov 2022 05:51:24 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osifl-0004E9-6y; Wed, 09 Nov 2022 05:51:12 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 796FF5FC12;
 Wed,  9 Nov 2022 13:50:48 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 CTn6j03csU-olOeU3cs; Wed, 09 Nov 2022 13:50:47 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667991047; bh=ejLlHY8vIyBU8Wa9dYx9fgVtgxItLlg8GiMxvG1ZXcA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=dxh62XTBHxfaIQoDqgWUYsak/dAjRGZdG3fIyqS0cGwGOtC/0nB3A+y28nYIMb6PK
 vTIT2DUnnMC9zC3QlQMDPM/yAxBENQpURLp4I9ZIDZ3aKRrBWA8mRq5TEcZf8amLCf
 onD1bgEB3nbEG/wzB9yCK0VbfsDjG9Xg9/HDxKqA=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7c2df33b-c7a2-6ed6-d198-1e70c1a009d5@yandex-team.ru>
Date: Wed, 9 Nov 2022 13:50:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/13] test-bdrv-drain: Don't yield in
 .bdrv_co_drained_begin/end()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-3-kwolf@redhat.com>
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

On 11/8/22 15:37, Kevin Wolf wrote:
> We want to change .bdrv_co_drained_begin/end() back to be non-coroutine
> callbacks, so in preparation, avoid yielding in their implementation.
> 
> This does almost the same as the existing logic in bdrv_drain_invoke(),
> by creating and entering coroutines internally. However, since the test
> case is by far the heaviest user of coroutine code in drain callbacks,
> it is preferable to have the complexity in the test case rather than the
> drain core, which is already complicated enough without this.
> 
> The behaviour for bdrv_drain_begin() is unchanged because we increase
> bs->in_flight and this is still polled. However, bdrv_drain_end()
> doesn't wait for the spawned coroutine to complete any more. This is
> fine, we don't rely on bdrv_drain_end() restarting all operations
> immediately before the next aio_poll().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/unit/test-bdrv-drain.c | 64 ++++++++++++++++++++++++++----------
>   1 file changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index 09dc4a4891..24f34e24ad 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -38,12 +38,22 @@ typedef struct BDRVTestState {
>       bool sleep_in_drain_begin;
>   } BDRVTestState;
>   
> +static void coroutine_fn sleep_in_drain_begin(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +
> +    qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
> +    bdrv_dec_in_flight(bs);
> +}
> +
>   static void coroutine_fn bdrv_test_co_drain_begin(BlockDriverState *bs)
>   {
>       BDRVTestState *s = bs->opaque;
>       s->drain_count++;
>       if (s->sleep_in_drain_begin) {
> -        qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
> +        Coroutine *co = qemu_coroutine_create(sleep_in_drain_begin, bs);
> +        bdrv_inc_in_flight(bs);
> +        aio_co_enter(bdrv_get_aio_context(bs), co);
>       }
>   }
>   
> @@ -1916,6 +1926,21 @@ static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static void coroutine_fn bdrv_replace_test_drain_co(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +    BDRVReplaceTestState *s = bs->opaque;
> +
> +    /* Keep waking io_co up until it is done */
> +    while (s->io_co) {
> +        aio_co_wake(s->io_co);
> +        s->io_co = NULL;
> +        qemu_coroutine_yield();
> +    }
> +    s->drain_co = NULL;
> +    bdrv_dec_in_flight(bs);
> +}

Same question, don't we need aio_wait_kick() after decrement in_flight.

Also, seems we have here extra waiting level: a special coroutine that waits in a loop.

Could we just do in .drain_begin:

if (s->io_co) {
    bdrv_inc_in_flight(bs);
}

and in .co_preadv instead of waking s->drain_co simply

if (s->drain_count == 1) {
   bdrv_dec_in_flight(bs);
   aio_wait_kick();
}


or even better, do inc in_flight when io_co becomes not NULL.

> +
>   /**
>    * If .drain_count is 0, wake up .io_co if there is one; and set
>    * .was_drained.
> @@ -1926,20 +1951,27 @@ static void coroutine_fn bdrv_replace_test_co_drain_begin(BlockDriverState *bs)
>       BDRVReplaceTestState *s = bs->opaque;
>   
>       if (!s->drain_count) {
> -        /* Keep waking io_co up until it is done */
> -        s->drain_co = qemu_coroutine_self();
> -        while (s->io_co) {
> -            aio_co_wake(s->io_co);
> -            s->io_co = NULL;
> -            qemu_coroutine_yield();
> -        }
> -        s->drain_co = NULL;
> -
> +        s->drain_co = qemu_coroutine_create(bdrv_replace_test_drain_co, bs);
> +        bdrv_inc_in_flight(bs);
> +        aio_co_enter(bdrv_get_aio_context(bs), s->drain_co);
>           s->was_drained = true;
>       }
>       s->drain_count++;
>   }
>   
> +static void coroutine_fn bdrv_replace_test_read_entry(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +    char data;
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
> +    int ret;
> +
> +    /* Queue a read request post-drain */
> +    ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
> +    g_assert(ret >= 0);
> +    bdrv_dec_in_flight(bs);
> +}
> +
>   /**
>    * Reduce .drain_count, set .was_undrained once it reaches 0.
>    * If .drain_count reaches 0 and the node has a backing file, issue a
> @@ -1951,17 +1983,13 @@ static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
>   
>       g_assert(s->drain_count > 0);
>       if (!--s->drain_count) {
> -        int ret;
> -
>           s->was_undrained = true;
>   
>           if (bs->backing) {
> -            char data;
> -            QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
> -
> -            /* Queue a read request post-drain */
> -            ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
> -            g_assert(ret >= 0);
> +            Coroutine *co = qemu_coroutine_create(bdrv_replace_test_read_entry,
> +                                                  bs);
> +            bdrv_inc_in_flight(bs);
> +            aio_co_enter(bdrv_get_aio_context(bs), co);
>           }
>       }
>   }

-- 
Best regards,
Vladimir


