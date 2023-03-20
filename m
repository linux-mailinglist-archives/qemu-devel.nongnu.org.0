Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F666C0EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:33:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCnc-0004to-Re; Mon, 20 Mar 2023 06:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peCnY-0004tG-E2; Mon, 20 Mar 2023 06:31:28 -0400
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1peCnV-0004KB-N4; Mon, 20 Mar 2023 06:31:28 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0d:3786:0:640:7c97:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id E101F601A3;
 Mon, 20 Mar 2023 13:31:14 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b71c::1:38] (unknown
 [2a02:6b8:b081:b71c::1:38])
 by mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id DVlKir0h9W20-Ehw6NFIl; Mon, 20 Mar 2023 13:31:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1679308274; bh=AV8985OHD3YEPp6/LVBVsTqA5wmbu/CyDzkalq7ZAAo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=tProonWBi0IFBIT3DaXb9j2YhgtSefXzNy/3xt1B+GUy52UG9q5jnH6P846V9JqtN
 AFWW45OIm88AqbnbNyjo19P+elVpIy+/kpugz2oLZVozF3FWzDDYdJohYYxCQPfzaJ
 JJYTiJe5ywNa3/f7pBU2XtMvwNkXrNOhfn98fe5A=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <794be57d-9bbb-4de4-00ef-32df10cc3eaa@yandex-team.ru>
Date: Mon, 20 Mar 2023 13:31:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] block: Split padded I/O vectors exceeding IOV_MAX
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230317175019.10857-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
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

On 17.03.23 20:50, Hanna Czenczek wrote:
> When processing vectored guest requests that are not aligned to the
> storage request alignment, we pad them by adding head and/or tail
> buffers for a read-modify-write cycle.
> 
> The guest can submit I/O vectors up to IOV_MAX (1024) in length, but
> with this padding, the vector can exceed that limit.  As of
> 4c002cef0e9abe7135d7916c51abce47f7fc1ee2 ("util/iov: make
> qemu_iovec_init_extended() honest"), we refuse to pad vectors beyond the
> limit, instead returning an error to the guest.
> 
> To the guest, this appears as a random I/O error.  We should not return
> an I/O error to the guest when it issued a perfectly valid request.
> 
> Before 4c002cef0e9abe7135d7916c51abce47f7fc1ee2, we just made the vector
> longer than IOV_MAX, which generally seems to work (because the guest
> assumes a smaller alignment than we really have, file-posix's
> raw_co_prw() will generally see bdrv_qiov_is_aligned() return false, and
> so emulate the request, so that the IOV_MAX does not matter).  However,
> that does not seem exactly great.
> 
> I see two ways to fix this problem:
> 1. We split such long requests into two requests.
> 2. We join some elements of the vector into new buffers to make it
>     shorter.
> 
> I am wary of (1), because it seems like it may have unintended side
> effects.
> 
> (2) on the other hand seems relatively simple to implement, with
> hopefully few side effects, so this patch does that.
> 
> To do this, the use of qemu_iovec_init_extended() in bdrv_pad_request()
> is effectively replaced by the new function bdrv_create_padded_qiov(),
> which not only wraps the request IOV with padding head/tail, but also
> ensures that the resulting vector will not have more than IOV_MAX
> elements.  Putting that functionality into qemu_iovec_init_extended() is
> infeasible because it requires allocating a bounce buffer; doing so
> would require many more parameters (buffer alignment, how to initialize
> the buffer, and out parameters like the buffer, its length, and the
> original elements), which is not reasonable.
> 
> Conversely, it is not difficult to move qemu_iovec_init_extended()'s
> functionality into bdrv_create_padded_qiov() by using public
> qemu_iovec_* functions, so that is what this patch does.
> 
> Because bdrv_pad_request() was the only "serious" user of
> qemu_iovec_init_extended(), the next patch will remove the latter
> function, so the functionality is not implemented twice.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2141964
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>   block/io.c | 153 +++++++++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 143 insertions(+), 10 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 8974d46941..1e9cdba17a 100644
> --- a/block/io.c
> +++ b/block/io.c

[..]

> +    pad->write = write;
> +
>       return true;
>   }
>   
> @@ -1545,6 +1561,18 @@ zero_mem:
>   
>   static void bdrv_padding_destroy(BdrvRequestPadding *pad)

Maybe, rename to _finalize, to stress that it's not only freeing memory.

>   {
> +    if (pad->collapse_bounce_buf) {
> +        if (!pad->write) {
> +            /*
> +             * If padding required elements in the vector to be collapsed into a
> +             * bounce buffer, copy the bounce buffer content back
> +             */
> +            qemu_iovec_from_buf(&pad->pre_collapse_qiov, 0,
> +                                pad->collapse_bounce_buf, pad->collapse_len);
> +        }
> +        qemu_vfree(pad->collapse_bounce_buf);
> +        qemu_iovec_destroy(&pad->pre_collapse_qiov);
> +    }
>       if (pad->buf) {
>           qemu_vfree(pad->buf);
>           qemu_iovec_destroy(&pad->local_qiov);
> @@ -1552,6 +1580,101 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>       memset(pad, 0, sizeof(*pad));
>   }
>   
> +/*
> + * Create pad->local_qiov by wrapping @iov in the padding head and tail, while
> + * ensuring that the resulting vector will not exceed IOV_MAX elements.
> + *
> + * To ensure this, when necessary, the first couple of elements (up to three)

maybe, "first two-three elements"

> + * of @iov are merged into pad->collapse_bounce_buf and replaced by a reference
> + * to that bounce buffer in pad->local_qiov.
> + *
> + * After performing a read request, the data from the bounce buffer must be
> + * copied back into pad->pre_collapse_qiov (e.g. by bdrv_padding_destroy()).
> + */
> +static int bdrv_create_padded_qiov(BlockDriverState *bs,
> +                                   BdrvRequestPadding *pad,
> +                                   struct iovec *iov, int niov,
> +                                   size_t iov_offset, size_t bytes)
> +{
> +    int padded_niov, surplus_count, collapse_count;
> +
> +    /* Assert this invariant */
> +    assert(niov <= IOV_MAX);
> +
> +    /*
> +     * Cannot pad if resulting length would exceed SIZE_MAX.  Returning an error
> +     * to the guest is not ideal, but there is little else we can do.  At least
> +     * this will practically never happen on 64-bit systems.
> +     */
> +    if (SIZE_MAX - pad->head < bytes ||
> +        SIZE_MAX - pad->head - bytes < pad->tail)
> +    {
> +        return -EINVAL;
> +    }
> +
> +    /* Length of the resulting IOV if we just concatenated everything */
> +    padded_niov = !!pad->head + niov + !!pad->tail;
> +
> +    qemu_iovec_init(&pad->local_qiov, MIN(padded_niov, IOV_MAX));
> +
> +    if (pad->head) {
> +        qemu_iovec_add(&pad->local_qiov, pad->buf, pad->head);
> +    }
> +
> +    /*
> +     * If padded_niov > IOV_MAX, we cannot just concatenate everything.
> +     * Instead, merge the first couple of elements of @iov to reduce the number

maybe, "first two-three elements"

> +     * of vector elements as necessary.
> +     */
> +    if (padded_niov > IOV_MAX) {
>

[..]

> @@ -1653,8 +1786,8 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
>           flags |= BDRV_REQ_COPY_ON_READ;
>       }
>   
> -    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
> -                           NULL, &flags);
> +    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, false,
> +                           &pad, NULL, &flags);
>       if (ret < 0) {
>           goto fail;
>       }

a bit later:

tracked_request_end(&req);
bdrv_padding_destroy(&pad);


Now, the request is formally finished inside bdrv_padding_destroy().. Not sure, does it really violate something, but seems safer to swap these two calls. With that:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>



PS, I feel here still exists small space for optimization:

move the logic to bdrv_init_padding(), and

1. allocate only one buffer
2. make the new collpase are to be attached to head or tail padding
3. avoid creating extra iov-slice, maybe with help of some new qemu_iovec_* API that can control number of copied/to-be-copied iovs and/or calculation number of iovs in qiov/qiov_offset/bytes slice



-- 
Best regards,
Vladimir


