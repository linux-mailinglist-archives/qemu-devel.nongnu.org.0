Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32716316CE9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:37:15 +0100 (CET)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tQQ-00081w-7e
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9syG-0003I1-DU
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9syD-0007av-7x
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hqtm0jzUZq41N8ay3p2KOKM1valUDMNBd63ozFiqthk=;
 b=U+b2uDBs0ZGts8AVAqdtioegIWLLSTTYw9xIbX4FP9YRqheJsTmtNIFJnpTszuoqnAgqxq
 bzViHffACZ3GiriR2zQ/eq88Fs0MHiiuxq3LLX1ZRaI2QZ/o8lYj5v8eb4UXAGXoW0pNld
 npmqczhT99jrwH4qCIVZbRjdtPk7wOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-EUOSgnVIOpGiGhsvoYR8wQ-1; Wed, 10 Feb 2021 12:07:38 -0500
X-MC-Unique: EUOSgnVIOpGiGhsvoYR8wQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFD96835E23;
 Wed, 10 Feb 2021 17:07:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-231.ams2.redhat.com
 [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2B719C44;
 Wed, 10 Feb 2021 17:07:34 +0000 (UTC)
Subject: Re: [PATCH 2/7] block/qcow2: introduce cache for compressed writes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-3-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <741acab7-b641-9b18-c0ae-1a5d149536d7@redhat.com>
Date: Wed, 10 Feb 2021 18:07:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129165030.640169-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
> Compressed writes and O_DIRECT are not friends: they works too slow,
> because compressed writes does many small unaligned to 512 writes.
> 
> Let's introduce an internal cache, so that compressed writes may work
> well when O_DIRECT is on.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2.h                        |  29 +
>   block/qcow2-compressed-write-cache.c | 770 +++++++++++++++++++++++++++
>   block/meson.build                    |   1 +
>   3 files changed, 800 insertions(+)
>   create mode 100644 block/qcow2-compressed-write-cache.c
> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index 0678073b74..fbdedf89fa 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -322,6 +322,8 @@ typedef struct Qcow2BitmapHeaderExt {
>       uint64_t bitmap_directory_offset;
>   } QEMU_PACKED Qcow2BitmapHeaderExt;
>   
> +typedef struct Qcow2CompressedWriteCache Qcow2CompressedWriteCache;
> +
>   #define QCOW2_MAX_THREADS 4
>   
>   typedef struct BDRVQcow2State {
> @@ -1010,4 +1012,31 @@ int coroutine_fn
>   qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_offset,
>                    uint64_t guest_offset, void *buf, size_t len);
>   
> +Qcow2CompressedWriteCache *qcow2_compressed_cache_new(BdrvChild *data_file,
> +                                                      int64_t cluster_size,
> +                                                      int64_t cache_size);
> +void qcow2_compressed_cache_free(Qcow2CompressedWriteCache *s);
> +int coroutine_fn
> +qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t offset,
> +                               int64_t bytes, void *buf);
> +int coroutine_fn
> +qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, int64_t offset,
> +                                int64_t bytes, void *buf);
> +void coroutine_fn
> +qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
> +                                          int64_t cluster_data_end);
> +int coroutine_fn
> +qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s);
> +int qcow2_compressed_cache_flush(BlockDriverState *bs,
> +                                 Qcow2CompressedWriteCache *state);
> +int coroutine_fn
> +qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s);
> +int qcow2_compressed_cache_stop_flush(BlockDriverState *bs,
> +                                      Qcow2CompressedWriteCache *s);
> +void qcow2_compressed_cache_set_size(Qcow2CompressedWriteCache *s,
> +                                     int64_t size);
> +void coroutine_fn
> +qcow2_compressed_cache_co_discard(Qcow2CompressedWriteCache *s,
> +                                  int64_t cluster_offset);
> +

It would be nice if these functions had their interface documented 
somewhere.

>   #endif
> diff --git a/block/qcow2-compressed-write-cache.c b/block/qcow2-compressed-write-cache.c
> new file mode 100644
> index 0000000000..7bb92cb550
> --- /dev/null
> +++ b/block/qcow2-compressed-write-cache.c
> @@ -0,0 +1,770 @@
> +/*
> + * Write cache for qcow2 compressed writes
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "block/block_int.h"
> +#include "block/block-gen.h"
> +#include "qemu/coroutine.h"
> +#include "qapi/qapi-events-block-core.h"
> +#include "qcow2.h"
> +
> +typedef struct CacheExtent {
> +    int64_t offset;
> +    int64_t bytes;
> +    void *buf;
> +    QLIST_ENTRY(CacheExtent) next;
> +} CacheExtent;
> +
> +typedef struct CacheCluster {

It isn’t immediately clear what these two structures mean by just their 
name, because “extent” has no meaning in the context of qcow2.

I understand CacheExtent to basically be a compressed cluster, and 
CacheCluster to be a host cluster.  Perhaps their names should reflect that.

(OTOH, the Cache* prefix seems unnecessary to me, because these are just 
local structs.)

> +    int64_t cluster_offset;
> +    int64_t n_bytes; /* sum of extents lengths */
> +
> +    /*
> +     * data_end: cluster is full if data_end reached and ready to be flushed.
> +     * data_end is absoluted offset, not relative.

*absolute

> +     */
> +    int64_t data_end;
> +
> +    bool in_flight; /* cluster is being flushed now */
> +
> +    /*
> +     * waiters: coroutines to wake after flush.

No, once in_flight is reset to false, which may happen even if the 
cluster hasn’t been flushed.


As a note that doesn’t really belong anywhere, I don’t like the current 
use of this queue perfectly well.

This is how it is used right now:

Some context A sets in_flight and flushes the cluster.

Some context B wants to evict the cluster from the cache.  It sees 
in_flight, so it gets into the queue.  (If in_flight were not set, B 
would remove the cluster from the cache.)

A finishes flushing, resets in_flight, queues B.  Then if flushing 
succeeded, it will evict the cluster from the cache.  If it failed, the 
cluster remains in the cache.

Then B is executed.  If the cluster isn’t in the cache anymore, it’s 
done.  If still is, it will remove it, and then be done.

My problem is that if B were executed right where it’s enqueued (with 
queue_restart_all()), we would crash because B would see the cluster in 
the cache, remove it, and then A would have a dangling reference and 
remove the (freed) cluster again.

So, well, it works, but I personally find it strange to “invoke“ B where 
you don’t actually want it to run.  I think the @waiters queue should 
only be restarted once A has had the chance to remove the cluster from 
the cache, or to be more general, once A no longer has a reference to 
the cluster.

tl;dr: I think the @waiters queue should only be restarted once the 
reference to the cluster is no longer going to be used.

>                                                  Must be empty when in_flight is
> +     * false
> +     */
> +    CoQueue waiters;
> +
> +    QTAILQ_ENTRY(CacheCluster) next;
> +    QLIST_HEAD(, CacheExtent) extents; /* sorted by offset */
> +} CacheCluster;
> +
> +typedef QTAILQ_HEAD(, CacheCluster) CacheClusterQueue;

Why the typedef?  It’s used one time.

> +
> +struct Qcow2CompressedWriteCache {
> +    /*
> +     * @data_file and @cluster_size are copied from qcow2 state. Not huge
> +     * duplications, seems better to avoid accessing the whole qcow2 state
> +     * instead.

Why?  What if in the future the data_file child can be changed with reopen?

What’s the argument against accessing the whole qcow2 state?  That it’s 
a layering violation, that we shouldn’t access it while the rest uses 
it?  If that’s a concern, perhaps *data_file should be an indirect 
pointer to the pointer in the BDRVQcow2State.

> +     */
> +    BdrvChild *data_file;
> +    int64_t cluster_size;
> +
> +    CoQueue waiters; /* coroutines, waiting for free place in the cache */
> +
> +    /*
> +     * Cache limits not total number of clusters but total number of active
> +     * clusters. Active clusters are clusters with non-zero @n_bytes (and
> +     * therefor non-empty @extents). This is done so we don't need to wait for
> +     * cache flush qcow2_compressed_cache_set_cluster_end() (which may create
> +     * cluster with @data_end set but zero @n_bytes), as
> +     * qcow2_compressed_cache_set_cluster_end() is intended to be called from
> +     * qcow2 mutex critical section.
> +     */
> +    int nb_active_clusters;
> +
> +    /*
> +     * If max_active_clusters is 0 it means that cache is inactive: all new
> +     * writes should fallthrough to data_file immediately.
> +     */
> +    int max_active_clusters;
> +
> +    CacheClusterQueue clusters;
> +};
> +
> +/* New extent takes ownership of @buf */
> +static CacheExtent *cache_extent_new(int64_t offset, int64_t bytes, void *buf)
> +{
> +    CacheExtent *e = g_new(CacheExtent, 1);
> +
> +    *e = (CacheExtent) {
> +        .offset = offset,
> +        .bytes = bytes,
> +        .buf = buf,
> +    };
> +
> +    return e;
> +}
> +
> +static void cache_extent_free(CacheExtent *e)
> +{
> +    if (e) {
> +        g_free(e->buf);
> +        g_free(e);
> +    }
> +}
> +
> +static CacheCluster *find_cluster(Qcow2CompressedWriteCache *s,
> +                                  int64_t cluster_offset)
> +{
> +    CacheCluster *c;
> +
> +    assert(QEMU_IS_ALIGNED(cluster_offset, s->cluster_size));
> +
> +    QTAILQ_FOREACH(c, &s->clusters, next) {
> +        if (cluster_offset == c->cluster_offset) {
> +            return c;
> +        }
> +    }

This reads like in any language but C we’d opt for a hash table.  On 
that thought, why don’t we opt for a hash table even in C?

> +
> +    return NULL;
> +}
> +
> +/* Creates "inactive" cluster, which doesn't influence s->nb_active_clusters */
> +static CacheCluster *cache_cluster_new(Qcow2CompressedWriteCache *s,
> +                                       int64_t cluster_offset)
> +{
> +    CacheCluster *c;
> +
> +    assert(!find_cluster(s, cluster_offset));
> +
> +    c = g_new(CacheCluster, 1);
> +    *c = (CacheCluster) {
> +        .cluster_offset = cluster_offset,
> +        .data_end = cluster_offset + s->cluster_size
> +    };
> +
> +    qemu_co_queue_init(&c->waiters);
> +    QTAILQ_INSERT_TAIL(&s->clusters, c, next);
> +
> +    return c;
> +}
> +
> +static void cache_cluster_free(CacheCluster *cluster)
> +{
> +    assert(!cluster->in_flight);
> +    assert(qemu_co_queue_empty(&cluster->waiters));
> +    QLIST_FOREACH_FUNC_SAFE(&cluster->extents, next, cache_extent_free);
> +    g_free(cluster);
> +}
> +
> +static bool cache_cluster_is_full(CacheCluster *cluster)
> +{
> +    assert(cluster->cluster_offset + cluster->n_bytes <= cluster->data_end);
> +    return cluster->cluster_offset + cluster->n_bytes == cluster->data_end;
> +}
> +
> +static void cache_cluster_remove(Qcow2CompressedWriteCache *s,
> +                                 CacheCluster *cluster)
> +{
> +    if (cluster->n_bytes) {
> +        s->nb_active_clusters--;
> +    }
> +    QTAILQ_REMOVE(&s->clusters, cluster, next);
> +    cache_cluster_free(cluster);
> +}
> +
> +/*
> + * Return number of consequtive clusters starting from @first. Store next after

%s/consequi\?tive/consecutive/

> + * last extent pointer into @next, store end offset of last extent into
> + * @end_off.
> + */
> +static int count_consequitive_extents(CacheExtent *first,
> +                                      CacheExtent **next,
> +                                      int64_t *end_off)
> +{
> +    CacheExtent *e;
> +    int64_t off = first->offset;
> +    int nb = 0;
> +
> +    for (e = first; e; e = QLIST_NEXT(e, next)) {
> +        assert(e->offset >= off);
> +        if (e->offset > off) {
> +            break;
> +        }
> +        off += e->bytes;
> +        nb++;
> +    }
> +
> +    if (next) {
> +        *next = e;
> +    }
> +
> +    if (end_off) {
> +        *end_off = off;
> +    }
> +
> +    return nb;
> +}
> +
> +/*
> + * Write consequtive extents, starting from @firest. Store next after last

*first

> + * extent pointer into @next. If align > 1, align end of the whole write by
> + * zero.
> + */
> +static int coroutine_fn flush_consequitive_extents(Qcow2CompressedWriteCache *s,
> +                                                   CacheExtent *first,
> +                                                   CacheExtent **next,
> +                                                   int64_t align)
> +{
> +    CacheExtent *e, *end_extent;
> +    int64_t end;
> +    int nb_extents = count_consequitive_extents(first, &end_extent, &end);

I’d prefer nb_bufs, because it will include a tail if present.

> +    int64_t aligned_end = QEMU_ALIGN_UP(end, align);
> +    int64_t tail = aligned_end - end;
> +    int64_t len = aligned_end - first->offset;
> +
> +    /*
> +     * Alignment if for flushing full cluster, first extent offset is always

s/.*,/The alignment will not exceed the cluster size, so the/?

> +     * aligned.
> +     */
> +    assert(QEMU_IS_ALIGNED(first->offset, align));
> +
> +    if (next) {
> +        *next = end_extent;
> +    }
> +
> +    if (tail) {
> +        nb_extents++;
> +    }
> +
> +    if (nb_extents > IOV_MAX) {
> +        g_autofree void *buf = g_malloc(len);

I wonder if this should be blk_blockalign() if first->offset is aligned 
to the cluster size.  (Don’t know how common that case is.)

> +        char *p = buf;
> +
> +        for (e = first; e != end_extent; e = QLIST_NEXT(e, next)) {
> +            memcpy(p, e->buf, e->bytes);
> +            p += e->bytes;
> +        }
> +
> +        if (tail) {
> +            memset(p, 0, tail);
> +        }
> +
> +        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
> +        return bdrv_co_pwrite(s->data_file, first->offset, len, buf, 0);
> +    } else {
> +        int ret;
> +        QEMUIOVector qiov;
> +        g_autofree void *tail_buf = NULL;
> +
> +        qemu_iovec_init(&qiov, nb_extents);
> +        for (e = first; e != end_extent; e = QLIST_NEXT(e, next)) {
> +            qemu_iovec_add(&qiov, e->buf, e->bytes);
> +        }
> +
> +        if (tail) {
> +            tail_buf = g_malloc0(tail);
> +            qemu_iovec_add(&qiov, tail_buf, tail);
> +        }
> +
> +        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
> +        ret = bdrv_co_pwritev(s->data_file, first->offset, len, &qiov, 0);
> +        qemu_iovec_destroy(&qiov);
> +        return ret;
> +    }

The write functions are missing overlap checks.  It can be argued that 
this is done by qcow2_co_pwritev_compressed_task() already, but the idea 
was to pair all actual writes with overlap checks (i.e., cached writes 
in qcow2_co_pwritev_compressed_task() wouldn’t need to do a check).

> +}
> +
> +static int coroutine_fn cache_cluster_flush_full(Qcow2CompressedWriteCache *s,
> +                                                 CacheCluster *cluster)
> +{
> +    int ret;
> +    CacheExtent *end_extent;
> +    int64_t align = MIN(s->cluster_size,
> +                        MAX(s->data_file->bs->bl.request_alignment, 4 * 1024));
> +
> +    assert(cache_cluster_is_full(cluster));
> +
> +    ret = flush_consequitive_extents(s, QLIST_FIRST(&cluster->extents),
> +                                     &end_extent, align);
> +
> +    assert(end_extent == NULL); /* all extents flushed */
> +
> +    return ret;
> +}
> +
> +static int coroutine_fn cache_cluster_flush(Qcow2CompressedWriteCache *s,
> +                                            CacheCluster *c)
> +{
> +    int ret;
> +    CacheExtent *e = QLIST_FIRST(&c->extents);
> +
> +    if (cache_cluster_is_full(c)) {
> +        return cache_cluster_flush_full(s, c);
> +    }
> +
> +    while (e) {
> +        ret = flush_consequitive_extents(s, e, &e, 1);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +int coroutine_fn qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s)
> +{
> +    int ret = 0;
> +    CacheCluster *c;
> +    GList *local_clusters = NULL, *p;
> +
> +    /*
> +     * Make a snapshot of current state: we will not flush clusters created in
> +     * parallel with flush operations and don't allow adding more extents to
> +     * staged clusters. We are also protected from parallel flush operations
> +     * flushing the same clusters.
> +     */
> +    QTAILQ_FOREACH(c, &s->clusters, next) {
> +        if (!c->in_flight && c->n_bytes) {
> +            c->in_flight = true;
> +            local_clusters = g_list_append(local_clusters, c);
> +        }
> +    }
> +
> +    for (p = local_clusters; p; p = p->next) {
> +        CacheCluster *c = p->data;
> +
> +        if (ret == 0) {
> +            ret = cache_cluster_flush(s, c);
> +        }
> +
> +        c->in_flight = false;
> +        qemu_co_queue_restart_all(&c->waiters);
> +
> +        if (ret == 0) {
> +            cache_cluster_remove(s, c);
> +        }
> +    }
> +
> +    g_list_free(local_clusters);
> +
> +    return ret;
> +}
> +
> +int coroutine_fn
> +qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s)
> +{
> +    int ret, save;
> +
> +    save = s->max_active_clusters;
> +    s->max_active_clusters = 0; /* No more extents */

Perhaps better “Don’t cache any more extents” / “Don’t cache any more 
compressed clusters”?

> +
> +    ret = qcow2_compressed_cache_co_flush(s);
> +    if (ret < 0) {
> +        s->max_active_clusters = save;
> +        return ret;
> +    }
> +
> +    assert(QTAILQ_EMPTY(&s->clusters));
> +    return 0;
> +}
> +
> +/* @cluster takes ownership of @extent */
> +static void cluster_add_extent(Qcow2CompressedWriteCache *s,
> +                               CacheCluster *cluster, CacheExtent *extent)
> +{
> +    CacheExtent *e;
> +
> +    assert(extent->bytes);
> +    assert(extent->offset >= cluster->cluster_offset);
> +    assert(extent->offset + extent->bytes <= cluster->data_end);
> +    assert(!cluster->in_flight);
> +
> +    e = QLIST_FIRST(&cluster->extents);
> +    if (!e) {
> +        /* inactive cluster */
> +        assert(!cluster->n_bytes);
> +        s->nb_active_clusters++;
> +        assert(s->nb_active_clusters <= s->max_active_clusters);
> +        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
> +    } else if (e->offset > extent->offset) {
> +        assert(extent->offset + extent->bytes <= e->offset);
> +        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
> +    } else {
> +        while (QLIST_NEXT(e, next) &&
> +               QLIST_NEXT(e, next)->offset < extent->offset) {
> +            e = QLIST_NEXT(e, next);
> +        }
> +
> +        /* Now e is last element with offset < extent->offset */
> +        assert(e->offset + e->bytes <= extent->offset);
> +
> +        QLIST_INSERT_AFTER(e, extent, next);
> +
> +        e = QLIST_NEXT(extent, next);
> +        if (e) {
> +            assert(extent->offset + extent->bytes <= e->offset);
> +        }
> +    }

I like how in C one always tends to implement everything from scratch. 
I think adding an element into an already-sorted list is a standard 
problem, so it’s a shame that it’s implemented from scratch here.  Also 
that it doesn’t use binary search, which would require a random-access 
list, so...

Well.  Not sure if it’s necessary.  Probably not.  Although I find it 
weird to start the search from the front when I’d imagine it’s more 
likely that new compressed clusters (extents) are added to the back.

> +
> +    cluster->n_bytes += extent->bytes;
> +}
> +
> +static CacheCluster *find_cluster_to_flush(Qcow2CompressedWriteCache *s)
> +{
> +    CacheCluster *c;
> +
> +    QTAILQ_FOREACH(c, &s->clusters, next) {
> +        if (!c->in_flight && cache_cluster_is_full(c)) {
> +            return c;

I don’t like it very much that this cache is built as an R/W cache, i.e. 
that entries are retained until they need to be flushed because a new 
entry needs space.

It was my impression this was meant as a write cache, that should speed 
up specifically O_DIRECT operation.  To me, that implies that entries 
are flushed once they are done, which is precisely why it works for 
compressed clusters, because we know when those are done.

I suppose nobody cares in practice because compression is basically only 
used for writing out whole images (so displacing clusters happens all 
the time, and once you’re done, the image is flushed and closed), but it 
just looks strange to me.

> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +/* Cache an extent if there is a place */
> +static bool coroutine_fn
> +try_cache_extent(Qcow2CompressedWriteCache *s, CacheExtent *extent,
> +                 bool *cluster_in_flight)

Like with other functions, but here especially, I would have liked some 
documentation on the interface.  I suppose the return value reflects 
whether the “try” worked (so a good guess is possible to me, but it’s 
still a guess at this point).

I have no idea what *cluster_in_flight means.  I would have guessed it 
means whether the host cluster touched by the compressed cluster is in 
flight, but it’s also set when the cache is disabled.  The caller seems 
to interpret it as “write this immediately”, which to me actually seems 
wrong, but more on that in said caller function below.

Perhaps this function should just have an enum return value that tells 
the caller precisely what to do with some expressively named values.

> +{
> +    CacheCluster *c;
> +    int64_t cluster_offset = QEMU_ALIGN_DOWN(extent->offset, s->cluster_size);
> +
> +    assert(extent->bytes);
> +
> +    if (s->max_active_clusters == 0) {
> +        *cluster_in_flight = true;
> +        return false;
> +    }
> +
> +    *cluster_in_flight = false;
> +
> +    c = find_cluster(s, cluster_offset);
> +    if (c && c->in_flight) {
> +        *cluster_in_flight = true;
> +        return false;
> +    }
> +    if (s->nb_active_clusters >= s->max_active_clusters &&
> +        (!c || !c->n_bytes))
> +    {
> +        /*
> +         * Cache is full, we can't allocate a new cluster and can't activate
> +         * existing inactive cluster
> +         */
> +        return false;
> +    }
> +
> +    if (!c) {
> +        c = cache_cluster_new(s, cluster_offset);
> +    }
> +
> +    cluster_add_extent(s, c, extent);
> +
> +    if (cache_cluster_is_full(c)) {
> +        qemu_co_queue_restart_all(&s->waiters);

This interface is unclear.  The documentation of s->waiters says to wake 
them up once there is a free space in the cache, but that isn’t the case 
here.  It’s true that it’s easy to make a free space (by flushing the 
full cluster), but there is no free space.

This also ties in to my uneasiness about how full clusters aren’t 
flushed immediately.

> +    }
> +
> +    return true;
> +}
> +
> +/* Takes ownership of @buf, don't free it after call! */
> +int coroutine_fn
> +qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, int64_t offset,
> +                                int64_t bytes, void *buf)
> +{
> +    int ret;
> +    int i;
> +    CacheExtent *extents[] = {NULL, NULL};
> +    int nb_extents = 0; /* number of non-NULL elements in @extents */
> +    int64_t e0_len;
> +
> +    assert(bytes > 0);
> +    assert(bytes < s->cluster_size);
> +
> +    e0_len = MIN(bytes, QEMU_ALIGN_UP(offset + 1, s->cluster_size) - offset);
> +    extents[0] = cache_extent_new(offset, e0_len, buf);
> +    nb_extents = 1;
> +
> +    if (bytes > e0_len) {
> +        int64_t e1_len = bytes - e0_len;
> +        /*
> +         * We have to allocate a new buffer, so that clusters are independent
> +         * and can free their extents when needed.
> +         */
> +        void *e1_buf = g_memdup(((const char *)buf) + e0_len, e1_len);
> +
> +        extents[1] = cache_extent_new(offset + e0_len, e1_len, e1_buf);
> +        nb_extents = 2;
> +    }
> +
> +    while (nb_extents) {
> +        bool do_write = false;
> +
> +        for (i = 0; i < 2; i++) {
> +            CacheExtent *e = extents[i];
> +
> +            do_write = false;
> +
> +            if (!e) {
> +                continue;
> +            }
> +
> +            if (try_cache_extent(s, e, &do_write)) {
> +                extents[i] = NULL;
> +                nb_extents--;
> +                continue;
> +            }
> +
> +            if (do_write) {
> +                ret = bdrv_co_pwrite(s->data_file, e->offset, e->bytes,
> +                                     e->buf, 0);

Is this safe?  do_write is set if the host cluster touched by this 
extent is in flight.  Because it can’t be full, it must currently be in 
the process of being flushed by cache_cluster_flush(), which flushes all 
consecutive areas with flush_consequitive_extents().  If the underlying 
file has some request alignment (which it tends to do with O_DIRECT), 
then those writes are likely transformed into RMW operations spanning 
more than their precise byte range.  Isn’t it possible that one of those 
RMWs then intersects with this write here?

If the host cluster is in flight, shouldn’t we just wait until it’s flushed?

> +
> +                cache_extent_free(e);
> +                extents[i] = NULL;
> +                nb_extents--;
> +
> +                if (ret < 0) {
> +                    goto out;
> +                }
> +            }
> +        }
> +
> +        if (do_write) {
> +            /*
> +             * We yielded during second extent writing. Probably the cache is
> +             * already free and we can now cache the first extent.

Where do we yield?  Do you mean it probably takes time to do the write, 
so it’s possible that if do_write is true because some cluster was in 
the process of being flushed, it is now removed from the cache, so we 
have a free entry?

Why not just check for whether we have a free entry?

Also, it’s possible that do_write is true just because the cache is 
disabled, which I guess is handled fine because then both extents will 
have been written to disk, so that nb_extents is now 0...  But that 
behavior isn’t documented here.

> +             */
> +            continue;
> +        }
> +
> +        if (nb_extents) {
> +            CacheCluster *cluster = find_cluster_to_flush(s);
> +
> +            if (cluster) {
> +                cluster->in_flight = true;
> +                ret = cache_cluster_flush_full(s, cluster);
> +                cluster->in_flight = false;
> +                qemu_co_queue_restart_all(&cluster->waiters);
> +                qemu_co_queue_restart_all(&s->waiters);

Looks weird to wake up other waiters here, because we are very likely 
going to take that spot, so it’s likely that nobody will be able to make 
use of it after we took another iteration.

It’s also weird because it’s different than the two other places which 
wake up s->waiters not if there’s a free space, but if a free space can 
be made by flushing find_cluster_to_flush().  As in, this is the only 
place where the queue is used as it is documented.

I think this again ties in with the question whether we shouldn’t flush 
clusters as soon as they are full instead of waiting until we need 
another free entry.

> +                if (ret < 0) {
> +                    goto out;
> +                }
> +                cache_cluster_remove(s, cluster);
> +                continue;
> +            }
> +
> +            qemu_co_queue_wait(&s->waiters, NULL);
> +        }
> +    }
> +
> +    ret = 0;
> +
> +out:
> +    for (i = 0; i < 2; i++) {
> +        cache_extent_free(extents[i]);
> +    }
> +
> +    return 0;

return ret, I think.

> +}
> +
> +int coroutine_fn
> +qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t offset,
> +                               int64_t bytes, void *buf)
> +{
> +    CacheCluster *c;
> +    CacheExtent *e;
> +    int64_t cluster_offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
> +
> +    c = find_cluster(s, cluster_offset);
> +    if (c) {
> +        QLIST_FOREACH(e, &c->extents, next) {
> +            if (e->offset == offset && e->bytes <= bytes) {
> +                memcpy(buf, e->buf, e->bytes);
> +                return 0;
> +            }

Again, reads like it should be a binary search.

I suppose e->bytes < bytes is OK because the only caller of this 
function is qcow2_co_preadv_compressed(), which passes a maximum length, 
effectively.  But then I’d call the parameter accordingly (i.e., 
max_bytes) and zero out the tail.

> +        }
> +    }
> +
> +    return bdrv_co_pread(s->data_file, offset, bytes, buf, 0);
> +}
> +
> +/*
> + * Caller states, that there would be no writes to this cluster beyond
> + * specified @cluster_data_end. So, it's OK to flush cluster when it is filled
> + * up to @cluster_data_end and it's OK to align flushing write operation up to
> + * some alignment (not greater than cluster_size of course).
> + */
> +void coroutine_fn
> +qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
> +                                          int64_t cluster_data_end)
> +{
> +    int64_t cluster_offset = QEMU_ALIGN_DOWN(cluster_data_end, s->cluster_size);

If cluster_data_end is aligned to a cluster boundary (I don’t think the 
caller does that, but...) this will do nothing, so cluster_offset is 
likely to be one cluster too high.

I wonder whether we should assert that cluster_data_end is not aligned 
to the cluster size, or whether we should use cluster_data_end - 1 here, 
or whether the caller should pass cluster_offset.

> +    CacheExtent *e;
> +    CacheCluster *c;
> +
> +    c = find_cluster(s, cluster_offset);
> +    if (!c) {
> +        c = cache_cluster_new(s, cluster_offset);

Is this case reachable?  How?

> +    }
> +
> +    QLIST_FOREACH(e, &c->extents, next) {
> +        assert(e->offset + e->bytes <= cluster_data_end);
> +    }
> +
> +    /* Shouldn't set data_end several times */
> +    assert(c->data_end == c->cluster_offset + s->cluster_size);
> +
> +    c->data_end = cluster_data_end;
> +    if (cache_cluster_is_full(c)) {
> +        qemu_co_queue_restart_all(&s->waiters);

Like in try_cache_extent(), this wakes up the queue while technically 
there is no free space.  I get the intention here, because as documented 
somewhere, this function is called from a mutexed section and we 
probably don’t want to write data to the data_file here.

But it would make sense for me to flush the cluster later as soon as 
possible, and then wake up the waiters.

> +    }
> +}
> +
> +Qcow2CompressedWriteCache *qcow2_compressed_cache_new(BdrvChild *data_file,
> +                                                      int64_t cluster_size,
> +                                                      int64_t cache_size)
> +{
> +    Qcow2CompressedWriteCache *s = g_new(Qcow2CompressedWriteCache, 1);
> +
> +    assert(cache_size >= cluster_size);
> +
> +    *s = (Qcow2CompressedWriteCache) {
> +        .data_file = data_file,
> +        .cluster_size = cluster_size,
> +        .max_active_clusters = cache_size / cluster_size,
> +    };
> +
> +    qemu_co_queue_init(&s->waiters);
> +    QTAILQ_INIT(&s->clusters);
> +
> +    return s;
> +}
> +
> +void qcow2_compressed_cache_free(Qcow2CompressedWriteCache *s)
> +{
> +    if (!s) {
> +        return;
> +    }
> +
> +    QTAILQ_FOREACH_FUNC_SAFE(&s->clusters, next, cache_cluster_free);

It seems strange to me to call this function if there are still clusters 
in the cache.  I suppose you can’t do anything else if the flush 
function failed to evict them, so I suppose it’s correct to do this, but 
it makes me flinch a bit.

> +    g_free(s);
> +}
> +
> +void qcow2_compressed_cache_set_size(Qcow2CompressedWriteCache *s,
> +                                     int64_t size)
> +{
> +    /*
> +     * We don't do flush here. Don't care too much, it's safe to have cache
> +     * larger than maximum, it will only decrease until it reaches the new
> +     * maximum.
> +     */
> +    assert(size >= s->cluster_size);
> +    s->max_active_clusters = size / s->cluster_size;
> +}

Simple enough, but I don’t see why we need it.  More on that in the next 
patch, though.

> +
> +void coroutine_fn
> +qcow2_compressed_cache_co_discard(Qcow2CompressedWriteCache *s,
> +                                  int64_t cluster_offset)

I don’t like this function’s name because I associate “discard” with 
discarding data.  I think “evict” would fit better, or perhaps “drop”. 
(I think “drop” better conveys that the data isn’t supposed to be 
written back.)

Max

> +{
> +    CacheCluster *c;
> +
> +    while (true) {
> +        c = find_cluster(s, cluster_offset);
> +        if (!c) {
> +            return;
> +        }
> +        if (!c->in_flight) {
> +            cache_cluster_remove(s, c);
> +            return;
> +        }
> +        qemu_co_queue_wait(&c->waiters, NULL);
> +    }
> +}
> +
> +
> +/*
> + * Wrappers for qcow2_compressed_cache_co_flush
> + *
> + * TODO: update scripts/block-coroutine-wrapper to generate this too
> + */
> +
> +typedef struct Qcow2CompressedCacheCoFlush {
> +    BdrvPollCo poll_state;
> +    Qcow2CompressedWriteCache *state;
> +} Qcow2CompressedCacheCoFlush;
> +
> +static void coroutine_fn
> +qcow2_compressed_cache_co_flush_entry(void *opaque)
> +{
> +    Qcow2CompressedCacheCoFlush *s = opaque;
> +
> +    s->poll_state.ret = qcow2_compressed_cache_co_flush(s->state);
> +    s->poll_state.in_progress = false;
> +
> +    aio_wait_kick();
> +}
> +
> +int qcow2_compressed_cache_flush(BlockDriverState *bs,
> +                                 Qcow2CompressedWriteCache *state)
> +{
> +    if (qemu_in_coroutine()) {
> +        return qcow2_compressed_cache_co_flush(state);
> +    } else {
> +        Qcow2CompressedCacheCoFlush s = {
> +            .poll_state.bs = bs,
> +            .poll_state.in_progress = true,
> +
> +            .state = state,
> +        };
> +
> +        s.poll_state.co =
> +            qemu_coroutine_create(qcow2_compressed_cache_co_flush_entry, &s);
> +
> +        return bdrv_poll_co(&s.poll_state);
> +    }
> +}
> +
> +/*
> + * Wrappers for qcow2_compressed_cache_co_stop_flush
> + *
> + * TODO: update scripts/block-coroutine-wrapper to generate this too
> + */
> +
> +typedef struct Qcow2CompressedCacheCoStopFlush {
> +    BdrvPollCo poll_state;
> +    Qcow2CompressedWriteCache *state;
> +} Qcow2CompressedCacheCoStopFlush;
> +
> +static void coroutine_fn
> +qcow2_compressed_cache_co_stop_flush_entry(void *opaque)
> +{
> +    Qcow2CompressedCacheCoStopFlush *s = opaque;
> +
> +    s->poll_state.ret = qcow2_compressed_cache_co_stop_flush(s->state);
> +    s->poll_state.in_progress = false;
> +
> +    aio_wait_kick();
> +}
> +
> +int qcow2_compressed_cache_stop_flush(BlockDriverState *bs,
> +                                      Qcow2CompressedWriteCache *state)
> +{
> +    if (qemu_in_coroutine()) {
> +        return qcow2_compressed_cache_co_stop_flush(state);
> +    } else {
> +        Qcow2CompressedCacheCoStopFlush s = {
> +            .poll_state.bs = bs,
> +            .poll_state.in_progress = true,
> +
> +            .state = state,
> +        };
> +
> +        s.poll_state.co =
> +            qemu_coroutine_create(qcow2_compressed_cache_co_stop_flush_entry,
> +                                  &s);
> +
> +        return bdrv_poll_co(&s.poll_state);
> +    }
> +}
> diff --git a/block/meson.build b/block/meson.build
> index eeaefe5809..7b94794c28 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -25,6 +25,7 @@ block_ss.add(files(
>     'qcow2-bitmap.c',
>     'qcow2-cache.c',
>     'qcow2-cluster.c',
> +  'qcow2-compressed-write-cache.c',
>     'qcow2-refcount.c',
>     'qcow2-snapshot.c',
>     'qcow2-threads.c',
> 


