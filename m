Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DE3387DD8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:43:38 +0200 (CEST)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2oj-0000I5-GG
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj2lQ-0006yK-PL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj2lM-0000dm-Br
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621356006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkAhv8rNMfRiKjF8GHs1nvjR7Ry+wkb1l4WsuiWSnEU=;
 b=AHquHU2k+pIzCIrs7FOpG22xx7dUSZpnonUNfVW8lWylhX5tDPRMuXpEknJgskumigsm/N
 u4dnHxypNwIYR9EPBQcdA5jwwkKEWNK2UcHt1iobPBSnepbai6d0d7oRZVRraMZEhxx0di
 JsT05aBxnWiQvs9leMEKWdpI/BmnIQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-cze578kSOk-LWc5wjZBA8w-1; Tue, 18 May 2021 12:39:13 -0400
X-MC-Unique: cze578kSOk-LWc5wjZBA8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5133801817;
 Tue, 18 May 2021 16:39:11 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D9B5C1C5;
 Tue, 18 May 2021 16:39:05 +0000 (UTC)
Subject: Re: RFC: Qemu backup interface plans
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eba2f2c5-a867-91bc-64ab-08dcd67a295d@redhat.com>
Date: Tue, 18 May 2021 18:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ad71ced7-d0f6-5d99-4678-7d0e2d3e2561@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, yur@virtuozzo.com,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 "Denis V. Lunev" <den@openvz.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Your proposal sounds good to me in general.  Some small independent 
building blocks that seems to make sense to me.


On 17.05.21 14:07, Vladimir Sementsov-Ogievskiy wrote:

[...]

> What we lack in this scheme:
> 
> 1. handling dirty bitmap in backup-top filter: backup-top does 
> copy-before-write operation on any guest write, when actually we are 
> interested only in "dirty" regions for incremental backup
> 
> Probable solution would allowing specifying bitmap for sync=none mode of 
> backup, but I think what I propose below is better.
> 
> 2. [actually it's a tricky part of 1]: possibility to not do 
> copy-before-write operations for regions that was already copied to 
> final backup. With normal Qemu backup job, this is achieved by the fact 
> that block-copy state with its internal bitmap is shared between backup 
> job and copy-before-write filter.
> 
> 3. Not a real problem but fact: backup block-job does nothing in the 
> scheme, the whole job is done by filter. So, it would be interesting to 
> have a possibility to simply insert/remove the filter, and avoid 
> block-job creation and managing at all for external backup. (and I'd 
> like to send another RFC on how to insert/remove filters, let's not 
> discuss it here).
> 
> 
> Next. Think about internal backup. It has one drawback too:
> 4. If target is remote with slow connection, copy-before-write 
> operations will slow down guest writes appreciably.
> 
> It may be solved with help of image fleecing: we create temporary qcow2 
> image, setup fleecing scheme, and instead of exporting temp image 
> through NBD we start a second backup with source = temporary image and 
> target would be real backup target (NBD for example).

How would a second backup work here?  Wouldn’t one want a mirror job to 
copy the data off to the real target?

(Because I see backup as something intrinsically synchronous, whereas 
mirror by default is rather lazy.)

[Note from future me where I read more below: I see you acknowledge that 
you’ll need to modify backup to do what you need here, i.e. not do any 
CBW operations.  So it’s effectively the same as a mirror that ignores 
new dirty areas.  Which could work without changing mirror if block-copy 
were to set BDRV_REQ_WRITE_UNCHANGED for the fleecing case, and 
bdrv_co_write_req_finish() would skip bdrv_set_dirty() for such writes.]

I mean, still has the problem that the mirror job can’t tell the CBW 
filter which areas are already copied off and so don’t need to be 
preserved anymore, but...

> Still, with such 
> solution there are same [1,2] problems, 3 becomes worse:

Not sure how 3 can become worse when you said above it isn’t a real 
problem (to which I agree).

> 5. We'll have two jobs and two automatically inserted filters, when 
> actually one filter and one job are enough (as first job is needed only 
> to insert a filter, second job doesn't need a filter at all).
> 
> Note also, that this (starting two backup jobs to make push backup with 
> fleecing) doesn't work now, op-blockers will be against. It's simple to 
> fix (and in Virtuozzo we live with downstream-only patch, which allows 
> push backup with fleecing, based on starting two backup jobs).. But I 
> never send a patch, as I have better plan, which will solve all listed 
> problems.
> 
> 
> So, what I propose:
> 
> 1. We make backup-top filter public, so that it could be 
> inserted/removed where user wants through QMP (how to properly 
> insert/remove filter I'll post another RFC, as backup-top is not the 
> only filter that can be usefully inserted somewhere). For this first 
> step I've sent a series today:
> 
>    subject: [PATCH 00/21] block: publish backup-top filter
>    id: <20210517064428.16223-1-vsementsov@virtuozzo.com>
>    patchew: 
> https://patchew.org/QEMU/20210517064428.16223-1-vsementsov@virtuozzo.com/
> 
> (note, that one of things in this series is rename 
> s/backup-top/copy-before-write/, still, I call it backup-top in this 
> letter)
> 
> This solves [3]. [4, 5] are solved partly: we still have one extra 
> filter, created by backup block jobs, and also I didn't test does this 
> work, probably some op-blockers or permissions should be tuned. So, let 
> it be step 2:
> 
> 2. Test, that we can start backup job with source = (target of 
> backup-top filter), so that we have "push backup with fleecing". Make an 
> option for backup to start without a filter, when we don't need 
> copy-before-write operations, to not create extra superfluous filter.

OK, so the backup job is not really a backup job, but just anything that 
copies data.

> 3. Support bitmap in backup-top filter, to solve [1]
> 
> 3.1 and make it possible to modify the bitmap externally, so that 
> consumer of fleecing can say to backup-top filter: I've already copied 
> these blocks, don't bother with copying them to temp image". This is to 
> solve [2].
> 
> Still, how consumer of fleecing will reset shared bitmap after copying 
> blocks? I have the following idea: we make a "discard-bitmap-filter" 
> filter driver, that own some bitmap and on discard request unset 
> corresponding bits. Also, on read, if read from the region with unset 
> bits the EINVAL returned immediately. This way both consumers (backup 
> job and NBD client) are able to use this interface:

Sounds almost like a 'bitmap' protocol block driver that, given some 
dirty bitmap, basically just represents that bitmap as a block device. 
*shrug*

Anyway.  I think I’m wrong, it’s something very different, and that’s 
clear when I turn your proposal around:  What this “filter” would do 
primarily is to restrict access to its filtered node based on the bitmap 
given to it, i.e. only dirty areas can be read.  (I say “filter” because 
I’m not sure it’s a filter if it restricts the data that can be read.) 
Secondarily, the bitmap can be cleared by sending discards.

You know what, that would allow implement backing files for formats that 
don’t support it.  Like, the overlay and the backing file are both 
children of a FIFO quorum node, where the overlay has the bitmap filter 
on top, and is the first child.  If writing to the bitmap filter then 
also marks the bitmap dirty there (which it logically should, I 
think)...  Don’t know if that’s good or not. :)

> Backup job can simply call discard on source, we can add an option for 
> this.

Hm.  I would have expected the most straightforward solution would be to 
share the job’s (backup or mirror, doesn’t matter) dirty bitmap with the 
CBW node, so that the latter only copies what the former still considers 
dirty.  Is the bitmap filter really still necessary then?

Oh, I see, discarding also helps to save disk space.  Makes sense then.

> External backup tool will send TRIM request after reading some region. 
> This way disk space will be freed and no extra copy-before-write 
> operations will be done. I also have a side idea that we can implement 
> READ_ONCE flag, so that READ and TRIM can be done in one NBD command. 
> But this works only for clients that don't want to implement any kind of 
> retrying.

[...]

> This way data from copy-before-write filter goes first to ram-cache, and 
> backup job could read it from ram. ram-cache will automatically flush 
> data to temp qcow2 image, when ram-usage limit is reached. We'll also 
> need a way to say backup-job that it should first read clusters that are 
> cached in ram, and only then other clusters. So, we'll have a priory for 
> clusters to be copied by block-copy:
> 1. clusters in ram-cache
> 2. clusters not in temp img (to avoid copy-before-write operations in 
> future)
> 3. clusters in temp img.
> 
> This will be a kind of block_status() thing, that allows a block driver 
> to give recommendations on sequence of reading to be effective.

You mean block_status should give that recommendation?  Is that really 
necessary?  I think this is a rather special case, so block-copy could 
figure that out itself.  All it needs to do is for any dirty area 
determine how deep in the backing chain it is: Is it in the ram-cache, 
is it in temp image, or is it below both?  It should be able to figure 
that out with the *file information that block_status returns.

> Not 
> also, that there is another benefit of such thing: we'll implement this 
> callback in qcow2 driver, so that backup will read clusters not in guest 
> cluster order, but in host cluster order, to read more sequentially, 
> which should bring better performance on rotating disks.

I’m not exactly sure how you envision this to work, but block_status 
also already gives you the host offset in *map.

Max


