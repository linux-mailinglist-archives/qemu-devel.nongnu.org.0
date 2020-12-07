Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9122D1786
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:29:18 +0100 (CET)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKK5-0003I0-HE
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmKF0-0008JW-QN
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmKEy-0006pV-TY
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BtS2cKDkDZv/oMbkOdRs/6W97PMYcVRdzOtzlx86o4=;
 b=UlkA4Uv5kqQ9qCobXpK19fnwO3w9FtkL6skv5NU2yc2+9LqcdUuzmgJeq4KikhxkgMZa4A
 T57jeBXVb5B725y/GecKciwLtv3vO58Az84HI+bVnJPoKdXF5uSlAo0IjmVVYABI6d7/zg
 uxMwy3H5XTepNY0Pt304Z+bTQ2//QuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-zAfHikf4Ntq-SgsRwyOmbQ-1; Mon, 07 Dec 2020 12:23:57 -0500
X-MC-Unique: zAfHikf4Ntq-SgsRwyOmbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 453CD107ACE3;
 Mon,  7 Dec 2020 17:23:56 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47C6F3CC9;
 Mon,  7 Dec 2020 17:23:51 +0000 (UTC)
Message-ID: <45420b24124b5b91bc0a80a4abad2e06acb8c2b3.camel@redhat.com>
Subject: Re: [PATCH 0/2] RFC: Issue with discards on raw block device
 without O_DIRECT
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>, Jan Kara <jack@suse.cz>
Date: Mon, 07 Dec 2020 19:23:50 +0200
In-Reply-To: <20201112220838.GD9699@magnolia>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <03b01c699c9fab64736d04891f1e835aef06c886.camel@redhat.com>
 <20201112111951.GB27697@quack2.suse.cz>
 <20201112120056.GC27697@quack2.suse.cz> <20201112220838.GD9699@magnolia>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-11-12 at 14:08 -0800, Darrick J. Wong wrote:
> On Thu, Nov 12, 2020 at 01:00:56PM +0100, Jan Kara wrote:
> > On Thu 12-11-20 12:19:51, Jan Kara wrote:
> > > [added some relevant people and lists to CC]
> > > 
> > > On Wed 11-11-20 17:44:05, Maxim Levitsky wrote:
> > > > On Wed, 2020-11-11 at 17:39 +0200, Maxim Levitsky wrote:
> > > > > clone of "starship_production"
> > > > 
> > > > The git-publish destroyed the cover letter:
> > > > 
> > > > For the reference this is for bz #1872633
> > > > 
> > > > The issue is that current kernel code that implements 'fallocate'
> > > > on kernel block devices roughly works like that:
> > > > 
> > > > 1. Flush the page cache on the range that is about to be discarded.
> > > > 2. Issue the discard and wait for it to finish.
> > > >    (as far as I can see the discard doesn't go through the
> > > >    page cache).
> > > > 
> > > > 3. Check if the page cache is dirty for this range,
> > > >    if it is dirty (meaning that someone wrote to it meanwhile)
> > > >    return -EBUSY.
> > > > 
> > > > This means that if qemu (or qemu-img) issues a write, and then
> > > > discard to the area that shares a page, -EBUSY can be returned by
> > > > the kernel.
> > > 
> > > Indeed, if you don't submit PAGE_SIZE aligned discards, you can get back
> > > EBUSY which seems wrong to me. IMO we should handle this gracefully in the
> > > kernel so we need to fix this.
> > > 
> > > > On the other hand, for example, the ext4 implementation of discard
> > > > doesn't seem to be affected. It does take a lock on the inode to avoid
> > > > concurrent IO and flushes O_DIRECT writers prior to doing discard thought.
> > > 
> > > Well, filesystem hole punching is somewhat different beast than block device
> > > discard (at least implementation wise).
> > > 
> > > > Doing fsync and retrying is seems to resolve this issue, but it might be
> > > > a too big hammer.  Just retrying doesn't work, indicating that maybe the
> > > > code that flushes the page cache in (1) doesn't do this correctly ?
> > > > 
> > > > It also can be racy unless special means are done to block IO from happening
> > > > from qemu during this fsync.
> > > > 
> > > > This patch series contains two patches:
> > > > 
> > > > First patch just lets the file-posix ignore the -EBUSY errors, which is
> > > > technically enough to fail back to plain write in this case, but seems wrong.
> > > > 
> > > > And the second patch adds an optimization to qemu-img to avoid such a
> > > > fragmented write/discard in the first place.
> > > > 
> > > > Both patches make the reproducer work for this particular bugzilla,
> > > > but I don't think they are enough.
> > > > 
> > > > What do you think?
> > > 
> > > So if the EBUSY error happens because something happened to the page cache
> > > outside of discarded range (like you describe above), that is a kernel bug
> > > than needs to get fixed. EBUSY should really mean - someone wrote to the
> > > discarded range while discard was running and userspace app has to deal
> > > with that depending on what it aims to do...
> > 
> > So I was looking what it would take to fix this inside the kernel. The
> > problem is that invalidate_inode_pages2_range() is working on page
> > granularity and it is non-trivial to extend it to work on byte granularity
> > since we don't support something like "try to reclaim part of a page". But
> > I'm also somewhat wondering why we use invalidate_inode_pages2_range() here
> > instead of truncate_inode_pages_range() again? I mean the EBUSY detection
> > cannot be reliable anyway and userspace has no way of knowing whether a
> > write happened before discard or after it so just discarding data is fine
> > from this point of view. Darrick?
> 
> Hmmm, I think I overlooked the fact that we can do buffered writes into
> a block device's pagecache without taking any of the usual locks that
> have to be held for filesystem files.  This is essentially a race
> between a not-page-aligned fallocate and a buffered write to a different
> sector that is mapped by a page that caches part of the fallocate range.
> 
> So yes, Jan is right that we need to use truncate_bdev_range instead of
> invalidate_inode_pages2_range because the former will zero the sub-page
> ranges on either end of the fallocate request instead of returning
> -EBUSY because someone dirtied a part of a page that wasn't involved in
> the fallocate operation.
> 
> I /probably/ just copy-pasta'd that invalidation call from directio
> without thinking hard enough about it, sorry about that. :(

Any update on this?
 
Today I took a look at both truncate_bdev_range,
and at invalidate_inode_pages2_range.
 
 
I see that the truncate_bdev_range can't really fail other 
than check for a mounted
filesystem.
 
It calls truncate_inode_pages_range which writes back all
dirty pages and waits for writeback to finish.
So it won't detect dirty pages as invalidate_inode_pages2_range does
 
 
Also AFAIK the
kernel page cache indeed 
only tracks the dirtiness of a whole page (e.g a 512 byte write, 
will cause the whole page to be written back, unless the 
write was done using O_DIRECT)
 
So if a page, part of
which is discarded, becomes dirty we can't really
know if someone wrote to the discarded region, or only near it.
 
I vote to keep the call to invalidate_inode_pages2_range but
exclude the non page
aligned areas from it.
 
This way we will still do a best effort detection of this case,
while not causing any false positives.
 
If you agree, I'll send a patch for this.


Best regards,
	Maxim Levitsky

> 
> --D
> 
> > 								Honza
> > -- 
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR



