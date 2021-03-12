Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C4338F00
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:43:04 +0100 (CET)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKi4F-0004OC-AD
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKi39-0002uA-Gx
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKi34-00045R-L4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615556508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRDy00Np8YhmJS7nH3Go8ZFdqruvpAX+lM+c29MF2nY=;
 b=P6yLiXJmkHmy7eKfsY0MHa7amdx23y9CRF1iTrKvaN0zSXekpv8J1Z6eSJf5qqf8W20joQ
 alm6Nh8XvRdSwmOshNK47LedsD9pi8mf4V4YqW5UMcE6lqbrDVWEZrlUBXH1AhSAIGwqoR
 6GSH9oA+g+aNzuc0keZ21mDfINg0Pt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-zhaCppyYPEWef9tpAmXMfw-1; Fri, 12 Mar 2021 08:41:45 -0500
X-MC-Unique: zhaCppyYPEWef9tpAmXMfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB385192D785;
 Fri, 12 Mar 2021 13:41:43 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-148.ams2.redhat.com
 [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AA05C1C5;
 Fri, 12 Mar 2021 13:41:42 +0000 (UTC)
Subject: Re: [PATCH v3 4/6] util: implement seqcache
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d9a75e53-0791-2cd7-f530-d07ea59fbe59@redhat.com>
Date: Fri, 12 Mar 2021 14:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305173507.393137-5-vsementsov@virtuozzo.com>
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
> Implement cache for small sequential unaligned writes, so that they may
> be cached until we get a complete cluster and then write it.
> 
> The cache is intended to be used for backup to qcow2 compressed target
> opened in O_DIRECT mode, but can be reused for any similar (even not
> block-layer related) task.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/qemu/seqcache.h |  42 +++++
>   util/seqcache.c         | 361 ++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS             |   6 +
>   util/meson.build        |   1 +
>   4 files changed, 410 insertions(+)
>   create mode 100644 include/qemu/seqcache.h
>   create mode 100644 util/seqcache.c

Looks quite good to me, thanks.  Nice explanations, too. :)

The only design question I have is whether there’s a reason you’re using 
a list again instead of a hash table.  I suppose we do need the list 
anyway because of the next_flush iterator, so using a hash table would 
only complicate the implementation, but still.

[...]

> diff --git a/util/seqcache.c b/util/seqcache.c
> new file mode 100644
> index 0000000000..d923560eab
> --- /dev/null
> +++ b/util/seqcache.c
> @@ -0,0 +1,361 @@
> +/*
> + * Cache for small sequential write requests.
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
> + *
> + *
> + * = Description =
> + *
> + * SeqCache is an abbreviation for Sequential Cache.
> + *
> + * The Cache is intended to improve performance of small unaligned sequential
> + * writes. Cache has a cluster_size parameter and the unit of caching is aligned
> + * cluster.  Cache has a list of cached clusters, several "finished" ones and at
> + * most one "unfinished". "unfinished" cluster is a cluster where last byte of
> + * last write operation is cached and there is a free place after that byte to
> + * the end of cluster. "finished" clusters are just stored in cache to be read
> + * or flushed and don't allow any writes to them.
> + *
> + * If write to the cache intersects cluster bounds, it's splat into several

*split

(Though I like “splat”.  Sounds like a wet blotch.)

> + * requests by cluster bounds. So, consider a write that doesn't intersect
> + * cluster bounds to describe the whole picture:
> + *
> + * There are two cases allowed:
> + *
> + * 1. Sequential write to "unfinished" cluster. Actually it's a write sequential
> + *    previous write. The data goes to "unfinished" cluster. If "unfinished" is
> + *    filled up to the cluster bound it becomes "finished".
> + *
> + * 2. Write to new cluster, not existing in the cache. It may be sequential to
> + *    previous write or not. Current "unfinshed" cluster (if exists) becomes

*unfinished

> + *    "finished" and new "unfinished" cluster is started. Note also that offset
> + *    of the write to new cluster is not required to be aligned.
> + *
> + *    Any other write operation (non-sequential write to "unfinished" cluster
> + *    or write to any of "finished" clusters) will crash.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/queue.h"
> +#include "qemu/seqcache.h"
> +
> +/*
> + * Cluster
> + *
> + * Representation of one cached cluster, aligned to SeqCache::cluster_size.
> + * Caches only one subregion of the cluster, started at @offset (may be
> + * unaligned to cluster_size) and of @bytes length (may be unaligned as well).
> + * The whole subregion always lay in one aligned cluster:
> + *
> + *      QEMU_ALIGN_DOWN(offset, cluster_size) ==
> + *          QEMU_ALIGN_DOWN(offset + bytes - 1, cluster_size)
> + *
> + * @buf is allocated to be able to fill the cluster up to the cluster end, i.e.
> + * allocated @buf length is at least:
> + *
> + *      cluster_size - offset % cluster_size
> + */
> +typedef struct Cluster {
> +   int64_t offset;
> +   int64_t bytes;
> +   uint8_t *buf;
> +   QSIMPLEQ_ENTRY(Cluster) entry;
> +} Cluster;
> +
> +/*
> + * SeqCache caches small sequential writes into "unfinished" @cur_write cluster,
> + * until entire cluster (of @cluster_size bytes) is filled by seqcache_write()
> + * calls.
> + *
> + * @cur_write->offset may be unaligned to @cluster_size if first write offset is
> + * not aligned (for example, if there was a flush request and cache was flushed,
> + * then we continue from the middle of the cluster with an empty cache).
> + *
> + * @cur_write may be NULL, which means we don't have current cluster and next
> + * seqcache_write() will start a new one.
> + *
> + * @all is a list of all clusters cached in the cache, some "finished" and one
> + * "unfinished" @cur_write (if exists). If @cur_write is not NULL it is a last
> + * one in the list.
> + *
> + * @nb_clusters is number of elements in @all list.
> + *
> + * @next_flush is an iterator for flushing. SeqCache knows nothing about how
> + * data should be flushing, so for flush user calls seqcache_get_next_flush()

s/flushing/flushed/

> + * (which moves @next_flush iterator) and when data is flushed somehow and cache
> + * is not needed anymore, user can call seqcache_discard_cluster().

AFAIU, next_flush always points to the first finished cluster that has 
not yet been returned by seqcache_get_next_flush(), is that correct? 
(Yes, at least the latter part is implied by this comment, I’m just 
asking for clarity, because I want to be sure the simple

   s->next_flush = QSIMPLEQ_NEXT(s->next_flush, entry);

in seqcache_get_next_flush() does what I think it does, which is never 
to let s->next_flush be NULL even though there are still flushable 
clusters somewhere.)

> + */
> +typedef struct SeqCache {
> +    int64_t cluster_size;
> +    int64_t nb_clusters;
> +    Cluster *cur_write;
> +    Cluster *next_flush;
> +    QSIMPLEQ_HEAD(, Cluster) all;
> +} SeqCache;

[...]

> +/* Align down @offset to s->cluster_size and search for corresponding cluster */
> +static Cluster *seqcache_find_cluster(SeqCache *s, int64_t offset)
> +{
> +    Cluster *cl;
> +    int64_t cl_start = cluster_start(s, offset);
> +
> +    QSIMPLEQ_FOREACH(cl, &s->all, entry) {
> +        if (cluster_start(s, cl->offset) == cl_start) {
> +            return cl;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +/* Makes current "unfinished" cluster the "finished" one. */

This sounds a bit like there’d be only a single finished cluster, so I’d 
rather write it as “Mark the current "unfinished" cluster as "finished".”

> +static void seqcache_finalize_current_cluster(SeqCache *s)
> +{
> +    if (s->cur_write && !s->next_flush) {
> +        s->next_flush = s->cur_write;
> +    }
> +    s->cur_write = NULL;
> +}
> +
> +/*
> + * Write an @offset, @bytes, @buf request into the cache. The requests MUST not

s/requests/request/

> + * intersect cluster bounds.
> + */
> +static void seqcache_write_one(SeqCache *s, int64_t offset, int64_t bytes,
> +                               uint8_t *buf)

Could use a const, though not a must.

> +{
> +    assert(bytes > 0);
> +    assert(cluster_start(s, offset) == cluster_start(s, offset + bytes - 1));
> +
> +    if (s->cur_write && offset == cached_end(s->cur_write)) {
> +        /* Continue sequential process */
> +        memcpy(s->cur_write->buf + s->cur_write->bytes, buf, bytes);
> +        s->cur_write->bytes += bytes;
> +
> +        if (cached_end(s->cur_write) == cluster_end(s, s->cur_write->offset)) {
> +            seqcache_finalize_current_cluster(s);
> +        }
> +
> +        return;
> +    }
> +
> +    /* We are starting a new cluster. Check that it's really new */
> +    assert(!seqcache_find_cluster(s, offset));
> +
> +    seqcache_finalize_current_cluster(s);
> +
> +    s->cur_write = g_new(Cluster, 1);
> +    *s->cur_write = (Cluster) {
> +        .offset = offset,
> +        .bytes = bytes,
> +        .buf = g_malloc(s->cluster_size),

I have to ask: Why not s->cluster_size - offset % s->cluster_size as 
advertised by the comment describing Cluster?

More practical question: Should we use qemu_memalign() (aligning either 
at the cluster size or at the block alignment, which would need to be 
passed to seqcache_new()) when offset is aligned to the cluster size? 
(Or with a custom alignment, if it is aligned to that.)

I feel that for O_DIRECT images it might be kind of important to align 
the buffer to the host block size.

> +    };
> +
> +    memcpy(s->cur_write->buf, buf, bytes);
> +    QSIMPLEQ_INSERT_TAIL(&s->all, s->cur_write, entry);
> +    s->nb_clusters++;
> +}
> +
> +/* Write an @offset, @bytes, @buf request into the cache. */
> +void seqcache_write(SeqCache *s, int64_t offset, int64_t bytes, uint8_t *buf)

“const” might again find its place here.

> +{
> +    while (bytes) {
> +        int64_t cl_end = cluster_end(s, offset);
> +        int64_t chunk = MIN(bytes, cl_end - offset);
> +
> +        seqcache_write_one(s, offset, chunk, buf);
> +        offset += chunk;
> +        bytes -= chunk;
> +        buf += chunk;
> +    }
> +}

[...]

> +/*
> + * Get next region for flushing. @offset, @bytes and @buf are out-parameters
> + * to return the region.
> + *
> + * @unfinished is in-out argument which means that user is interested in
> + * flushing unfinished cluster too:
> + *
> + * If there are "finished" clusters, "finished" cluster is returned and
> + * *@unfinished is set to false, independently of its original value.
> + *
> + * If there are no "finished" clusters but "unfinished" exists (i.e.
> + * s->cur_write != NULL and it is the only element of s->all), then *@unfinished
> + * value remains the same and the following logic works:
> + *
> + *    If *@unfinished:
> + *       return s->cur_write unfinished cluster for flushing
> + *    Else
> + *       return nothing
> + *
> + *
> + * Returns true and set @offset, @bytes, @buf and @unfinished if there is
> + * something to flush (accordingly to @unfinished value), returns false
> + * otherwise.
> + *
> + * Nothing is removed from the cache.

Out of curiosity, mainly, is that because the returned *buf is only 
valid as long as the entry is still in the cache, or is there a 
different reason that I’m missing?

(Hm, perhaps the fact that the user may want to keep it available for 
reading through seqcache_read()?)

> + */
> +bool seqcache_get_next_flush(SeqCache *s, int64_t *offset, int64_t *bytes,
> +                             uint8_t **buf, bool *unfinished)

Could be “uint8_t *const *buf”, I suppose.  Don’t know how much the 
callers would hate that, though.

> +{
> +    Cluster *req = s->next_flush;
> +
> +    if (s->next_flush) {
> +        *unfinished = false;
> +        req = s->next_flush;
> +        s->next_flush = QSIMPLEQ_NEXT(req, entry);
> +        if (s->next_flush == s->cur_write) {
> +            s->next_flush = NULL;
> +        }
> +    } else if (s->cur_write && *unfinished) {
> +        req = s->cur_write;

I was wondering whether flushing an unfinished cluster wouldn’t kind of 
finalize it, but I suppose the problem with that would be that you can’t 
add data to a finished cluster, which wouldn’t be that great if you’re 
just flushing the cache without wanting to drop it all.

(The problem I see is that flushing it later will mean all the data that 
already has been written here will have to be rewritten.  Not that bad, 
I suppose.)

> +    } else {
> +        return false;
> +    }
> +
> +    *offset = req->offset;
> +    *bytes = req->bytes;
> +    *buf = req->buf;
> +
> +    return true;
> +}
> +
> +/*
> + * Find corresponding cluster and drop it. No matter does requested @offset is
> + * cached itself or not.

The second sentence sounds strange grammatically, if I understand 
correctly, I’d change this to something like “Find the cluster 
corresponding to @offset and drop it.  It does not matter whether 
@offset itself is actually within that cluster’s cached range or not.”

Max

> + */


