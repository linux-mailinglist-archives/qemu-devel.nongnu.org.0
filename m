Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71C7ACC3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 17:50:45 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsUOi-0008F0-BV
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 11:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hsUNu-0007ii-Om
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 11:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hsUNt-00089n-LG
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 11:49:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2585)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hsUNs-00089D-Tz; Tue, 30 Jul 2019 11:49:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3179C3082126;
 Tue, 30 Jul 2019 15:49:52 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-204-67.brq.redhat.com [10.40.204.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 283DA1001B14;
 Tue, 30 Jul 2019 15:49:49 +0000 (UTC)
Date: Tue, 30 Jul 2019 17:49:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <20190730174946.46029336@Igors-MacBook-Pro>
In-Reply-To: <aac94bbf-eb9b-56bd-0c52-9918968973f2@de.ibm.com>
References: <20190729145229.4333-1-imammedo@redhat.com>
 <aac94bbf-eb9b-56bd-0c52-9918968973f2@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 30 Jul 2019 15:49:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH RFC 0/2] s390: stop abusing
 memory_region_allocate_system_memory()
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
Cc: pbonzini@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jul 2019 17:22:01 +0200
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> I remember that you send a similar patch a while ago and something broke on s390x.
> Have you changed something from the old patchs set?
Thanks for reminder, I totally forgot about it.

it was "[PATCH v1 5/5] s390: do not call memory_region_allocate_system_memory() multiple times"
now looking at history it all comes back, so this series is incomplete as is
due to memory memory region aliases being merged back to one big memory section
after flatview is rendered. So KVM get too big chunk of RAM and it breaks.

So aliases solve only half of the problem (keeping migration side working)
and to fix KVM side, I'd add splitting memory section on chunks into
kvm_set_phys_mem() to keep KVM specifics to kvm code only.
Board would only have to set max size value and kvm code would use it for splitting,
I'll try to find that patch.


> 
> On 29.07.19 16:52, Igor Mammedov wrote:
> > While looking into unifying guest RAM allocation to use hostmem backends
> > for initial RAM (especially when -mempath is used) and retiring
> > memory_region_allocate_system_memory() API, leaving only single hostmem backend,
> > I was inspecting how currently it is used by boards and it turns out several
> > boards abuse it by calling the function several times (despite documented contract
> > forbiding it).
> > 
> > s390 is one of such boards where KVM limitation on memslot size got propagated
> > to board design and memory_region_allocate_system_memory() was abused to satisfy
> > KVM requirement for max RAM chunk where memory region alias would suffice.
> > 
> > Unfortunately, memory_region_allocate_system_memory() usage created migration
> > dependency where guest RAM is transferred in migration stream as several RAMBlocks
> > if it's more than KVM_SLOT_MAX_BYTES.
> > 
> > In order to replace these several RAM chunks with a single memdev and keep it
> > working with KVM memslot size limit and migration compatible, following was done:
> >    * [2/2] use memory region aliases to partition hostmem backend RAM on
> >            KVM_SLOT_MAX_BYTES chunks, which should keep KVM side working
> >    * [1/2] hacked memory region aliases (to ram memory regions only) to have
> >            its own RAMBlocks pointing to RAM chunks owned by aliased memory
> >            region. While it's admittedly a hack, but it's relatively simple and
> >            allows board code rashape migration stream as necessary
> > 
> >            I haven't tried to use migratable aliases on x86 machines, but with it
> >            it could be possible to drop legacy RAM allocation and compat knob
> >            (cd5ff8333a) dropping '-numa node,mem' completely even for old machines.
> > 
> > PS:
> >    Tested with ping pong cross version migration on s390 machine 
> >    (with reduced KVM_SLOT_MAX_BYTES since I don't have access to large
> >     enough host)
> >      
> > 
> > Igor Mammedov (2):
> >   memory: make MemoryRegion alias migratable
> >   s390: do not call memory_region_allocate_system_memory() multiple
> >     times
> > 
> >  exec.c                     |  7 ++++---
> >  hw/s390x/s390-virtio-ccw.c | 20 +++++++++++++++-----
> >  memory.c                   |  5 +++++
> >  3 files changed, 24 insertions(+), 8 deletions(-)
> > 
> 


