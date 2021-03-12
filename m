Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CEB339090
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:00:52 +0100 (CET)
Received: from localhost ([::1]:38502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjHX-0002Vk-L3
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKjFq-0001XV-AU
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:59:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKjFo-0007yD-BR
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615561143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRDzsHdJN3e0TGa7uWfEbbNiJE9rveeQkwHWsXydE7I=;
 b=bRzpBVNcWMK7TpL04yAU6sIOjxLzNdO1BESIgQPqYFWW5Re8NJc1vcK2uZlM1D4XoiPftq
 6Vrze5dIr6q+ituzM16eNoLUKt+TTSIODoq4bqW0oovrQiOUf/gE2jJjlRzhM2rc1uMUI2
 9nz8pB0aGIvsgqaGon9WG40Y1PkbiNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-IddQFQ87Mz2zG7V6ysBtHw-1; Fri, 12 Mar 2021 09:59:01 -0500
X-MC-Unique: IddQFQ87Mz2zG7V6ysBtHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33250108BD12;
 Fri, 12 Mar 2021 14:59:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-148.ams2.redhat.com
 [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 781BB610A8;
 Fri, 12 Mar 2021 14:58:58 +0000 (UTC)
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
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3035e3f2-ea1b-550a-0d3d-52aaa18d7bc9@redhat.com>
Date: Fri, 12 Mar 2021 15:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On 12.03.21 13:32, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 14:17, Max Reitz wrote:
>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>> 11.03.2021 22:58, Max Reitz wrote:
>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>> becomes 0) and reused during data write. In this case data write may
> 
> [..]
> 
>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT 
>>>>> update_refcount(BlockDriverState *bs,
>>>>>           if (refcount == 0) {
>>>>>               void *table;
>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, 
>>>>> cluster_index);
>>>>> +
>>>>> +            if (infl) {
>>>>> +                infl->refcount_zero = true;
>>>>> +                infl->type = type;
>>>>> +                continue;
>>>>> +            }
>>>>
>>>> I don’t understand what this is supposed to do exactly.  It seems 
>>>> like it wants to keep metadata structures in the cache that are 
>>>> still in use (because dropping them from the caches is what happens 
>>>> next), but users of metadata structures won’t set in-flight counters 
>>>> for those metadata structures, will they?
>>>
>>> Don't follow.
>>>
>>> We want the code in "if (refcount == 0)" to be triggered only when 
>>> full reference count of the host cluster becomes 0, including 
>>> inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, 
>>> we postpone freeing the host cluster, it will be done later from 
>>> "slow path" in update_inflight_write_cnt().
>>
>> But the code under “if (refcount == 0)” doesn’t free anything, does 
>> it?  All I can see is code to remove metadata structures from the 
>> metadata caches (if the discarded cluster was an L2 table or a 
>> refblock), and finally the discard on the underlying file.  I don’t 
>> see how that protocol-level discard has anything to do with our 
>> problem, though.
> 
> Hmm. Still, if we do this discard, and then our in-flight write, we'll 
> have data instead of a hole. Not a big deal, but seems better to 
> postpone discard.
> 
> On the other hand, clearing caches is OK, as its related only to 
> qcow2-refcount, not to inflight-write-cnt
> 
>>
>> As far as I understand, the freeing happens immediately above the “if 
>> (refcount == 0)” block by s->set_refcount() setting the refcount to 0. 
>> (including updating s->free_cluster_index if the refcount is 0).
> 
> Hmm.. And that (setting s->free_cluster_index) what I should actually 
> prevent until total reference count becomes zero.
> 
> And about s->set_refcount(): it only update a refcount itself, and don't 
> free anything.

That is what freeing is, though.  I consider something to be free when 
allocation functions will allocate it.  The allocation functions look at 
the refcount, so once a cluster’s refcount is 0, it is free.

If that isn’t what freeing is, nothing in update_refcount() frees 
anything (when looking at how data clusters are handled).  Passing the 
discard through to the protocol layer isn’t “freeing”, because it’s 
independent of qcow2.

Now, your patch adds an additional check to the allocation functions 
(whether there are ongoing writes on the cluster), so it’s indeed 
possible that a cluster can have a refcount of 0 but still won’t be used 
by allocation functions.

But that means you’ve just changed the definition of what a free cluster 
is.  In fact, that means that nothing in update_refcount() can free a 
cluster that has active writes to it, because now a cluster is only free 
if there are no such writes.  It follows that you needn’t change 
update_refcount() to prevent clusters with such writes from being freed, 
because with this new definition of what a free cluster is, it’s 
impossible for update_refcount() to free them.

(Yes, you’re right that it would be nice to postpone the protocol-level 
discard still, but not doing so wouldn’t be a catastrophe – which shows 
that it has little to do with actually freeing something, as far as 
qcow2 is concerned.

If it’s just about postponing the discard, we can do exactly that: Let 
update_refcount() skip discarding for clusters that are still in use, 
and then let update_inflight_write_cnt() only do that discard instead of 
invoking all of qcow2_update_cluster_refcount().)

Alternatively, we could also not change the definition of what a free 
cluster is, which means we wouldn’t need to change the allocation 
functions, but instead postpone the refcount update that 
update_refcount() does.  That would mean we’d actually need to really 
drop the refcount in update_inflight_write_cnt() instead of doing a -0.

Max


