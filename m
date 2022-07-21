Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2757D12E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:14:54 +0200 (CEST)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYpA-0003Cu-Ei
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oEYl4-0005ee-Nq
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:10:39 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oEYl0-0002Bt-G8
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:10:37 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id D5CC52E129A;
 Thu, 21 Jul 2022 19:10:23 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 55ZTUhbDda-AMOO7OLi; Thu, 21 Jul 2022 19:10:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658419823; bh=Es26ail2jOjgPf70iy3tk+Zfa5DHk5koNkJgFY0ScwA=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=ZDr68Tu4VKK1Tb+vNp9EIVdCMdorTQAxCQ7HZg22vMtQc6XHSlVwn1e91aKwFJ2LW
 ZZtk58+jRUCTNDopDp3KDjcElDhyPuKPnxD5BQY+QYbD2ZWlV63wP7owXR4B07HdKR
 OYUwm6apa9cf2PLhhHBj39eA80A8P24nRyCo7OGk=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Thu, 21 Jul 2022 19:10:20 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <Ytl6bBgk/0nB8zAA@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
 <Ytlii7t0rERVJBXo@rvkaganb>
 <f85ae904-4a31-141d-17dd-43c5a27d9b07@ilande.co.uk>
 <Ytl3SKpbnp8Twtkq@redhat.com>
 <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 05:05:38PM +0100, Mark Cave-Ayland wrote:
> On 21/07/2022 16:56, Daniel P. Berrangé wrote:
> 
> > On Thu, Jul 21, 2022 at 04:51:51PM +0100, Mark Cave-Ayland wrote:
> > > On 21/07/2022 15:28, Roman Kagan wrote:
> > > 
> > > (lots cut)
> > > 
> > > > In the guest (Fedora 34):
> > > > 
> > > > [root@test ~]# lspci -tv
> > > > -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
> > > >              +-01.0  Device 1234:1111
> > > >              +-02.0  Red Hat, Inc. QEMU XHCI Host Controller
> > > >              +-05.0-[01]----00.0  Red Hat, Inc. Virtio block device
> > > >              +-05.1-[02]----00.0  Red Hat, Inc. Virtio network device
> > > >              +-05.2-[03]--
> > > >              +-05.3-[04]--
> > > >              +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
> > > >              \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller
> > > > 
> > > > Changing addr of the second disk from 4 to 0 makes it appear in the
> > > > guest.
> > > > 
> > > > What exactly do you find odd?
> > > 
> > > Thanks for this, the part I wasn't sure about was whether the device ids in
> > > the command line matched the primary PCI bus or the secondary PCI bus.
> > > 
> > > In that case I suspect that the enumeration of non-zero PCIe devices fails
> > > in Linux because of the logic here:
> > > https://github.com/torvalds/linux/blob/master/drivers/pci/probe.c#L2622.
> > 
> > Just above that though is logic that handles 'pci=pcie_scan_all'
> > kernel parameter, to make it look for non-zero devices.
> > 
> > > I don't have a copy of the PCIe specification, but assuming the comment is
> > > true then your patch looks correct to me. I think it would be worth adding a
> > > similar comment and reference to your patch to explain why the logic is
> > > required, which should also help the PCI maintainers during review.
> > 
> > The docs above with the pci=pcie_scan_all suggest it is unusual but not
> > forbidden.
> 
> That's interesting as I read it completely the other way around, i.e. PCIe
> downstream ports should only have device 0 and the PCI_SCAN_ALL_PCIE_DEVS
> flag is there for broken/exotic hardware :)

Me too :)

The commit that introduced it suggested the same:

commit 284f5f9dbac170b054c1e386ef92cbf654e91bba
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Mon Apr 30 15:21:02 2012 -0600

    PCI: work around Stratus ftServer broken PCIe hierarchy
    
    A PCIe downstream port is a P2P bridge.  Its secondary interface is
    a link that should lead only to device 0 (unless ARI is enabled)[1], so
    we don't probe for non-zero device numbers.
    
    Some Stratus ftServer systems have a PCIe downstream port (02:00.0) that
    leads to both an upstream port (03:00.0) and a downstream port (03:01.0),
    and 03:01.0 has important devices below it:
    
      [0000:02]-+-00.0-[03-3c]--+-00.0-[04-09]--...
                                \-01.0-[0a-0d]--+-[USB]
                                                +-[NIC]
                                                +-...
    
    Previously, we didn't enumerate device 03:01.0, so USB and the network
    didn't work.  This patch adds a DMI quirk to scan all device numbers,
    not just 0, below a downstream port.
    
    Based on a patch by Prarit Bhargava.
    
    [1] PCIe spec r3.0, sec 7.3.1
    
    CC: Myron Stowe <mstowe@redhat.com>
    CC: Don Dutile <ddutile@redhat.com>
    CC: James Paradis <james.paradis@stratus.com>
    CC: Matthew Wilcox <matthew.r.wilcox@intel.com>
    CC: Jesse Barnes <jbarnes@virtuousgeek.org>
    CC: Prarit Bhargava <prarit@redhat.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

> Perhaps if someone has a copy of the PCIe specification they can check the
> wording in section 7.3.1 to see exactly what the correct behaviour should
> be?

I don't, sorry

Thanks,
Roman.

