Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BB338B61
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:19:25 +0100 (CET)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfpE-0003Eq-Ft
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKfnM-0008VU-0a
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKfnH-000832-F6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615547842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9ScwPbekDTRjeeU6XchZozZLzZwkWKfpUsTt+JI8HA=;
 b=AgTXUopziyMM9PXNkjKgKuyWfK0j1XBcErWezyDIwt4acYXjCtvvn1MFQXSrTGlzpUVZIs
 LgOw0nTLcFcwZOZXsTN+S5MCMo8UeULze/ybEVz2EvoRURXgclxwRsUreDxbErCKmR1EkW
 /cVzIA2Wyc+K/NeHmC8VSAjN5Pz+Q04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-ubaNlqJwN2arRPdUdqbDdg-1; Fri, 12 Mar 2021 06:17:17 -0500
X-MC-Unique: ubaNlqJwN2arRPdUdqbDdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 900E394EE3;
 Fri, 12 Mar 2021 11:17:16 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-148.ams2.redhat.com
 [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A72645D75F;
 Fri, 12 Mar 2021 11:17:14 +0000 (UTC)
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
Date: Fri, 12 Mar 2021 12:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
> 11.03.2021 22:58, Max Reitz wrote:
>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>> becomes 0) and reused during data write. In this case data write may
>>> pollute another cluster (recently allocated) or even metadata.
>>
>> I was about to ask whether we couldn’t somehow let discard requests 
>> check overlapping I/O with the tracked_request infrastructure from 
>> block/io.c (or perhaps even just let them be serializing).
>>
>> But I suppose there may be other reasons for clusters being discarded 
>> other than explicit discard requests, so we have to have something in 
>> qcow2...
> 
> For example, host cluster which contain exactly one compressed cluster 
> may be discarded when corresponding guest cluster is rewritten by 
> non-compressed write.
> 
> Also, (not very good argument for fixing existing bug but still) 
> serializing will not help with compressed-cache, because with compressed 
> cache we'll have data writes (cache flushes) not related to current 
> in-flight request. And that leads us to something like serializing of 
> operations with .file child of qcow2 node. But we can't do it, as 
> "discarding" a host cluster is operation with metadata, which may do no 
> operation with underlying .file child.

Yes, makes sense.  I think it is a good argument, because the point is 
that qcow2 host cluster discards are not necessarily related to guest 
discards.  The compressed cache is just one new example for that.

>>> To fix the issue let's track inflight writes to host cluster in the
>>> hash table and consider new counter when discarding and reusing host
>>> clusters.
>>
>> This didn’t really explain anything that would help me understand 
>> what’s going on in this patch.  The patch itself doesn’t really help 
>> me with comments either.  It’s possible that I’m just daft, but 
>> honestly I have a hard time really understanding what’s supposed to be 
>> going on.
> 
> Sorry for this. I believe into your experience of understanding my 
> patches, so that shows that something is wrong with the patch itself)
> 
>>
>> Coming back from jumping all over this patch, I also wonder why this 
>> isn’t split in multiple patches, where the first introduces the 
>> infrastructure and explains exactly what’s going on, and the next 
>> patches make use of it so I could understand what each check etc. is 
>> supposed to represent and do.
> 
> OK
> 
>>
>>
>> To serve as an example, after reading through the patch, I still have 
>> no idea how it prevents that discard problem you’re trying to fix.  
>> Maybe I’m lazy, but I would have liked exactly that to be explained by 
>> this commit message.  Actually, I don’t even understand the problem 
>> just from this commit message alone, but I could resort to HEAD^ and 
>> some thinking.  Not sure if that’s ideal, though.
> 
> The problem:
> 
> 1. Start write to qcow2. Assume guest cluster G and corresponding host 
> cluster is H.
> 
> 2. The write requests come to the point of data writing to .file. The 
> write to .file is started and qcow2 mutex is unlocked.
> 
> 3. At this time refcount of H becomes 0. For example, it may be due to 
> discard operation on qcow2 node, or rewriting compressed data by normal 
> write, or some operation with snapshots..
> 
> 4. Next, some operations occurs and leads to allocation of H for some 
> other needs: it may be another write-to-qcow2-node operation, or 
> allocation of L2 table or some other data or metadata cluster allocation.
> 
> 5. So, at this point H is used for something other. Assume, L2 table is 
> written into H.
> 
> 6. And now, our write from [2] finishes. And pollutes L2 table in H. 
> That's a bug.

Understood.

> The problem becomes more possible with compressed write cache, because 
> any flush operation may trigger deferred data writes, so problem can be 
> reproduced like:
> 
> 1. Write to guest cluster G2, which triggers flushing of data to host 
> cluster H, which is unrelated to G2.
> 
> 2. Discard cluster G in parallel
> 
> [...]
> 
> So, problem is simply triggered by parallel write and discard to 
> different guest clusters. That's why I should do something with this old 
> (and most probably never triggered) problem in qcow2 driver prior to 
> implementing compressed cache.

OK!  That makes sense.

> Hmm, probably we can avoid all these difficulties by implementing 
> compressed cache as a filter driver between qcow2 and its .file nodes..

As I see it, you’ve now opened the can of worms, and I’m not sure we can 
just close it and say we haven’t seen any problem. :)

So, regardless of the compressed cache, I think this should be fixed.

> I tried to do it, encountered some problems, but I don't remember what 
> exactly. Probably I should return to this try. Some obvious problems:
> 
> 1. Metadata write will go through cache, and we should handle it somehow 
> to not break the sequence of unaligned chunks. Simplest way is to add 
> BDRV_REQ_COLORED flag and do compressed data writes to .file with this 
> flag. And cache filter would track this flag for sequential caching.
> 
> 2. We can't enable caching by default this way, so user will have to 
> explicitly add a filter.. And actually, it's a real problem of qcow2 
> driver that in O_DIRECT mode it writes compressed data by small 
> unaligned chunks. So, good to fix it inside qcow2..

Agreed.

> With filter we avoid the problem of parallel reuse of host cluster, as 
> all writes go through the cache and flushes will be serialized. So, the 
> problem in qcow2 driver is not enlarged by the cache and we can leave it 
> unfixed..

Not sure I agree. ;)

>> So the commit message says that “host cluster can be discarded and 
>> reused during data write”, which to me just seems like the exact 
>> behavior we want.  The second sentence describes a problem, but 
>> doesn’t say how reclaiming discarded clusters leads there.
>>
>> I suppose what leads to the problem is that there first needs to be a 
>> background write even before the discard that is settled only after 
>> the re-claiming write (which isn’t mentioned).
>>
>> As far as I understand, this patch addresses that problem by 
>> preventing the discarded clusters from being allocated while said 
>> background write is not settled yet.  This is done by keeping track of 
>> all host clusters that are currently the target of some write 
>> operation, and preventing them from being allocated.  OK, makes sense.
>> (This latter part does roughly correspond to the second paragraph of 
>> this commit message, but I couldn’t make sense of it without 
>> understanding why we’d do it.  What’s notably missing from my 
>> explanation is the part that you hinted at with “when discarding”, but 
>> my problem is that that I just don’t understand what that means at 
>> all.  Perhaps it has to do with how I don’t understand the change to 
>> update_refcount(), and consequently the whole “slow path” in 
>> update_inflight_write_cnt().)
> 
> 
> Let me explain:
> 
> What is the problem? User uses dynamic object, and the object disappear 
> during the usage. Use-after-free follows. This means that we probably 
> want reference counting for the object, so that user will keep the 
> reference during usage, and object is freed when refcount becomes 0. But 
> for qcow2 host clusters we already have reference counting!

Makes sense.

> Still, we 
> don't want to simply reuse qcow2 refcounts as normal reference counters 
> for two reasons:
> 
> 1. qcow2 refcounts is part of qcow2 metadata and strictly defined. Qcow2 
> refcounts shows only usage of the host cluster by other objects in qcow2 
> metadata. But what we want is usage by the process of writing data.

Indeed.

> 2. we don't want to do additional read/write of refcounts from/to 
> physical drive

Right.

> So, what comes to my mind is and additional "dynamic" in-RAM reference 
> counter for host cluster. So that actual full reference count of host 
> cluster is qcow2-refcount + inflight-write-cnt.

OK, yes, that makes a lot of sense.

> So, what we need for this:
> 
> 1. calculate these new inflight-write-cnt, increase it before data write 
> and decrease after.
> 
> 2. update the core thing of reference counting: freeing the object.

Makes sense, but I don’t see how your change to update_refcount() does 
that, though.  But OTOH I do see how you prevent use-after-frees (by 
preventing allocations  of clusters with refcount == 0 but with active 
writes on them), which works just as well.

And if freeing the object (clusters) were postponed until all writes are 
settled, I don’t think we’d need the checks in the cluster allocation 
functions.

> Currently the object is "freed" when qcow2-refcoutn becomes 0, that's 
> the code in update_recounts(). But we want to postpone freeing until 
> full reference count becomes zero, i.e. both qcow2-refcount is zero and 
> inflight-write-cnt is zero. So, if qcow2-refcount becomes zero but 
> inflight-write-cnt is nonzero, we postpone discarding the cluster, 
> storing needed information in Qcow2InFlightRefcount. And when 
> inflight-write-cnt becomes zero (and we see this information) we call 
> update_refcount(addend=0) to trigger actual discarding of the cluster.
> 
> 3. we should consider full reference count when search for free host 
> clusters.
> 
>>
>>
>> Side note: Intuitively, this hash table feels like an unnecessarily 
>> big hammer to me, but I can’t think of a better solution either, so.  
>> (I mainly don’t like how every write request will result in one 
>> allocation and hash table entry per cluster it touches, even when no 
>> data cluster is ever discarded.)
> 
> We can have a list of inflight-data-writes instead.

Yes.  I’m not sure which would actually be better in the end.

I feel such a list would be better for the normal case (just writes, no 
allocations or discards), but I don’t know how much worse they’d be when 
something needs to be looked up (i.e. on allocations or discards).

> I afraid, we can't 
> reuse tracked requests of underlying .file node, because we should add 
> inflight-write to the list before releasing the qcow2 mutex.

Yes.

>>> Enable qcow2-discard-during-rewrite as it is fixed.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/qcow2.h                                 |   9 ++
>>>   block/qcow2-refcount.c                        | 149 +++++++++++++++++-
>>>   block/qcow2.c                                 |  26 ++-
>>>   .../tests/qcow2-discard-during-rewrite        |   2 +-
>>>   4 files changed, 181 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/block/qcow2.h b/block/qcow2.h
>>> index 0678073b74..e18d8dfbae 100644
>>> --- a/block/qcow2.h
>>> +++ b/block/qcow2.h
>>> @@ -420,6 +420,8 @@ typedef struct BDRVQcow2State {
>>>        * is to convert the image with the desired compression type set.
>>>        */
>>>       Qcow2CompressionType compression_type;
>>> +
>>> +    GHashTable *inflight_writes_counters;
>>>   } BDRVQcow2State;
>>>   typedef struct Qcow2COWRegion {
>>> @@ -896,6 +898,13 @@ int qcow2_shrink_reftable(BlockDriverState *bs);
>>>   int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
>>>   int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
>>> +int qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
>>> +                              int64_t length);
>>> +int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
>>> +                              int64_t length);
>>> +int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t 
>>> offset,
>>> +                                     int64_t length);
>>> +
>>>   /* qcow2-cluster.c functions */
>>>   int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
>>>                           bool exact_size);
>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>> index 8e649b008e..464d133368 100644
>>> --- a/block/qcow2-refcount.c
>>> +++ b/block/qcow2-refcount.c
>>> @@ -799,6 +799,140 @@ found:
>>>       }
>>>   }
>>> +/*
>>> + * Qcow2InFlightRefcount is a type for values of 
>>> s->inflight_writes_counters
>>> + * hasm map. And it's keys are cluster indices.
>>
>> *hash, *its
>>
>> I’d rather document this for s->inflight_writes_counters, though (like 
>> “/* cluster index (int64_t) -> Qcow2InFlightRefcount */”)
>>
>>> + */
>>> +typedef struct Qcow2InFlightRefcount {
>>> +    /*
>>> +     * Number of in-flight writes to the cluster, always > 0, as 
>>> when becomes
>>
>> s/when becomes/when it becomes/
>>
>>> +     * 0 the entry is removed from s->inflight_writes_counters.
>>> +     */
>>> +    uint64_t inflight_writes_cnt;
>>> +
>>> +    /* Cluster refcount is known to be zero */
>>> +    bool refcount_zero;
>>> +
>>> +    /* Cluster refcount was made zero with this discard-type */
>>> +    enum qcow2_discard_type type;
>>> +} Qcow2InFlightRefcount;
>>> +
>>> +static Qcow2InFlightRefcount *find_infl_wr(BDRVQcow2State *s,
>>> +                                           int64_t cluster_index)
>>> +{
>>> +    Qcow2InFlightRefcount *infl;
>>> +
>>> +    if (!s->inflight_writes_counters) {
>>> +        return NULL;
>>> +    }
>>> +
>>> +    infl = g_hash_table_lookup(s->inflight_writes_counters, 
>>> &cluster_index);
>>> +
>>> +    if (infl) {
>>> +        assert(infl->inflight_writes_cnt > 0);
>>> +    }
>>> +
>>> +    return infl;
>>> +}
>>> +
>>> +/*
>>> + * Returns true if there are any in-flight writes to the cluster 
>>> blocking
>>> + * its reallocation.
>>> + */
>>> +static bool has_infl_wr(BDRVQcow2State *s, int64_t cluster_index)
>>> +{
>>> +    return !!find_infl_wr(s, cluster_index);
>>
>> I wonder if g_hash_table_contains() would be quicker. *shrug*
>>
>>> +}
>>> +
>>> +static int update_inflight_write_cnt(BlockDriverState *bs,
>>> +                                     int64_t offset, int64_t length,
>>> +                                     bool decrease, bool locked)
>>> +{
>>> +    BDRVQcow2State *s = bs->opaque;
>>> +    int64_t start, last, cluster_offset;
>>> +
>>> +    if (locked) {
>>> +        qemu_co_mutex_assert_locked(&s->lock);
>>> +    }
>>> +
>>> +    start = start_of_cluster(s, offset);
>>> +    last = start_of_cluster(s, offset + length - 1);
>>> +    for (cluster_offset = start; cluster_offset <= last;
>>> +         cluster_offset += s->cluster_size)
>>> +    {
>>> +        int64_t cluster_index = cluster_offset >> s->cluster_bits;
>>> +        Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>> +
>>> +        if (!infl) {
>>> +            infl = g_new0(Qcow2InFlightRefcount, 1);
>>> +            g_hash_table_insert(s->inflight_writes_counters,
>>> +                                g_memdup(&cluster_index, 
>>> sizeof(cluster_index)),
>>> +                                infl);
>>
>> I suppose we could save one allocation by putting the cluster index 
>> into Qcow2InFlightRefcount and then giving the key as 
>> &infl->cluster_index. Not sure if that’s too nasty, though.
> 
> Allocations are a lot faster than IO.. So, I don't think we'll see the 
> difference in normal cases.

Sure.

>>> +        }
>>> +
>>> +        if (decrease) {
>>> +            assert(infl->inflight_writes_cnt >= 1);
>>> +            infl->inflight_writes_cnt--;
>>> +        } else {
>>> +            infl->inflight_writes_cnt++;
>>> +        }
>>> +
>>> +        if (infl->inflight_writes_cnt == 0) {
>>> +            bool refcount_zero = infl->refcount_zero;
>>> +            enum qcow2_discard_type type = infl->type;
>>> +
>>> +            g_hash_table_remove(s->inflight_writes_counters, 
>>> &cluster_index);
>>> +
>>> +            if (refcount_zero) {
>>> +                /*
>>> +                 * Slow path. We must reset normal refcount to 
>>> actually release
>>
>> I don’t understand what “slow path” means in this context.  (Nor do I 
>> really understand the rest, but more on that below.)
> 
> 
> In most cases inc/dev of inflight-writes-cnt is fast: it only update 
> in-memory structure. But when full reference count of the cluster 
> becomes zero we call real update_refcount to trigger discarding of the 
> cluster.. This may be slower. Probably the needed code should be moved 
> from update_refcount to separate function like host_cluster_free(), to 
> not cheat with addend=0.

OK.

>>> +                 * the cluster.
>>> +                 */
>>> +                int ret;
>>> +
>>> +                if (!locked) {
>>> +                    qemu_co_mutex_lock(&s->lock);
>>> +                }
>>> +                ret = qcow2_update_cluster_refcount(bs, 
>>> cluster_index, 0,
>>> +                                                    true, type);
>>
>> I don’t understand this, but then again I’m writing this very early in 
>> my review, and at this point I don’t understand anything, really.  
>> (The comment doesn’t explain to me what’s happening here.)
>>
>> Revisiting later, refcount_zero is set by update_refcount() when the 
>> refcount drops to zero, so invoking this function here will finalize 
>> the change.  I don’t quite understand what’s going on in 
>> update_refcount(), though.
>>
>> (And even after finding out why, I don’t understand why the comment 
>> doesn’t explain why we must invoke qcow2_update_cluster_refcount() 
>> with addend=0.)
> 
> Sorry for the mess. Here we want to trigger the code in 
> update_refcount() that is freeing host cluster.. I.e. the code that runs 
> when refcount becomes zero.
> 
>>
>>> +                if (!locked) {
>>> +                    qemu_co_mutex_unlock(&s->lock);
>>> +                }
>>> +
>>> +                if (ret < 0) {
>>> +                    return ret;
>>> +                }
>>> +            }
>>> +        }
>>> +
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
>>> +                              int64_t length)
>>> +{
>>> +    return update_inflight_write_cnt(bs, offset, length, false, false);
>>> +}
>>> +
>>> +/*
>>> + * Called with s->lock not locked by caller. Will take s->lock only 
>>> if need to
>>> + * release the cluster (refcount is 0 and inflight-write-cnt becomes 
>>> zero).
>>> + */
>>
>> Why doesn’t qcow2_inflight_writes_inc() get the same comment?
>>
>> ...Oh, because @locked doesn’t have an influence there.  Why isn’t it 
>> worth a comment that *_inc() works both with a locked and an unlocked 
>> mutex?
> 
> OK, it worth
> 
>>
>>> +int qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
>>> +                              int64_t length)
>>> +{
>>> +    return update_inflight_write_cnt(bs, offset, length, true, false);
>>> +}
>>> +
>>> +/* Called with s->lock locked. */
>>> +int qcow2_inflight_writes_dec_locked(BlockDriverState *bs, int64_t 
>>> offset,
>>> +                                     int64_t length)
>>> +{
>>> +    return update_inflight_write_cnt(bs, offset, length, true, true);
>>> +}
>>> +
>>>   /* XXX: cache several refcount block clusters ? */
>>>   /* @addend is the absolute value of the addend; if @decrease is 
>>> set, @addend
>>>    * will be subtracted from the current refcount, otherwise it will 
>>> be added */
>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT 
>>> update_refcount(BlockDriverState *bs,
>>>           if (refcount == 0) {
>>>               void *table;
>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, 
>>> cluster_index);
>>> +
>>> +            if (infl) {
>>> +                infl->refcount_zero = true;
>>> +                infl->type = type;
>>> +                continue;
>>> +            }
>>
>> I don’t understand what this is supposed to do exactly.  It seems like 
>> it wants to keep metadata structures in the cache that are still in 
>> use (because dropping them from the caches is what happens next), but 
>> users of metadata structures won’t set in-flight counters for those 
>> metadata structures, will they?
> 
> Don't follow.
> 
> We want the code in "if (refcount == 0)" to be triggered only when full 
> reference count of the host cluster becomes 0, including 
> inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we 
> postpone freeing the host cluster, it will be done later from "slow 
> path" in update_inflight_write_cnt().

But the code under “if (refcount == 0)” doesn’t free anything, does it? 
  All I can see is code to remove metadata structures from the metadata 
caches (if the discarded cluster was an L2 table or a refblock), and 
finally the discard on the underlying file.  I don’t see how that 
protocol-level discard has anything to do with our problem, though.

As far as I understand, the freeing happens immediately above the “if 
(refcount == 0)” block by s->set_refcount() setting the refcount to 0. 
(including updating s->free_cluster_index if the refcount is 0).

>> (I also wondered why the continue wasn’t put before the 
>> s->set_refcount() call, but I suppose the same effect is had by the 
>> has_infl_wr() check in alloc_clusters_noref() and 
>> qcow2_alloc_clusters_at().)
> 
> The only change of update_refcount() logic is postponing of freeing the 
> cluster. So, handling of qcow2-refacount is kept as is. qcow2-refcount 
> becomes zero, and s->set_refcount() is called. inflight-write-cnt is a 
> separate thing, not the cache for qcow2-refcount.
> 
>>
>>>               table = 
>>> qcow2_cache_is_table_offset(s->refcount_block_cache,
>>>                                                   offset);
>>> @@ -983,7 +1124,7 @@ retry:
>>>           if (ret < 0) {
>>>               return ret;
>>> -        } else if (refcount != 0) {
>>> +        } else if (refcount != 0 || has_infl_wr(s, 
>>> next_cluster_index)) {
>>>               goto retry;
>>>           }
>>>       }
>>> @@ -1046,7 +1187,7 @@ int64_t 
>>> qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
>>>               ret = qcow2_get_refcount(bs, cluster_index++, &refcount);
>>>               if (ret < 0) {
>>>                   return ret;
>>> -            } else if (refcount != 0) {
>>> +            } else if (refcount != 0 || has_infl_wr(s, 
>>> cluster_index)) {
>>>                   break;
>>>               }
>>>           }
>>> @@ -2294,7 +2435,9 @@ static int64_t 
>>> alloc_clusters_imrt(BlockDriverState *bs,
>>>            contiguous_free_clusters < cluster_count;
>>>            cluster++)
>>>       {
>>> -        if (!s->get_refcount(*refcount_table, cluster)) {
>>> +        if (!s->get_refcount(*refcount_table, cluster) &&
>>> +            !has_infl_wr(s, cluster))
>>
>> Is this really necessary?
> 
> Yes. Everywhere when we want free cluster, we should check that full 
> reference count is zero, which is qcow2-refcount + inflight-write-cnt.. 
> Which is equal to check that both qcow2-refcount and inflight-write-cnt 
> are zero. And for for zero inflight-write-cnt it must just be absent in 
> the hash.

I understand the sentiment, but I don’t think that reasoning applies 
here.  The in-memory refcount table (IMRT) used for qemu-img check will 
not be updated on discards anyway.  If there were any I/O to the image 
concurrently to check, it would completely ignore the IMRT, so the check 
feels hypocritical.

>>> +        {
>>>               contiguous_free_clusters++;
>>>               if (first_gap) {
>>>                   /* If this is the first free cluster found, update
>>> diff --git a/block/qcow2.c b/block/qcow2.c
>>> index d9f49a52e7..6ee94421e0 100644
>>> --- a/block/qcow2.c
>>> +++ b/block/qcow2.c
>>
>> [...]
>>
>>> @@ -4536,13 +4553,20 @@ 
>>> qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
>>>       }
>>>       ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, 
>>> out_len, true);
>>> -    qemu_co_mutex_unlock(&s->lock);
>>>       if (ret < 0) {
>>> +        qemu_co_mutex_unlock(&s->lock);
>>>           goto fail;
>>>       }
>>> +    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
>>
>> It was my impression that this function could be called either with or 
>> without a lock, that it wouldn’t really matter.  Well, at least that’s 
>> what I figured out for lack of a comment regarding the contract how it 
>> is to be invoked.
>>
> 
> I'm sorry:(

Oh, geez, now I feel bad, too.  Thanks a lot for your explanations, it 
all makes much more sense to me now! :)

Max


