Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50EC24D91A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 17:52:44 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k99LP-0007wH-VL
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 11:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k99KZ-0007Px-Qh; Fri, 21 Aug 2020 11:51:51 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k99KW-0001So-Ab; Fri, 21 Aug 2020 11:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=soWk78RUWdSJLsgAMjhRJyzG2A4x8sm7fZrAJgSXdJI=; 
 b=TtJwLxSOOAOugfZDqmLSdmMehwjiyDmG9+rqrsOuwnvMuQqgk4ghZV4uMdBUykQheAWBCU/ewHRNAFS3u/f3dEBCLgh7AcOjRyGg3jYsdBUhiSXAzfeewIp+rGkDa/DW9wBI8nXIE6oAYeBlmp+W4bK40i5GzF6Saq+xvsCHcDABGauyQnBo9ccZJS6gDNsVe7jxqYJ7jxu1BvT967lLhyuUi4dJd/5nZQSj7/S2qglFOMbVKIsGKLq6pKBluEDHs9GtY4BpAf37lj747+J85TEuM6FgHE/cQ4VkfxSrFYN3mqmGaYzGWWQwhraXJtt5sKNgxJoQRwqIwNit61MCPA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k99KM-0005fs-C7; Fri, 21 Aug 2020 17:51:38 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k99KM-00017v-2h; Fri, 21 Aug 2020 17:51:38 +0200
From: Alberto Garcia <berto@igalia.com>
To: Brian Foster <bfoster@redhat.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
In-Reply-To: <20200821125944.GC212879@bfoster>
References: <20200817101019.GD11402@linux.fritz.box>
 <w518sedz3td.fsf@maestria.local.igalia.com>
 <20200817155307.GS11402@linux.fritz.box>
 <w51pn7memr7.fsf@maestria.local.igalia.com>
 <20200819150711.GE10272@linux.fritz.box> <20200819175300.GA141399@bfoster>
 <w51v9hdultt.fsf@maestria.local.igalia.com>
 <20200820215811.GC7941@dread.disaster.area> <20200821110506.GB212879@bfoster>
 <w51364gjkcj.fsf@maestria.local.igalia.com> <20200821125944.GC212879@bfoster>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 21 Aug 2020 17:51:38 +0200
Message-ID: <w51sgcghu9h.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 11:04:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Dave Chinner <david@fromorbit.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, linux-xfs@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 21 Aug 2020 02:59:44 PM CEST, Brian Foster wrote:
>> > Option 4 is described above as initial file preallocation whereas
>> > option 1 is per 64k cluster prealloc. Prealloc mode mixup aside, Berto
>> > is reporting that the initial file preallocation mode is slower than
>> > the per cluster prealloc mode. Berto, am I following that right?
>> 
>> Option (1) means that no qcow2 cluster is allocated at the beginning of
>> the test so, apart from updating the relevant qcow2 metadata, each write
>> request clears the cluster first (with fallocate(ZERO_RANGE)) then
>> writes the requested 4KB of data. Further writes to the same cluster
>> don't need changes on the qcow2 metadata so they go directly to the area
>> that was cleared with fallocate().
>> 
>> Option (4) means that all clusters are allocated when the image is
>> created and they are initialized with fallocate() (actually with
>> posix_fallocate() now that I read the code, I suppose it's the same for
>> xfs?). Only after that the test starts. All write requests are simply
>> forwarded to the disk, there is no need to touch any qcow2 metadata nor
>> do anything else.
>> 
>
> Ok, I think that's consistent with what I described above (sorry, I find
> the preallocation mode names rather confusing so I was trying to avoid
> using them). Have you confirmed that posix_fallocate() in this case
> translates directly to fallocate()? I suppose that's most likely the
> case, otherwise you'd see numbers more like with preallocation=full
> (file preallocated via writing zeroes).

Yes, it seems to be:

   https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/posix_fallocate.c;h=7238b000383af2f3878a9daf8528819645b6aa31;hb=HEAD

And that's also what the posix_fallocate() manual page says.

>> And yes, (4) is a bit slower than (1) in my tests. On ext4 I get 10%
>> more IOPS.
>> 
>> I just ran the tests with aio=native and with a raw image instead of
>> qcow2, here are the results:
>> 
>> qcow2:
>> |----------------------+-------------+------------|
>> | preallocation        | aio=threads | aio=native |
>> |----------------------+-------------+------------|
>> | off                  |        8139 |       7649 |
>> | off (w/o ZERO_RANGE) |        2965 |       2779 |
>> | metadata             |        7768 |       8265 |
>> | falloc               |        7742 |       7956 |
>> | full                 |       41389 |      56668 |
>> |----------------------+-------------+------------|
>> 
>
> So this seems like Dave's suggestion to use native aio produced more
> predictable results with full file prealloc being a bit faster than per
> cluster prealloc. Not sure why that isn't the case with aio=threads. I
> was wondering if perhaps the threading affects something indirectly like
> the qcow2 metadata allocation itself, but I guess that would be
> inconsistent with ext4 showing a notable jump from (1) to (4) (assuming
> the previous ext4 numbers were with aio=threads).

Yes, I took the ext4 numbers with aio=threads

>> raw:
>> |---------------+-------------+------------|
>> | preallocation | aio=threads | aio=native |
>> |---------------+-------------+------------|
>> | off           |        7647 |       7928 |
>> | falloc        |        7662 |       7856 |
>> | full          |       45224 |      58627 |
>> |---------------+-------------+------------|
>> 
>> A qcow2 file with preallocation=metadata is more or less similar to a
>> sparse raw file (and the numbers are indeed similar).
>> 
>> preallocation=off on qcow2 does not have an equivalent on raw files.
>
> It sounds like preallocation=off for qcow2 would be roughly equivalent
> to a raw file with a 64k extent size hint (on XFS).

There's the overhead of handling the qcow2 metadata but QEMU keeps a
memory cache so it should not be too big.

Berto

