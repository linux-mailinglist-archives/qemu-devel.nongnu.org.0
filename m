Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2479E5552A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 18:52:32 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfogJ-0001F6-B6
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 12:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51243)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <klaus@birkelund.eu>) id 1hfoZX-0006KT-CY
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <klaus@birkelund.eu>) id 1hfoZW-000064-7f
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 12:45:31 -0400
Received: from charlie.dont.surf ([128.199.63.193]:44872)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <klaus@birkelund.eu>)
 id 1hfoZT-0008RN-FA; Tue, 25 Jun 2019 12:45:27 -0400
Received: from apples.localdomain (ip-5-186-120-196.cgn.fibianet.dk
 [5.186.120.196])
 by charlie.dont.surf (Postfix) with ESMTPSA id C33F7BF988;
 Tue, 25 Jun 2019 16:45:22 +0000 (UTC)
Date: Tue, 25 Jun 2019 18:45:19 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190625164445.GA21148@apples.localdomain>
Mail-Followup-To: Kevin Wolf <kwolf@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@intel.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20190617081205.GA26990@apples.localdomain>
 <c754211f-b41d-4b69-585b-b287fb776d81@redhat.com>
 <20190624080154.GA4263@apples.localdomain>
 <20190624101828.GC12855@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624101828.GC12855@linux.fritz.box>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: Re: [Qemu-devel] [Qemu-block] [RFC] nvme: how to support multiple
 namespaces
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Keith Busch <keith.busch@intel.com>,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 12:18:45PM +0200, Kevin Wolf wrote:
> Am 24.06.2019 um 10:01 hat Klaus Birkelund geschrieben:
> > On Thu, Jun 20, 2019 at 05:37:24PM +0200, Laszlo Ersek wrote:
> > > On 06/17/19 10:12, Klaus Birkelund wrote:
> > > > Hi all,
> > > > 
> > > > I'm thinking about how to support multiple namespaces in the NVMe
> > > > device. My first idea was to add a "namespaces" property array to the
> > > > device that references blockdevs, but as Laszlo writes below, this might
> > > > not be the best idea. It also makes it troublesome to add per-namespace
> > > > parameters (which is something I will be required to do for other
> > > > reasons). Some of you might remember my first attempt at this that
> > > > included adding a new block driver (derived from raw) that could be
> > > > given certain parameters that would then be stored in the image. But I
> > > > understand that this is a no-go, and I can see why.
> > > > 
> > > > I guess the optimal way would be such that the parameters was something
> > > > like:
> > > > 
> > > >    -blockdev raw,node-name=blk_ns1,file.driver=file,file.filename=blk_ns1.img
> > > >    -blockdev raw,node-name=blk_ns2,file.driver=file,file.filename=blk_ns2.img
> > > >    -device nvme-ns,drive=blk_ns1,ns-specific-options (nsfeat,mc,dlfeat)...
> > > >    -device nvme-ns,drive=blk_ns2,...
> > > >    -device nvme,...
> > > > 
> > > > My question is how to state the parent/child relationship between the
> > > > nvme and nvme-ns devices. I've been looking at how ide and virtio does
> > > > this, and maybe a "bus" is the right way to go?
> > > 
> > > I've added Markus to the address list, because of this question. No
> > > other (new) comments from me on the thread starter at this time, just
> > > keeping the full context.
> > > 
> > 
> > Hi all,
> > 
> > I've succesfully implemented this by introducing a new 'nvme-ns' device
> > model. The nvme device creates a bus named from the device id ('id'
> > parameter) and the nvme-ns devices are then registered on this.
> > 
> > This results in an nvme device being creates like this (two namespaces
> > example):
> > 
> >   -drive file=nvme0n1.img,if=none,id=disk1
> >   -drive file=nvme0n2.img,if=none,id=disk2
> >   -device nvme,serial=deadbeef,id=nvme0
> >   -device nvme-ns,drive=disk1,bus=nvme0,nsid=1
> >   -device nvme-ns,drive=disk2,bus=nvme0,nsid=2
> > 
> > How does that look as a way forward?
> 
> This looks very similar to what other devices do (one bus controller
> that has multiple devices on its but), so I like it.
> 
> The thing that is special here is that -device nvme is already a block
> device by itself that can take a drive property. So how does this play
> together? Can I choose to either specify a drive directly for the nvme
> device or nvme-ns devices, but when I do both, I will get an error? What
> happens if I don't specify a drive for nvme, but also don't add nvme-ns
> devices?
> 

Hi Kevin,

Yes, the nvme device is already a block device. My current patch removes
that property from the nvme device. I guess this breaks backward
compatibiltiy. We could accept a drive for the nvme device only if no
nvme-ns devices are configured and connected on the bus.

I'm not entirely sure on the spec, but my gut tells me that an nvme
device without any namespaces is technically a valid device, although it
is a bit useless.

I will post my patch (as part of a larger series) and we can discuss it
there.

Thanks for the feedback!

Klaus

