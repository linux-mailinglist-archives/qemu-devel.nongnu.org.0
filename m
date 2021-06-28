Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DE3B65E5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:39:28 +0200 (CEST)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtM7-00073W-Nv
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lxtKq-0005fX-2a
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lxtKm-0007Ca-7E
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624894683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13hQdurU1cnBN9PRGLGfKO2tTUZoo1yOonXuAcCJyJA=;
 b=HwsxJ0x8wuLs/vXO3mSZppqWvLvC/OxA/gsQDSRPDQRb5FeaTEkqJtonol4odnyeoEkXLF
 daqDQvfcz1ZVmIIa+uP4ecU5OB3uhooPHPYZVkm8V/zYeOZf5gIctuhcRut0KsuLETU17z
 ZiwHv94zCfnHkEmzWnPbgK8/uymjLA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-388fl7N7P2yNFTV8MW6qrg-1; Mon, 28 Jun 2021 11:38:01 -0400
X-MC-Unique: 388fl7N7P2yNFTV8MW6qrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC7A6100C61B;
 Mon, 28 Jun 2021 15:37:40 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27BEA6E6E2;
 Mon, 28 Jun 2021 15:37:20 +0000 (UTC)
Date: Mon, 28 Jun 2021 17:37:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 4/6] i386/pc: Keep PCI 64-bit hole within usable
 IOVA space
Message-ID: <20210628173719.2822ce0d@redhat.com>
In-Reply-To: <57664249-003c-7e62-2a16-925b3bb33418@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-5-joao.m.martins@oracle.com>
 <20210623143031.1dd7faa1@redhat.com>
 <57664249-003c-7e62-2a16-925b3bb33418@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 14:22:29 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/23/21 1:30 PM, Igor Mammedov wrote:
> > On Tue, 22 Jun 2021 16:49:03 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> pci_memory initialized by q35 and i440fx is set to a range
> >> of 0 .. UINT64_MAX, and as a consequence when ACPI and pci-host
> >> pick the hole64_start it does not account for allowed IOVA ranges.
> >>
> >> Rather than blindly returning, round up the hole64_start
> >> value to the allowable IOVA range, such that it accounts for
> >> the 1Tb hole *on AMD*. On Intel it returns the input value
> >> for hole64 start.  
> > 
> > wouldn't that work only in case where guest firmware hadn't
> > mapped any PCI bars above 4Gb (possibly in not allowed region).
> > 
> > Looking at Seabios, it uses reserved_memory_end as the start
> > of PCI64 window. Not sure about OVMF,
> >  CCing Laszlo.
> >   
> Hmmm, perhaps only in the case that I don't advertise the reserved
> region (i.e. mem size not being big enough to let the guest know in
> the e820). But then that it begs the question, should we then always
> advertise the said HT region as reserved regardless of memory size?

Where in firmware that e820 reserved entry will be accounted for?
All I see in Seabios is qemu_cfg_e820() which accounts for E820_RAM (sometimes)
and there the high RAM is hardwired to 4G. Then later on it might get used
to setup the start of 64-bit PCI hole if etc/reserved-memory-end
doesn't exist.

And for E820_RAM to work, the entry with highest address has to be
the last in the table, which is fragile and it's only a question of
time when someone breaks that.
(well if it's explicitly specified in ACPI spec, I won't object
if properly documented)
So firmware side will also need changes to account for this,
and make it independent if 4G starting point.

For Seabios it might be better to make use of fwcfg file Laszlo has
suggested in his reply than relying on e820 & reserved-memory-end,
either way Seabios would need related patches for this to work
properly. For OVMF you can get away with QEMU only patches,
if using that knob.

(PS:
I'm not PCI expert so there might be more issues hidden there
)

> >> Suggested-by: David Edmondson <david.edmondson@oracle.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/i386/pc.c         | 17 +++++++++++++++--
> >>  hw/pci-host/i440fx.c |  4 +++-
> >>  hw/pci-host/q35.c    |  4 +++-
> >>  include/hw/i386/pc.h |  3 ++-
> >>  4 files changed, 23 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index 2e2ea82a4661..65885cc16037 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -1141,7 +1141,7 @@ void pc_memory_init(PCMachineState *pcms,
> >>   * The 64bit pci hole starts after "above 4G RAM" and
> >>   * potentially the space reserved for memory hotplug.
> >>   */
> >> -uint64_t pc_pci_hole64_start(void)
> >> +uint64_t pc_pci_hole64_start(uint64_t size)
> >>  {
> >>      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
> >>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >> @@ -1155,12 +1155,25 @@ uint64_t pc_pci_hole64_start(void)
> >>              hole64_start += memory_region_size(&ms->device_memory->mr);
> >>          }
> >>      } else {
> >> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
> >> +        if (!x86ms->above_1t_mem_size) {
> >> +            hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
> >> +        } else {
> >> +            hole64_start = x86ms->above_1t_maxram_start;
> >> +        }
> >>      }  
> >   
> >> +    hole64_start = allowed_round_up(hole64_start, size);  
> > 
> > I'm not sure but, might it cause problems if there were BARs placed
> > by firmware in region below rounded up value?
> > (i.e. ACPI description which uses PCI_HOST_PROP_PCI_HOLE_START property
> > won't match whatever firmware programmed due to rounding pushing hole
> > start up)
> >   
> But wouldn't then the problem be firmware ignoring E820 to avoid putting
> firmware region where it shouldn't? Unless of course, it wasn't advertised
> like I mentioned earlier.
> 
> >>      return ROUND_UP(hole64_start, 1 * GiB);
> >>  }
> >>  
> >> +uint64_t pc_pci_hole64_start_aligned(uint64_t start, uint64_t size)
> >> +{
> >> +    if (nb_iova_ranges == DEFAULT_NR_USABLE_IOVAS) {
> >> +        return start;
> >> +    }
> >> +    return allowed_round_up(start, size);
> >> +}
> >> +
> >>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
> >>  {
> >>      DeviceState *dev = NULL;
> >> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> >> index 28c9bae89944..e8eaebfe1034 100644
> >> --- a/hw/pci-host/i440fx.c
> >> +++ b/hw/pci-host/i440fx.c
> >> @@ -163,8 +163,10 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
> >>      pci_bus_get_w64_range(h->bus, &w64);
> >>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> >>      if (!value && s->pci_hole64_fix) {
> >> -        value = pc_pci_hole64_start();
> >> +        value = pc_pci_hole64_start(s->pci_hole64_size);
> >>      }
> >> +    /* This returns @value when not on AMD */
> >> +    value = pc_pci_hole64_start_aligned(value, s->pci_hole64_size);
> >>      return value;
> >>  }
> >>  
> >> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> >> index 2eb729dff585..d556eb965ddb 100644
> >> --- a/hw/pci-host/q35.c
> >> +++ b/hw/pci-host/q35.c
> >> @@ -126,8 +126,10 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
> >>      pci_bus_get_w64_range(h->bus, &w64);
> >>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> >>      if (!value && s->pci_hole64_fix) {
> >> -        value = pc_pci_hole64_start();
> >> +        value = pc_pci_hole64_start(s->mch.pci_hole64_size);
> >>      }
> >> +    /* This returns @value when not on AMD */
> >> +    value = pc_pci_hole64_start_aligned(value, s->mch.pci_hole64_size);
> >>      return value;
> >>  }
> >>  
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index 73b8e2900c72..b924aef3a218 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -217,7 +217,8 @@ void pc_memory_init(PCMachineState *pcms,
> >>                      MemoryRegion *system_memory,
> >>                      MemoryRegion *rom_memory,
> >>                      MemoryRegion **ram_memory);
> >> -uint64_t pc_pci_hole64_start(void);
> >> +uint64_t pc_pci_hole64_start(uint64_t size);
> >> +uint64_t pc_pci_hole64_start_aligned(uint64_t value, uint64_t size);
> >>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
> >>  void pc_basic_device_init(struct PCMachineState *pcms,
> >>                            ISABus *isa_bus, qemu_irq *gsi,  
> >   
> 


