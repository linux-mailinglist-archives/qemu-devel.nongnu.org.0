Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A3DC7B7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 16:49:35 +0200 (CEST)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLTZN-00073H-MA
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 10:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iLTVR-0004VG-CX
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iLTVQ-0008Sq-0I
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:45:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39616)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iLTVP-0008SO-NS
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 10:45:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A4E789AFB9;
 Fri, 18 Oct 2019 14:45:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BBB160BFB;
 Fri, 18 Oct 2019 14:45:17 +0000 (UTC)
Date: Fri, 18 Oct 2019 16:45:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [RFC 2/3] acpi: cpuhp: add typical usecases into spec
Message-ID: <20191018164515.05aef75d@redhat.com>
In-Reply-To: <2b10ca48-c734-4f41-9521-136c44060812@redhat.com>
References: <20191009132252.17860-1-imammedo@redhat.com>
 <20191009132252.17860-3-imammedo@redhat.com>
 <2b10ca48-c734-4f41-9521-136c44060812@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 18 Oct 2019 14:45:26 +0000 (UTC)
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Oct 2019 16:13:22 +0200
Laszlo Ersek <lersek@redhat.com> wrote:

> On 10/09/19 15:22, Igor Mammedov wrote:
> > Clarify values of "CPU selector' register and add workflows for
> >   * finding CPU with pending 'insert/remove' event
> >   * enumerating present/non present CPUs
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  docs/specs/acpi_cpu_hotplug.txt | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
> > index ac5903b2b1..43c5a193f0 100644
> > --- a/docs/specs/acpi_cpu_hotplug.txt
> > +++ b/docs/specs/acpi_cpu_hotplug.txt
> > @@ -54,6 +54,7 @@ write access:
> >      [0x0-0x3] CPU selector: (DWORD access)
> >                selects active CPU device. All following accesses to other
> >                registers will read/store data from/to selected CPU.
> > +              Valid values: [0 .. max_cpus)
> >      [0x4] CPU device control fields: (1 byte access)
> >          bits:
> >              0: reserved, OSPM must clear it before writing to register.
> > @@ -93,3 +94,24 @@ Selecting CPU device beyond possible range has no effect on platform:
> >       ignored
> >     - read accesses to CPU hot-plug registers not documented above return
> >       all bits set to 0.
> > +
> > +Typical usecases:
> > +   - Get a cpu with pending event
> > +     1. write 0x0 into 'Command field' register
> > +     2. read from 'Command data' register, CPU selector value (CPU's UID in ACPI
> > +        tables) and event for selected CPU from 'CPU device status fields'
> > +        register. If there aren't pending events, CPU selector value doesn't
> > +        change and 'insert' and 'remove' bits are not set.  
> 
> Okay, so based on the "Command data" documentation I'm suggesting in
> <http://mid.mail-archive.com/cd0713b5-fd64-d3e1-7f83-3a0725b819a3@redhat.com>,
> I propose:
> 
> 1. Store 0x0 to the 'CPU selector' register.
With ACPI code being the only user it was not necessary
as value val always correct. But if someone wrote invalid selector
value it would break CPHP_GET_NEXT_CPU_WITH_EVENT_CMD command.
I shall update AML code to include this step as well so it would
be more robust.

> 2. Store 0x0 to the 'Command field' register.
> 3. Read the 'CPU device status fields' register.
> 4. If both bit#1 and bit#2 are clear in the value read, there is no CPU
>    with a pending event.
> 5. Otherwise, read the 'Command data' register. The value read is the
>    selector of the CPU with the pending event (which is already
>    selected).
> 
> > +   - Enumerate CPUs present/non present CPUs.
> > +     1. set iterator to 0x0
> > +     2. write 0x0 into 'Command field' register and then iterator
> > +        into 'CPU selector' register.
> > +     3. read 'enabled' flag for selected CPU from 'CPU device status fields'
> > +        register
> > +     4. to continue to the next CPU, increment iterator and repeat step 2
> > +     5. read 'Command data' register
> > +     5.1 if 'Command data' register matches iterator continue to step 3.
> > +         (read presence bit for the next CPU)
> > +     5.2 if 'Command data' register has not changed, there is not CPU
> > +         corresponding to iterator value and the last valid iterator value
> > +         equals to 'max_cpus' + 1
> >   
> 
> How about:
> 
> 01. Set the present CPU count to 0.
> 02. Set the iterator to 0.
> 03. Store 0x0 to the 'Command field' register.
> 04. Store 0x0 to the 'CPU selector' register.
> 05. Read the 'CPU device status fields' register.
> 06. If bit#0 is set, increment the present CPU count.
> 07. Increment the iterator.
> 08. Store the iterator to the 'CPU selector' register.
> 09. Read the 'Command data' register.
> 10. If the value read is zero, then the iterator equals "max_cpus";
>     exit now.
> 11. Goto 05.

Looks good, I'll use both suggestions, thanks!

> 
> Thanks
> Laszlo


