Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B64316318
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:03:04 +0100 (CET)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mKt-000227-Hc
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9mIM-0000kl-BT
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 05:00:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9mIH-0006FN-7U
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 05:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612951212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yc+cQM2/RtefK4pJ9Rw5iGd7sVq18LmO9qUGUofCfLU=;
 b=hGTFwBFbaOdL7KtpkGn4qqM3Ct0Pwmj0KSWLb0vqSYyAW42BqDMvXG1+UOyLGwI2ggWV26
 z7/M74kSCoNvGZ1U3WpAaOEsh7AO/BA+SUYh058he1BrJnB3UHEkUpnSazwPtrAuqMtHfW
 ReFfGeZy+LbkH+6DB8UFM092qAPt0Us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-K5HS5BR9MbiPflhr4ShjBw-1; Wed, 10 Feb 2021 05:00:09 -0500
X-MC-Unique: K5HS5BR9MbiPflhr4ShjBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88666801965;
 Wed, 10 Feb 2021 10:00:08 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-231.ams2.redhat.com
 [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E555B60BE2;
 Wed, 10 Feb 2021 10:00:06 +0000 (UTC)
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <745c4617-01bc-c888-b6da-95a705cf0c1e@redhat.com>
 <0669a5e8-bcff-ffb1-23b0-0af9ce20ad27@virtuozzo.com>
 <476836f5-09d8-976d-bc3c-afb05befddbd@redhat.com>
 <df5f3aac-b43f-85f8-8210-6b0b527ac343@virtuozzo.com>
 <1b4ad0ed-e1a7-d592-cb76-8a204fbbd585@virtuozzo.com>
 <a3f741fd-8ab7-3721-38cc-be855b538afd@openvz.org>
 <dad2a202-430e-f430-6cfd-1c75fd3f2549@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d7387da7-fb53-5d58-7ddf-4bf469e6526c@redhat.com>
Date: Wed, 10 Feb 2021 11:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dad2a202-430e-f430-6cfd-1c75fd3f2549@virtuozzo.com>
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.02.21 19:51, Vladimir Sementsov-Ogievskiy wrote:
> 09.02.2021 21:41, Denis V. Lunev wrote:
>> On 2/9/21 9:36 PM, Vladimir Sementsov-Ogievskiy wrote:
>>> 09.02.2021 19:39, Vladimir Sementsov-Ogievskiy wrote:
>>>> 09.02.2021 17:47, Max Reitz wrote:
>>>>> On 09.02.21 15:10, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> 09.02.2021 16:25, Max Reitz wrote:
>>>>>>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>>> Hi all!
>>>>>>>>
>>>>>>>> I know, I have several series waiting for a resend, but I had to
>>>>>>>> switch
>>>>>>>> to another task spawned from our customer's bug.
>>>>>>>>
>>>>>>>> Original problem: we use O_DIRECT for all vm images in our
>>>>>>>> product, it's
>>>>>>>> the policy. The only exclusion is backup target qcow2 image for
>>>>>>>> compressed backup, because compressed backup is extremely slow with
>>>>>>>> O_DIRECT (due to unaligned writes). Customer complains that backup
>>>>>>>> produces a lot of pagecache.
>>>>>>>>
>>>>>>>> So we can either implement some internal cache or use fadvise
>>>>>>>> somehow.
>>>>>>>> Backup has several async workes, which writes simultaneously, so
>>>>>>>> in both
>>>>>>>> ways we have to track host cluster filling (before dropping the
>>>>>>>> cache
>>>>>>>> corresponding to the cluster).  So, if we have to track anyway,
>>>>>>>> let's
>>>>>>>> try to implement the cache.
>>>>>>>
>>>>>>> I wanted to be excited here, because that sounds like it would be
>>>>>>> very easy to implement caching.  Like, just keep the cluster at
>>>>>>> free_byte_offset cached until the cluster it points to changes,
>>>>>>> then flush the cluster.
>>>>>>
>>>>>> The problem is that chunks are written asynchronously.. That's why
>>>>>> this all is not so easy.
>>>>>>
>>>>>>>
>>>>>>> But then I see like 900 new lines of code, and I’m much less
>>>>>>> excited...
>>>>>>>
>>>>>>>> Idea is simple: cache small unaligned write and flush the cluster
>>>>>>>> when
>>>>>>>> filled.
>>>>>>>>
>>>>>>>> Performance result is very good (results in a table is time of
>>>>>>>> compressed backup of 1000M disk filled with ones in seconds):
>>>>>>>
>>>>>>> “Filled with ones” really is an edge case, though.
>>>>>>
>>>>>> Yes, I think, all clusters are compressed to rather small chunks :)
>>>>>>
>>>>>>>
>>>>>>>> ---------------  -----------  -----------
>>>>>>>>                    backup(old)  backup(new)
>>>>>>>> ssd:hdd(direct)  3e+02        4.4
>>>>>>>>                                   -99%
>>>>>>>> ssd:hdd(cached)  5.7          5.4
>>>>>>>>                                   -5%
>>>>>>>> ---------------  -----------  -----------
>>>>>>>>
>>>>>>>> So, we have benefit even for cached mode! And the fastest thing is
>>>>>>>> O_DIRECT with new implemented cache. So, I suggest to enable the 
>>>>>>>> new
>>>>>>>> cache by default (which is done by the series).
>>>>>>>
>>>>>>> First, I’m not sure how O_DIRECT really is relevant, because I
>>>>>>> don’t really see the point for writing compressed images.
>>>>>>
>>>>>> compressed backup is a point
>>>>>
>>>>> (Perhaps irrelevant, but just to be clear:) I meant the point of
>>>>> using O_DIRECT, which one can decide to not use for backup targets
>>>>> (as you have done already).
>>>>>
>>>>>>> Second, I find it a bit cheating if you say there is a huge
>>>>>>> improvement for the no-cache case, when actually, well, you just
>>>>>>> added a cache.  So the no-cache case just became faster because
>>>>>>> there is a cache now.
>>>>>>
>>>>>> Still, performance comparison is relevant to show that O_DIRECT as
>>>>>> is unusable for compressed backup.
>>>>>
>>>>> (Again, perhaps irrelevant, but:) Yes, but my first point was
>>>>> exactly whether O_DIRECT is even relevant for writing compressed
>>>>> images.
>>>>>
>>>>>>> Well, I suppose I could follow that if O_DIRECT doesn’t make much
>>>>>>> sense for compressed images, qemu’s format drivers are free to
>>>>>>> introduce some caching (because technically the cache.direct
>>>>>>> option only applies to the protocol driver) for collecting
>>>>>>> compressed writes.
>>>>>>
>>>>>> Yes I thought in this way, enabling the cache by default.
>>>>>>
>>>>>>> That conclusion makes both of my complaints kind of moot.
>>>>>>>
>>>>>>> *shrug*
>>>>>>>
>>>>>>> Third, what is the real-world impact on the page cache?  You
>>>>>>> described that that’s the reason why you need the cache in qemu,
>>>>>>> because otherwise the page cache is polluted too much.  How much
>>>>>>> is the difference really?  (I don’t know how good the compression
>>>>>>> ratio is for real-world images.)
>>>>>>
>>>>>> Hm. I don't know the ratio.. Customer reported that most of RAM is
>>>>>> polluted by Qemu's cache, and we use O_DIRECT for everything except
>>>>>> for target of compressed backup.. Still the pollution may relate to
>>>>>> several backups and of course it is simple enough to drop the cache
>>>>>> after each backup. But I think that even one backup of 16T disk may
>>>>>> pollute RAM enough.
>>>>>
>>>>> Oh, sorry, I just realized I had a brain fart there.  I was
>>>>> referring to whether this series improves the page cache pollution.
>>>>> But obviously it will if it allows you to re-enable O_DIRECT.
>>>>>
>>>>>>> Related to that, I remember a long time ago we had some discussion
>>>>>>> about letting qemu-img convert set a special cache mode for the
>>>>>>> target image that would make Linux drop everything before the last
>>>>>>> offset written (i.e., I suppose fadvise() with
>>>>>>> POSIX_FADV_SEQUENTIAL).  You discard that idea based on the fact
>>>>>>> that implementing a cache in qemu would be simple, but it isn’t,
>>>>>>> really.  What would the impact of POSIX_FADV_SEQUENTIAL be?  (One
>>>>>>> advantage of using that would be that we could reuse it for
>>>>>>> non-compressed images that are written by backup or qemu-img
>>>>>>> convert.)
>>>>>>
>>>>>> The problem is that writes are async. And therefore, not sequential.
>>>>>
>>>>> In theory, yes, but all compressed writes still goes through
>>>>> qcow2_alloc_bytes() right before submitting the write, so I wonder
>>>>> whether in practice the writes aren’t usually sufficiently
>>>>> sequential to make POSIX_FADV_SEQUENTIAL work fine.
>>>>
>>>> Yes, allocation is sequential. But writes are not.. Reasonable, I
>>>> should at least bench it. So we should set POSIX_FADV_SEQUENTIAL for
>>>> the whole backup target before the backup? Will try. Still, I expect
>>>> that my cache will show better performance anyway. Actually,
>>>> comparing cached (by pagecache) vs my cache we have 5.7 -> 4.4, i.e.
>>>> 20% faster, which is significant (still, yes, would be good to check
>>>> it on more real case than all-ones).
>>>>
>>>>>
>>>>>> So
>>>>>> I have to track the writes and wait until the whole cluster is
>>>>>> filled. It's simple use fadvise as an option to my cache: instead
>>>>>> of caching data and write when cluster is filled we can instead
>>>>>> mark cluster POSIX_FADV_DONTNEED.
>>>>>>
>>>>>>>
>>>>>>> (I don’t remember why that qemu-img discussion died back then.)
>>>>>>>
>>>>>>>
>>>>>>> Fourth, regarding the code, would it be simpler if it were a pure
>>>>>>> write cache?  I.e., on read, everything is flushed, so we don’t
>>>>>>> have to deal with that.  I don’t think there are many valid cases
>>>>>>> where a compressed image is both written to and read from at the
>>>>>>> same time. (Just asking, because I’d really want this code to be
>>>>>>> simpler.  I can imagine that reading from the cache is the least
>>>>>>> bit of complexity, but perhaps...)
>>>>>>>
>>>>>>
>>>>>> Hm. I really didn't want to support reads, and do it only to make
>>>>>> it possible to enable the cache by default.. Still read function is
>>>>>> really simple, and I don't think that dropping it will simplify the
>>>>>> code significantly.
>>>>>
>>>>> That’s too bad.
>>>>>
>>>>> So the only question I have left is what POSIX_FADV_SEQUENTIAL
>>>>> actually would do in practice.
>>>>
>>>> will check.
>>>>
>>>
>>> Checked that if I mark the whole file by FADV_SEQUENTIAL, cache is not
>>> removed.
>>>
>>> Test:
>>> [root@kvm fadvise]# cat a.c
>>> #define _GNU_SOURCE
>>> #include <fcntl.h>
>>> #include <unistd.h>
>>> #include <stdio.h>
>>> #include <getopt.h>
>>> #include <string.h>
>>> #include <stdbool.h>
>>>
>>> int main(int argc, char *argv[])
>>> {
>>>      int fd;
>>>      int i;
>>>      char mb[1024 * 1024];
>>>      int open_flags = O_RDWR | O_CREAT | O_EXCL;
>>>      int fadv_flags = 0;
>>>      int fadv_final_flags = 0;
>>>      int len = 1024 * 1024;
>>>      bool do_fsync = false;
>>>
>>>      for (i = 1; i < argc - 1; i++) {
>>>          const char *arg = argv[i];
>>>
>>>          if (!strcmp(arg, "direct")) {
>>>              open_flags |= O_DIRECT;
>>>          } else if (!strcmp(arg, "seq")) {
>>>              fadv_flags = POSIX_FADV_SEQUENTIAL;
>>>          } else if (!strcmp(arg, "dontneed")) {
>>>              fadv_flags = POSIX_FADV_DONTNEED;
>>>          } else if (!strcmp(arg, "final-dontneed")) {
>>>              fadv_final_flags = POSIX_FADV_DONTNEED;
>>>          } else if (!strcmp(arg, "fsync")) {
>>>              do_fsync = true;
>>>          } else {
>>>              fprintf(stderr, "unknown: %s\n", arg);
>>>              return 1;
>>>          }
>>>      }
>>>
>>>      fd = open(argv[argc - 1], open_flags);
>>>
>>>      if (fd < 0) {
>>>          fprintf(stderr, "failed to open\n");
>>>          return 1;
>>>      }
>>>
>>>      if (fadv_flags) {
>>>          posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_flags);
>>>      }
>>>      for (i = 0; i < 100; i++) {
>>>          write(fd, mb, len);
>>>      }
>>>      if (fadv_final_flags) {
>>>          posix_fadvise(fd, 0, 100 * 1024 * 1024, fadv_final_flags);
>>>      }
>>>      if (do_fsync) {
>>>          fsync(fd);
>>>      }
>>>
>>>      close(fd);
>>> }
>>>
>>>
>>>
>>> [root@kvm fadvise]# gcc a.c
>>> [root@kvm fadvise]# rm -f x; ./a.out seq x; fincore x
>>>    RES PAGES  SIZE FILE
>>>   100M 25600  100M x
>>> [root@kvm fadvise]# rm -f x; ./a.out dontneed x; fincore x
>>>    RES PAGES  SIZE FILE
>>>   100M 25600  100M x
>>> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed x; fincore x
>>>    RES PAGES  SIZE FILE
>>>    36M  9216  100M x
>>> [root@kvm fadvise]# rm -f x; ./a.out seq fsync x; fincore x
>>>    RES PAGES  SIZE FILE
>>>   100M 25600  100M x
>>> [root@kvm fadvise]# rm -f x; ./a.out dontneed fsync x; fincore x
>>>    RES PAGES  SIZE FILE
>>>   100M 25600  100M x
>>> [root@kvm fadvise]# rm -f x; ./a.out final-dontneed fsync x; fincore x
>>>    RES PAGES  SIZE FILE
>>>    36M  9216  100M x
>>> [root@kvm fadvise]# rm -f x; ./a.out direct x; fincore x
>>> RES PAGES SIZE FILE
>>>   0B     0   0B x
>>>
>>>
>>>
>>> Backup-generated pagecache is a formal trash, it will be never used.
>>> And it's bad that it can displace another good pagecache. So the best
>>> thing for backup is direct mode + proposed cache.

What a shame.

Thanks a lot for testing.

>> I think that the original intention of Max is about POSIX_FADV_DONTNEED
>> One should call this fadvise for just fully written cluster.

I had hoped that SEQUENTIAL would just work, magically.

> This should work, but:
> 
>   - as we see from test above, POSIX_FADV_DONTNEED don't remove the 
> whole cache (see final-dontneed)
>   - as I said we'll have to track writes, so the cache will be the same, 
> just instead of postponed-write operation we'll do fadvise.
> 
> Hmm. Still, in this way, we will not need some difficult things in my 
> proposed cache.
> 
> So, it may be reasonable to at least split the big patch so that
> 
>   - first part brings writes / full-cluster tracking and fadvice
> 
>   - second part adds caching-wrties option, corresponding flush code and 
> additional performance
> 
> Does it make sense?

I think the fadvise solution would have been nice if it gave us 
something magical that we could also use for normal qemu-img convert (or 
backup) operations, but as that doesn’t seem to be the case, I don’t 
think it makes too much sense to implement something like that.  (I 
imagine doing fadvise also creates the need to implement new block to 
call into file-posix and so on.)

I’d propose I take some time to look at your patch as-is and then I 
report back.

Max


