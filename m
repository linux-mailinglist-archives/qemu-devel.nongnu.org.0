Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7C31EB3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:06:04 +0100 (CET)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCksV-0000rA-Lm
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCkrC-00087G-DY
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCkr2-0002pM-Io
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613660667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTRO3HpIToN/he/ZtdqG/eTGOP0VaGebC6AJYO+BjZ8=;
 b=SQ75SCmGiKZdl+bWk32WFQqGOKx/KPSY8fZSFiJdP5I31Yo+jNCtteX2D/+1piIz/e0gy+
 kVBuh9ClTDDo4ieQ4cTOUVIo2zSrn4s7PJ2KdfBY/hdfUICSihdwsd+oV2HmpGHJE7HaWT
 cfhhIiXfe0veBgTWlo1AoUtVyanFFMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-_bD5aus0PYyeqQlCEu2huQ-1; Thu, 18 Feb 2021 10:04:16 -0500
X-MC-Unique: _bD5aus0PYyeqQlCEu2huQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA47F107ACFB;
 Thu, 18 Feb 2021 15:04:13 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8913614F0;
 Thu, 18 Feb 2021 15:04:11 +0000 (UTC)
Subject: Re: [PATCH 2/7] block/qcow2: introduce cache for compressed writes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-3-vsementsov@virtuozzo.com>
 <741acab7-b641-9b18-c0ae-1a5d149536d7@redhat.com>
 <9ed1dfea-0681-a922-4d2d-3b40c14eae73@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b4e62093-4f01-05b5-4065-e11f33a08fe5@redhat.com>
Date: Thu, 18 Feb 2021 16:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9ed1dfea-0681-a922-4d2d-3b40c14eae73@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.21 13:49, Vladimir Sementsov-Ogievskiy wrote:
> you may jump first to my last inline answer
> 
> 10.02.2021 20:07, Max Reitz wrote:
>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>> Compressed writes and O_DIRECT are not friends: they works too slow,
>>> because compressed writes does many small unaligned to 512 writes.
>>>
>>> Let's introduce an internal cache, so that compressed writes may work
>>> well when O_DIRECT is on.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/qcow2.h                        |  29 +
>>>   block/qcow2-compressed-write-cache.c | 770 +++++++++++++++++++++++++++
>>>   block/meson.build                    |   1 +
>>>   3 files changed, 800 insertions(+)
>>>   create mode 100644 block/qcow2-compressed-write-cache.c
>>>
>>> diff --git a/block/qcow2.h b/block/qcow2.h
>>> index 0678073b74..fbdedf89fa 100644
>>> --- a/block/qcow2.h
>>> +++ b/block/qcow2.h
>>> @@ -322,6 +322,8 @@ typedef struct Qcow2BitmapHeaderExt {
>>>       uint64_t bitmap_directory_offset;
>>>   } QEMU_PACKED Qcow2BitmapHeaderExt;
>>> +typedef struct Qcow2CompressedWriteCache Qcow2CompressedWriteCache;
>>> +
>>>   #define QCOW2_MAX_THREADS 4
>>>   typedef struct BDRVQcow2State {
>>> @@ -1010,4 +1012,31 @@ int coroutine_fn
>>>   qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_offset,
>>>                    uint64_t guest_offset, void *buf, size_t len);
>>> +Qcow2CompressedWriteCache *qcow2_compressed_cache_new(BdrvChild 
>>> *data_file,
>>> +                                                      int64_t 
>>> cluster_size,
>>> +                                                      int64_t 
>>> cache_size);
>>> +void qcow2_compressed_cache_free(Qcow2CompressedWriteCache *s);
>>> +int coroutine_fn
>>> +qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t 
>>> offset,
>>> +                               int64_t bytes, void *buf);
>>> +int coroutine_fn
>>> +qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, 
>>> int64_t offset,
>>> +                                int64_t bytes, void *buf);
>>> +void coroutine_fn
>>> +qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
>>> +                                          int64_t cluster_data_end);
>>> +int coroutine_fn
>>> +qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s);
>>> +int qcow2_compressed_cache_flush(BlockDriverState *bs,
>>> +                                 Qcow2CompressedWriteCache *state);
>>> +int coroutine_fn
>>> +qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s);
>>> +int qcow2_compressed_cache_stop_flush(BlockDriverState *bs,
>>> +                                      Qcow2CompressedWriteCache *s);
>>> +void qcow2_compressed_cache_set_size(Qcow2CompressedWriteCache *s,
>>> +                                     int64_t size);
>>> +void coroutine_fn
>>> +qcow2_compressed_cache_co_discard(Qcow2CompressedWriteCache *s,
>>> +                                  int64_t cluster_offset);
>>> +
>>
>> It would be nice if these functions had their interface documented 
>> somewhere.
> 
> I tried to comment dificult things in .c... Is there a prefernce, where 
> to document
> how and what function does, in .h or in .c ?

No, but my problem was that I found even the things you probably didn’t 
consider difficult not completely obvious; i.e., I would’ve liked a full 
documentation on the function interface.  (And I don’t think there is 
such documentation in the .c file.)

>>>   #endif
>>> diff --git a/block/qcow2-compressed-write-cache.c 
>>> b/block/qcow2-compressed-write-cache.c
>>> new file mode 100644
>>> index 0000000000..7bb92cb550
>>> --- /dev/null
>>> +++ b/block/qcow2-compressed-write-cache.c
>>> @@ -0,0 +1,770 @@
>>> +/*
>>> + * Write cache for qcow2 compressed writes
>>> + *
>>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person 
>>> obtaining a copy
>>> + * of this software and associated documentation files (the 
>>> "Software"), to deal
>>> + * in the Software without restriction, including without limitation 
>>> the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, 
>>> and/or sell
>>> + * copies of the Software, and to permit persons to whom the 
>>> Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be 
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
>>> SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>>> OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>>> ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
>>> DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +
>>> +#include "block/block_int.h"
>>> +#include "block/block-gen.h"
>>> +#include "qemu/coroutine.h"
>>> +#include "qapi/qapi-events-block-core.h"
>>> +#include "qcow2.h"
>>> +
>>> +typedef struct CacheExtent {
>>> +    int64_t offset;
>>> +    int64_t bytes;
>>> +    void *buf;
>>> +    QLIST_ENTRY(CacheExtent) next;
>>> +} CacheExtent;
>>> +
>>> +typedef struct CacheCluster {
>>
>> It isn’t immediately clear what these two structures mean by just 
>> their name, because “extent” has no meaning in the context of qcow2.
> 
> It's not important for the cache are extents compressed clusters or 
> not.. So I'd keep more generic name

OK, but then my problem was that I had no idea what it’s supposed to 
represent.  I had to read the code, which I don’t think is ideal (i.e., 
I’d like to know what the structures are so I can understand what the 
code does, not having to figure out both at the same time).

>> I understand CacheExtent to basically be a compressed cluster, and 
>> CacheCluster to be a host cluster.  Perhaps their names should reflect 
>> that.
>>
>> (OTOH, the Cache* prefix seems unnecessary to me, because these are 
>> just local structs.)

[...]

>>> +
>>> +struct Qcow2CompressedWriteCache {
>>> +    /*
>>> +     * @data_file and @cluster_size are copied from qcow2 state. Not 
>>> huge
>>> +     * duplications, seems better to avoid accessing the whole qcow2 
>>> state
>>> +     * instead.
>>
>> Why?  What if in the future the data_file child can be changed with 
>> reopen?
> 
> I didn't considered this.. Still it's impossible now, yes? But would be 
> possible in future of course.
> 
>>
>> What’s the argument against accessing the whole qcow2 state?  That 
>> it’s a layering violation, that we shouldn’t access it while the rest 
>> uses it? 
> 
> To keep it simple to reuse the cache for something other.

I could give the argument of “isn’t that impossible right now?” right back.

But anyhow, that is a reason for “why”, but then it should be noted in 
the comment (i.e., not saying it’s better, but saying why it’s necessary).

>> If that’s a concern, perhaps *data_file should be an indirect pointer 
>> to the pointer in the BDRVQcow2State.
> 
> Or we should update it on reopen (like cache_size)

Yes, if we keep it duplicated here, then we’ll need to do it.

(The code didn’t note why it needs to be duplicated here, so if there 
had been no reason, it would’ve been easier not to duplicate it.)

[...]

>>> +static int coroutine_fn 
>>> flush_consequitive_extents(Qcow2CompressedWriteCache *s,
>>> +                                                   CacheExtent *first,
>>> +                                                   CacheExtent **next,
>>> +                                                   int64_t align)
>>> +{
>>> +    CacheExtent *e, *end_extent;
>>> +    int64_t end;
>>> +    int nb_extents = count_consequitive_extents(first, &end_extent, 
>>> &end);
>>
>> I’d prefer nb_bufs, because it will include a tail if present.
>>
>>> +    int64_t aligned_end = QEMU_ALIGN_UP(end, align);
>>> +    int64_t tail = aligned_end - end;
>>> +    int64_t len = aligned_end - first->offset;
>>> +
>>> +    /*
>>> +     * Alignment if for flushing full cluster, first extent offset 
>>> is always
>>
>> s/.*,/The alignment will not exceed the cluster size, so the/?
> 
> s/if/is/. When cluster is "full", which means it is filled up to its 
> data_end, the remaining tail is unsed, and we can align it up.

That doesn’t really help me understand.  What does “Alignment is for 
flushing full cluster” mean?  That the alignment is equal to the cluster 
size?  I think there should still be an "if" in there somewhere.

I think the full explanation for why this assertion is here and what it 
means is “If a full cluster is flushed and so a block alignment has been 
given*, the first extent's offset will be at the start of the cluster. 
Otherwise, the alignment is 1.  Therefore, if an alignment greater than 
1 is given, at most we need to add a tail, but not a head (which is what 
this assertion shows).”, but perhaps I’m still wrong.

*I think this statement then requires a comment on what the alignment is 
even for.  I’m not sure myself, because, well, it isn’t commented on 
anywhere.  I think it’s because we want to avoid RMW cycles for 
O_DIRECT, so the alignment most of the time will fit the host device 
block size (though at least 4k, I suppose to include devices with a 
logical block size of 512, but a physical block size of 4k).  But we 
can’t necessarily do that for non-full clusters, because those might 
need a padding head to accomplish that, but that might overwrite 
existing data that we don’t want to overwrite, so to keep it simple, we 
just align=1 there.  Is that about right?

[...]

>>> +/* @cluster takes ownership of @extent */
>>> +static void cluster_add_extent(Qcow2CompressedWriteCache *s,
>>> +                               CacheCluster *cluster, CacheExtent 
>>> *extent)
>>> +{
>>> +    CacheExtent *e;
>>> +
>>> +    assert(extent->bytes);
>>> +    assert(extent->offset >= cluster->cluster_offset);
>>> +    assert(extent->offset + extent->bytes <= cluster->data_end);
>>> +    assert(!cluster->in_flight);
>>> +
>>> +    e = QLIST_FIRST(&cluster->extents);
>>> +    if (!e) {
>>> +        /* inactive cluster */
>>> +        assert(!cluster->n_bytes);
>>> +        s->nb_active_clusters++;
>>> +        assert(s->nb_active_clusters <= s->max_active_clusters);
>>> +        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
>>> +    } else if (e->offset > extent->offset) {
>>> +        assert(extent->offset + extent->bytes <= e->offset);
>>> +        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
>>> +    } else {
>>> +        while (QLIST_NEXT(e, next) &&
>>> +               QLIST_NEXT(e, next)->offset < extent->offset) {
>>> +            e = QLIST_NEXT(e, next);
>>> +        }
>>> +
>>> +        /* Now e is last element with offset < extent->offset */
>>> +        assert(e->offset + e->bytes <= extent->offset);
>>> +
>>> +        QLIST_INSERT_AFTER(e, extent, next);
>>> +
>>> +        e = QLIST_NEXT(extent, next);
>>> +        if (e) {
>>> +            assert(extent->offset + extent->bytes <= e->offset);
>>> +        }
>>> +    }
>>
>> I like how in C one always tends to implement everything from 
>> scratch.I think adding an element into an already-sorted list is a 
>> standard problem, so it’s a shame that it’s implemented from scratch 
>> here.  Also that it doesn’t use binary search, which would require a 
>> random-access list, so...
> 
> Yes, we have g_list_insert_sorted(), but it doesn't use binary search 
> anyway.

lol

(I mean, it’s impossible to use binary search on a GList, but still.)

> So I decided to use typed lists as Kevin said they are better.. 
> Still I'm not fun of all these macros.
> 
>>
>> Well.  Not sure if it’s necessary.  Probably not.  Although I find it 
>> weird to start the search from the front when I’d imagine it’s more 
>> likely that new compressed clusters (extents) are added to the back.
> 
> Thought about this too, but decided to not care.
> 
> 1. I think, it's all doesn't really matter, as io write operation is a 
> lot longer than all these opeartions with a list.
> 
> 2. Still it's interesting :)

Yes, basically my thinking, too.  I just couldn’t help but notice it 
seems like a standard problem that should have a pre-implemented simple 
solution, but I don’t think there’s a reason to spend too much time and 
effort here.

> When adding extent we want to check that it doesn't intersect with other 
> extents. And we want to have sorted list when flush the cluster.
> 
> In GLib there is GTree. It has g_tree_foreach in sorted order. But it 
> doesn't have an option to get neighbours of inserted element (to check 
> intersection), neither it have something like lower_bound and 
> upper_bound :\
> 
> Hmm, implementing a tree from stratch is not what I want to do in 
> context of my cache :\  Any ideas?
> 
> wow, I found this: 
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1509
> 
> So, 3 months ago all we need was merged into GLib master.. Aha and it's 
> in GLib 2.67.0.. and centos7 has 2.56..
> 
> I can add a comment: "refactor using GTree node-based API when it become 
> available (it will in GLib 2.67)"

Why not.  Might be cool.

>>> +
>>> +    cluster->n_bytes += extent->bytes;
>>> +}
>>> +
>>> +static CacheCluster *find_cluster_to_flush(Qcow2CompressedWriteCache 
>>> *s)
>>> +{
>>> +    CacheCluster *c;
>>> +
>>> +    QTAILQ_FOREACH(c, &s->clusters, next) {
>>> +        if (!c->in_flight && cache_cluster_is_full(c)) {
>>> +            return c;
>>
>> I don’t like it very much that this cache is built as an R/W cache, 
>> i.e. that entries are retained until they need to be flushed because a 
>> new entry needs space.
>>
>> It was my impression this was meant as a write cache, that should 
>> speed up specifically O_DIRECT operation.  To me, that implies that 
>> entries are flushed once they are done, which is precisely why it 
>> works for compressed clusters, because we know when those are done.
> 
> We learn that cluster is finished in two cases:
> 
> 1. when data_end is set and we see that cluster is full. That's a bad 
> place for flushing, as we are under qcow2 mutex.
> 2. when we add an extent. That's occures during some write operation.. 
> And I don't see real difference, flushing cluster here or when we want 
> to create one more cluster.
> 
> And because we don't want to flush at [1], we'll probably have some lost 
> full cluster if flush only on [2]. So, we anyway should flush when want 
> to create new cluster but cache is full. And then no real reason to 
> flush on [2]

Yes, I acknowledged that for qcow2_compressed_cache_co_set_cluster_end() 
(“I get the intention here, because as documented somewhere, this 
function is called from a mutexed section and we probably don’t want to 
write data to the data_file here.”).

But I also raised the question of whether we might delay the 
set_cluster_end() or the flush until the mutex is no longer taken, so 
we’d still flush as soon as possible.

I suppose if you want a more versatile cache, delaying the flush until 
the cache is needed will make sense, so it also serves as a read cache, 
but in its advertised form for caching compressed clusters specifically 
for the O_DIRECT case, I’d prefer to flush as soon as possible.

>> I suppose nobody cares in practice because compression is basically 
>> only used for writing out whole images (so displacing clusters happens 
>> all the time, and once you’re done, the image is flushed and closed), 
>> but it just looks strange to me.
>>
>>> +        }
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +/* Cache an extent if there is a place */
>>> +static bool coroutine_fn
>>> +try_cache_extent(Qcow2CompressedWriteCache *s, CacheExtent *extent,
>>> +                 bool *cluster_in_flight)
>>
>> Like with other functions, but here especially, I would have liked 
>> some documentation on the interface.
> 
> will add
> 
>>   I suppose the return value reflects whether the “try” worked (so a 
>> good guess is possible to me, but it’s still a guess at this point).
>>
>> I have no idea what *cluster_in_flight means.
> 
> Neither me at this point, I don't remember:) But everything is so 
> obvious when you are writing the code..
> 
> Ok, looking forward, *cluster_in_flight means that cluster is now 
> flushing, so please don't even retry to cache this extent!

But that doesn’t apply when the cache is disabled, in which case 
*cluster_in_flight is also set.

>> I would have guessed it means whether the host cluster touched by the 
>> compressed cluster is in flight, but it’s also set when the cache is 
>> disabled.  The caller seems to interpret it as “write this 
>> immediately”, which to me actually seems wrong, but more on that in 
>> said caller function below.
>>
>> Perhaps this function should just have an enum return value that tells 
>> the caller precisely what to do with some expressively named values.

So this is still something I think might make sense.

[...]

>>> +
>>> +                cache_extent_free(e);
>>> +                extents[i] = NULL;
>>> +                nb_extents--;
>>> +
>>> +                if (ret < 0) {
>>> +                    goto out;
>>> +                }
>>> +            }
>>> +        }
>>> +
>>> +        if (do_write) {
>>> +            /*
>>> +             * We yielded during second extent writing. Probably the 
>>> cache is
>>> +             * already free and we can now cache the first extent.
>>
>> Where do we yield?  Do you mean it probably takes time to do the 
>> write, so it’s possible that if do_write is true because some cluster 
>> was in the process of being flushed, it is now removed from the cache, 
>> so we have a free entry?
>>
>> Why not just check for whether we have a free entry?
> 
> and we do it, moving to try_cache_extent at start of loop..

Yes.  But why not check here, and only continue if there is a free entry?

(The problem with “continue” is that it’s a goto in disguise, so I don’t 
like using it just to avoid code duplication.  I think “continue” should 
only be used if you really want to do the next iteration, but in this 
case it seems like you just want to avoid a duplicated check.)

[...]

>>> +    CacheExtent *e;
>>> +    CacheCluster *c;
>>> +
>>> +    c = find_cluster(s, cluster_offset);
>>> +    if (!c) {
>>> +        c = cache_cluster_new(s, cluster_offset);
>>
>> Is this case reachable?  How?
> 
> Ooops... I feel stupid. Great thing that you asked this question!
> 
> Somehow I thought that already allocated clusters may be in progress 
> of... what? compression? writing?.. But actually allocation is of course 
> done after compression. So we may compress clusters in parallel, but 
> than they allocated and written sequentially. Of courese without the 
> cache the writes themselves may go in parallel. But write to cache is 
> immediate and doesn't yield. We even can do it before unlocking qcow2 
> mutex to be sure that we don't switch to another coroutine to write next 
> extent first.
> 
> Seems I was wrong, and all this can be a lot simpler. Very sorry for 
> your time. But it helped me to open my eyes :\

Well, looking forward to v2 then. :)

Max


