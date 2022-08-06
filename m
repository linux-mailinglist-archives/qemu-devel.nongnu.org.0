Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2958B848
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 22:47:37 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKQhs-0005wp-2T
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 16:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oKQgM-0004JM-HQ; Sat, 06 Aug 2022 16:46:02 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oKQg3-0001ZH-Vy; Sat, 06 Aug 2022 16:45:46 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id BF7362E0A4A;
 Sat,  6 Aug 2022 23:45:32 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:215::1:1d] (unknown
 [2a02:6b8:b081:215::1:1d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 RDXr0lZoZQ-jVOCxr2H; Sat, 06 Aug 2022 23:45:31 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1659818731; bh=ZS1dNbG9VIbdfFIf7NzP0u+2hQfg/lBj8Ox9sHfsbIk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=FN45Wk/oRR6VwacbIY/fH5hr+9d9YM1P0UkNvULuK7BeDwT1zQwL3eJ+0WTSRxorW
 hd4CkJmy9sTi0GJZn7jZeu5xLjukmKJWpAmd3Z6GeC10fRF/n/DzliRK4neDBx1owg
 Tsytu1nDi5cYHJAL4tXSUxBBuiUUM1iwP1VBBufM=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8f2b2cad-d24a-e5e4-a8b1-3a8088788921@yandex-team.ru>
Date: Sat, 6 Aug 2022 23:45:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] parallels: Add checking and repairing duplicate
 offsets in BAT
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
 <20220805154752.799395-3-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220805154752.799395-3-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/5/22 18:47, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> 
> There could be corruptions in the image file:
> two guest memory areas refer to the same host cluster.

Is that written in parallels spec (docs/interop/parallels.txt)?

Hmm yes: "- the value must be unique among all BAT entries".

> 
> If a duplicate offset is found fix it by copying the content
> of the referred cluster to a new allocated cluster and
> replace one of the two referring entries by the new cluster offset.
> 
> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>   block/parallels.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 135 insertions(+)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index a0eb7ec3c3..73264b4bd1 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -64,6 +64,11 @@ static QEnumLookup prealloc_mode_lookup = {
>   #define PARALLELS_OPT_PREALLOC_MODE     "prealloc-mode"
>   #define PARALLELS_OPT_PREALLOC_SIZE     "prealloc-size"
>   
> +#define REVERSED_BAT_UNTOUCHED  0xFFFFFFFF
> +
> +#define HOST_CLUSTER_INDEX(s, off) \
> +    ((off - ((s->header->data_off) << BDRV_SECTOR_BITS)) / (s->cluster_size))

Let it be a static function, not a macro.

> +
>   static QemuOptsList parallels_runtime_opts = {
>       .name = "parallels",
>       .head = QTAILQ_HEAD_INITIALIZER(parallels_runtime_opts.head),
> @@ -559,6 +564,131 @@ static int check_leak(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static int check_duplicate(BlockDriverState *bs,
> +                           BdrvCheckResult *res,
> +                           BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    QEMUIOVector qiov;
> +    int64_t off, high_off, size, sector_num;
> +    uint32_t i, idx_host;
> +    int ret = 0, n;
> +    g_autofree uint32_t *reversed_bat = NULL;
> +    g_autofree int64_t *cluster_buf = NULL;
> +    bool sync_and_truncate = false;
> +
> +    /*
> +     * Make a reversed BAT.
> +     * Each cluster in the host file could represent only one cluster
> +     * from the guest point of view. Reversed BAT provides mapping of that type.
> +     * Initially the table is filled with REVERSED_BAT_UNTOUCHED values.
> +     */
> +    reversed_bat = g_malloc(s->bat_size * sizeof(uint32_t));

Hmm. Why size of reversed_bat equal to bat_size? Couldn't host file size be larger than that?

Seems that we want calculate the highest offset first, and then allocate corresponding table.

Also, here we probably allocate too much memory. Better use g_try_malloc and clean error-out instead of crash.

> +    for (i = 0; i < s->bat_size; i++) {
> +        reversed_bat[i] = REVERSED_BAT_UNTOUCHED;
> +    }
> +
> +    cluster_buf = g_malloc(s->cluster_size);
> +    qemu_iovec_init(&qiov, 0);
> +    qemu_iovec_add(&qiov, cluster_buf, s->cluster_size);
> +
> +    high_off = 0;
> +    for (i = 0; i < s->bat_size; i++) {
> +        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off == 0) {
> +            continue;
> +        }
> +
> +        if (off > high_off) {
> +            high_off = off;
> +        }
> +
> +        idx_host = HOST_CLUSTER_INDEX(s, off);
> +        if (idx_host >= s->bat_size) {
> +            res->check_errors++;

As I understand, check_errors is mostly for IO errors during the check.

If it's incorrect for parallels format to have such cluster, we want res->corruptions++ here instead.

But is it really incorrect, what the spec say?

> +            goto out;
> +        }
> +
> +        if (reversed_bat[idx_host] != REVERSED_BAT_UNTOUCHED) {
> +            /*
> +             * We have alreade written a guest cluster index for this

already

> +             * host cluster. It means there is a duplicated offset in BAT.
> +             */
> +            fprintf(stderr,
> +                    "%s BAT offset in entry %u duplicates offset in entry %u\n",
> +                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
> +                    i, reversed_bat[idx_host]);
> +            res->corruptions++;
> +
> +            if (fix & BDRV_FIX_ERRORS) {
> +                /*
> +                 * Write zero to the current BAT entry, allocate a new cluster
> +                 * for the relevant guest offset and copy the host cluster
> +                 * to the new allocated cluster.
> +                 * In this way mwe will have two identical clusters and two
> +                 * BAT entries with the offsets of these clusters.
> +                 */
> +                s->bat_bitmap[i] = 0;

I don't understand that. So you just remove that guest cluster. Shouldn't we instead set it to new allocated off?

> +
> +                sector_num = bat2sect(s, reversed_bat[idx_host]);
> +                ret = bdrv_pread(bs->file, sector_num << BDRV_SECTOR_BITS,
> +                                 s->cluster_size, cluster_buf, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                sector_num = (i * s->cluster_size) >> BDRV_SECTOR_BITS;
> +                off = allocate_clusters(bs, sector_num, s->tracks, &n);

you probably want to update high_off here

> +                if (off < 0) {
> +                    res->check_errors++;
> +                    ret = off;
> +                    goto out;
> +                }
> +                off <<= BDRV_SECTOR_BITS;
> +
> +                ret = bdrv_co_pwritev(bs->file, off, s->cluster_size, &qiov, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                /* off is new and we should repair idx_host accordingly. */
> +                idx_host = HOST_CLUSTER_INDEX(s, off);
> +                res->corruptions_fixed++;
> +                sync_and_truncate = true;
> +            }
> +        }
> +        reversed_bat[idx_host] = i;
> +    }
> +
> +    if (sync_and_truncate) {
> +        ret = sync_header(bs, res);
> +        if (ret < 0) {
> +            goto out;
> +        }
> +
> +        size = bdrv_getlength(bs->file->bs);
> +        if (size < 0) {
> +            res->check_errors++;
> +            ret = size;
> +            goto out;
> +        }
> +
> +        res->image_end_offset = high_off + s->cluster_size;
> +        if (size > res->image_end_offset) {
> +            ret = truncate_file(bs, res->image_end_offset);

that's already done in check_leak, why we need it again?

> +            if (ret < 0) {
> +                goto out;
> +            }
> +        }
> +    }
> +
> +out:
> +    qemu_iovec_destroy(&qiov);
> +    return ret;
> +}
> +
>   static void collect_statistics(BlockDriverState *bs, BdrvCheckResult *res)
>   {
>       BDRVParallelsState *s = bs->opaque;
> @@ -598,6 +728,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           goto out;
>       }
>   
> +    ret = check_duplicate(bs, res, fix);
> +    if (ret != 0) {
> +        goto out;
> +    }
> +
>       collect_statistics(bs, res);
>   
>   out:


-- 
Best regards,
Vladimir

