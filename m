Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BA1FD144
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 17:51:04 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlaL9-0005hM-T4
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 11:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jlaKI-00059z-3V
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 11:50:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57748
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jlaKF-0005C7-E5
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 11:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592409006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ozMxDN804biLskDVGn8kxb1EGcRpDdirxgri5DWHX0s=;
 b=MjLJzhXAjSay07Vt4HjO6OiTqL8r3MHcvV9wAPJ+CdXEtcF+RYvtVGkQRf6uZVQpLFt0RM
 K5anz40P/srrkny8LGtINF0r+1Fjg/VAboPHzJeYoagK/a7A8Jl29rKosJ5RUkq8dWSceS
 2D300IrZKzp7OZSxI5RJz1qINNtrPIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-Kj5kjy6aMPyugyivLSH_Tw-1; Wed, 17 Jun 2020 11:50:04 -0400
X-MC-Unique: Kj5kjy6aMPyugyivLSH_Tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5095E1018480;
 Wed, 17 Jun 2020 15:50:03 +0000 (UTC)
Received: from localhost (ovpn-113-21.phx2.redhat.com [10.3.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D3F479302;
 Wed, 17 Jun 2020 15:50:00 +0000 (UTC)
Date: Wed, 17 Jun 2020 11:49:59 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: ovmf / PCI passthrough impaired due to very limiting PCI64
 aperture
Message-ID: <20200617154959.GZ2366737@habkost.net>
References: <99779e9c-f05f-501b-b4be-ff719f140a88@canonical.com>
 <20200616165043.24y2cp53axk7uggy@sirius.home.kraxel.org>
 <20200616165746.GH2788@work-vm>
 <CAHD1Q_zGu4Q63HjHx3aZKu3wh8NppuP6T4kgnUN3j=-ZDufVZA@mail.gmail.com>
 <b423f4a4-2552-bdc8-7c9f-41f200aef672@redhat.com>
 <20200617134652.GE2776@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200617134652.GE2776@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 fw@gpiccoli.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 17, 2020 at 02:46:52PM +0100, Dr. David Alan Gilbert wrote:
> * Laszlo Ersek (lersek@redhat.com) wrote:
> > On 06/16/20 19:14, Guilherme Piccoli wrote:
> > > Thanks Gerd, Dave and Eduardo for the prompt responses!
> > > 
> > > So, I understand that when we use "-host-physical-bits", we are
> > > passing the *real* number for the guest, correct? So, in this case we
> > > can trust that the guest physbits matches the true host physbits.
> > > 
> > > What if then we have OVMF relying in the physbits *iff*
> > > "-host-phys-bits" is used (which is the default in RH and a possible
> > > machine configuration on libvirt XML in Ubuntu), and we have OVMF
> > > fallbacks to 36-bit otherwise?
> > 
> > I've now read the commit message on QEMU commit 258fe08bd341d, and the
> > complexity is simply stunning.
> > 
> > Right now, OVMF calculates the guest physical address space size from
> > various range sizes (such as hotplug memory area end, default or
> > user-configured PCI64 MMIO aperture), and derives the minimum suitable
> > guest-phys address width from that address space size. This width is
> > then exposed to the rest of the firmware with the CPU HOB (hand-off
> > block), which in turn controls how the GCD (global coherency domain)
> > memory space map is sized. Etc.
> > 
> > If QEMU can provide a *reliable* GPA width, in some info channel (CPUID
> > or even fw_cfg), then the above calculation could be reversed in OVMF.
> > We could take the width as a given (-> produce the CPU HOB directly),
> > plus calculate the *remaining* address space between the GPA space size
> > given by the width, and the end of the memory hotplug area end. If the
> > "remaining size" were negative, then obviously QEMU would have been
> > misconfigured, so we'd halt the boot. Otherwise, the remaining area
> > could be used as PCI64 MMIO aperture (PEI memory footprint of DXE page
> > tables be darned).
> > 
> > > Now, regarding the problem "to trust or not" in the guests' physbits,
> > > I think it's an orthogonal discussion to some extent. It'd be nice to
> > > have that check, and as Eduardo said, prevent migration in such cases.
> > > But it's not really preventing OVMF big PCI64 aperture if we only
> > > increase the aperture _when  "-host-physical-bits" is used_.
> > 
> > I don't know what exactly those flags do, but I doubt they are clearly
> > visible to OVMF in any particular way.
> 
> The firmware should trust whatever it reads from the cpuid and thus gets
> told from qemu; if qemu is doing the wrong thing there then that's our
> problem and we need to fix it in qemu.

It is impossible to provide a MAXPHYADDR that the guest can trust
unconditionally and allow live migration to hosts with different
sizes at the same time.

Unless we want to drop support live migration to hosts with
different sizes entirely, we need additional bits to tell the
guest how much it can trust MAXPHYADDR.

-- 
Eduardo


