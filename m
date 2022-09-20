Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7915BEB01
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 18:20:21 +0200 (CEST)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafys-0003TE-LV
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 12:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oacTG-0005vF-8E
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:35:26 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:60446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oacTB-0002rV-5L
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:35:24 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 9194F2E120F;
 Tue, 20 Sep 2022 15:35:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b65b::1:34] (unknown
 [2a02:6b8:b081:b65b::1:34])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 CeudgTyhFM-ZBOej0SU; Tue, 20 Sep 2022 15:35:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663677313; bh=MWTB9GDGc6sLf1ulRhW6prcGIHzH13OXkt6MzveaT+0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=wzSFnETxFXj5y7t7sMa000vLc9hJ9f5NvWK1tJJjCqJjQMgTzZy4Hil+ob5rWgt2g
 kBcPVDUD5L5F0sfKL4WXbeb6QHR319sYC5IceTKkvccCQsZRLdiRMVXdVTMoRMkGaG
 AlaA9U00jKORypbHULY3FL+eftAUzqEysKeYvh24=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <eeae2432-c5b6-f2ab-ae21-a27bb318e772@yandex-team.ru>
Date: Tue, 20 Sep 2022 15:35:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] This patch is to solve the problem that bitmaps in memory
 are lost after dirve-mirror is completed.
Content-Language: en-US
To: Hongleilee <281773481@qq.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 richard.henderson@linaro.org, John Snow <jsnow@redhat.com>
References: <tencent_D664D92C94A87E015A59B4A93C16EB1EFC0A@qq.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <tencent_D664D92C94A87E015A59B4A93C16EB1EFC0A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.182,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Cc John]

Hi!

Please make subject line shorter and do longer description in the body of commit message.

About the patch - same thing. Please move/copy bitmaps using Bitmap API.

On 9/20/22 08:47, Hongleilee wrote:
> Signed-off-by: Hongleilee <281773481@qq.com>
> ---
>   block/mirror.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 3c4ab1159d..86d2cd6b67 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -24,6 +24,7 @@
>   #include "qemu/ratelimit.h"
>   #include "qemu/bitmap.h"
>   #include "qemu/memalign.h"
> +#include "qemu/queue.h"
>   
>   #define MAX_IN_FLIGHT 16
>   #define MAX_IO_BYTES (1 << 20) /* 1 Mb */
> @@ -654,7 +655,10 @@ static int mirror_exit_common(Job *job)
>       BlockDriverState *target_bs;
>       BlockDriverState *mirror_top_bs;
>       Error *local_err = NULL;
> +    BdrvDirtyBitmap *bm, *next, *bt_mp;
> +    HBitmap *hb;
>       bool abort = job->ret < 0;
> +    int i, j;
>       int ret = 0;
>   
>       if (s->prepared) {
> @@ -671,6 +675,31 @@ static int mirror_exit_common(Job *job)
>           bdrv_unfreeze_backing_chain(mirror_top_bs, target_bs);
>       }
>   
> +    QLIST_INIT(&target_bs->dirty_bitmaps);
> +    QLIST_FOREACH_SAFE(bm, &src->dirty_bitmaps, list, next) {
> +        if (bm->name) {
> +            bt_mp = g_new0(BdrvDirtyBitmap, 1);
> +            hb = g_new0(struct HBitmap, 1);
> +            hb->count = bm->bitmap->count;
> +            hb->size = bm->bitmap->size;
> +            hb->granularity = bm->bitmap->granularity;
> +            for (i = 0; i < HBITMAP_LEVELS; i++) {
> +                hb->sizes[i] = bm->bitmap->sizes[i];
> +                hb->levels[i] = g_new0(unsigned long, bm->bitmap->sizes[i]);
> +                for (j = 0; j < bm->bitmap->sizes[i]; j++) {
> +                    hb->levels[i][j] = bm->bitmap->levels[i][j];
> +                }
> +            }
> +            bt_mp->mutex = &target_bs->dirty_bitmap_mutex;
> +            bt_mp->bitmap = hb;
> +            bt_mp->size = bm->size;
> +            bt_mp->name = g_strdup(bm->name);
> +            qemu_mutex_lock(&target_bs->dirty_bitmap_mutex);
> +            QLIST_INSERT_HEAD(&target_bs->dirty_bitmaps, bt_mp, list);
> +            qemu_mutex_unlock(&target_bs->dirty_bitmap_mutex);
> +        }
> +    }
> +
>       bdrv_release_dirty_bitmap(s->dirty_bitmap);
>   
>       /* Make sure that the source BDS doesn't go away during bdrv_replace_node,


-- 
Best regards,
Vladimir

