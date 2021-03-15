Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606B33AF76
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:01:52 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLk2p-0006CY-5Y
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lLk0F-0004vU-2Q
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lLk0C-0000U7-CA
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615802343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucFWYcTI4g/lQx+mvN5uVHF2KHwGX2g+AhG315Ke+Pc=;
 b=cebceK7iesVi/8gide8GqWL2jAWZoNiP1rA7wR8sR3EwVp8w3sHVNHTBN1pJjd5odSlMRA
 JXkBc8q+yNz1j+OYujTs0eIIdg01em9rUde07zYAkgvktVhsRhEpbTv1H6gJQxDFC3+3rN
 7a9PSTAgJKgImdysUyfv3jc2FLAXRoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-tZyMyHelPlWMp7y1YcRd8g-1; Mon, 15 Mar 2021 05:59:00 -0400
X-MC-Unique: tZyMyHelPlWMp7y1YcRd8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE2458015BD;
 Mon, 15 Mar 2021 09:58:58 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-5.ams2.redhat.com
 [10.36.115.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1AC15D9C0;
 Mon, 15 Mar 2021 09:58:56 +0000 (UTC)
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
 <d5acfe9d-2095-a601-20b7-bd0b677df68a@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6056196d-a0cc-7de2-5d6f-b223fdee98ff@redhat.com>
Date: Mon, 15 Mar 2021 10:58:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d5acfe9d-2095-a601-20b7-bd0b677df68a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 12.03.21 19:43, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 21:15, Max Reitz wrote:
>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>> Compressed writes are unaligned to 512, which works very slow in
>>> O_DIRECT mode. Let's use the cache.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/coroutines.h     |   3 +
>>>   block/qcow2.h          |   4 ++
>>>   block/qcow2-refcount.c |  10 +++
>>>   block/qcow2.c          | 158 ++++++++++++++++++++++++++++++++++++++---
>>>   4 files changed, 164 insertions(+), 11 deletions(-)

[...]

>>> @@ -2699,6 +2796,12 @@ static void qcow2_close(BlockDriverState *bs)
>>>           qcow2_inactivate(bs);
>>>       }
>>> +    /*
>>> +     * Cache should be flushed in qcow2_inactivate() and should be 
>>> empty in
>>> +     * inactive mode. So we are safe to free it.
>>> +     */
>>> +    seqcache_free(s->compressed_cache);
>>> +
>>>       cache_clean_timer_del(bs);
>>>       qcow2_cache_destroy(s->l2_table_cache);
>>>       qcow2_cache_destroy(s->refcount_block_cache);
>>> @@ -4558,18 +4661,42 @@ 
>>> qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
>>>           goto fail;
>>>       }
>>> -    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
>>> +    if (s->compressed_cache) {
>>
>> Why is this conditional?
> 
> We don't have compressed_cache for non o_direct.

Oh right.

>>> +        /*
>>> +         * It's important to do seqcache_write() in the same 
>>> critical section
>>> +         * (by s->lock) as qcow2_alloc_compressed_cluster_offset(), 
>>> so that the
>>> +         * cache is filled sequentially.
>>> +         */
>>
>> Yes.
>>
>>> +        seqcache_write(s->compressed_cache, cluster_offset, out_len, 
>>> out_buf);
>>> -    qemu_co_mutex_unlock(&s->lock);
>>> +        qemu_co_mutex_unlock(&s->lock);
>>> -    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
>>> -    ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, 
>>> out_buf, 0);
>>> +        ret = qcow2_co_compressed_flush_one(bs, false);
>>
>> The qcow2 doc says a compressed cluster can span multiple host 
>> clusters.  I don’t know whether that can happen with this driver, but 
>> if it does, wouldn’t that mean we’d need to flush two clusters here?  
>> Oh, no, never mind.  Only the first one would be finished and thus 
>> flushed, not the second one.
>>
>> I could have now removed the above paragraph, but it made me think, so 
>> I kept it:
>>
>> Hm.  Actually, if we unconditionally flush here, doesn’t that mean 
>> that we’ll never have a finished cluster in the cache for longer than 
>> the span between the seqcache_write() and this 
>> qcow2_co_compressed_flush_one()?  I.e., the 
>> qcow2_co_flush_compressed_cache() is supposed to never flush any 
>> finished cluster, but only the currently active unfinished cluster (if 
>> there is one), right?
> 
> Hmm. Maybe if we have parallel write and flush requests, it's a kind of 
> race condition: may be flush will flush both finished and unfinished 
> cluster, maybe write will flush the finished cluster and flush will 
> flush only unfinished one.. Moreover we may have several parallel 
> requests, so they make several finished clusters, and sudden flush will 
> flush them all.

OK.  I was mostly asking because I was wondering how much you expect the 
cache to be filled, i.e., how much you expect the read cache to help.

[...]

>>> @@ -4681,10 +4808,19 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
>>>       out_buf = qemu_blockalign(bs, s->cluster_size);
>>> -    BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
>>> -    ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
>>> -    if (ret < 0) {
>>> -        goto fail;
>>> +    /*
>>> +     * seqcache_read may return less bytes than csize, as csize may 
>>> exceed
>>> +     * actual compressed data size. So we are OK if seqcache_read 
>>> returns
>>> +     * something > 0.
>>
>> I was about to ask what happens when a compressed cluster spans two 
>> host clusters (I could have imagined that in theory the second one 
>> could have been discarded, but not the first one, so reading from the 
>> cache would really be short -- we would have needed to check that we 
>> only fell short in the range of 512 bytes, not more).
>>
>> But then I realized that in this version of the series, all finished 
>> clusters are immediately discarded and only the current unfinished one 
>> is kept.  Does it even make sense to try seqcache_read() here, then?
> 
> Hmm. Not immediately, but after flush. An flush is not under mutex. So 
> in theory at some moment we may have several finished clusters 
> "in-flight". And your question make sense. The cache supports reading 
> from consequitive clusters. But we also should support here reading one 
> part of data from disk and another from the cache to be safe.

The question is whether it really makes sense to even have a 
seqcache_read() path when in reality it’s probably never accessed.  I 
mean, besides the fact that it seems based purely on chance whether a 
read might fetch something from the cache even while we’re writing, in 
practice I don’t know any case where we’d write to and read from a 
compressed qcow2 image at the same time.  (I don’t know what you’re 
doing with the 'compress' filter, though.)

Max


