Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB1314E5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 20:47:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWmYT-0006Fn-Fg
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 14:47:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hWmWu-0005g2-LC
	for qemu-devel@nongnu.org; Fri, 31 May 2019 14:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hWmWt-0007wM-G6
	for qemu-devel@nongnu.org; Fri, 31 May 2019 14:45:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hWmWt-0007qh-7V
	for qemu-devel@nongnu.org; Fri, 31 May 2019 14:45:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0642880B49
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 18:45:26 +0000 (UTC)
Received: from work-vm (ovpn-117-254.ams2.redhat.com [10.36.117.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A1B35DE81;
	Fri, 31 May 2019 18:45:15 +0000 (UTC)
Date: Fri, 31 May 2019 19:45:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190531184512.GN3169@work-vm>
References: <20190517125820.2885-4-jfreimann@redhat.com>
	<20190521094504.GB2915@work-vm>
	<20190530145645.tjwkgi4hae5yblsi@jenstp.localdomain>
	<20190530134631-mutt-send-email-mst@kernel.org>
	<20190530180022.GB2864@work-vm>
	<20190530140419-mutt-send-email-mst@kernel.org>
	<20190530182210.GA22103@habkost.net>
	<20190530190322-mutt-send-email-mst@kernel.org>
	<20190531170154.GB22103@habkost.net>
	<20190531135059-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531135059-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 31 May 2019 18:45:26 +0000 (UTC)
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
Cc: pkrempa@redhat.com, berrange@redhat.com,
	Eduardo Habkost <ehabkost@redhat.com>, aadam@redhat.com,
	qemu-devel@nongnu.org, laine@redhat.com, jdenemar@redhat.com,
	Jens Freimann <jfreimann@redhat.com>, ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Fri, May 31, 2019 at 02:01:54PM -0300, Eduardo Habkost wrote:
> > > Yes. It's just lots of extremely low level interfaces
> > > and all rather pointless.
> > > 
> > > And down the road extensions like surprise removal support will make it
> > > all cleaner and more transparent. Floating things up to libvirt means
> > > all these low level details will require more and more hacks.
> > 
> > Why do you call it pointless?
> 
> We'd need APIs to manipulate device visibility to guest, hotplug
> controller state and separately manipulate the resources allocated. This
> is low level stuff that users really have no idea what to do about.
> Exposing such a level of detail to management is imho pointless.
> We are better off with a high level API, see below.

so I don't know much about vfio; but to me it strikes me that
you wouldn't need that low level detail if we just reworked vfio
to look more like all our other devices; something like:

  -vfiodev  host=02:00.0,id=gpu
  -device vfio-pci,dev=gpu

The 'vfiodev' would own the resources; so to do this trick, the
management layer would:
   hotunplug the vfio-pci
   migrate

if anything went wrong it would
   hotplug the vfio-pci backin

you wouldn't have free'd up any resources because they belonged
to the vfiodev.


> > If we want this to work before
> > surprise removal is implemented, we need to provide an API that
> > works for management software.
> >  Don't we want to make this work
> > without surprise removal too?
> 
> This patchset adds an optional, off by default support for
> migrating guests with an assigned network device.
> If enabled this requires guest to allow migration.
> 
> Of course this can be viewed as a security problem since it allows guest
> to block migration. We can't detect a malicious guest reliably imho.
> What we can do is report to management when guest allows migration.
> Policy such what to do when this does not happen for a while and
> what timeout to set would be up to management.
> 
> The API in question would be a high level one, something
> along the lines of a single "guest allowed migration" event.

This is all fairly normal problems with hot unplugging - that's
already dealt with at higher levels for normal hot unplugging.

The question here is to try to avoid duplicating that fairly
painful process in qemu.

Dave

> 
> -- 
> MST
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

