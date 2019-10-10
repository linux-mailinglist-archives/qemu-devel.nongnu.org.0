Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE9D3142
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:21:57 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIe0a-0003q9-3j
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iIdzb-0003JW-1q
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iIdzZ-0002Ha-Nq
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:20:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59814)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iIdzZ-0002HN-FM
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:20:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D58BA26692;
 Thu, 10 Oct 2019 19:20:52 +0000 (UTC)
Received: from localhost (ovpn-116-5.gru2.redhat.com [10.97.116.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3920A50D08;
 Thu, 10 Oct 2019 19:20:41 +0000 (UTC)
Date: Thu, 10 Oct 2019 16:20:39 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC 0/3] acpi: cphp: add CPHP_GET_CPU_ID_CMD command to cpu
 hotplug MMIO interface
Message-ID: <20191010192039.GE4084@habkost.net>
References: <20191009132252.17860-1-imammedo@redhat.com>
 <20191010055356-mutt-send-email-mst@kernel.org>
 <20191010153815.4f7a3fc9@redhat.com>
 <20191010095459-mutt-send-email-mst@kernel.org>
 <20191010175754.7c62cf8f@Igors-MacBook-Pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010175754.7c62cf8f@Igors-MacBook-Pro>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 10 Oct 2019 19:20:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 10, 2019 at 05:57:54PM +0200, Igor Mammedov wrote:
> On Thu, 10 Oct 2019 09:59:42 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Oct 10, 2019 at 03:39:12PM +0200, Igor Mammedov wrote:
> > > On Thu, 10 Oct 2019 05:56:55 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > 
> > > > On Wed, Oct 09, 2019 at 09:22:49AM -0400, Igor Mammedov wrote:
> > > > > As an alternative to passing to firmware topology info via new fwcfg files
> > > > > so it could recreate APIC IDs based on it and order CPUs are enumerated,
> > > > > 
> > > > > extend CPU hotplug interface to return APIC ID as response to the new command
> > > > > CPHP_GET_CPU_ID_CMD.  
> > > > 
> > > > One big piece missing here is motivation:
> > > I thought the only willing reader was Laszlo (who is aware of context)
> > > so I skipped on details and confused others :/
> > > 
> > > > Who's going to use this interface?
> > > In current state it's for firmware, since ACPI tables can cheat
> > > by having APIC IDs statically built in.
> > > 
> > > If we were creating CPU objects in ACPI dynamically
> > > we would be using this command as well.
> > 
> > I'm not sure how it's even possible to create devices dynamically. Well
> > I guess it's possible with LoadTable. Is this what you had in
> > mind?
> 
> Yep. I even played this shiny toy and I can say it's very tempting one.
> On the  other side, even problem of legacy OSes not working with it aside,
> it's hard to debug and reproduce compared to static tables.
> So from maintaining pov I dislike it enough to be against it.
> 
> 
> > > It would save
> > > us quite a bit space in ACPI blob but it would be a pain
> > > to debug and diagnose problems in ACPI tables, so I'd rather
> > > stay with static CPU descriptions in ACPI tables for the sake
> > > of maintenance.
> > > > So far CPU hotplug was used by the ACPI, so we didn't
> > > > really commit to a fixed interface too strongly.
> > > > 
> > > > Is this a replacement to Laszlo's fw cfg interface?
> > > > If yes is the idea that OVMF going to depend on CPU hotplug directly then?
> > > > It does not depend on it now, does it?
> > > It doesn't, but then it doesn't support cpu hotplug,
> > > OVMF(SMM) needs to cooperate with QEMU "and" ACPI tables to perform
> > > the task and using the same interface/code path between all involved
> > > parties makes the task easier with the least amount of duplicated
> > > interfaces and more robust.
> > > 
> > > Re-implementing alternative interface for firmware (fwcfg or what not)
> > > would work as well, but it's only question of time when ACPI and
> > > this new interface disagree on how world works and process falls
> > > apart.
> > 
> > Then we should consider switching acpi to use fw cfg.
> > Or build another interface that can scale.
> 
> Could be an option, it would be a pain to write a driver in AML for fwcfg access though
> (I've looked at possibility to access fwcfg from AML about a year ago and gave up.
> I'm definitely not volunteering for the second attempt and can't even give an estimate
> it it's viable approach).
> 
> But what scaling issue you are talking about, exactly?
> With current CPU hotplug interface we can handle upto UNIT32_MAX cpus, and extend
> interface without need to increase IO window we are using now.
> 
> Granted IO access it not fastest compared to fwcfg in DMA mode, but we already
> doing stop machine when switching to SMM which is orders of magnitude slower.
> Consensus was to compromise on speed of CPU hotplug versus more complex and more
> problematic unicast SMM mode in OVMF (can't find a particular email but we have discussed
> it with Laszlo already, when I considered ways to optimize hotplug speed)

If we were designing the interface from the ground up, I would
agree with Michael.  But I don't see why we would reimplement
everything from scratch now, if just providing the
cpu_selector => cpu_hardware_id mapping to firmware is enough to
make the existing interface work.

If somebody is really unhappy with the current interface and
wants to implement a new purely fw_cfg-based one (and write the
corresponding ACPI code), they would be welcome.  I just don't
see why we should spend our time doing that now.

-- 
Eduardo

