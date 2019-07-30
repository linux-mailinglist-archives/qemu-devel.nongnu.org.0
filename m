Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22D7A6B1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 13:14:03 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsQ4x-0000lR-2q
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 07:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50711)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hsQ4C-0000IP-AQ
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 07:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hsQ4B-0002OB-4y
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 07:13:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48850)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hsQ4A-0002Ng-ER
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 07:13:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B610487633;
 Tue, 30 Jul 2019 11:13:13 +0000 (UTC)
Received: from work-vm (ovpn-117-45.ams2.redhat.com [10.36.117.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A6D10013A7;
 Tue, 30 Jul 2019 11:13:09 +0000 (UTC)
Date: Tue, 30 Jul 2019 12:13:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190730111306.GC2678@work-vm>
References: <20190730093719.12958-1-dgilbert@redhat.com>
 <20190730093719.12958-2-dgilbert@redhat.com>
 <20190730122545.7c08dd58@Igors-MacBook-Pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730122545.7c08dd58@Igors-MacBook-Pro>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 30 Jul 2019 11:13:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] pcie_root_port: Allow ACS to be
 disabled
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Tue, 30 Jul 2019 10:37:18 +0100
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > ACS was added in 4.0 unconditionally, this breaks migration
> > compatibility.
> > Allow ACS to be disabled by adding a property that's
> > checked by pcie_root_port.
> > 
> > Unfortunately pcie-root-port doesn't have any instance data,
> > so there's no where for that flag to live, so stuff it into
> > PCIESlot.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/pci-bridge/pcie_root_port.c | 3 ++-
> >  include/hw/pci/pcie_port.h     | 2 ++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
> > index 09019ca05d..1d8a778709 100644
> > --- a/hw/pci-bridge/pcie_root_port.c
> > +++ b/hw/pci-bridge/pcie_root_port.c
> > @@ -111,7 +111,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
> >      pcie_aer_root_init(d);
> >      rp_aer_vector_update(d);
> >  
> > -    if (rpc->acs_offset) {
> > +    if (rpc->acs_offset && !s->disable_acs) {
> 
> it's not like it would be used per instance,
> so could we use class property and with rpc->disable_acs instead of PCIESlot?

I'm not clear I understand how class properties help;
    object_class_property_add_bool
takes a getter/setter that takes an Object *  parameter;
my reading of that is that it's the instance data so has the same
problem.

Dave

> >          pcie_acs_init(d, rpc->acs_offset);
> >      }
> >      return;
> > @@ -145,6 +145,7 @@ static void rp_exit(PCIDevice *d)
> >  static Property rp_props[] = {
> >      DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
> >                      QEMU_PCIE_SLTCAP_PCP_BITNR, true),
> > +    DEFINE_PROP_BOOL("disable-acs", PCIESlot, disable_acs, false),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >  
> > diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> > index 09586f4641..7515430087 100644
> > --- a/include/hw/pci/pcie_port.h
> > +++ b/include/hw/pci/pcie_port.h
> > @@ -53,6 +53,8 @@ struct PCIESlot {
> >      PCIExpLinkSpeed speed;
> >      PCIExpLinkWidth width;
> >  
> > +    /* Disable ACS (really for a pcie_root_port) */
> > +    bool        disable_acs;
> >      QLIST_ENTRY(PCIESlot) next;
> >  };
> >  
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

