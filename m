Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F62683431
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 18:45:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMugy-00034s-3a; Tue, 31 Jan 2023 12:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pMugo-00034T-K6; Tue, 31 Jan 2023 12:45:03 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pMugi-0005hV-DB; Tue, 31 Jan 2023 12:45:00 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id AEBD45F343;
 Tue, 31 Jan 2023 20:44:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b42f::1:11] (unknown
 [2a02:6b8:b081:b42f::1:11])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 giZwaH0QXCg1-UTPfhcoW; Tue, 31 Jan 2023 20:44:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675187082; bh=91ExZ/ijhpXrAZYiaFieIluk1Lrj4Y/29of6vvCGF2Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=AzkYUrkYkQM8PCisCm8J06FP/yRJBTNK+hGYlgM3xNH1pGGeGBuvQojntM18JbEhP
 LO3kF/ddnRaIJwyZne4VbV9wVC+lVXhJoU4zeBMy/qdnwrVnbAnIpeyggEA4m3GcVM
 +RhrFfbVq7f6t56h4/rYMjgZ2iVmYE8G/2/3sXKY=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c120932d-a1a7-5904-3f17-10a7c9ac69af@yandex-team.ru>
Date: Tue, 31 Jan 2023 20:44:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>
References: <20221207132719.131227-1-f.ebner@proxmox.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221207132719.131227-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

+ Den

Den, I remember we thought about that, and probably had a solution?

Another possible approach to get benefits from both modes is to switch to blocking mode after first loop of copying. [*]

Hmm. Thinking about proposed solution it seems, that [*] is better. The main reason of "write-blocking" mode is to force convergence of the mirror job. But you lose this thing if you postpone switching to the moment when mirror becomes READY: we may never reach it.



Or, may be we can selectively skip or block guest writes, to keep some specified level of convergence?

Or, we can start in "background" mode, track the speed of convergence (like dirty-delta per minute), and switch to blocking if speed becomes less than some threshold.


On 07.12.22 16:27, Fiona Ebner wrote:
> The new copy mode starts out in 'background' mode and switches to
> 'write-blocking' mode once the job transitions to ready.
> 
> Before switching to active mode and indicating that the drives are
> actively synced, it is necessary to have seen and handled all guest
> I/O. This is done by checking the dirty bitmap inside a drained
> section. Transitioning to ready is also only done at the same time.
> 
> The new mode is useful for management applications using drive-mirror
> in combination with migration. Currently, migration doesn't check on
> mirror jobs before inactivating the blockdrives, so it's necessary to
> either:
> 1) use the 'pause-before-switchover' migration capability and complete
>     mirror jobs before actually switching over.
> 2) use 'write-blocking' copy mode for the drive mirrors.
> 
> The downside with 1) is longer downtime for the guest, while the
> downside with 2) is that guest write speed is limited by the
> synchronous writes to the mirror target. The newly introduced copy
> mode reduces the time that limit is in effect.

Do you mean that in (2) we don't use pause-before-switchover? So, we have to wait for mirror-ready before starting the migration? What's the benefit of it? Or what I miss?

> 
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> See [0] for a bit more context. While the new copy mode doesn't
> fundamentally improve the downside of 2) (especially when multiple
> drives are mirrored), it would still improve things a little. And I
> guess when trying to keep downtime short, guest write speed needs to
> be limited at /some/ point (always in the context of migration with
> drive-mirror of course). Ideally, that could go hand-in-hand with
> migration convergence, but that would require some larger changes to
> implement and introduce more coupling.
> 
> [0] https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg04886.html
> 
>   block/mirror.c       | 29 +++++++++++++++++++++++++++--
>   qapi/block-core.json |  5 ++++-
>   2 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 251adc5ae0..e21b4e5e77 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -60,6 +60,7 @@ typedef struct MirrorBlockJob {
>       /* Set when the target is synced (dirty bitmap is clean, nothing
>        * in flight) and the job is running in active mode */
>       bool actively_synced;
> +    bool in_active_mode;
>       bool should_complete;
>       int64_t granularity;
>       size_t buf_size;
> @@ -1035,10 +1036,31 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>           if (s->in_flight == 0 && cnt == 0) {
>               trace_mirror_before_flush(s);
>               if (!job_is_ready(&s->common.job)) {
> +                if (s->copy_mode ==
> +                    MIRROR_COPY_MODE_WRITE_BLOCKING_AFTER_READY) {
> +                    /*
> +                     * Pause guest I/O to check if we can switch to active mode.
> +                     * To set actively_synced to true below, it is necessary to
> +                     * have seen and synced all guest I/O.
> +                     */
> +                    s->in_drain = true;
> +                    bdrv_drained_begin(bs);
> +                    if (bdrv_get_dirty_count(s->dirty_bitmap) > 0) {
> +                        bdrv_drained_end(bs);
> +                        s->in_drain = false;
> +                        continue;
> +                    }
> +                    s->in_active_mode = true;
> +                    bdrv_disable_dirty_bitmap(s->dirty_bitmap);
> +                    bdrv_drained_end(bs);
> +                    s->in_drain = false;
> +                }

I doubt, do we really need the drained section?

Why can't we simply set s->in_active_mode here and don't care?

I think bdrv_get_dirty_count(s->dirty_bitmap) can't become > 0 here, as cnt is zero, we are in context of bs and we don't have yield point. (ok, we have one in drained_begin(), but what I think we can simply drop drained section here).

> +
>                   if (mirror_flush(s) < 0) {
>                       /* Go check s->ret.  */
>                       continue;
>                   }
> +
>                   /* We're out of the streaming phase.  From now on, if the job
>                    * is cancelled we will actually complete all pending I/O and
>                    * report completion.  This way, block-job-cancel will leave
> @@ -1443,7 +1465,7 @@ static int coroutine_fn bdrv_mirror_top_do_write(BlockDriverState *bs,
>       if (s->job) {
>           copy_to_target = s->job->ret >= 0 &&
>                            !job_is_cancelled(&s->job->common.job) &&
> -                         s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
> +                         s->job->in_active_mode;
>       }
>   
>       if (copy_to_target) {
> @@ -1494,7 +1516,7 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
>       if (s->job) {
>           copy_to_target = s->job->ret >= 0 &&
>                            !job_is_cancelled(&s->job->common.job) &&
> -                         s->job->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING;
> +                         s->job->in_active_mode;
>       }
>   
>       if (copy_to_target) {
> @@ -1792,7 +1814,10 @@ static BlockJob *mirror_start_job(
>           goto fail;
>       }
>       if (s->copy_mode == MIRROR_COPY_MODE_WRITE_BLOCKING) {
> +        s->in_active_mode = true;
>           bdrv_disable_dirty_bitmap(s->dirty_bitmap);
> +    } else {
> +        s->in_active_mode = false;
>       }
>   
>       ret = block_job_add_bdrv(&s->common, "source", bs, 0,
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 95ac4fa634..2a983ed78d 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1200,10 +1200,13 @@
>   #                  addition, data is copied in background just like in
>   #                  @background mode.
>   #
> +# @write-blocking-after-ready: starts out in @background mode and switches to
> +#                              @write-blocking when transitioning to ready.

You should add also (Since: 8.0) label

> +#
>   # Since: 3.0
>   ##
>   { 'enum': 'MirrorCopyMode',
> -  'data': ['background', 'write-blocking'] }
> +  'data': ['background', 'write-blocking', 'write-blocking-after-ready'] }
>   
>   ##
>   # @BlockJobInfo:

-- 
Best regards,
Vladimir


