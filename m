Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA6150A3D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 16:50:00 +0100 (CET)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iydz4-0002TJ-UX
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 10:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iydxk-0001Tk-1X
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:48:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iydxi-00060y-7a
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:48:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44848
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iydxh-0005xb-VD
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 10:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580744913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84rpQ4jJRLdl5UDr3nhIEwQ/adlKJzynEjK37aoemJw=;
 b=AjYmxdh/w4jsXLNi3XqEpqs/HNa07QvGeikyxcbLeAPNJY4v98sdXFLvZxFC4xzh7T3h0r
 wgAOmoIh73FvFFsi8FGglfTql5ZO7RCYocx3swJYw5qpI/Ge1JSMOO+DGBzQA+wa9UdOJX
 e4nCkei13WqE9ZMRlyhj2LZ83l+RJvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-vHCzlFPqPN-99m1-WwDbyw-1; Mon, 03 Feb 2020 10:48:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795681800D41;
 Mon,  3 Feb 2020 15:48:28 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F2360BE0;
 Mon,  3 Feb 2020 15:48:22 +0000 (UTC)
Date: Mon, 3 Feb 2020 16:48:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Question] Regarding containers
 "unattached/peripheral/anonymous" - their relation with hot(un)plug of
 devices
Message-ID: <20200203164820.54100793@redhat.com>
In-Reply-To: <20200203053819-mutt-send-email-mst@kernel.org>
References: <70446b6cbf5442488a40fe809f38c3c8@huawei.com>
 <20200124145404.1d15209e@redhat.com>
 <20200203053819-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vHCzlFPqPN-99m1-WwDbyw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pbonzini <pbonzini@redhat.com>, Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Feb 2020 05:40:01 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jan 24, 2020 at 02:54:04PM +0100, Igor Mammedov wrote:
> > On Fri, 24 Jan 2020 11:20:15 +0000
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> >   
> > > Hello,
> > > I am working on vCPU Hotplug feature for ARM64 and I am in mid of understanding some aspect of device_add/device_del interface of the QEMU.
> > > 
> > > Observations:
> > > 1. Any object initialised by qmp_device_add() gets into /machine/unattached container. I traced the flow to code leg inside  device_set_realized()
> > > 2. I could see the reverse qmp_device_del() expects the device to be in  /machine/peripheral container.
> > > 3. I could see any object initially added to unattached container did not had their parents until object_add_property_child() was called further in the leg.
> > >     which effectively meant a new property was created and property table populated and child was parented.
> > > 4. Generally, container  /machine/peripheral was being used wherever DEVICE(dev)->id was present and non-null.
> > > 
> > > Question:
> > > 1. Wanted to confirm my understanding about the use of having separate containers like unattached, peripheral and anonymous.  
> >   
> > > 2. At init time all the vcpus goes under *unattached* container. Now, qmp_device_del() cannot be used to unplug them. I am wondering  
> > 
> > device is put into 'unattached' in case it wasn't assigned a parent.
> > Usually it happens when board creates device directly.
> >   
> > >    if all the hotplug devices need to go under the *peripheral* container while they are hotplugged and during object init time as well?  
> > 
> > theoretically device_del may use QOM path (the later users can get with query-hotpluggable-cpus),
> > but I think it's mostly debugging feature.
> > 
> > users are supposed to specify 'id' during -device/device_add if they are going to manage that device
> > afterwards (like unplugging it). Then they could use that 'id' in other commands (including device_del)
> > 
> > So 'id'-ed devices end up in 'peripheral' container
> >   
> > > 3. I could not see any device being place under *anonymous* container during init time. What is the use of this container?  
> > 
> > if I recall it right, devices created with help of device_add but without 'id' go to this container  
> 
> BTW, ATM hw/acpi/cpu.c creates _EJ0 for all CPUs (except the 1st one).
Eject on the 1st is disabled because we can't remove it in current impl.

> It might be cleaner to skip it for CPUs which don't have an id - what
> do you think?

Not sure as it's a bit different.
device_del is mgmt means to ask guest to remove CPU and if mgmt cares about removal
it should use 'id' during -device/device_add.
Where as _EJ0 is guest's means to actually remove cpus either on mgmt request
or manually via some other tooling running on guest side.
Once guest ejects such CPU, slot becomes free and mgmt could plug a CPU into it
later on.

I don't know if it's used in practice, so the only way to find it out is to
break it and see if someone complains.

Disabling _EJ0 on -smp X cpus looks to me like a policy decision (possible config option)
and won't simplify anything in practice (QEMU wise).

(so I'd duck my head into sand due to luck of complains from users)


> >   
> > > 
> > > I would be thankful for your valuable insights and answers and help in highlighting any gap in my understanding.
> > > 
> > > Thanks in anticipation!
> > > 
> > > Best Regards
> > > Salil
> > >   
> 
> 


