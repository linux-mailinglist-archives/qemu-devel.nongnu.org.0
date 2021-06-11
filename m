Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7B3A4312
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:32:16 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhGh-0005Nq-FW
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrhFq-0004c6-LO
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrhFp-0007xX-1O
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623418280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qIDZ8XOKyyZOPlW9MM+CVpWlwqLBkYGenn7V06DJyVI=;
 b=PVaVP/lcDghYqOqmeFzoJYJR+Bqf10ay0aIt8arUN+7AadsVVJBwFxhU6q8FZOSmSALA/8
 LjZjBlO4NkRalWF5jBcdCcg5WnjuVvCbYgFQ9B/I5wixBNjGUqdGUAX31+fwQsF6hEl7lN
 rkHb8vd4AXKMEzWzYgSdPCG7oCRhQbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-0FGYCBo6NOmXR5BLsPCNsg-1; Fri, 11 Jun 2021 09:31:14 -0400
X-MC-Unique: 0FGYCBo6NOmXR5BLsPCNsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4901940927;
 Fri, 11 Jun 2021 13:31:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 937E11002EF0;
 Fri, 11 Jun 2021 13:31:12 +0000 (UTC)
Date: Fri, 11 Jun 2021 08:31:10 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
Message-ID: <20210611133110.dy2arokoux63m3n7@redhat.com>
References: <20210607202204.1805199-1-nsoffer@redhat.com>
 <20210607212224.tiqjvvdwosvhrvz7@redhat.com>
 <CAMRbyyukE9iTmM6OB_xAA1n6tRiRRxwKojaO5wzRwAR-8-FX3g@mail.gmail.com>
 <20210610183443.clk43ngkobzyjopy@redhat.com>
 <CAMRbyysoYhcyiP2mWubfZsj09k=Ea_3-RPr+Tt7KvoE1z3jrNA@mail.gmail.com>
 <20210610204617.fuj4ivqrixpz4qfj@redhat.com>
 <YMMaJcKYe8nHDdjU@redhat.com>
 <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
 <YMNHSZ+Dc8v7/80Q@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YMNHSZ+Dc8v7/80Q@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Nir Soffer <nirsof@gmail.com>, qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 01:21:45PM +0200, Kevin Wolf wrote:
> > Did you consider just add a new field?
> > 
> > So, "depth" keeps its meaning "which level provides data".
> > 
> > And we add additional optional field like
> > 
> > absolutely-completely-absent: bool
> > 
> > Which is true if data is nowhere in the backing chain.
> 
> Or how about exposing BDRV_BLOCK_ALLOCATED as 'allocated': 'bool'? Which
> I think is what the conclusion was already for NBD, so doing the same in
> 'qemu-img map' would be consistent.
> 
> This is, of course, almost the same as 'absolutely-completely-absent',
> just without the negating the flag.

If we want to bikeshed on a new name, I think "allocated" is going to
cause more confusion than it solves.  And "hole" is wrong.  Better
would be "backing":true for portions of the file that would derive
from a backing file, if a backing file had been present.

But that still feels like more work than just exposing n+1 in depth.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


