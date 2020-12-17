Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88F2DD1FA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:15:19 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpt7m-00023Z-7E
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpt1K-0005TT-Du
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpt1I-0003nP-Ah
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608210515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nvDZ9epNqdeZQGDMg45qqCWSp6yh19yOo80UKE+c7E=;
 b=d/2oe04yYQ60PD7bD7kUjr7WdfTs0XHz7tC8ghc+Z4K8Jo1UiR3xE5fqlw0uYSENyAWwCX
 dre2hkRbkHacGWR8aziSvrYoLL/sNxK5tWrno1jNkFyEMd4V9Irlz3a0ig1sSAZZ7Us6A3
 d8aoawph/lMju9fkJXULKSiA0cjLduA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-W5wuA-RuPAOtS3NWEMt-PA-1; Thu, 17 Dec 2020 08:08:33 -0500
X-MC-Unique: W5wuA-RuPAOtS3NWEMt-PA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EAD1800D55;
 Thu, 17 Dec 2020 13:08:32 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B90E41A353;
 Thu, 17 Dec 2020 13:08:19 +0000 (UTC)
Date: Thu, 17 Dec 2020 14:08:17 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [RFC 2/8] s390x/pci: MSI-X isn't strictly required for passthrough
Message-ID: <20201217140817.30bae4e4.cohuck@redhat.com>
In-Reply-To: <9fc712d1-2350-f16f-7073-87162def13eb@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
 <1607546066-2240-3-git-send-email-mjrosato@linux.ibm.com>
 <20201210112806.61b0c854.cohuck@redhat.com>
 <9fc712d1-2350-f16f-7073-87162def13eb@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, richard.henderson@linaro.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 10:13:29 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 12/10/20 5:28 AM, Cornelia Huck wrote:
> > On Wed,  9 Dec 2020 15:34:20 -0500
> > Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> >   
> >> s390 PCI currently disallows PCI devices without the MSI-X capability.
> >> However, this fence doesn't make sense for passthrough devices.  Move
> >> the check to only fence emulated devices (e.g., virtio).
> >>
> >> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> >> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> >> ---
> >>   hw/s390x/s390-pci-bus.c | 14 ++++++++------
> >>   1 file changed, 8 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> >> index 05f7460..afad048 100644
> >> --- a/hw/s390x/s390-pci-bus.c
> >> +++ b/hw/s390x/s390-pci-bus.c
> >> @@ -1028,12 +1028,12 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >>               s390_pci_get_clp_info(pbdev);
> >>           } else {
> >>               pbdev->fh |= FH_SHM_EMUL;
> >> -        }
> >>   
> >> -        if (s390_pci_msix_init(pbdev)) {
> >> -            error_setg(errp, "MSI-X support is mandatory "
> >> -                       "in the S390 architecture");
> >> -            return;
> >> +            if (s390_pci_msix_init(pbdev)) {
> >> +                error_setg(errp, "MSI-X support is mandatory "
> >> +                           "in the S390 architecture");
> >> +                return;
> >> +            }
> >>           }
> >>   
> >>           if (dev->hotplugged) {
> >> @@ -1073,7 +1073,9 @@ static void s390_pcihost_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >>           devfn = pci_dev->devfn;
> >>           qdev_unrealize(dev);
> >>   
> >> -        s390_pci_msix_free(pbdev);
> >> +        if (pbdev->fh & FH_SHM_EMUL) {
> >> +            s390_pci_msix_free(pbdev);
> >> +        }
> >>           s390_pci_iommu_free(s, bus, devfn);
> >>           pbdev->pdev = NULL;
> >>           pbdev->state = ZPCI_FS_RESERVED;  
> > 
> > Remind me: Wasn't it only msi that was strictly required (i.e., not msi-x?)
> > 
> > Can we generally relax this requirement, possibly with some changes in
> > the adapter interrupt mapping? I might misremember, though.
> >   
> 
> Yes, but even so our current emulation support only sets up for MSI-X, 
> it does not have an msi_init() equivalent.  I do believe that this 
> requirement can be relaxed at some point for the emulation support as 
> well, but the focus on this set was to at least stop fencing passthrough 
> for no reason.

Looking back to when this was introduced, I see that 857cc71985dc
("s390x/pci: merge msix init functions") actually makes this mandatory
and states that nothing changes for passthrough. Has anything changed
regarding msi-x in the architecture in the meantime?


