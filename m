Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461909C668
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 00:19:14 +0200 (CEST)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i20qv-0005Xk-AH
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 18:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i20pN-0004TW-31
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 18:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i20pM-0001h7-4h
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 18:17:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44684)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i20pJ-0001gH-WC; Sun, 25 Aug 2019 18:17:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47D495AFE3;
 Sun, 25 Aug 2019 22:17:33 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A43855C258;
 Sun, 25 Aug 2019 22:17:31 +0000 (UTC)
Message-ID: <44a4d19bd9b7cc760a015570110eb27efe6e0055.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 26 Aug 2019 01:17:30 +0300
In-Reply-To: <CAMRbyyt2PTWJBuR7Ni+gSCeHGpFuF-hkmCEG0Sqvm2gzFQL=CQ@mail.gmail.com>
References: <20190816212122.8816-1-nsoffer@redhat.com>
 <92b8b240313fc978a1454e079963488667b6d4b0.camel@redhat.com>
 <CAMRbyyt2PTWJBuR7Ni+gSCeHGpFuF-hkmCEG0Sqvm2gzFQL=CQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Sun, 25 Aug 2019 22:17:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] block: posix: Always allocate
 the first block
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Nir Soffer <nirsof@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2019-08-25 at 22:51 +0300, Nir Soffer wrote:
> On Sun, Aug 25, 2019 at 10:44 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > On Sat, 2019-08-17 at 00:21 +0300, Nir Soffer wrote:
> > > When creating an image with preallocation "off" or "falloc", the first
> > > block of the image is typically not allocated. When using Gluster
> > > storage backed by XFS filesystem, reading this block using direct I/O
> > > succeeds regardless of request length, fooling alignment detection.
> > > 
> > > In this case we fallback to a safe value (4096) instead of the optimal
> > > value (512), which may lead to unneeded data copying when aligning
> > > requests.  Allocating the first block avoids the fallback.
> > > 
> > > When using preallocation=off, we always allocate at least one filesystem
> > > block:
> > > 
> > >     $ ./qemu-img create -f raw test.raw 1g
> > >     Formatting 'test.raw', fmt=raw size=1073741824
> > > 
> > >     $ ls -lhs test.raw
> > >     4.0K -rw-r--r--. 1 nsoffer nsoffer 1.0G Aug 16 23:48 test.raw
> > 
> > Are you sure about this?
> 
> This is the new behaviour with this change...
> 
> > [mlevitsk@maximlenovopc ~/work/test_area/posix-file 0]$ qemu-img create -f raw test.raw 1g -o preallocation=off
> > Formatting 'test.raw', fmt=raw size=1073741824 preallocation=off
> > [mlevitsk@maximlenovopc ~/work/test_area/posix-file 0]$ls -lhs ./test.raw 
> > 0 -rw-r--r--. 1 mlevitsk mlevitsk 1.0G Aug 25 10:38 ./test.raw
> > 
> > ext4, tested on qemu-4.0.0 and qemu git master.
> 
> And this is the old behavior. I guess the commit message does not make it clear.

Ah, thanks!


> > From what I remember, the only case when posix-raw touches the first block is to zero it out
> > when running on top of kernel block device, to erase whatever header might be there, and this
> > is also kind of a backward compat hack which might be one day removed.
> 
> This change is only for file, on block storage we use BLKSSZGET.
>  
> > [...]
> > 
> > Best regards,
> >         Maxim Levitsky
> > 
> > 

Best regards,
	Maxim Levitsky



