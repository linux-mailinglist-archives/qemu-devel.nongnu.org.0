Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CF295FA2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:18:35 +0200 (CEST)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVaUE-0002fu-FS
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kVaRY-0001TC-16
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kVaRU-0002Dg-C0
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603372539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wnj7eDLYQb68RxOKX0qL9Uk3bXQYXvYL8lznyRGCBTA=;
 b=GaYsFAHFSp9myesC88/75JYzqiXABQ7VOzjCjdwFJiIKrLJPFHEMhLGdJiHcPI5EsLHka1
 FDr7UgTJ3VPiA24JuPf0CPx/GBVhZN5TAfHZLtdfsRUEc3D+3tk3MvlwL5CDx1lEzgr1bb
 y9eLomVfZeKVviIc9iJz2/123gzc1IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-vzNnW07kMfaQPgA01TMH8g-1; Thu, 22 Oct 2020 09:15:37 -0400
X-MC-Unique: vzNnW07kMfaQPgA01TMH8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B99B18B9EC3;
 Thu, 22 Oct 2020 13:15:36 +0000 (UTC)
Received: from redhat.com (ovpn-113-117.ams2.redhat.com [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BCB36EF42;
 Thu, 22 Oct 2020 13:15:31 +0000 (UTC)
Date: Thu, 22 Oct 2020 09:15:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Gibson <dgibson@redhat.com>
Subject: Re: [PATCH] pci: Refuse to hotplug PCI Devices when the Guest OS is
 not ready
Message-ID: <20201022091500-mutt-send-email-mst@kernel.org>
References: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
 <20201022080354-mutt-send-email-mst@kernel.org>
 <20201022235632.7f69ddc9@yekko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201022235632.7f69ddc9@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 22, 2020 at 11:56:32PM +1100, David Gibson wrote:
> On Thu, 22 Oct 2020 08:06:55 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Oct 22, 2020 at 02:40:26PM +0300, Marcel Apfelbaum wrote:
> > > From: Marcel Apfelbaum <marcel@redhat.com>
> > > 
> > > During PCIe Root Port's transition from Power-Off to Power-ON (or vice-versa)
> > > the "Slot Control Register" has the "Power Indicator Control"
> > > set to "Blinking" expressing a "power transition" mode.
> > > 
> > > Any hotplug operation during the "power transition" mode is not permitted
> > > or at least not expected by the Guest OS leading to strange failures.
> > > 
> > > Detect and refuse hotplug operations in such case.
> > > 
> > > Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > ---
> > >  hw/pci/pcie.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index 5b48bae0f6..2fe5c1473f 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -410,6 +410,7 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > >      PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
> > >      uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
> > >      uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > > +    uint32_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
> > >  
> > >      /* Check if hot-plug is disabled on the slot */
> > >      if (dev->hotplugged && (sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
> > > @@ -418,6 +419,12 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > >          return;
> > >      }
> > >  
> > > +    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
> > > +        error_setg(errp, "Hot-plug failed: %s is in Power Transition",
> > > +                   DEVICE(hotplug_pdev)->id);
> > > +        return;
> > > +    }
> > > +
> > >      pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, errp);
> > >  }  
> > 
> > Probably the only way to handle for existing machine types.
> > For new ones, can't we queue it in host memory somewhere?
> 
> I'm not actually convinced we can't do that even for existing machine
> types.

The difficulty would be in migrating the extra "reuested but defferred"
state.

>  So I'm a bit hesitant to suggest going ahead with this without
> looking a bit closer at whether we can implement a wait-for-ready in
> qemu, rather than forcing every user of qemu (human or machine) to do
> so.
> 
> 
> -- 
> David Gibson <dgibson@redhat.com>
> Principal Software Engineer, Virtualization, Red Hat



