Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F60316C0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 23:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWpOX-0006t7-US
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 17:49:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hWpNZ-0006aZ-9j
	for qemu-devel@nongnu.org; Fri, 31 May 2019 17:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hWpNX-0005wI-He
	for qemu-devel@nongnu.org; Fri, 31 May 2019 17:48:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hWpNX-0005rZ-Bx
	for qemu-devel@nongnu.org; Fri, 31 May 2019 17:47:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC5CB3002C7D
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 21:47:57 +0000 (UTC)
Received: from localhost (ovpn-120-246.rdu2.redhat.com [10.10.120.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB8260BFC;
	Fri, 31 May 2019 21:47:50 +0000 (UTC)
Date: Fri, 31 May 2019 18:47:48 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Message-ID: <20190531214748.GN22103@habkost.net>
References: <20190517125820.2885-1-jfreimann@redhat.com>
	<20190517125820.2885-4-jfreimann@redhat.com>
	<20190521094504.GB2915@work-vm>
	<20190530145645.tjwkgi4hae5yblsi@jenstp.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530145645.tjwkgi4hae5yblsi@jenstp.localdomain>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 31 May 2019 21:47:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/4] net/virtio: add failover support
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
Cc: pkrempa@redhat.com, berrange@redhat.com, mst@redhat.com, aadam@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, laine@redhat.com, ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 30, 2019 at 04:56:45PM +0200, Jens Freimann wrote:
> On Tue, May 28, 2019 at 11:04:15AM -0400, Michael S. Tsirkin wrote:
> > On Tue, May 21, 2019 at 10:45:05AM +0100, Dr. David Alan Gilbert wrote:
> > > * Jens Freimann (jfreimann@redhat.com) wrote:
[...]
> > > > +    }
> > > > +    if (migration_in_setup(s) && !should_be_hidden && n->primary_dev) {
> > > > +        qdev_unplug(n->primary_dev, &err);
> > > 
> > > Not knowing unplug well; can you just explain - is that device hard
> > > unplugged and it's gone by the time this function returns or is it still
> > > hanging around for some indeterminate time?
> 
> Qemu will trigger an unplug request via pcie attention button in which case
> there could be a delay by the guest operating system. We could give it some
> amount of time and if nothing happens try surpise removal or handle the
> error otherwise.

I'm missing something here:

Isn't the whole point of the new device-hiding infrastructure to
prevent QEMU from closing the VFIO until migration ended
successfully?

What exactly is preventing QEMU from closing the host VFIO device
after the guest OS has handled the unplug request?

-- 
Eduardo

