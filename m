Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992373A48C1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:37:34 +0200 (CEST)
Received: from localhost ([::1]:40774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm29-00064M-KV
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrlza-0003A5-0h
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrlzY-0000zE-2S
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623436491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jABj5OuEAOYIxYI4zohAX2pHnOZAXgIriDfrgYIEbuE=;
 b=ZOgfIXuV4u080xRKwCYi68CZFjyBjXxoiswmQ0ZG6f5iZMScq7oMPe/KnAax1kHC/f14eo
 hVhPb1H5yH276/KbXD9/ESIxnFvqjwAYF7egerVT8crIaEuZy2/toT7nUrmLOMhNyy2l+Z
 HUqV0frADROdVzBTI9vEAZx/anGNPuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-vc_AlRd5MxSVpsTvMnkhiw-1; Fri, 11 Jun 2021 14:34:47 -0400
X-MC-Unique: vc_AlRd5MxSVpsTvMnkhiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A84F8015A4;
 Fri, 11 Jun 2021 18:34:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69EE01007606;
 Fri, 11 Jun 2021 18:34:45 +0000 (UTC)
Date: Fri, 11 Jun 2021 13:34:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210611183443.bnw6npo53lbvfp2h@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com>
 <YMMaJcKYe8nHDdjU@redhat.com>
 <20210611132830.i6wwm3fvytri6czu@redhat.com>
 <CAMRbyytDeniKkg4Bjcqry8203RHWzAKmAMdSELnLquBkXJNXvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyytDeniKkg4Bjcqry8203RHWzAKmAMdSELnLquBkXJNXvQ@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 08:35:01PM +0300, Nir Soffer wrote:
> On Fri, Jun 11, 2021 at 4:28 PM Eric Blake <eblake@redhat.com> wrote:
> >
> > On Fri, Jun 11, 2021 at 10:09:09AM +0200, Kevin Wolf wrote:
> > > > Yes, that might work as well.  But we didn't previously document
> > > > depth to be optional.  Removing something from output risks breaking
> > > > more downstream tools that expect it to be non-optional, compared to
> > > > providing a new value.
> > >
> > > A negative value isn't any less unexpected than a missing key. I don't
> > > think any existing tool would be able to handle it. Encoding different
> > > meanings in a single value isn't very QAPI-like either. Usually strings
> > > that are parsed are the problem, but negative integers really isn't that
> > > much different. I don't really like this solution.
> > >
> > > Leaving out the depth feels like a better suggestion to me.
> > >
> > > But anyway, this seems to only happen at the end of the backing chain.
> > > So if the backing chain consistents of n images, why not report 'depth':
> > > n + 1? So, in the above example, you would get 1. I think this has the
> > > best chances of tools actually working correctly with the new output,
> > > even though it's still not unlikely to break something.
> >
> > Ooh, I like that.  It is closer to reality - the file data really
> > comes from the next depth, even if we have no filename at that depth.
> > v2 of my patch coming up.
> 
> How do you know the number of the layer? this info is not presented in
> qemu-img map output.

qemu-img map has two output formats.

In --output=human, areas of the disk reading as zero are elided (and
this happens to include ALL areas that were not allocated anywhere in
the chain); all other areas list the filename of the element in the
chain where the data was found.  This mode also fails if compression
or encryption prevents easy access to actual data.  In other words,
it's fragile, so no one uses it for anything programmatic, even though
it's the default.

In --output=json, no file names are output.  Instead, "depth":N tells
you how deep in the backing chain you must traverse to find the data.
"depth":0 is obvious: the file you mapped (other than the bug that
this patch is fixing where we mistakenly used "depth":0 also for
unallocated regions).  If you use "backing":null to force a 1-layer
depth, then "depth":1 is unambiguous meaning the (non-present) backing
file.

Otherwise, you do have a point: "depth":1 in isolation is ambiguous
between "not allocated anywhere in this 1-element chain" and
"allocated at the first backing file in this chain of length 2 or
more".  At which point you can indeed use "qemu-img info" to determine
the backing chain depth.  How painful is that extra step?  Does it
justify the addition of a new optional "backing":true to any portion
of the file that was beyond the end of the chain (and omit that line
for all other regions, rather than printing "backing":false)?

> 
> Users will have to run "qemu-img info --backing-chain" to understand the
> output of qemu-img map.

At any rate, it should be easy enough to output an additional field,
followup patch coming soon...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


