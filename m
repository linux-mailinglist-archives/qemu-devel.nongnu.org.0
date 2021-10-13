Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2F42B463
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 07:03:42 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maWQX-0000V5-6p
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 01:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maWPc-00088s-EJ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 01:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maWPa-0004Ia-Vr
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 01:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634101362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=23i8iqgfqDBNPI/E9imNdoob4vYdO9Cma0SAfCOn1E4=;
 b=R0KNtusItparEsmEWRGxkXyekAPO6E6Cf/Fng1/YfPH4fGMzQDE2zkhYrEG8OZiM7ziqcp
 I3yU+VBEnUamjIQiTWXMHruCvgDDcf2tjVxiYB2g+gTOLEid7SCSkOz8jJMZA13uDBkIW0
 fEdAxee77ffSp8gwe62Tv67SsblQZdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-Ow9JDnCeP2-tqlF-mo1CtA-1; Wed, 13 Oct 2021 01:02:38 -0400
X-MC-Unique: Ow9JDnCeP2-tqlF-mo1CtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CAF580158D;
 Wed, 13 Oct 2021 05:02:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F35CD60CC6;
 Wed, 13 Oct 2021 05:02:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A29C41800997; Wed, 13 Oct 2021 07:02:32 +0200 (CEST)
Date: Wed, 13 Oct 2021 07:02:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Message-ID: <20211013050232.glqkx25hhn4lbfbd@sirius.home.kraxel.org>
References: <20211005132041.B884E745953@zero.eik.bme.hu>
 <20211011093758.kpjpw2htfvcra5mb@sirius.home.kraxel.org>
 <1afcbf3-37cf-b7fa-b6cd-e37592956bac@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <1afcbf3-37cf-b7fa-b6cd-e37592956bac@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 12:31:17PM +0200, BALATON Zoltan wrote:
> On Mon, 11 Oct 2021, Gerd Hoffmann wrote:
> > On Tue, Oct 05, 2021 at 03:12:05PM +0200, BALATON Zoltan wrote:
> > > This device is part of a superio/ISA bridge chip and IRQs from it are
> > > routed to an ISA interrupt set by the Interrupt Line PCI config
> > > register. Change uhci_update_irq() to allow this and use it from
> > > vt82c686-uhci-pci.
> > 
> > Hmm, shouldn't this logic be part of the superio bridge emulation?
> 
> But how? The ISA bridge does not know about PCI and PCI does not know about
> ISA. UHCI is a PCIDevice and would raise PCI interrupts. Where and how could
> I convert that to ISA interrupts? (Oh and ISA in QEMU is not Qdev'ified and
> I don't want to do that as it's too much work and too much to break that I
> can't even test so if an alternative solution involves that then get
> somebody do that first.) This patch puts the irq mapping in the vt82xx
> specific vt82c686-uhci-pci.c which in the real chip also contains the ISA
> bridge so in a way it's part of the superio bridge emulation in that this
> uhci variant is part of that chip model.

I'd suggest to first switch over uhci to use pci_allocate_irq() +
qemu_set_irq() (see ehci for example).

With that in place it should be possible to have vt82c686-uhci-pci.c
create a different IRQ setup without changes elsewhere in uhci and
without adding extra callbacks.

HTH,
  Gerd


