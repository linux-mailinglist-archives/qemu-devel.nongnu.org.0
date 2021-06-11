Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3023A4133
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:23:38 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfGD-0004xz-CF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lrfEc-00049o-Tp
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lrfEX-0003nN-Ee
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623410512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T9LY7V734PnvOmhOkhR3bPQMtuTwCSz0b/uOMK0z1VM=;
 b=YSmpQnZv2ICIugjo8+kFIhnMo+P97tbNW+CM9QLEZfNGhQDYsGfb3OacYasQwulJ2XTJ3S
 Lef3o2iESlBZhZp3CMRRz+UifbnsW4ciqW08sTI8ezy8EpXhwnvm1wPQbhDyhDd1R/BO5n
 DYsmypcUWLxj71NhozyI6taEYadyHYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-kZvMiTGNOUm2Xybgsd02jg-1; Fri, 11 Jun 2021 07:21:49 -0400
X-MC-Unique: kZvMiTGNOUm2Xybgsd02jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A97D88015A4;
 Fri, 11 Jun 2021 11:21:48 +0000 (UTC)
Received: from redhat.com (ovpn-114-101.ams2.redhat.com [10.36.114.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA256091A;
 Fri, 11 Jun 2021 11:21:47 +0000 (UTC)
Date: Fri, 11 Jun 2021 13:21:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <YMNHSZ+Dc8v7/80Q@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com>
 <YMMaJcKYe8nHDdjU@redhat.com>
 <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.06.2021 um 10:14 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 11.06.2021 11:09, Kevin Wolf wrote:
> > Am 10.06.2021 um 22:46 hat Eric Blake geschrieben:
> > > On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrote:
> > > > > But:
> > > > > 
> > > > > $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
> > > > >    "file":{"driver":"file","filename":"top.qcow2"}}'
> > > > > [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
> > > > > { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> > > > > { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
> > > > > 
> > > > > also reports the entire file at "depth":0, which is misleading, since
> > > > > we have just been arguing from the qemu:allocation-depth perspective
> > > > > (and also from bdrv_block_status) that the qcow2 image is NOT 100%
> > > > > allocated (in the sense where allocation == data comes locally).
> > > > > Perhaps it might be better if we tweaked the above qemu-img map to
> > > > > produce:
> > > > > 
> > > > > [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
> > > > > { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
> > > > > { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
> > > > > { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
> > > > 
> > > > It will be more consistent with "offset" to drop "depth" from output
> > > > if we don't have it:
> > > > 
> > > >      [{ "start": 0, "length": 65536, "zero": true, "data": false},
> > > >       { "start": 65536, "length": 65536, "depth": 0, "zero": false,
> > > > "data": true, "offset": 327680},
> > > >       { "start": 131072, "length": 65536, "depth": 0, "zero": true,
> > > > "data": false},
> > > >       { "start": 196608, "length": 65536, "zero": true, "data": false}]
> > > 
> > > Yes, that might work as well.  But we didn't previously document
> > > depth to be optional.  Removing something from output risks breaking
> > > more downstream tools that expect it to be non-optional, compared to
> > > providing a new value.
> > 
> > A negative value isn't any less unexpected than a missing key. I don't
> > think any existing tool would be able to handle it. Encoding different
> > meanings in a single value isn't very QAPI-like either. Usually strings
> > that are parsed are the problem, but negative integers really isn't that
> > much different. I don't really like this solution.
> > 
> > Leaving out the depth feels like a better suggestion to me.
> > 
> > But anyway, this seems to only happen at the end of the backing chain.
> > So if the backing chain consistents of n images, why not report 'depth':
> > n + 1? So, in the above example, you would get 1. I think this has the
> > best chances of tools actually working correctly with the new output,
> > even though it's still not unlikely to break something.
> > 
> 
> Did you consider just add a new field?
> 
> So, "depth" keeps its meaning "which level provides data".
> 
> And we add additional optional field like
> 
> absolutely-completely-absent: bool
> 
> Which is true if data is nowhere in the backing chain.

Or how about exposing BDRV_BLOCK_ALLOCATED as 'allocated': 'bool'? Which
I think is what the conclusion was already for NBD, so doing the same in
'qemu-img map' would be consistent.

This is, of course, almost the same as 'absolutely-completely-absent',
just without the negating the flag.

Kevin


