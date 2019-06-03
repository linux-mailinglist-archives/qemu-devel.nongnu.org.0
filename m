Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B546B3289B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 08:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXgal-0003nn-Si
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 02:37:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hXgZA-0003E7-DM
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hXgZ8-0007NB-J3
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:35:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hXgZ6-0007Cy-P0
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:35:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E8313107B10;
	Mon,  3 Jun 2019 06:35:27 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4A1604A2;
	Mon,  3 Jun 2019 06:35:23 +0000 (UTC)
Date: Mon, 3 Jun 2019 14:35:20 +0800
From: Peter Xu <peterx@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190603063520.GB31512@xz-x1>
References: <20190507031703.856-1-richardw.yang@linux.intel.com>
	<20190531164337.GK3169@work-vm> <20190601033441.GB4958@xz-x1>
	<20190603013305.GA7784@richard> <20190603023527.GD4958@xz-x1>
	<20190603033600.GB7784@richard> <20190603054013.GE4958@xz-x1>
	<20190603060547.GA17726@richard> <20190603061034.GA18247@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190603061034.GA18247@richard>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 06:35:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migratioin/ram: leave RAMBlock->bmap blank
 on allocating
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 03, 2019 at 02:10:34PM +0800, Wei Yang wrote:
> On Mon, Jun 03, 2019 at 02:05:47PM +0800, Wei Yang wrote:
> >On Mon, Jun 03, 2019 at 01:40:13PM +0800, Peter Xu wrote:
> >>
> >>Ah I see, thanks for the pointer.  Then I would agree it's fine.
> >>
> >>I'm not an expert of TCG - I'm curious on why all those three dirty
> >>bitmaps need to be set at the very beginning.  IIUC at least the VGA
> >>bitmap should not require that (so IMHO we should be fine to have all
> >>zeros with VGA bitmap for ramblocks, and we only set them when the
> >>guest touches them).  Migration bitmap should be special somehow but I
> >>don't know much on TCG/TLB part I'd confess so I can't say.  In other
> >>words, if migration is the only one that requires this "all-1"
> >>initialization then IMHO we may consider to remove the other part
> >>rather than here in migration because that's what we'd better to be
> >>sure with.
> >
> >I am not sure about the background here, so I didn't make a change at this
> >place.
> >
> >>
> >>And even if you want to remove this, I still have two suggestions:
> >>
> >>(1) proper comment here above bmap on the above fact that although
> >>    bmap is not set here but it's actually set somewhere else because
> >>    we'll sooner or later copy all 1s from the ramblock bitmap
> >>
> >>(2) imho you can move "migration_dirty_pages = 0" into
> >>    ram_list_init_bitmaps() too to let them be together
> >>
> 
> I took a look into this one.
> 
> ram_list_init_bitmaps() setup bitmap for each RAMBlock, while ram_state_init()
> setup RAMState. Since migration_dirty_pages belongs to RAMState, it maybe more
> proper to leave it at the original place.
> 
> Do you feel good about this?

Yes it's ok to me.  Thanks,

-- 
Peter Xu

