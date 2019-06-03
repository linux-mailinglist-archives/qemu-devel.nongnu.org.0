Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06232ABF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 10:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXiIn-0004Oj-PO
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 04:26:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jfreimann@redhat.com>) id 1hXiHl-0003w2-3u
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jfreimann@redhat.com>) id 1hXiHi-0005tV-PU
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:25:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jfreimann@redhat.com>)
	id 1hXiHX-0005GT-12
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:25:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09256C058CA2
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 08:25:08 +0000 (UTC)
Received: from localhost (dhcp-192-193.str.redhat.com [10.33.192.193])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 589DD610AA;
	Mon,  3 Jun 2019 08:24:58 +0000 (UTC)
Date: Mon, 3 Jun 2019 10:24:56 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190603082456.vzpy256kj4o5e5wu@jenstp.localdomain>
References: <20190517125820.2885-1-jfreimann@redhat.com>
	<20190517125820.2885-4-jfreimann@redhat.com>
	<20190521094504.GB2915@work-vm>
	<20190530145645.tjwkgi4hae5yblsi@jenstp.localdomain>
	<20190531214748.GN22103@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190531214748.GN22103@habkost.net>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 03 Jun 2019 08:25:13 +0000 (UTC)
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
	qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, laine@redhat.com,
	ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 31, 2019 at 06:47:48PM -0300, Eduardo Habkost wrote:
>On Thu, May 30, 2019 at 04:56:45PM +0200, Jens Freimann wrote:
>> On Tue, May 28, 2019 at 11:04:15AM -0400, Michael S. Tsirkin wrote:
>> > On Tue, May 21, 2019 at 10:45:05AM +0100, Dr. David Alan Gilbert wrote:
>> > > * Jens Freimann (jfreimann@redhat.com) wrote:
>[...]
>> > > > +    }
>> > > > +    if (migration_in_setup(s) && !should_be_hidden && n->primary_dev) {
>> > > > +        qdev_unplug(n->primary_dev, &err);
>> > >
>> > > Not knowing unplug well; can you just explain - is that device hard
>> > > unplugged and it's gone by the time this function returns or is it still
>> > > hanging around for some indeterminate time?
>>
>> Qemu will trigger an unplug request via pcie attention button in which case
>> there could be a delay by the guest operating system. We could give it some
>> amount of time and if nothing happens try surpise removal or handle the
>> error otherwise.
>
>I'm missing something here:
>
>Isn't the whole point of the new device-hiding infrastructure to
>prevent QEMU from closing the VFIO until migration ended
>successfully?

No. The point of hiding it is to only add the VFIO (that is configured
with the same MAC as the virtio-net device) until the
VIRTIO_NET_F_STANDBY feature is negotiated. We don't want to expose to
devices with the same MAC to guests who can't handle it.

>What exactly is preventing QEMU from closing the host VFIO device
>after the guest OS has handled the unplug request?

We qdev_unplug() the VFIO device and want the virtio-net standby device to
take over. If something goes wrong with unplug or
migration in general we have to qdev_plug() the device back.

This series does not try to implement new functionality to close a
device without freeing the resources.

From the discussion in this thread I understand that is what libvirt
needs though. Something that will trigger the unplug from the
guest but not free the devices resources in the host system (which is
what qdev_unplug() does). Correct? 

Why is it bad to fully re-create the device in case of a failed migration?


regards,
Jens 
 


>-- 
>Eduardo
>

