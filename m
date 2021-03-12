Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B543C3390E6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:13:05 +0100 (CET)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjTM-0005c6-6u
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKjQd-0002pQ-6q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKjQa-0006jw-4t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615561811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPAu90u6+mEI/JDHG2chE7vt3mYR12113ozKhMwZ87E=;
 b=KqBAjPW9zDCsCIkTJHp9jnlEc4gPG2VtQgtNRCG9OC14P68uqNOiQx8H1tQYvGk+eeO31u
 LtB02KP8lqgdqexdV2z7Sv3OJ9qbK3gok2QBUMcCSZ1Frxk0reobeSJvjqZNkkfi/crDdG
 FwE9t5d1D2usNpROhJeSU6jaO9RQZy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-ftdWpw8oMS-OGwLbU781vA-1; Fri, 12 Mar 2021 10:10:07 -0500
X-MC-Unique: ftdWpw8oMS-OGwLbU781vA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A2FF3E741;
 Fri, 12 Mar 2021 15:10:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-148.ams2.redhat.com
 [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DA319705;
 Fri, 12 Mar 2021 15:10:02 +0000 (UTC)
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
 <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
 <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
 <dcc0caaa-f8b6-6139-a02c-643397f0a787@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <4ff8a576-9713-7c06-8ab5-a5232314507d@redhat.com>
Date: Fri, 12 Mar 2021 16:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <dcc0caaa-f8b6-6139-a02c-643397f0a787@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On 12.03.21 13:46, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 15:32, Vladimir Sementsov-Ogievskiy wrote:
>> 12.03.2021 14:17, Max Reitz wrote:
>>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>>> 11.03.2021 22:58, Max Reitz wrote:
>>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>>> becomes 0) and reused during data write. In this case data write may
>>
>> [..]
>>
>>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT 
>>>>>> update_refcount(BlockDriverState *bs,
>>>>>>           if (refcount == 0) {
>>>>>>               void *table;
>>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, 
>>>>>> cluster_index);
>>>>>> +
>>>>>> +            if (infl) {
>>>>>> +                infl->refcount_zero = true;
>>>>>> +                infl->type = type;
>>>>>> +                continue;
>>>>>> +            }
>>>>>
>>>>> I don’t understand what this is supposed to do exactly.  It seems 
>>>>> like it wants to keep metadata structures in the cache that are 
>>>>> still in use (because dropping them from the caches is what happens 
>>>>> next), but users of metadata structures won’t set in-flight 
>>>>> counters for those metadata structures, will they?
>>>>
>>>> Don't follow.
>>>>
>>>> We want the code in "if (refcount == 0)" to be triggered only when 
>>>> full reference count of the host cluster becomes 0, including 
>>>> inflight-write-cnt. So, if at this point inflight-write-cnt is not 
>>>> 0, we postpone freeing the host cluster, it will be done later from 
>>>> "slow path" in update_inflight_write_cnt().
>>>
>>> But the code under “if (refcount == 0)” doesn’t free anything, does 
>>> it?  All I can see is code to remove metadata structures from the 
>>> metadata caches (if the discarded cluster was an L2 table or a 
>>> refblock), and finally the discard on the underlying file.  I don’t 
>>> see how that protocol-level discard has anything to do with our 
>>> problem, though.
>>
>> Hmm. Still, if we do this discard, and then our in-flight write, we'll 
>> have data instead of a hole. Not a big deal, but seems better to 
>> postpone discard.
>>
>> On the other hand, clearing caches is OK, as its related only to 
>> qcow2-refcount, not to inflight-write-cnt
>>
>>>
>>> As far as I understand, the freeing happens immediately above the “if 
>>> (refcount == 0)” block by s->set_refcount() setting the refcount to 
>>> 0. (including updating s->free_cluster_index if the refcount is 0).
>>
>> Hmm.. And that (setting s->free_cluster_index) what I should actually 
>> prevent until total reference count becomes zero.
>>
>> And about s->set_refcount(): it only update a refcount itself, and 
>> don't free anything.
>>
>>
> 
> So, it is more correct like this:
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 464d133368..1da282446d 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1012,21 +1012,12 @@ static int QEMU_WARN_UNUSED_RESULT 
> update_refcount(BlockDriverState *bs,
>           } else {
>               refcount += addend;
>           }
> -        if (refcount == 0 && cluster_index < s->free_cluster_index) {
> -            s->free_cluster_index = cluster_index;
> -        }
>           s->set_refcount(refcount_block, block_index, refcount);
> 
>           if (refcount == 0) {
>               void *table;
>               Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
> 
> -            if (infl) {
> -                infl->refcount_zero = true;
> -                infl->type = type;
> -                continue;
> -            }
> -
>               table = qcow2_cache_is_table_offset(s->refcount_block_cache,
>                                                   offset);
>               if (table != NULL) {
> @@ -1040,6 +1031,16 @@ static int QEMU_WARN_UNUSED_RESULT 
> update_refcount(BlockDriverState *bs,
>                   qcow2_cache_discard(s->l2_table_cache, table);
>               }
> 
> +            if (infl) {
> +                infl->refcount_zero = true;
> +                infl->type = type;
> +                continue;
> +            }
> +
> +            if (cluster_index < s->free_cluster_index) {
> +                s->free_cluster_index = cluster_index;
> +            }
> +
>               if (s->discard_passthrough[type]) {
>                   update_refcount_discard(bs, cluster_offset, 
> s->cluster_size);
>               }

I don’t think I like using s->free_cluster_index as a protection against 
allocating something before it.

First, it comes back the problem I just described in my mail from 15:58 
GMT+1, which is that you’re changing the definition of what a free 
cluster is.  With this proposal, you’re proposing yet a new definition: 
A free cluster is anything with refcount == 0 after free_cluster_index.

Now looking only at the allocation functions, it may look like that kind 
of is the definition already.  But I don’t think that was the intention 
when free_cluster_index was introduced, so we’d have to check every 
place that sets free_cluster_index, to see whether it adheres to this 
definition.

And I think it’s clear that there is a place that won’t adhere to this 
definition, and that is this very place here, in update_refcount().  Say 
free_cluster_index is 42.  Then you free cluster 39, but there is a 
write to it, so free_cluster_index isn’t update.  Then you free cluster 
38, and there are writes to that cluster, so free_cluster_index is 
updated to 38.  Suddenly, 39 is free to be allocated, too.

(The precise problem is that with this new definition decreasing 
free_cluster_index suddenly has the power to free any cluster between 
its new and all value.  With the old definition, changing 
free_cluster_index would never free any cluster.  So when you decrease 
free_cluster_index, you suddenly have to be sure that all clusters 
between the new and old value that have refcount 0 are indeed to be 
considered free.)

Max


