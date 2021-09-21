Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07561413B10
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:03:13 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSlyy-0006I0-9i
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSlwP-0005OY-9f
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSlwJ-0003vw-VT
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632254424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xqOiomyoXScQ00jF1zpJf2WXdV0GOjEWNgXx+FA6mn0=;
 b=QCn0VDsijTbQALzbvkp8T9RGHDx9E3TR/ZOlYBkPLpOpTcnWEKrxLfEcMmbim7XP4G/UZy
 pKO3SfCX2Lo7rwoc7htLsA/VdGwDuTOVWglLn0e4NQhxnjmUAxLvP6lhtutB8PsQCZ3G2J
 c9pfI/jsVkLqCJeLYAtN2/V7iJZjyx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-ksDuVvhSMTGZ42zf7Jv12g-1; Tue, 21 Sep 2021 16:00:21 -0400
X-MC-Unique: ksDuVvhSMTGZ42zf7Jv12g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 327A11808301;
 Tue, 21 Sep 2021 20:00:20 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71F426D98B;
 Tue, 21 Sep 2021 20:00:19 +0000 (UTC)
Date: Tue, 21 Sep 2021 15:00:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] nbd/client: Request larger block status by default
Message-ID: <20210921200017.huvks6mtothvv74p@redhat.com>
References: <20210921161703.2682802-1-eblake@redhat.com>
 <5b9402dd-4c37-2fc6-7c65-a13c4c5e6383@virtuozzo.com>
 <20210921180843.6tfubsqvf56hkyro@redhat.com>
 <95d19c17-1541-4a34-fe3c-6a085255a586@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <95d19c17-1541-4a34-fe3c-6a085255a586@virtuozzo.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 21, 2021 at 10:12:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 21.09.2021 21:08, Eric Blake wrote:
> > On Tue, Sep 21, 2021 at 08:25:11PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 21.09.2021 19:17, Eric Blake wrote:
> > > > Now that commit 5a1cfd21 has clarified that a driver's block_status
> > > > can report larger *pnum than in the original request, we can take
> > > > advantage of that in the NBD driver.  Rather that limiting our request
> > > > to the server based on the maximum @bytes our caller mentioned, we
> > > > instead ask for as much status as possible (the minimum of our 4G
> > > > limit or the rest of the export); the server will still only give us
> > > > one extent in its answer (because we are using NBD_CMD_FLAG_REQ_ONE),
> > > > but now the block layer's caching of data areas can take advantage of
> > > > cases where the server gives us a large answer to avoid the need for
> > > > future NBD_CMD_BLOCK_STATUS calls.
> > > > 
> > > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > > ---
> > 
> > > 
> > > I remember we already discussed that, but can't find.
> > > 
> > > The problem is that it's not for free:
> > > 
> > > In server code in blockstatus_to_extents, we loop though the disk, trying to merge extents of the same type.
> > > 
> > > With full allocated qcow2, we'll have to load all L2 tables and handle them, to merge all block status into one big "allocated" extent.
> > > 
> > 
> > We don't have to loop that far.  The NBD protocol allows the server to
> > stop looping at whatever point makes sense, as long as it makes
> > progress.
> > 
> > > Maybe, we need some additional negotiation flag, to allow BLOCK_STATUS command with NBD_CMD_FLAG_REQ_ONE flag to return an extent larger than required when that information is available for free?

That's already the case when FLAG_REQ_ONE is not present.  The reason
that REQ_ONE clamps things at the requested limit is because older
qemu had a bug that it rejected the server sending extra information,
even when that info was free.

> > 
> > That's one possibility.  Another does not add anything to the NBD
> > protocol, but instead limits the code that tries to loop over block
> > status to deteremine a larger "allocated" answer to return to instead
> > stop looping after a finite number of extents have been merged
> > together.
> > 
> 
> In this case we should answer a question: when to stop looping? I'm not sure we can simply drop the loop:
> 
> For example, for compressed clusters, bdrv_co_block_status() will return them one-by-one, and sending them one by one to the wire, when user requested large range would be inefficient.
> Or should we change block-status behavior for compressed clusters? And may be add flag to block_status() that we are not interested in valid_offset, so it can return an extent corresponding to the whole L2 table chunk (if all entries are allocated, but not consecutive)?

Currently, bdrv_co_block_status() takes 'bool want_zero' that says
what the client wants.  Maybe it's worth expanding that into an enum
or bitmask to allow finer-grained client requests (the notion of
whether valid_offset matters to the caller IS relevant for deciding
when to clamp vs. loop).

> 
> 
> Hmm. So, if not update spec, we'll have to "fix" implementation. That means actually, that we should update spec anyway, at least to note that: "clients tend to request large regions in hope that server will not spend too much time to serve them but instead return shorter answer"..

I'm really hoping we don't have to tweak the NBD spec on this one, but
rather improve the quality of implementation in qemu.

> 
> And you'll never have guarantee, that some another (non-qemu) NBD server will not try to satisfy the whole request in on go.

That's true, but the NBD spec has always tried to encourage servers to
provide more information when it was free, but to give up early if it
gets too expensive.  It's a judgment call on where that line lies, and
may indeed be different between different servers.

> 
> 
> In other words:
> 
> 1. We want block_status of some region
> 2. If there some free information available about larger region we are happy to cache it
> 
> With your solution, we just request a lot larger region, so we lose information of [1]. That means that sever can't imagine, how much of requested region is really needed, i.e. if we do some additional work to return more information (still within boundaries of the request) will it be:
>  - good work to minimize network traffic
> OR
>  - extra work, waste server time, client will cache this information but probably never use (or even lose it soon, as our cache is very simple)
> 
> With additional negotiation flag we don't lose [1], i.e how much client wants now.
> 
> 
> So, for me, modifying the protocol looks nicer..
> 
> Another approach is do request without NBD_CMD_FLAG_REQ_ONE and handle several extents.

_This_ idea is nicer.  It allows the client to request an actual
length it is interested in now, but allows the server to give extra
information back if it is free.  And it works without changing the NBD
protocol or existing qemu server; it is a client-only change, just
like this patch tried to be, but may have nicer performance
implications.

> 
> 
> Are you optimizing some concrete scenario?

Not at this point, so much as observing the effects of commit 5a1cfd21
and seeing if we should update our behavior to match.

For v2, I'll try switching to just drop our REQ_ONE artificial
limitations from the client.  We are still throwing away a lot of
useful information because we don't cache anything beyond the first
extent returned by the server.  At worst, maybe it will require adding
a tuning knob in the QAPI when creating the NBD client to decide which
of the two approaches to favor for a given client's connection to a
particular server.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


