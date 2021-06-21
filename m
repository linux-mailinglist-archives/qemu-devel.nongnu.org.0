Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156233AF5B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:55:50 +0200 (CEST)
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvP5I-0007xg-MS
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lvP3K-000608-Q2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lvP3I-0005SP-0B
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624301622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MeUpBjDh4GmrBVEFUq0CS7IjIDQK6bmO7fVVQTdNZ8=;
 b=Kx+niDUmzQG7pN01Y8P6cXrG4VfobNLsQI4bRcG4SZz52yAe+sjcjOWkp3wjinL/Zw6Btu
 gilDtiZpPXCWPhmDeIcZNFWFaRIB+DwOdSAnm2lMeTJbsvoorG3Gl2sioHrfKSi/uw/6dW
 V16BwL6t93eiTJKOWdxvoOOy3rVey2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-kekMAA0bOHWd69WgPvKntw-1; Mon, 21 Jun 2021 14:53:39 -0400
X-MC-Unique: kekMAA0bOHWd69WgPvKntw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC806420E1;
 Mon, 21 Jun 2021 18:53:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-63.phx2.redhat.com [10.3.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F6795DEFB;
 Mon, 21 Jun 2021 18:53:38 +0000 (UTC)
Date: Mon, 21 Jun 2021 13:53:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
Message-ID: <20210621185336.zslqpqusqng4ub2u@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
 <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 01:53:24PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > +++ b/block/nbd.c
> > @@ -1702,7 +1702,7 @@ static int coroutine_fn nbd_client_co_block_status(
> >           .type = NBD_CMD_BLOCK_STATUS,
> >           .from = offset,
> >           .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
> > -                   MIN(bytes, s->info.size - offset)),
> > +                   s->info.size - offset),
> >           .flags = NBD_CMD_FLAG_REQ_ONE,
> >       };
> > 
> 
> Hmm..
> 
> I don't that this change is correct. In contrast with file-posix you don't get extra information for free, you just make a larger request. This means that server will have to do more work.

Not necessarily.  The fact that we have passed NBD_CMD_FLAG_REQ_ONE
means that the server is still only allowed to give us one extent in
its answer, and that it may not give us information beyond the length
we requested.  You are right that if we lose the REQ_ONE flag we may
result in the server doing more work to provide us additional extents
that we will then be ignoring because we aren't yet set up for
avoiding REQ_ONE.  Fixing that is a longer-term goal.  But in the
short term, I see no harm in giving a larger length to the server with
REQ_ONE.

> 
> (look at blockstatus_to_extents, it calls bdrv_block_status_above in a loop).
> 
> For example, assume that nbd export is a qcow2 image with all clusters allocated. With this change, nbd server will loop through the whole qcow2 image, load all L2 tables to return big allocated extent.

No, the server is allowed to reply with less length than our request,
and that is particularly true if the server does NOT have free access
to the full length of our request.  In the case of qcow2, since
bdrv_block_status is (by current design) clamped at cluster
boundaries, requesting a 4G length will NOT increase the amount of the
server response any further than the first cluster boundary (that is,
the point where the server no longer has free access to status without
loading another cluster of L2 entries).

> 
> So, only server can decide, could it add some extra free information to request or not. But unfortunately NBD_CMD_FLAG_REQ_ONE doesn't allow it.

What the flag prohibits is the server giving us more information than
the length we requested.  But this patch is increasing our request
length for the case where the server CAN give us more information than
we need locally, on the hopes that even though the server can only
reply with one extent, we aren't wasting as many network
back-and-forth trips when a larger request would have worked.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


