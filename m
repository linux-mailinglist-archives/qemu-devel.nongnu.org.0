Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52730C4D9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:04:54 +0100 (CET)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yAf-0005yE-2e
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xyM-00018Q-MF
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xyJ-0008SP-42
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FA64lc8GlnVWxhv/beG4RSia0UvXtRxVpgomxXzZgn4=;
 b=TkqzvutKtjImVat716fMbwbMIY80md611snbkwvPwJ0aYetEb33PsdKPPxZFnE4NL0mcnk
 6n8WwFKHsuyiZz8SmF7Qj/eePekyMvnVXGyXwCVi99VfKKhjUHEeWMZgzjk9wN6PJ07dTM
 g0GjXxAtcRwT4yLTbXbtueDCnmKz2MA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-TvE7641DPcK3FvnUk2goCg-1; Tue, 02 Feb 2021 10:52:02 -0500
X-MC-Unique: TvE7641DPcK3FvnUk2goCg-1
Received: by mail-wr1-f71.google.com with SMTP id m7so2086410wro.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FA64lc8GlnVWxhv/beG4RSia0UvXtRxVpgomxXzZgn4=;
 b=NMI1lLqm4vu+iS4AtOKIWJ55wELaHwXlrWkMlLo1p2NISid9R1vYSBJeRq5IWC6Ug6
 04VJn78nb7+1tBB1eRe8Ddqc8nLP27p9RTx9smGob+5TTfYjsFahjmfURalrv8v2J9Uj
 LDojiblkyNPGl/L9gs5fkC4RYJdy8K5VXS3FDxjnCZZ3RlPQMMZ1eVYzzCtk98YH82tZ
 hkPOREv5pYwV5XzPZdjwWJIT7764zsEv576K4WPtYBdyHcjYszrrrCXHtpMffOINar1G
 mtv623bEtZpafYSGCJIbdF1etAYwNxchV4hKptwMs9kRLWwI3wEknxbpStP206w33MXA
 D9Fg==
X-Gm-Message-State: AOAM530UvqVIQ8aG2CLSBQ/+332k45yscAPOEZBfKcjtHXuzrjCDRnpY
 8UDZJidbq5qWdfJmtze/8IDLiOxh8PcHR0g0KUPHjx51/QuoPfqx1HW9diBx3WIvmNFKlDKUUpe
 R84Fgye4+UPEIvTA=
X-Received: by 2002:a5d:6685:: with SMTP id l5mr23916525wru.176.1612281119789; 
 Tue, 02 Feb 2021 07:51:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXjloLTFC16gAYfakV4qFxjXPpKNcVVqPWkX4SYQVj2/ZQhyYHB3MJsduGeHyGu9mEpFlEJA==
X-Received: by 2002:a5d:6685:: with SMTP id l5mr23916496wru.176.1612281119513; 
 Tue, 02 Feb 2021 07:51:59 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id n187sm3813416wmf.29.2021.02.02.07.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:51:58 -0800 (PST)
Date: Tue, 2 Feb 2021 10:51:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 16/31] hw/pci: Plumb _UID through host bridges
Message-ID: <20210202104540-mutt-send-email-mst@kernel.org>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-17-ben.widawsky@intel.com>
 <20210202150056.00003bec@Huawei.com>
 <20210202101504-mutt-send-email-mst@kernel.org>
 <20210202154257.zepdz74logmi52wn@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210202154257.zepdz74logmi52wn@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 07:42:57AM -0800, Ben Widawsky wrote:
> Thanks for looking! Mixing comments to Jonathan and Michael..
> 
> On 21-02-02 10:24:43, Michael S. Tsirkin wrote:
> > On Tue, Feb 02, 2021 at 03:00:56PM +0000, Jonathan Cameron wrote:
> > > On Mon, 1 Feb 2021 16:59:33 -0800
> > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > > 
> > > > Currently, QEMU makes _UID equivalent to the bus number (_BBN). While
> > > > there is nothing wrong with doing it this way, CXL spec has a heavy
> > > > reliance on _UID to identify host bridges and there is no link to the
> > > > bus number. Having a distinct UID solves two problems. The first is it
> > > > gets us around the limitation of 256 (current max bus number).
> > 
> > Not sure I understand. You want more than 256 host bridges?
> > 
> 
> I don't want more than 256 host bridges, but I want the ability to disaggregate
> _UID and bus (_BBN). The reasoning is just to align with the spec where _UID is
> used to identify a CXL host bridge which is unrelated (perhaps) to the bus
> number.

Which spec is that?

> > > The
> > > > second is it allows us to replicate hardware configurations where bus
> > > > number and uid aren't equivalent.
> > 
> > A bit more data on when this needs to be the case?
> > 
> 
> Doesn't *need* to be the case. I was making a concerted effort to allow full
> spec flexibility, but I don't believe it to be necessary unless we want to
> accurately emulate a real platform.
> 
> > > The latter has benefits for our
> > > > development and debugging using QEMU.
> > > > 
> > > > The other way to do this would be to implement the expanded bus
> > > > numbering, but having an explicit uid makes more sense when trying to
> > > > replicate real hardware configurations.
> > > > 
> > > > The QEMU commandline to utilize this would be:
> > > >   -device pxb-cxl,id=cxl.0,bus="pcie.0",bus_nr=1,uid=x
> > > > 
> > > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > 
> > However, if doing this how do we ensure UID is still unique?
> > What do we do for cases where UID was not specified?
> > One idea is to generate a string UID and just stick the bus #
> > in there.
> 
> This is totally mishandled in the code currently. I like your idea though.
> 
> > 
> > 
> > > > --
> > > > 
> > > > I'm guessing this patch will be somewhat controversial. For early CXL
> > > > work, this can be dropped without too much heartache.
> > > 
> > > Whilst I'm not personally against, this maybe best to drop for now as you
> > > say.
> > > 
> 
> I think it'd be good to understand from the PCIe experts if CXL matches in this
> regard. If PCIe generally allows (and does in practice) _UID not matching _BBN,
> perhaps this is an overall improvement to the code.

Well

6.1.12 _UID (Unique ID)
	This object provides OSPM with a logical device ID that does not change across reboots. This object
	is optional, but is required when the device has no other way to report a persistent unique device ID.
	The _UID must be unique across all devices with either a common _HID or _CID. This is because a
	device needs to be uniquely identified to the OSPM, which may match on either a _HID or a _CID to
	identify the device. The uniqueness match must be true regardless of whether the OSPM uses the
	_HID or the _CID. OSPM typically uses the unique device ID to ensure that the device-specific
	information, such as network protocol binding information, is remembered for the device even if its
	relative location changes. For most integrated devices, this object contains a unique identifier.
	A _UID object evaluates to either a numeric value or a string.


IOW _UID is there so guest can tell devices with identical HID/CID apart.




> > > > ---
> > > >  hw/i386/acpi-build.c                |  3 ++-
> > > >  hw/pci-bridge/pci_expander_bridge.c | 19 +++++++++++++++++++
> > > >  hw/pci/pci.c                        | 11 +++++++++++
> > > >  include/hw/pci/pci.h                |  1 +
> > > >  include/hw/pci/pci_bus.h            |  1 +
> > > >  5 files changed, 34 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index cf6eb54c22..145a503e92 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -1343,6 +1343,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >          QLIST_FOREACH(bus, &bus->child, sibling) {
> > > >              uint8_t bus_num = pci_bus_num(bus);
> > > >              uint8_t numa_node = pci_bus_numa_node(bus);
> > > > +            int32_t uid = pci_bus_uid(bus);
> > > >  
> > > >              /* look only for expander root buses */
> > > >              if (!pci_bus_is_root(bus)) {
> > > > @@ -1356,7 +1357,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >              scope = aml_scope("\\_SB");
> > > >              dev = aml_device("PC%.02X", bus_num);
> > > >              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
> > > > -            init_pci_acpi(dev, bus_num, pci_bus_is_express(bus) ? PCIE : PCI);
> > > > +            init_pci_acpi(dev, uid, pci_bus_is_express(bus) ? PCIE : PCI);
> > > >  
> > > >              if (numa_node != NUMA_NODE_UNASSIGNED) {
> > > >                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
> > > > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> > > > index b42592e1ff..5021b60435 100644
> > > > --- a/hw/pci-bridge/pci_expander_bridge.c
> > > > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > > > @@ -67,6 +67,7 @@ struct PXBDev {
> > > >  
> > > >      uint8_t bus_nr;
> > > >      uint16_t numa_node;
> > > > +    int32_t uid;
> > > >  };
> > > >  
> > > >  static PXBDev *convert_to_pxb(PCIDevice *dev)
> > 
> > As long as we are doing this, do we want to support a string uid too?
> > How about a 64 bit uid? Why not?
> 
> If generally the idea of the patch is welcome, I am happy to change it.

I am still not sure, let's figure out the motivation.

For example, grep for UID and you will find more cases
like this. E.g. hw/pci-host/gpex-acpi.c

Do we care?



> > 
> > 
> > > > @@ -98,12 +99,20 @@ static uint16_t pxb_bus_numa_node(PCIBus *bus)
> > > >      return pxb->numa_node;
> > > >  }
> > > >  
> > > > +static int32_t pxb_bus_uid(PCIBus *bus)
> > > > +{
> > > > +    PXBDev *pxb = convert_to_pxb(bus->parent_dev);
> > > > +
> > > > +    return pxb->uid;
> > > > +}
> > > > +
> > > >  static void pxb_bus_class_init(ObjectClass *class, void *data)
> > > >  {
> > > >      PCIBusClass *pbc = PCI_BUS_CLASS(class);
> > > >  
> > > >      pbc->bus_num = pxb_bus_num;
> > > >      pbc->numa_node = pxb_bus_numa_node;
> > > > +    pbc->uid = pxb_bus_uid;
> > > >  }
> > > >  
> > > >  static const TypeInfo pxb_bus_info = {
> > > > @@ -329,6 +338,7 @@ static Property pxb_dev_properties[] = {
> > > >      /* Note: 0 is not a legal PXB bus number. */
> > > >      DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
> > > >      DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> > > > +    DEFINE_PROP_INT32("uid", PXBDev, uid, -1),
> > > >      DEFINE_PROP_END_OF_LIST(),
> > > >  };
> > > >  
> > > > @@ -400,12 +410,21 @@ static const TypeInfo pxb_pcie_dev_info = {
> > > >  
> > > >  static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
> > > >  {
> > > > +    PXBDev *pxb = convert_to_pxb(dev);
> > > > +
> > > >      /* A CXL PXB's parent bus is still PCIe */
> > > >      if (!pci_bus_is_express(pci_get_bus(dev))) {
> > > >          error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
> > > >          return;
> > > >      }
> > > >  
> > > > +    if (pxb->uid < 0) {
> > > > +        error_setg(errp, "pxb-cxl devices must have a valid uid (0-2147483647)");
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /* FIXME: Check that uid doesn't collide with UIDs of other host bridges */
> > > > +
> > > >      pxb_dev_realize_common(dev, CXL, errp);
> > > >  }
> > > >  
> > > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > > index adbe8aa260..bf019d91a0 100644
> > > > --- a/hw/pci/pci.c
> > > > +++ b/hw/pci/pci.c
> > > > @@ -170,6 +170,11 @@ static uint16_t pcibus_numa_node(PCIBus *bus)
> > > >      return NUMA_NODE_UNASSIGNED;
> > > >  }
> > > >  
> > > > +static int32_t pcibus_uid(PCIBus *bus)
> > > > +{
> > > > +    return -1;
> > > > +}
> > > > +
> > > >  static void pci_bus_class_init(ObjectClass *klass, void *data)
> > > >  {
> > > >      BusClass *k = BUS_CLASS(klass);
> > > > @@ -184,6 +189,7 @@ static void pci_bus_class_init(ObjectClass *klass, void *data)
> > > >  
> > > >      pbc->bus_num = pcibus_num;
> > > >      pbc->numa_node = pcibus_numa_node;
> > > > +    pbc->uid = pcibus_uid;
> > > >  }
> > > >  
> > > >  static const TypeInfo pci_bus_info = {
> > > > @@ -530,6 +536,11 @@ int pci_bus_numa_node(PCIBus *bus)
> > > >      return PCI_BUS_GET_CLASS(bus)->numa_node(bus);
> > > >  }
> > > >  
> > > > +int pci_bus_uid(PCIBus *bus)
> > > > +{
> > > > +    return PCI_BUS_GET_CLASS(bus)->uid(bus);
> > > > +}
> > > > +
> > > >  static int get_pci_config_device(QEMUFile *f, void *pv, size_t size,
> > > >                                   const VMStateField *field)
> > > >  {
> > > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > > index bde3697bee..a46de48ccd 100644
> > > > --- a/include/hw/pci/pci.h
> > > > +++ b/include/hw/pci/pci.h
> > > > @@ -463,6 +463,7 @@ static inline int pci_dev_bus_num(const PCIDevice *dev)
> > > >  }
> > > >  
> > > >  int pci_bus_numa_node(PCIBus *bus);
> > > > +int pci_bus_uid(PCIBus *bus);
> > > >  void pci_for_each_device(PCIBus *bus, int bus_num,
> > > >                           void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
> > > >                           void *opaque);
> > > > diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> > > > index eb94e7e85c..3c9fbc55bb 100644
> > > > --- a/include/hw/pci/pci_bus.h
> > > > +++ b/include/hw/pci/pci_bus.h
> > > > @@ -17,6 +17,7 @@ struct PCIBusClass {
> > > >  
> > > >      int (*bus_num)(PCIBus *bus);
> > > >      uint16_t (*numa_node)(PCIBus *bus);
> > > > +    int32_t (*uid)(PCIBus *bus);
> > > >  };
> > > >  
> > > >  enum PCIBusFlags {
> > 


