Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F122FCF41
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:08:59 +0100 (CET)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2CID-0007wW-OC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2CGl-0007UU-Hi
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:07:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2CGi-00018l-2u
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611144442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUvsak6AhrqcVQkoYUIUNpP828hM1W5trKjq91RIGMc=;
 b=iWBLoB6c4SWlkokj7ItktnyORo1nNyQ1Xga+wfCofbRo1hipTC7BZuAm6/lkKUMlaZLYUT
 cvdPf7V86z5MK5AqGz/NqmRlhV8rDXr1ecraiUg6A3hU5tfAS6phMRHAV+kCE0xIAW6Pzu
 NTdjHI6Y4ikaH214kHJ0ETWoB2z2A68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Z_h5dplSPaSuqE4GO42bHQ-1; Wed, 20 Jan 2021 07:07:19 -0500
X-MC-Unique: Z_h5dplSPaSuqE4GO42bHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E148107ACF7
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:07:18 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B27E810023B2;
 Wed, 20 Jan 2021 12:07:16 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:07:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 0/5] pc: support user provided NIC naming/indexing
Message-ID: <20210120130714.4b8b7d06@redhat.com>
In-Reply-To: <20210117053250-mutt-send-email-mst@kernel.org>
References: <20201222233934.451578-1-imammedo@redhat.com>
 <20210113064312-mutt-send-email-mst@kernel.org>
 <20210115025902.13e84f7c@redhat.com>
 <20210117053250-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Jan 2021 05:59:18 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jan 15, 2021 at 02:59:02AM +0100, Igor Mammedov wrote:
> > On Wed, 13 Jan 2021 07:09:56 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, Dec 22, 2020 at 06:39:29PM -0500, Igor Mammedov wrote:  
> > > > 
> > > > Series implements support for 'onboard' naming scheme for network
> > > > interfaces (1), which is based on PCI firmware spec and lets user
> > > > to explicitly specify index that will be used by guest to name
> > > > network interface, ex:
> > > >     -device e1000,acpi-index=33
> > > > should make guest rename NIC name to 'eno33' where 'eno' is default
> > > > prefix for this scheme.
> > > > 
> > > > Hope is that it will allow to simplify launching VMs from
> > > > template disk images with different set VM configurations
> > > > without need to reconfigure guest network intrfaces or
> > > > risk of loosing network connectivity.    
> > > 
> > > Questions:
> > > the spec says:
> > > Assignment of specific device names to multi-function devices installed in expansion
> > > slots, and/or PCI or PCI Express devices that are hot-added to expansion slots in operating system-
> > > environment would be handled in operating system-specific manner, and is not specified via this
> > > specification.
> > > 
> > > Accordingly, link below says:
> > > " Names incorporating Firmware/BIOS provided index numbers for on-board devices (example: eno1)"
> > > 
> > > to what extend does guest assume the index is for on-board devices?
> > > it seems things work for fedora but how confident are we that this
> > > will keep working.  
> > 
> > code itself is not limiting it to onboard devices in any way.
> > (I can only speculate here, reason for calling it onboard is that
> > on real hardware ACPI is mostly static tables and firmware provides
> > an option to set index for only built-in NICs).
> > Technically there is no reason to call in onboad though.  
> 
> Well there's an smbios thing that I believe says onboard
> in the spec. Come to think of it that one actually
> applies to multifunction devices too.
Can you point to the specific place in the spec, pls?

> 
> 
> > 
> > I'd believe it should work with any distribution that uses
> > recent enough systemd/udev (released starting from 2003).
> >   
> > > Further, code seems to only look at the slot level.
> > > According to this, and according to the spec, this does not work with
> > > multifunction devices, does it?  
> > 
> > we probably should disable it for multifunction devices,
> > any suggestions how to detect those in QEMU?  
> 
> QEMU_PCI_CAP_MULTIFUNCTION_BITNR ?
> 
> Enforcing this will help but can we make this self-documenting somehow?
what do you mean saying "to make it self-documenting somehow"?

> > > The link you supplied lists another option:
> > > "Names incorporating Firmware/BIOS provided PCI Express hotplug slot index numbers (example: ens1)"
> > > these are under management control already ...   
> > 
> > with it interface name continues to depend on PCI topology (and theoretically
> > limited to PCI expess). That's becomes harder to consume as complexity grows
> > (i.e. mgmt needs to keep NIC in the same place for which guest image was configured for).
> > acpi-index doesn't impose such limitation.
> >
> > In case of 1 NIC, it could be moved anywhere within PCI hierarchy and guest
> > doesn't have to be reconfigured to account for new interface name
> > (i.e without loosing network connectivity - that's the actual issue coming from
> > upper layers that made me look into acpi-index approach).  
> 
> Could you describe the issue in a bit more detail in the commit
> log pls?
sure

> > In another words acpi index is easier to consume for users above libvirt
> > and frees mgmt hands in a way it could distribute PCI devices.
> > Even better would be if guest image could carry index as metadata
> >   
> > > Also if we ask users to supply the property on the slot then it seems
> > > that the property can be baked into ACPI when it's created instead of
> > > being loaded from host - we can avoid adding new registers, this seems
> > > preferable.  Could someone from management side chime in on whether that
> > > is sufficient?  
> > 
> > I did consider it (it would be simpler, but not much), however unless we disable
> > PCI hotplug for affected slots it won't work. (unplug device from such slot and
> > plug another in that place will still return boot time index.  
> 
> Well it's interesting that you mention it. Let's say you remove
> a device then plug in a different index immediately ...
> Guest gets a wrong name temporarily, right?
> Should we worry about that?
guest will get not a wrong name but rather name that user asked for.
(i.e. NIC with old index could be moved to other slot and still keep its name)


> > That's why I ended up with hotplug variant. 
> > 
> > I chose abusing existing PCI hotplug registers for it, 
> > but we can use a new range if that's preferred.   
> 
> Would it work for multi-function devices though?
> If yes that's a big advantage ...
Does ACPI hotplug work with multi-function devices (I thought not)?
If not, I'd prefer explicitly disable new feature
for multi-function devices (the code is heavily based on
ACPI hotplug infrastructure we already have).
(
in other words, I don't see immediate benefit in grabbing new registers
)


> > > More questions:
> > > 
> > > does all this affect windows guests at all?  
> > I don't know (spec shows examples that reminded
> > me about NIC naming which Windows use(s|d)).
> > But I won't bet on it.
> > If I recall correctly, for e1000 NIC, it didn't made any
> > difference in naming (pre-existing guest image).
> >   
> > > where does the "acpi index" terminology come from?
> > > the pci firmware spec talks about "instance number", right?  
> > it comes from linux kernel (that's how it's named in sysfs)
> > and systemd/udev uses it. So I tried to avoid making up another
> > one.  
> 
> OTOH that's guest specific ... and does not seem to imply
> the limitations unless you look at the code ...
"instance number" looks to me too generic (it's fine in context of
specific chapter in spec). While linux kernel's variant looks to me as
as better option that fits the bill.

If you don't object, I'd prefer 'acpi-index'.

> >   
> > > > For more detailed description/examples see patches [3-4/5]
> > > > 
> > > > 1)
> > > >  https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/ 
> > > > 
> > > > Git repo for testing:
> > > >    https://github.com/imammedo/qemu/branches acpi-index-rfc
> > > > 
> > > > Igor Mammedov (5):
> > > >   acpi: add aml_to_decimalstring() and aml_call6() helpers
> > > >   tests: acpi: temporary whitelist DSDT changes
> > > >   pci: introduce apci-index property for PCI device
> > > >   pci: acpi: add _DSM method to PCI devices
> > > >   tests: acpi: update expected data files
> > > > 
> > > >  include/hw/acpi/aml-build.h                 |   3 +
> > > >  include/hw/acpi/pci.h                       |   1 +
> > > >  include/hw/acpi/pcihp.h                     |   7 +-
> > > >  include/hw/pci/pci.h                        |   1 +
> > > >  tests/qtest/bios-tables-test-allowed-diff.h |  21 +++++
> > > >  hw/acpi/aml-build.c                         |  28 +++++++
> > > >  hw/acpi/pci.c                               |  84 ++++++++++++++++++++
> > > >  hw/acpi/pcihp.c                             |  25 +++++-
> > > >  hw/i386/acpi-build.c                        |  31 +++++++-
> > > >  hw/pci/pci.c                                |   1 +
> > > >  tests/data/acpi/pc/DSDT                     | Bin 5065 -> 6023 bytes
> > > >  tests/data/acpi/pc/DSDT.acpihmat            | Bin 6390 -> 7348 bytes
> > > >  tests/data/acpi/pc/DSDT.bridge              | Bin 6924 -> 8689 bytes
> > > >  tests/data/acpi/pc/DSDT.cphp                | Bin 5529 -> 6487 bytes
> > > >  tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6719 -> 7677 bytes
> > > >  tests/data/acpi/pc/DSDT.hpbridge            | Bin 5026 -> 5990 bytes
> > > >  tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3177 bytes
> > > >  tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5137 -> 6095 bytes
> > > >  tests/data/acpi/pc/DSDT.memhp               | Bin 6424 -> 7382 bytes
> > > >  tests/data/acpi/pc/DSDT.numamem             | Bin 5071 -> 6029 bytes
> > > >  tests/data/acpi/pc/DSDT.roothp              | Bin 5261 -> 6324 bytes
> > > >  tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7863 bytes
> > > >  tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9188 bytes
> > > >  tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7911 bytes
> > > >  tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8327 bytes
> > > >  tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9517 bytes
> > > >  tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7938 bytes
> > > >  tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9222 bytes
> > > >  tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9024 bytes
> > > >  tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7869 bytes
> > > >  tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8468 bytes
> > > >  31 files changed, 197 insertions(+), 5 deletions(-)
> > > > 
> > > > -- 
> > > > 2.27.0    
> > > 
> > >   
> 


