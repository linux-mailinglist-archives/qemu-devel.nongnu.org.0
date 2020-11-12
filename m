Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8A42B1187
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:30:14 +0100 (CET)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdL6b-0005rO-EY
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrick.wong@oracle.com>)
 id 1kdKmG-0001lY-HO; Thu, 12 Nov 2020 17:09:12 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darrick.wong@oracle.com>)
 id 1kdKmA-00068G-IO; Thu, 12 Nov 2020 17:09:11 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACM004j142766;
 Thu, 12 Nov 2020 22:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9ThhF8V90CjzupnEclxvacXDddkSxx615ZBTJ0oW79I=;
 b=eHv1HXCZVNPcGg89tPVsfq9UZxB4x+e/WDDjYepez+pSGmAT+QLbcS/XCDC8CjvQeddu
 S1fCSsik+vv6iCUeL12rSeg+2GlPIyeCVvpmz+rgGu9NjZ5IxP1jAdfR+bYorYiuQx2d
 0t83mX7eImAC35rTjnntVsyLsel5HVn76CzuLwosVJ0OBhh4Y+PHGxFmPXkoRB2VVYni
 CHk6NqUBxgQ5gPhO8RfRsRDFMVW61xbQKPOOB4sDKwzimQGRq9QhajmfhOThHvwd1GZl
 ommznwiyji11Gwlh+Z57uTHOf1ZmcWppcuMX/+/+FAnvAZkgbDvR+8GZ4nrKsClB70U8 Xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34nh3b852e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 22:08:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACM1LqP178918;
 Thu, 12 Nov 2020 22:08:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 34p55rye2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 22:08:46 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ACM8f6x017137;
 Thu, 12 Nov 2020 22:08:42 GMT
Received: from localhost (/10.159.255.85)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Nov 2020 14:08:39 -0800
Date: Thu, 12 Nov 2020 14:08:38 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 0/2] RFC: Issue with discards on raw block device without
 O_DIRECT
Message-ID: <20201112220838.GD9699@magnolia>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <03b01c699c9fab64736d04891f1e835aef06c886.camel@redhat.com>
 <20201112111951.GB27697@quack2.suse.cz>
 <20201112120056.GC27697@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112120056.GC27697@quack2.suse.cz>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=1
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120126
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darrick.wong@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 17:09:00
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 Jens Axboe <axboe@kernel.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 01:00:56PM +0100, Jan Kara wrote:
> On Thu 12-11-20 12:19:51, Jan Kara wrote:
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
> 
> So I was looking what it would take to fix this inside the kernel. The
> problem is that invalidate_inode_pages2_range() is working on page
> granularity and it is non-trivial to extend it to work on byte granularity
> since we don't support something like "try to reclaim part of a page". But
> I'm also somewhat wondering why we use invalidate_inode_pages2_range() here
> instead of truncate_inode_pages_range() again? I mean the EBUSY detection
> cannot be reliable anyway and userspace has no way of knowing whether a
> write happened before discard or after it so just discarding data is fine
> from this point of view. Darrick?

Hmmm, I think I overlooked the fact that we can do buffered writes into
a block device's pagecache without taking any of the usual locks that
have to be held for filesystem files.  This is essentially a race
between a not-page-aligned fallocate and a buffered write to a different
sector that is mapped by a page that caches part of the fallocate range.

So yes, Jan is right that we need to use truncate_bdev_range instead of
invalidate_inode_pages2_range because the former will zero the sub-page
ranges on either end of the fallocate request instead of returning
-EBUSY because someone dirtied a part of a page that wasn't involved in
the fallocate operation.

I /probably/ just copy-pasta'd that invalidation call from directio
without thinking hard enough about it, sorry about that. :(

--D

> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

