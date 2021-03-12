Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9E339753
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:21:17 +0100 (CET)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnLY-0006gm-TK
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKmJk-0003dU-Hk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:15:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKmJc-0005eQ-IG
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615572907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++NPrQ14fhrDOHGTIuUl1zeaua/id8hulnWrkfWvEGk=;
 b=VA3V17ll817IL4v+6e0P2g2Kzb3iP+oEvowZfqwG2u+q42Ell7wY9bBl69WsUoSGuVSwzA
 TUn1+fwT8WjBi8mHvTblmh7gKEuzFVvw7js8ZzK5esJOEjJjrK4/q6k0O8PAeHjc5ZdZQp
 2zAntJRBcYdX4YMT4yUHkvG1ljIYJZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-58drxTizPhCIRjh6czbwhA-1; Fri, 12 Mar 2021 13:15:05 -0500
X-MC-Unique: 58drxTizPhCIRjh6czbwhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F512101F001;
 Fri, 12 Mar 2021 18:15:04 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-148.ams2.redhat.com
 [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 167E65C1C5;
 Fri, 12 Mar 2021 18:15:01 +0000 (UTC)
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
Date: Fri, 12 Mar 2021 19:15:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305173507.393137-7-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
> Compressed writes are unaligned to 512, which works very slow in
> O_DIRECT mode. Let's use the cache.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/coroutines.h     |   3 +
>   block/qcow2.h          |   4 ++
>   block/qcow2-refcount.c |  10 +++
>   block/qcow2.c          | 158 ++++++++++++++++++++++++++++++++++++++---
>   4 files changed, 164 insertions(+), 11 deletions(-)
> 
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 4cfb4946e6..cb8e05830e 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -66,4 +66,7 @@ int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
>   int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
>                                           QEMUIOVector *qiov, int64_t pos);
>   
> +int coroutine_fn qcow2_co_flush_compressed_cache(BlockDriverState *bs);
> +int generated_co_wrapper qcow2_flush_compressed_cache(BlockDriverState *bs);
> +
>   #endif /* BLOCK_COROUTINES_INT_H */
> diff --git a/block/qcow2.h b/block/qcow2.h
> index e18d8dfbae..8b8fed0950 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -28,6 +28,7 @@
>   #include "crypto/block.h"
>   #include "qemu/coroutine.h"
>   #include "qemu/units.h"
> +#include "qemu/seqcache.h"
>   #include "block/block_int.h"
>   
>   //#define DEBUG_ALLOC
> @@ -422,6 +423,9 @@ typedef struct BDRVQcow2State {
>       Qcow2CompressionType compression_type;
>   
>       GHashTable *inflight_writes_counters;
> +
> +    SeqCache *compressed_cache;
> +    int compressed_flush_ret;
>   } BDRVQcow2State;
>   
>   typedef struct Qcow2COWRegion {
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 464d133368..218917308e 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -29,6 +29,7 @@
>   #include "qemu/bswap.h"
>   #include "qemu/cutils.h"
>   #include "trace.h"
> +#include "block/coroutines.h"
>   
>   static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
>                                       uint64_t max);
> @@ -1040,6 +1041,10 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>                   qcow2_cache_discard(s->l2_table_cache, table);
>               }
>   
> +            if (s->compressed_cache) {
> +                seqcache_discard_cluster(s->compressed_cache, cluster_offset);
> +            }
> +
>               if (s->discard_passthrough[type]) {
>                   update_refcount_discard(bs, cluster_offset, s->cluster_size);
>               }
> @@ -1349,6 +1354,11 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
>       BDRVQcow2State *s = bs->opaque;
>       int ret;
>   
> +    ret = qcow2_flush_compressed_cache(bs);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +

I wonder a bit why this function doesn’t work on a best-effort basis, 
but that isn’t your problem.

>       ret = qcow2_cache_write(bs, s->l2_table_cache);
>       if (ret < 0) {
>           return ret;
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 6ee94421e0..5f3713cd6f 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -42,6 +42,7 @@
>   #include "qapi/qapi-visit-block-core.h"
>   #include "crypto.h"
>   #include "block/aio_task.h"
> +#include "block/coroutines.h"
>   
>   /*
>     Differences with QCOW:
> @@ -1834,6 +1835,10 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>       s->inflight_writes_counters =
>           g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
>   
> +    if (!has_data_file(bs) && (bs->file->bs->open_flags & BDRV_O_NOCACHE)) {

Looks a bit like a layering violation, but I have no better proposal and 
you gave your reasoning, so, OK.

I wonder whether this should be re-checked during reopen, though.

> +        s->compressed_cache = seqcache_new(s->cluster_size);
> +    }
> +
>       return ret;
>   
>    fail:
> @@ -2653,6 +2658,91 @@ fail_nometa:
>       return ret;
>   }
>   
> +/*
> + * Flush one cluster of compressed cache if exists. If @unfinished is true and
> + * there is no finished cluster to flush, flush the unfinished one. Otherwise
> + * flush only finished clusters.
> + *
> + * Return 0 if nothing to flush, 1 if one cluster successfully flushed and <0 on
> + * error.
> + */
> +static int coroutine_fn
> +qcow2_co_compressed_flush_one(BlockDriverState *bs, bool unfinished)
> +{
> +    BDRVQcow2State *s = bs->opaque;
> +    int ret;
> +    int64_t align = 1;
> +    int64_t offset, bytes;
> +    uint8_t *buf;
> +
> +    if (!s->compressed_cache) {
> +        return 0;
> +    }
> +
> +    if (!seqcache_get_next_flush(s->compressed_cache, &offset, &bytes, &buf,
> +                                 &unfinished))
> +    {
> +        return 0;
> +    }
> +
> +    qcow2_inflight_writes_inc(bs, offset, bytes);
> +
> +    /*
> +     * Don't try to align-up unfinished cached cluster, parallel write to it is
> +     * possible! For finished host clusters data in the tail of the cluster will
> +     * be never used. So, take some good alignment for speed.
> +     *
> +     * Note also, that seqcache guarantees that allocated size of @buf is enough
> +     * to fill the cluster up to the end, so we are safe to align up with
> +     * align <= cluster_size.
> +     */
> +    if (!unfinished) {
> +        align = MIN(s->cluster_size,
> +                    MAX(s->data_file->bs->bl.request_alignment,
> +                        bdrv_opt_mem_align(bs)));
> +    }
> +

I’d move the pre-write overlap check here, because its purpose is to 
prevent writes to metadata structures as they are happening, not as they 
are queued into a cache.  (I’d say.)

> +    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
> +    ret = bdrv_co_pwrite(s->data_file, offset,
> +                         QEMU_ALIGN_UP(offset + bytes, align) - offset,

I remember you said you wanted to describe more of the properties of the 
buffer returned by seqcache_get_next_flush().  That would be nice here, 
because intuitively one would assume that the buffer is @bytes bytes 
long, which aligning here will exceed.  (It’s fine, but it would be 
nicer if there was a comment that assured that it’s fine.)

> +                         buf, 0);
> +    if (ret < 0 && s->compressed_flush_ret == 0) {
> +        /*
> +         * The data that was "written" earlier is lost. We don't want to
> +         * care with storing it somehow to retry flushing later.

Yeah, there is little point in trying something like writing it again 
and again in the hope that maybe at some point it’ll work.

It is a shame that the error isn’t returned by the original compressed 
write, but what can you do.

>                                                                   Also, how much
> +         * data will we have to store, if not drop it after failed flush?
> +         * After this point qcow2_co_flush_compressed_cache() (and
> +         * qcow2_flush_compressed_cache()) never return success.
> +         */
> +        s->compressed_flush_ret = ret;
> +    }
> +
> +    seqcache_discard_cluster(s->compressed_cache, offset);
> +
> +    qcow2_inflight_writes_dec(bs, offset, bytes);
> +
> +    return ret < 0 ? ret : 1;
> +}
> +
> +int coroutine_fn qcow2_co_flush_compressed_cache(BlockDriverState *bs)
> +{
> +    BDRVQcow2State *s = bs->opaque;
> +
> +    if (s->compressed_cache) {
> +        uint64_t nb_clusters = seqcache_nb_clusters(s->compressed_cache);
> +
> +        /*
> +         * If parallel writes are possible we don't want to loop forever. So
> +         * flush only clusters available at start of flush operation.
> +         */
> +        while (nb_clusters--) {
> +            qcow2_co_compressed_flush_one(bs, true);
> +        }
> +    }
> +
> +    return s->compressed_flush_ret;
> +}
> +
>   static int qcow2_inactivate(BlockDriverState *bs)
>   {
>       BDRVQcow2State *s = bs->opaque;
> @@ -2667,6 +2757,13 @@ static int qcow2_inactivate(BlockDriverState *bs)
>                             bdrv_get_device_or_node_name(bs));
>       }
>   
> +    ret = qcow2_flush_compressed_cache(bs);
> +    if (ret) {
> +        result = ret;
> +        error_report("Failed to flush the compressed write cache: %s",
> +                     strerror(-ret));
> +    }
> +
>       ret = qcow2_cache_flush(bs, s->l2_table_cache);
>       if (ret) {
>           result = ret;
> @@ -2699,6 +2796,12 @@ static void qcow2_close(BlockDriverState *bs)
>           qcow2_inactivate(bs);
>       }
>   
> +    /*
> +     * Cache should be flushed in qcow2_inactivate() and should be empty in
> +     * inactive mode. So we are safe to free it.
> +     */
> +    seqcache_free(s->compressed_cache);
> +
>       cache_clean_timer_del(bs);
>       qcow2_cache_destroy(s->l2_table_cache);
>       qcow2_cache_destroy(s->refcount_block_cache);
> @@ -4558,18 +4661,42 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
>           goto fail;
>       }
>   
> -    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
> +    if (s->compressed_cache) {

Why is this conditional?

> +        /*
> +         * It's important to do seqcache_write() in the same critical section
> +         * (by s->lock) as qcow2_alloc_compressed_cluster_offset(), so that the
> +         * cache is filled sequentially.
> +         */

Yes.

> +        seqcache_write(s->compressed_cache, cluster_offset, out_len, out_buf);
>   
> -    qemu_co_mutex_unlock(&s->lock);
> +        qemu_co_mutex_unlock(&s->lock);
>   
> -    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
> -    ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
> +        ret = qcow2_co_compressed_flush_one(bs, false);

The qcow2 doc says a compressed cluster can span multiple host clusters. 
  I don’t know whether that can happen with this driver, but if it does, 
wouldn’t that mean we’d need to flush two clusters here?  Oh, no, never 
mind.  Only the first one would be finished and thus flushed, not the 
second one.

I could have now removed the above paragraph, but it made me think, so I 
kept it:

Hm.  Actually, if we unconditionally flush here, doesn’t that mean that 
we’ll never have a finished cluster in the cache for longer than the 
span between the seqcache_write() and this 
qcow2_co_compressed_flush_one()?  I.e., the 
qcow2_co_flush_compressed_cache() is supposed to never flush any 
finished cluster, but only the currently active unfinished cluster (if 
there is one), right?

> +        if (ret < 0) {
> +            /*
> +             * if ret < 0 it probably not this request which failed, but some
> +             * previous one that was cached. Moreover, when we write to the
> +             * cache we probably may always report success, because
> +             * seqcache_write() never fails. Still, it's better to inform
> +             * compressed backup now then wait until final flush.
> +             */

Yup.

> +            goto fail;
> +        }
> +    } else {
> +        qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
>   
> -    qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
> +        qemu_co_mutex_unlock(&s->lock);
>   
> -    if (ret < 0) {
> -        goto fail;
> +        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
> +        ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
> +
> +        qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
> +
> +        if (ret < 0) {
> +            goto fail;
> +        }
>       }
> +
>   success:
>       ret = 0;
>   fail:
> @@ -4681,10 +4808,19 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
>   
>       out_buf = qemu_blockalign(bs, s->cluster_size);
>   
> -    BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
> -    ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
> -    if (ret < 0) {
> -        goto fail;
> +    /*
> +     * seqcache_read may return less bytes than csize, as csize may exceed
> +     * actual compressed data size. So we are OK if seqcache_read returns
> +     * something > 0.

I was about to ask what happens when a compressed cluster spans two host 
clusters (I could have imagined that in theory the second one could have 
been discarded, but not the first one, so reading from the cache would 
really be short -- we would have needed to check that we only fell short 
in the range of 512 bytes, not more).

But then I realized that in this version of the series, all finished 
clusters are immediately discarded and only the current unfinished one 
is kept.  Does it even make sense to try seqcache_read() here, then?

> +     */
> +    if (!s->compressed_cache ||

(As for writing, I don’t think this can ever occur.)

Max

> +        seqcache_read(s->compressed_cache, coffset, csize, buf) <= 0)
> +    {
> +        BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
> +        ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
> +        if (ret < 0) {
> +            goto fail;
> +        }
>       }
>   
>       if (qcow2_co_decompress(bs, out_buf, s->cluster_size, buf, csize) < 0) {
> 


