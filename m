Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A9DFF7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 12:00:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL355-0003CP-PW
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 06:00:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hL33v-0002lW-Hc
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:59:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hL33u-0005XI-9T
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:59:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hL33r-0005V8-Hp; Mon, 29 Apr 2019 05:58:59 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 840E4356EA;
	Mon, 29 Apr 2019 09:58:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-63.ams2.redhat.com
	[10.36.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA3F45B5;
	Mon, 29 Apr 2019 09:58:56 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:58:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20190429095855.GC8492@localhost.localdomain>
References: <CA+aFP1B7ZZ_xwNOfMbKUzEjYbMH=9dJstLYEyVq4LphPR81u0Q@mail.gmail.com>
	<20190414132008.uxoia6avdpp4jov6@steredhat.homenet.telecomitalia.it>
	<CA+aFP1D8VYcnwWpB=4PzAdBKr+YK-r8bSwzKKUCkH7jT3kVvoQ@mail.gmail.com>
	<20190415080452.GA6031@localhost.localdomain>
	<20190417073438.r57lemi6emu4x3ld@steredhat>
	<20190417080443.GA8330@localhost.localdomain>
	<20190419122356.7dmwwdbtnzgimydw@steredhat>
	<20190423075619.GB9041@localhost.localdomain>
	<20190423082657.mzulhihpv6rhgiww@steredhat>
	<20190423083805.GC9041@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423083805.GC9041@localhost.localdomain>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 29 Apr 2019 09:58:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH RFC 1/1] block/rbd: increase
 dynamically the image size
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Josh Durgin <jdurgin@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.04.2019 um 10:38 hat Kevin Wolf geschrieben:
> Am 23.04.2019 um 10:26 hat Stefano Garzarella geschrieben:
> > On Tue, Apr 23, 2019 at 09:56:19AM +0200, Kevin Wolf wrote:
> > > Am 19.04.2019 um 14:23 hat Stefano Garzarella geschrieben:
> > > > Hi Kevin,
> > > > 
> > > > On Wed, Apr 17, 2019 at 10:04:43AM +0200, Kevin Wolf wrote:
> > > > > Am 17.04.2019 um 09:34 hat Stefano Garzarella geschrieben:
> > > > > > On Mon, Apr 15, 2019 at 10:04:52AM +0200, Kevin Wolf wrote:
> > > > > > > 
> > > > > > > I think a potential actual use case could be persistent dirty bitmaps
> > > > > > > for incremental backup. Though maybe that would be better served by
> > > > > > > using the rbd image just as a raw external data file and keeping the
> > > > > > > qcow2 metadata on a filesystem.
> > > > > > 
> > > > > > Thanks to point it out! I'll take a look to understand how to keep
> > > > > > metadata separated from the data.
> > > > > 
> > > > > I'd consider the feature still experimental, but for local files, it
> > > > > works like this:
> > > > > 
> > > > >     qemu-img create -f qcow2 -o data_file=test.raw test.qcow2 4G
> > > > > 
> > > > > And then just use test.qcow2. As long as you can put everything you need
> > > > > into an rbd URL, the same approach should work. Otherwise, you may need
> > > > > to use QMP blockdev-create on creation and possibly the data-file option
> > > > > of the qcow2 driver for opening.
> > > > 
> > > > Very interesting, I'll try to add this support also in the rbd driver.
> > > 
> > > I don't understand - what is the thing you want to add to the rbd driver?
> > > qcow2 doesn't need special protocol driver support for doing this, and I
> > > don't think the QEMU rbd driver has any metadata that could be split off.
> > > 
> > 
> > Oh sorry, I didn't understand that was completely independent from the
> > protocol.
> > 
> > > > > > > How fast is rbd_resize()? Does automatically resizing for every write
> > > > > > > request actually work reasonably well in practice? If it does, there is
> > > > > > > probably little reason not to allow it, even if the use cases are rather
> > > > > > > obscure.
> > > > > > 
> > > > > > I'll try to measure the percentage of the time spent in the rbd_resize.
> > > > > > 
> > > > > > Another solution could be to pass to the rbd driver the virtual size of
> > > > > > the image and resize it only one time also if the preallocation is
> > > > > > disabled, because RBD will not allocate blocks but IIUC it only set the max
> > > > > > size.
> > > > > > 
> > > > > > Do you think make sense? Is it feasible?
> > > > > 
> > > > > In theory yes, though it requires modification of every driver that
> > > > > should be usable together with rbd (i.e. ideally all of the drivers). If
> > > > > automatic resize works good enough, I'd prefer that
> > > > 
> > > > I did some tests and it seems that the cost of rbd_resize() is
> > > > negligible. IIUC it only updates the metadata without allocating any
> > > > blocks (if we are growing, like that case).
> > > > 
> > > > Anyway the automatic resize will not affect the current use-case (raw
> > > > images on rbd), where the file size is set during the creation, so I
> > > > think there should not be side effects with this patch.
> > > 
> > > Okay, sounds good.
> > > 
> > > > I'm also adding the support for preallocation (i.e. full) in the rbd
> > > > driver that can be useful for qcow2 images.
> > > > 
> > > > If you prefer I can resend this patch with the preallocation series.
> > > 
> > > Let's keep seperate things separate. Huge patch series are always harder
> > > to handle.
> > 
> > Okay, thanks for the suggestion!
> > 
> > Should this patch go through your tree?
> 
> I think so, yes.

Hm, this is an RFC patch, which suggests that it wasn't originally meant
to be merged as it is. Are you going to send a new version, or did it
turn out to be exactly what we want and the "RFC" tag was a mistake?

Kevin

