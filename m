Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74D1FD315
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 19:03:53 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlbTc-0000QN-Ex
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 13:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jlbSh-0008NQ-U3
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 13:02:55 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33768
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jlbSf-00008h-Lw
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 13:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592413372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LMaKoaHaDwjOtepalDnDbjOizo6dTlH+Y2wMKJqNYfg=;
 b=hQr1CR8kl60hDypsH7Y10LQhflep8y/JoOh+23w4q2ym7qmO7oOY1nFZEcs6avAGfUQUGO
 2/AfzO2Nb+zzH6CShykIYVq+kGDg/mK9ccUMxINyzlqxpvLn3YDiFjE0n3KnAM0O8uOgg7
 r7/BoK6reE/I5rjpoXUPrheJDJ+9rFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-avmEDA30Nvy8DefrViHt5Q-1; Wed, 17 Jun 2020 13:02:48 -0400
X-MC-Unique: avmEDA30Nvy8DefrViHt5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2562107ACF7;
 Wed, 17 Jun 2020 17:02:46 +0000 (UTC)
Received: from localhost (ovpn-113-21.phx2.redhat.com [10.3.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB9955C1D4;
 Wed, 17 Jun 2020 17:02:43 +0000 (UTC)
Date: Wed, 17 Jun 2020 13:02:42 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: ovmf / PCI passthrough impaired due to very limiting PCI64
 aperture
Message-ID: <20200617170242.GF2366737@habkost.net>
References: <99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com>
 <20200616165043.24y2cp53axk7uggy@sirius.home.kraxel.org>
 <20200616165746.GH2788@work-vm>
 <CAHD1Q_zGu4Q63HjHx3aZKu3wh8NppuP6T4kgnUN3j=-ZDufVZA@mail.gmail.com>
 <b423f4a4-2552-bdc8-7c9f-41f200aef672@redhat.com>
 <20200617134652.GE2776@work-vm>
 <37e7bbbe-6792-fdaa-0046-fb8bc5b64546@redhat.com>
 <74a52916-af58-6dee-f0e0-deb2954ddd90@redhat.com>
MIME-Version: 1.0
In-Reply-To: <74a52916-af58-6dee-f0e0-deb2954ddd90@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Pedro Principeza <pedro.principeza@canonical.com>,
 Dann Frazier <dann.frazier@canonical.com>,
 Guilherme Piccoli <gpiccoli@canonical.com>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, fw@gpiccoli.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 17, 2020 at 06:43:20PM +0200, Laszlo Ersek wrote:
> On 06/17/20 18:14, Laszlo Ersek wrote:
> > On 06/17/20 15:46, Dr. David Alan Gilbert wrote:
> >> * Laszlo Ersek (lersek@redhat.com) wrote:
> >>> On 06/16/20 19:14, Guilherme Piccoli wrote:
> >>>> Thanks Gerd, Dave and Eduardo for the prompt responses!
> >>>>
> >>>> So, I understand that when we use "-host-physical-bits", we are
> >>>> passing the *real* number for the guest, correct? So, in this case we
> >>>> can trust that the guest physbits matches the true host physbits.
> >>>>
> >>>> What if then we have OVMF relying in the physbits *iff*
> >>>> "-host-phys-bits" is used (which is the default in RH and a possible
> >>>> machine configuration on libvirt XML in Ubuntu), and we have OVMF
> >>>> fallbacks to 36-bit otherwise?
> >>>
> >>> I've now read the commit message on QEMU commit 258fe08bd341d, and the
> >>> complexity is simply stunning.
> >>>
> >>> Right now, OVMF calculates the guest physical address space size from
> >>> various range sizes (such as hotplug memory area end, default or
> >>> user-configured PCI64 MMIO aperture), and derives the minimum suitable
> >>> guest-phys address width from that address space size. This width is
> >>> then exposed to the rest of the firmware with the CPU HOB (hand-off
> >>> block), which in turn controls how the GCD (global coherency domain)
> >>> memory space map is sized. Etc.
> >>>
> >>> If QEMU can provide a *reliable* GPA width, in some info channel (CPUID
> >>> or even fw_cfg), then the above calculation could be reversed in OVMF.
> >>> We could take the width as a given (-> produce the CPU HOB directly),
> >>> plus calculate the *remaining* address space between the GPA space size
> >>> given by the width, and the end of the memory hotplug area end. If the
> >>> "remaining size" were negative, then obviously QEMU would have been
> >>> misconfigured, so we'd halt the boot. Otherwise, the remaining area
> >>> could be used as PCI64 MMIO aperture (PEI memory footprint of DXE page
> >>> tables be darned).
> >>>
> >>>> Now, regarding the problem "to trust or not" in the guests' physbits,
> >>>> I think it's an orthogonal discussion to some extent. It'd be nice to
> >>>> have that check, and as Eduardo said, prevent migration in such cases.
> >>>> But it's not really preventing OVMF big PCI64 aperture if we only
> >>>> increase the aperture _when  "-host-physical-bits" is used_.
> >>>
> >>> I don't know what exactly those flags do, but I doubt they are clearly
> >>> visible to OVMF in any particular way.
> >>
> >> The firmware should trust whatever it reads from the cpuid and thus gets
> >> told from qemu; if qemu is doing the wrong thing there then that's our
> >> problem and we need to fix it in qemu.
> > 
> > This sounds good in practice, but -- as Gerd too has stated, to my
> > understanding -- it has potential to break existing usage.
> > 
> > Consider assigning a single device with a 32G BAR -- right now that's
> > supposed to work, without the X-PciMmio64Mb OVMF knob, on even the "most
> > basic" hardware (36-bit host phys address width, and EPT supported). If
> > OVMF suddenly starts trusting the CPUID from QEMU, and that results in a
> > GPA width of 40 bits (i.e. new OVMF is run on old QEMU), then the big
> > BAR (and other stuff too) could be allocated from GPA space that EPT is
> > actually able to deal with. --> regression for the user.
> 
> s/able/unable/, sigh. :/

I was confused for a while, thanks for the clarification.  :)

So, I'm trying to write down which additional guarantees we want
to give to guests, exactly.  I don't want the documentation to
reference "host physical address bits", but actual behavior we
don't emulate.

What does "unable to deal with" means in this specific case?  I
remember MAXPHYADDR mismatches make EPT treatment of of reserved
bits not be what guests would expect from bare metal, but can
somebody point out to the specific guest-visible VCPU behavior
that would cause a regression in OVMF?  Bonus points if anybody
can find the exact Intel SDM paragraph we fail to implement.

> 
> > 
> > Sometimes I can tell users "hey given that you're building OVMF from
> > source, or taking it from a 3rd party origin anyway, can you just run
> > upstream QEMU too", but most of the time they just want everything to
> > continue working on a 3 year old Ubuntu LTS release or whatever. :/
> > 

Agreed.  It wouldn't reasonable to ask guest software to
unconditionally trust the data we provide to it after we provided
incorrect data to guests for [*checks git log*] 13 years.

-- 
Eduardo


