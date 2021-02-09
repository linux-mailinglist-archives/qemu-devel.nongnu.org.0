Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7A315200
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:50:48 +0100 (CET)
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ULn-000216-Ao
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9UIZ-0000Rn-Fu
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9UIV-0003I3-VJ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612882042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lKjJ530v8RWylT1t6KW3fAr4g3D/Ww1Qs7jwAjKX0A=;
 b=cngMr7zbJmajR8cEeT57KrZv8wE4IErZWD4PQw1njQpC7km4A0EQ9lwCJQeks4jnhAXbWn
 vhXQGnmIOom52l4/DL8BXmy3/c6gaMvhfz6znTT5Mme8seQc4XPg80mY46mXw+2tCD5lTm
 olyV8TVoMJ34HwV3XKeQ4B8NnwMLHFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Algn0ptoPsyAQ5YAfjS48w-1; Tue, 09 Feb 2021 09:47:19 -0500
X-MC-Unique: Algn0ptoPsyAQ5YAfjS48w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C2FB1083EA2;
 Tue,  9 Feb 2021 14:47:18 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-208.ams2.redhat.com
 [10.36.113.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A625A60CD2;
 Tue,  9 Feb 2021 14:47:16 +0000 (UTC)
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
Date: Tue, 9 Feb 2021 15:47:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
> 09.02.2021 16:25, Max Reitz wrote:
>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> I know, I have several series waiting for a resend, but I had to switch
>>> to another task spawned from our customer's bug.
>>>
>>> Original problem: we use O_DIRECT for all vm images in our product, it's
>>> the policy. The only exclusion is backup target qcow2 image for
>>> compressed backup, because compressed backup is extremely slow with
>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>> produces a lot of pagecache.
>>>
>>> So we can either implement some internal cache or use fadvise somehow.
>>> Backup has several async workes, which writes simultaneously, so in both
>>> ways we have to track host cluster filling (before dropping the cache
>>> corresponding to the cluster).  So, if we have to track anyway, let's
>>> try to implement the cache.
>>
>> I wanted to be excited here, because that sounds like it would be very 
>> easy to implement caching.  Like, just keep the cluster at 
>> free_byte_offset cached until the cluster it points to changes, then 
>> flush the cluster.
> 
> The problem is that chunks are written asynchronously.. That's why this 
> all is not so easy.
> 
>>
>> But then I see like 900 new lines of code, and I’m much less excited...
>>
>>> Idea is simple: cache small unaligned write and flush the cluster when
>>> filled.
>>>
>>> Performance result is very good (results in a table is time of
>>> compressed backup of 1000M disk filled with ones in seconds):
>>
>> “Filled with ones” really is an edge case, though.
> 
> Yes, I think, all clusters are compressed to rather small chunks :)
> 
>>
>>> ---------------  -----------  -----------
>>>                   backup(old)  backup(new)
>>> ssd:hdd(direct)  3e+02        4.4
>>>                                  -99%
>>> ssd:hdd(cached)  5.7          5.4
>>>                                  -5%
>>> ---------------  -----------  -----------
>>>
>>> So, we have benefit even for cached mode! And the fastest thing is
>>> O_DIRECT with new implemented cache. So, I suggest to enable the new
>>> cache by default (which is done by the series).
>>
>> First, I’m not sure how O_DIRECT really is relevant, because I don’t 
>> really see the point for writing compressed images.
> 
> compressed backup is a point

(Perhaps irrelevant, but just to be clear:) I meant the point of using 
O_DIRECT, which one can decide to not use for backup targets (as you 
have done already).

>> Second, I find it a bit cheating if you say there is a huge 
>> improvement for the no-cache case, when actually, well, you just added 
>> a cache.  So the no-cache case just became faster because there is a 
>> cache now.
> 
> Still, performance comparison is relevant to show that O_DIRECT as is 
> unusable for compressed backup.

(Again, perhaps irrelevant, but:) Yes, but my first point was exactly 
whether O_DIRECT is even relevant for writing compressed images.

>> Well, I suppose I could follow that if O_DIRECT doesn’t make much 
>> sense for compressed images, qemu’s format drivers are free to 
>> introduce some caching (because technically the cache.direct option 
>> only applies to the protocol driver) for collecting compressed writes.
> 
> Yes I thought in this way, enabling the cache by default.
> 
>> That conclusion makes both of my complaints kind of moot.
>>
>> *shrug*
>>
>> Third, what is the real-world impact on the page cache?  You described 
>> that that’s the reason why you need the cache in qemu, because 
>> otherwise the page cache is polluted too much.  How much is the 
>> difference really?  (I don’t know how good the compression ratio is 
>> for real-world images.)
> 
> Hm. I don't know the ratio.. Customer reported that most of RAM is 
> polluted by Qemu's cache, and we use O_DIRECT for everything except for 
> target of compressed backup.. Still the pollution may relate to several 
> backups and of course it is simple enough to drop the cache after each 
> backup. But I think that even one backup of 16T disk may pollute RAM 
> enough.

Oh, sorry, I just realized I had a brain fart there.  I was referring to 
whether this series improves the page cache pollution.  But obviously it 
will if it allows you to re-enable O_DIRECT.

>> Related to that, I remember a long time ago we had some discussion 
>> about letting qemu-img convert set a special cache mode for the target 
>> image that would make Linux drop everything before the last offset 
>> written (i.e., I suppose fadvise() with POSIX_FADV_SEQUENTIAL).  You 
>> discard that idea based on the fact that implementing a cache in qemu 
>> would be simple, but it isn’t, really.  What would the impact of 
>> POSIX_FADV_SEQUENTIAL be?  (One advantage of using that would be that 
>> we could reuse it for non-compressed images that are written by backup 
>> or qemu-img convert.)
> 
> The problem is that writes are async. And therefore, not sequential.

In theory, yes, but all compressed writes still goes through 
qcow2_alloc_bytes() right before submitting the write, so I wonder 
whether in practice the writes aren’t usually sufficiently sequential to 
make POSIX_FADV_SEQUENTIAL work fine.

> So
> I have to track the writes and wait until the whole cluster is filled. 
> It's simple use fadvise as an option to my cache: instead of caching 
> data and write when cluster is filled we can instead mark cluster 
> POSIX_FADV_DONTNEED.
> 
>>
>> (I don’t remember why that qemu-img discussion died back then.)
>>
>>
>> Fourth, regarding the code, would it be simpler if it were a pure 
>> write cache?  I.e., on read, everything is flushed, so we don’t have 
>> to deal with that.  I don’t think there are many valid cases where a 
>> compressed image is both written to and read from at the same time.  
>> (Just asking, because I’d really want this code to be simpler.  I can 
>> imagine that reading from the cache is the least bit of complexity, 
>> but perhaps...)
>>
> 
> Hm. I really didn't want to support reads, and do it only to make it 
> possible to enable the cache by default.. Still read function is really 
> simple, and I don't think that dropping it will simplify the code 
> significantly.

That’s too bad.

So the only question I have left is what POSIX_FADV_SEQUENTIAL actually 
would do in practice.

(But even then, the premise just doesn’t motivate me sufficiently yet...)

Max


