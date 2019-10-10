Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F36D2F50
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 19:11:19 +0200 (CEST)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIbyA-0001Wc-Ec
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 13:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iIbwV-0000Qn-4i
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 13:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iIbwS-00012p-Lo
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 13:09:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iIbwR-00012Y-Bh
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 13:09:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47859C057F31;
 Thu, 10 Oct 2019 17:09:30 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 223BC60600;
 Thu, 10 Oct 2019 17:09:19 +0000 (UTC)
Date: Thu, 10 Oct 2019 19:09:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC 0/3] acpi: cphp: add CPHP_GET_CPU_ID_CMD command to cpu
 hotplug MMIO interface
Message-ID: <20191010190916.4563a5eb@Igors-MacBook-Pro>
In-Reply-To: <20191010141652.GD21666@habkost.net>
References: <20191009132252.17860-1-imammedo@redhat.com>
 <20191010055356-mutt-send-email-mst@kernel.org>
 <20191010153815.4f7a3fc9@redhat.com>
 <20191010141652.GD21666@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 10 Oct 2019 17:09:30 +0000 (UTC)
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
 Philippe =?UTF-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Oct 2019 11:16:52 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Oct 10, 2019 at 03:39:12PM +0200, Igor Mammedov wrote:
> > On Thu, 10 Oct 2019 05:56:55 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> > > On Wed, Oct 09, 2019 at 09:22:49AM -0400, Igor Mammedov wrote:
> > > > As an alternative to passing to firmware topology info via new fwcfg files
> > > > so it could recreate APIC IDs based on it and order CPUs are enumerated,
> > > > 
> > > > extend CPU hotplug interface to return APIC ID as response to the new command
> > > > CPHP_GET_CPU_ID_CMD.  
> > > 
> > > One big piece missing here is motivation:
> > I thought the only willing reader was Laszlo (who is aware of context)
> > so I skipped on details and confused others :/
> > 
> > > Who's going to use this interface?
> > In current state it's for firmware, since ACPI tables can cheat
> > by having APIC IDs statically built in.
> > 
> > If we were creating CPU objects in ACPI dynamically
> > we would be using this command as well. It would save
> > us quite a bit space in ACPI blob but it would be a pain
> > to debug and diagnose problems in ACPI tables, so I'd rather
> > stay with static CPU descriptions in ACPI tables for the sake
> > of maintenance.
> > 
> > > So far CPU hotplug was used by the ACPI, so we didn't
> > > really commit to a fixed interface too strongly.
> > > 
> > > Is this a replacement to Laszlo's fw cfg interface?
> > > If yes is the idea that OVMF going to depend on CPU hotplug directly then?
> > > It does not depend on it now, does it?
> > It doesn't, but then it doesn't support cpu hotplug,
> > OVMF(SMM) needs to cooperate with QEMU "and" ACPI tables to perform
> > the task and using the same interface/code path between all involved
> > parties makes the task easier with the least amount of duplicated
> > interfaces and more robust.
> > 
> > Re-implementing alternative interface for firmware (fwcfg or what not)
> > would work as well, but it's only question of time when ACPI and
> > this new interface disagree on how world works and process falls
> > apart.
> > 
> > > If answers to all of the above is yes, then I don't really like it: it
> > > is better to keep all paravirt stuff in one place, namely in fw cfg.
> > Lets discuss, what cpu hotplug fwcfg interface could look like in 
> >  [PATCH 3/4] hw/i386: add facility to expose CPU topology over  fw-cfg
> > mail thread and clarify (dis)likes with concrete reasons.
> > 
> > So far I managed to convince myself that we ought to reuse
> > and extend current CPU hotplug interface with firmware features,
> > to endup with consolidated cpu hotplug process without
> > introducing duplicate ABIs, but I could be wrong so
> > lets see if fwcfg will be the better approach.
> > 
> 
> I was more inclined towards the approach in this patch, because I
> see it as just a bug fix in the CPU hotplug interface (which
> should have been using the hardware CPU identifier as the CPU
> selector since the beginning).
> 
> Providing the missing information in fw_cfg isn't necessarily
> bad, but please document it explicitly as a
>   hotplug_cpu_selector => cpu_hardware_id
> mapping, so people won't use "CPU index" as a generic identifier
> elsewhere.

Currently cpu_selector is UID (or whatever you'd like to name it)
for a CPU instance in ACPI tables. It just happens to be non sparse
range [0..max_cpus) and was just a convenient way to make up IDs
and handle them on hw side (requires simple array).

Sure I'll document it as such to avoid mis-understanding,
plus a bunch of other fixes to the spec.


