Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAE9EFF6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 18:18:35 +0200 (CEST)
Received: from localhost ([::1]:53792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2eB0-00050J-DD
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 12:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60260)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i2e8Y-0003z4-85
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i2e8V-0006oq-VY
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:16:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i2e8V-0006o2-Mp
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 12:15:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F0448AC6E1;
 Tue, 27 Aug 2019 16:15:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D342860600;
 Tue, 27 Aug 2019 16:15:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47D9A1165361; Tue, 27 Aug 2019 18:15:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20190815183803.13346-1-ehabkost@redhat.com>
 <20190815183803.13346-4-ehabkost@redhat.com>
 <20190816152011.0c673027@redhat.com>
 <20190816165635.GC3908@habkost.net>
 <87sgq0qprn.fsf@dusky.pond.sub.org>
 <20190826165135.03e97e1b@redhat.com>
Date: Tue, 27 Aug 2019 18:15:53 +0200
In-Reply-To: <20190826165135.03e97e1b@redhat.com> (Igor Mammedov's message of
 "Mon, 26 Aug 2019 16:51:35 +0200")
Message-ID: <87ftlmeg92.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 27 Aug 2019 16:15:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] pc: Don't make CPU properties
 mandatory unless necessary
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
Cc: Peter Krempa <pkrempa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Like Xu <like.xu@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Sat, 17 Aug 2019 08:17:48 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > On Fri, Aug 16, 2019 at 03:20:11PM +0200, Igor Mammedov wrote:  
>> >> On Thu, 15 Aug 2019 15:38:03 -0300
>> >> Eduardo Habkost <ehabkost@redhat.com> wrote:
>> >>   
>> >> > We have this issue reported when using libvirt to hotplug CPUs:
>> >> > https://bugzilla.redhat.com/show_bug.cgi?id=1741451
>> >> > 
>> >> > Basically, libvirt is not copying die-id from
>> >> > query-hotpluggable-cpus, but die-id is now mandatory.  
>> >> 
>> >> this should have been gated on compat property and affect
>> >> only new machine types.
>> >> Maybe we should do just that instead of fixup so libvirt
>> >> would finally make proper handling of query-hotpluggable-cpus.
>> >> 
>> >>    
>> >> > We could blame libvirt and say it is not following the documented
>> >> > interface, because we have this buried in the QAPI schema
>> >> > documentation:  
>> >> 
>> >> I wouldn't say buried, if I understand it right QAPI schema
>> >> should be the authoritative source of interface description.
>> >> 
>> >> If I recall it's not the first time, there was similar issue
>> >> for exactly the same reason (libvirt not passing through
>> >> all properties from query-hotpluggable-cpus).
>> >> 
>> >> And we had to fix it up on QEMU side (numa_cpu_pre_plug),
>> >> but it seems 2 years later libvirt is still broken the same way :(
>> >> 
>> >> Should we really do fixups or finaly fix it on libvirt side?  
>> >
>> > Is it truly a bug in libvirt?  Making QEMU behave differently
>> > when getting exactly the same input sounds like a bad idea, even
>> > if we documented that at the QAPI documentation.
>> >
>> > My suggestion is to instead drop the comment below from the QAPI
>> > documentation.  New properties shouldn't become mandatory.  
>> 
>> The "comment below" is this one, in qapi/machine.json:
>> 
>> >> > > Note: currently there are 5 properties that could be present
>> >> > > but management should be prepared to pass through other
>> >> > > properties with device_add command to allow for future
>> >> > > interface extension. This also requires the filed names to be kept in
>> >> > > sync with the properties passed to -device/device_add.    
>> 
>> Goes back to commit d4633541ee0, v2.7.0.  @die-id was the first such
>> interface extension.
>> 
>> A rule like "to use command C, you must pass it whatever you get from
>> command Q" punches a hole into the "QMP is a stable interface" promise.
>> Retroactively tacking it onto an existing interface like device-add
>> some-existing-device is even more problematic than specifying it for a
>> new interface.  Mind, this is not a categorical "can't ever do that".
>> It's more like "you better show this is less bad than all the
>> alternatives we can think of, and we've thought pretty hard".
>> Since this particular hole failed us the first time anybody actually
>> tried to wiggle through it, I think Eduardo has a point when he calls
>> for filling it in by deleting the comment.
>
> That was a consensus we were able to reach when discussing cpu hotplug
> QMP interface. If I recall correctly idea was that it should work for
> different targets (cpu topology properties target specific) and be
> extensible without breaking old mgmt stack  or requiring its update
> in lock step.
>
> If implemented correctly mgmt would not only query from QEMU/machine
> possible CPUs (with properties and valid values needed to plug it in,
> which it does already) but also 'keep' them around and pass back to
> device_add. In that case it would have worked as designed just fine.
>
> But this also shows a problem that we still need versioned machine type
> to keep old set of properties for old machine types anyway and we can
> miss it during review as tests we have might be not enough
> (tests/cpu-plug-test didn't detect it for some reason).

I think the lesson to learn here is "non-trivial rules on correct
interface use need to be backed by integration tests".

The rule in question is "a CPU hot-plug with device_add must specify all
the properties returned by query-hotpluggable-cpus".

Sadly, stipulating such rules does not change the de facto API.  Case in
point: libvirt did not obey this one, and even though it's been in place
for years, yet we're (rightly!) unwilling to blame libvirt for the
regression.  The stipulation was futile.

How could we increase our chances that management applications pick up
such rules?  I can see only one promising way: make tests fail unless
they do.  Add some arbitray dummy property, fail the hot plug unless
it's given.  Of course, we can't do that, because it's exactly the
breakage we're trying to avoid.  So do it only when QEMU is run with
--future, then have integration tests run it that way.

Aside: I'm afraid "# TODO: Better documentation; currently there is
none" didn't exactly help with query-hotpluggable-cpus uptake.

[...]

