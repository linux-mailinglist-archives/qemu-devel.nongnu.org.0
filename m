Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CAD2B18C1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:08:18 +0100 (CET)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdW09-0002mK-KR
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jack@suse.cz>)
 id 1kdVzR-0002Ha-HR; Fri, 13 Nov 2020 05:07:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:34214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jack@suse.cz>)
 id 1kdVzP-0000Ly-IP; Fri, 13 Nov 2020 05:07:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AF00AE42;
 Fri, 13 Nov 2020 10:07:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 030FD1E1312; Fri, 13 Nov 2020 11:07:28 +0100 (CET)
Date: Fri, 13 Nov 2020 11:07:28 +0100
From: Jan Kara <jack@suse.cz>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 0/2] RFC: Issue with discards on raw block device without
 O_DIRECT
Message-ID: <20201113100728.GA8919@quack2.suse.cz>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <03b01c699c9fab64736d04891f1e835aef06c886.camel@redhat.com>
 <20201112111951.GB27697@quack2.suse.cz>
 <fbe9f98d6fa9ecd5f53fd284216c740d2d4a723a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe9f98d6fa9ecd5f53fd284216c740d2d4a723a.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=195.135.220.15; envelope-from=jack@suse.cz;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 03:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Jan Kara <jack@suse.cz>, qemu-block@nongnu.org,
 "Darrick J . Wong" <darrick.wong@oracle.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 12-11-20 17:38:36, Maxim Levitsky wrote:
> On Thu, 2020-11-12 at 12:19 +0100, Jan Kara wrote:
> > [added some relevant people and lists to CC]
> > 
> > On Wed 11-11-20 17:44:05, Maxim Levitsky wrote:
> > > On Wed, 2020-11-11 at 17:39 +0200, Maxim Levitsky wrote:
> > > > clone of "starship_production"
> > > 
> > > The git-publish destroyed the cover letter:
> > > 
> > > For the reference this is for bz #1872633
> > > 
> > > The issue is that current kernel code that implements 'fallocate'
> > > on kernel block devices roughly works like that:
> > > 
> > > 1. Flush the page cache on the range that is about to be discarded.
> > > 2. Issue the discard and wait for it to finish.
> > >    (as far as I can see the discard doesn't go through the
> > >    page cache).
> > > 
> > > 3. Check if the page cache is dirty for this range,
> > >    if it is dirty (meaning that someone wrote to it meanwhile)
> > >    return -EBUSY.
> > > 
> > > This means that if qemu (or qemu-img) issues a write, and then
> > > discard to the area that shares a page, -EBUSY can be returned by
> > > the kernel.
> > 
> > Indeed, if you don't submit PAGE_SIZE aligned discards, you can get back
> > EBUSY which seems wrong to me. IMO we should handle this gracefully in the
> > kernel so we need to fix this.
> > 
> > > On the other hand, for example, the ext4 implementation of discard
> > > doesn't seem to be affected. It does take a lock on the inode to avoid
> > > concurrent IO and flushes O_DIRECT writers prior to doing discard thought.
> > 
> > Well, filesystem hole punching is somewhat different beast than block device
> > discard (at least implementation wise).
> > 
> > > Doing fsync and retrying is seems to resolve this issue, but it might be
> > > a too big hammer.  Just retrying doesn't work, indicating that maybe the
> > > code that flushes the page cache in (1) doesn't do this correctly ?
> > > 
> > > It also can be racy unless special means are done to block IO from happening
> > > from qemu during this fsync.
> > > 
> > > This patch series contains two patches:
> > > 
> > > First patch just lets the file-posix ignore the -EBUSY errors, which is
> > > technically enough to fail back to plain write in this case, but seems wrong.
> > > 
> > > And the second patch adds an optimization to qemu-img to avoid such a
> > > fragmented write/discard in the first place.
> > > 
> > > Both patches make the reproducer work for this particular bugzilla,
> > > but I don't think they are enough.
> > > 
> > > What do you think?
> > 
> > So if the EBUSY error happens because something happened to the page cache
> > outside of discarded range (like you describe above), that is a kernel bug
> > than needs to get fixed. EBUSY should really mean - someone wrote to the
> > discarded range while discard was running and userspace app has to deal
> > with that depending on what it aims to do...
> I double checked this, those are the writes/discards according to my debug
> prints (I print start and then start+len-1 for each request)
> I have attached the patch for this for reference.
> 
> ZERO: 0x00007fe00000 00007fffefff (len:0x1ff000)
>        fallocate 00007fe00000 00007fffefff

Yeah, the end at 7ffff000 is indeed not 4k aligned...

> WRITE: 0x00007ffff000 00007ffffdff (len:0xe00)
>        write 00007ffff000 00007ffffdff

.. and this write is following discarded area in the same page
(7ffff000..7ffffdff).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

