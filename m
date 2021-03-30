Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A734EE17
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:42:03 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHRK-0006X7-AY
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRHOy-0005DL-N4
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRHOw-00025F-Of
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617122371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRH6LEOkiSskbGyYo97Ttg+QGWc5eFanFTNM09SB5GU=;
 b=RWQVHRAeLxDyaWjCNN4P1d4jquDeFvBtYcmR1IioKWTiT8NOLyTnuoD9leaRFTreHZhLU3
 xS4XjsLunMDxJXiWDe0Nfv3zdSuvVmuumdzgvNYYX7LsR5CwgPhbgKgOj4/k/v/6RC8HUp
 2Qv/nbgnx0HE084ftos/fHzYdthAOOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-h0GJVok_NMCu34QYNpvfkQ-1; Tue, 30 Mar 2021 12:39:29 -0400
X-MC-Unique: h0GJVok_NMCu34QYNpvfkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFA36612A3;
 Tue, 30 Mar 2021 16:39:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 476431037E81;
 Tue, 30 Mar 2021 16:39:27 +0000 (UTC)
Subject: Re: [PATCH v4 for-6.0? 0/3] qcow2: fix parallel rewrite and discard
 (rw-lock)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
 <f16e8ea3-5af7-abc2-bf1c-7fd997ecf651@virtuozzo.com>
 <c3c2ea3a-9475-69f2-b9d7-e88001d822c0@redhat.com>
 <166496e1-f855-5813-2fe8-88035fb85a26@virtuozzo.com>
 <80e4838f-772b-28e1-3bdb-10a5d7e72ec0@redhat.com>
 <09d7683a-0e1f-58dd-3f24-02591a5d7ac8@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <61a00c13-3000-249e-8081-7b55ce5832bd@redhat.com>
Date: Tue, 30 Mar 2021 18:39:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <09d7683a-0e1f-58dd-3f24-02591a5d7ac8@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.21 15:25, Vladimir Sementsov-Ogievskiy wrote:
> 30.03.2021 15:51, Max Reitz wrote:
>> On 30.03.21 12:51, Vladimir Sementsov-Ogievskiy wrote:
>>> 30.03.2021 12:49, Max Reitz wrote:
>>>> On 25.03.21 20:12, Vladimir Sementsov-Ogievskiy wrote:
>>>>> ping. Do we want it for 6.0?
>>>>
>>>> I’d rather wait.  I think the conclusion was that guests shouldn’t 
>>>> hit this because they serialize discards?
>>>
>>> I think, that we never had bugs, so we of course can wait.
>>>
>>>>
>>>> There’s also something Kevin wrote on IRC a couple of weeks ago, for 
>>>> which I had hoped he’d sent an email but I don’t think he did, so 
>>>> I’ll try to remember and paraphrase as well as I can...
>>>>
>>>> He basically asked whether it wouldn’t be conceptually simpler to 
>>>> take a reference to some cluster in get_cluster_offset() and later 
>>>> release it with a to-be-added put_cluster_offset().
>>>>
>>>> He also noted that reading is problematic, too, because if you read 
>>>> a discarded and reused cluster, this might result in an information 
>>>> leak (some guest application might be able to read data it isn’t 
>>>> allowed to read); that’s why making get_cluster_offset() the point 
>>>> of locking clusters against discarding would be better.
>>>
>>> Yes, I thought about read too, (RFCed in cover letter of [PATCH v5 
>>> 0/6] qcow2: fix parallel rewrite and discard (lockless))
>>>
>>>>
>>>> This would probably work with both of your solutions.  For the 
>>>> in-memory solutions, you’d take a refcount to an actual cluster; in 
>>>> the CoRwLock solution, you’d take that lock.
>>>>
>>>> What do you think?
>>>>
>>>
>>> Hmm. What do you mean? Just rename my qcow2_inflight_writes_inc() and 
>>> qcow2_inflight_writes_dec() to 
>>> get_cluster_offset()/put_cluster_offset(), to make it more native to 
>>> use for read operations as well?
>>
>> Hm.  Our discussion wasn’t so detailed.
>>
>> I interpreted it to mean all qcow2 functions that find an offset to a 
>> qcow2 cluster, namely qcow2_get_host_offset(), 
>> qcow2_alloc_host_offset(), and qcow2_alloc_compressed_cluster_offset().
> 
> What about qcow2_alloc_clusters() ?

Seems like all callers for that but do_alloc_cluster_offset() call it to 
allocate metadata clusters, which cannot be discarded from the guest.

Is it really possible that some metadata cluster is used while qcow2 
discards it internally at the same time, or isn’t all of this only a 
problem for data clusters?

>> When those functions return an offset (in)to some cluster, that 
>> cluster (or the image as a whole) should be locked against discards.  
>> Every offset received this way would require an accompanying 
>> qcow2_put_host_offset().
>>
>>> Or to update any kind of "getting cluster offset" in the whole qcow2 
>>> driver to take a kind of "dynamic reference count" by 
>>> get_cluster_offset() and then call corresponding put() somewhere? In 
>>> this case I'm afraid it's a lot more work..
>>
>> Hm, really?  I would have assumed we need to do some locking in all 
>> functions that get a cluster offset this way, so it should be less 
>> work to take the lock in the functions they invoke to get the offset.
>>
>>> It would be also the problem that a lot of paths in qcow2 are not in 
>>> coroutine and don't even take s->lock when they actually should.
>>
>> I’m not sure what you mean here, because all functions that invoke any 
>> of the three functions I listed above are coroutine_fns (or, well, I 
>> didn’t look it up, but they all have *_co_* in their name).
> 
> qcow2_alloc_clusters() has a lot more callers..

Let’s hope we don’t need to worry about it then. O:)

>>> This will also mean that we do same job as normal qcow2 refcounts 
>>> already do: no sense in keeping additional "dynamic refcount" for L2 
>>> table cluster while reading it, as we already have non-zero qcow2 
>>> normal refcount for it..
>>
>> I’m afraid I don’t understand how normal refcounts relate to this.  
>> For example, qcow2_get_host_offset() doesn’t touch refcounts at all.
>>
> 
> I mean the following: remember our discussion about what is 
> free-cluster. If we add "dynamic-refcount", or "infligth-write-counter" 
> thing only to count inflight data-writing (or, as discussed, we should 
> count data-reads as well) operations, than "full reference count" of the 
> cluster is inflight-write-count + qcow2-metadata-refcount.
> 
> But if we add a kind of "dynamic refcount" for any use of host cluster, 
> for example reading of L2 table, than we duplicate the reference in 
> qcow2-metadata to this L2 table (represented as refcount) by our 
> "dynamic refcount", and we don't have a concept of "full reference 
> count" as the sum above.. We still should treat a cluster as free when 
> both "dynamic refcount" and qcow2-metadata-refcount are zero, but their 
> sum doesn't have a good sense. Not a problem maybe.. But looks like a 
> complication with no benefit.

You’re right, but I don’t think that’s a real problem.  Perhaps the sum 
was even a false equivalency.  There is a difference between the dynamic 
refcount and the on-disk refcount: We must wait with discarding until 
the the dynamic refcount is 0, and discarding will then drop the on-disk 
refcount to 0, too.  I think.  So I’m not sure whether the sum really 
means anything.

But if metadata isn’t a problem and that means we don’t have ask these 
questions at all, well, that’ll be even better.

> ==
> 
> OK, I think now that you didn't mean qcow2_alloc_clusters(). So, we are 
> saying about only functions returning an offset to cluster with "guest 
> data", not to any kind of host cluster. Than what you propose looks like 
> this to me:
> 
>   - take my v5
>   - rename qcow2_inflight_writes_dec() to put_cluster_offset()
>   - call qcow2_inflight_writes_inc() from the three functions you mention

Yes, I think so.  Or you take the CoRwLock in those three functions, 
depending on which implementation we want.

Sorry if we’ve discussed this before and I just forgot, but: What are 
the performance implications of either solution?  As far as I remember, 
the inflight-write-counter solution had the problem of always doing 
stuff on every I/O access.  You said the impact was small and yes, it 
is, but it’s still there.
I haven’t looked at the CoRwLock solution but it I would assume it’s 
basically zero cost for common cases, right?  I.e. the case where the 
guest already serializes discards from other accesses, which I thought 
is what e.g. Linux does.  (And even if it doesn’t, I would assume that 
concurrent I/O and discards are rather rare.)

> That make sense to me. Still, put_cluster_offset() name doesn't make it 
> obvious that it's only for clusters with "guest data", and we shouldn't 
> call it when work with metadata clusters.

Yeah, it was meant for symmetry with qcow2_get_host_offset() (i.e. it 
would be named “qcow2_put_host_offset()”).  Now that there are three 
functions that would take a reference, it should get some other name.  I 
don’t know.  qcow2_put_data_cluster_offset()?

Max


