Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26263F70C3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 10:31:38 +0100 (CET)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iU62q-0003nY-MT
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 04:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iU61W-00039T-UV
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 04:30:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iU61V-0008Hg-Ru
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 04:30:14 -0500
Received: from charlie.dont.surf ([128.199.63.193]:51844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iU61V-0008C8-Le; Mon, 11 Nov 2019 04:30:13 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 467B0BF600;
 Mon, 11 Nov 2019 09:30:11 +0000 (UTC)
Date: Mon, 11 Nov 2019 10:30:07 +0100
From: Klaus Birkelund <its@irrelevant.dk>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/1] pci: pass along the return value of dma_memory_rw
Message-ID: <20191111093007.GA109346@apples.localdomain>
References: <20191011070141.188713-1-its@irrelevant.dk>
 <20191011070141.188713-2-its@irrelevant.dk>
 <455e6dee-8dd8-fae7-5a2f-e175b9d1cb8d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <455e6dee-8dd8-fae7-5a2f-e175b9d1cb8d@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 24, 2019 at 01:13:36AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 10/11/19 9:01 AM, Klaus Jensen wrote:
> > Some might actually care about the return value of dma_memory_rw. So
> > let us pass it along instead of ignoring it.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   include/hw/pci/pci.h | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index f3f0ffd5fb78..4e95bb847857 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -779,8 +779,7 @@ static inline AddressSpace *pci_get_address_space=
(PCIDevice *dev)
> >   static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> >                                void *buf, dma_addr_t len, DMADirectio=
n dir)
> >   {
> > -    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
> > -    return 0;
> > +    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,=
 dir);
> >   }
> >   static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
> >=20
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Gentle ping on this.

This fix is required for the nvme device to start passing some of the
nasty tests from blktests that flips bus mastering while doing I/O.


Cheers,
Klaus

