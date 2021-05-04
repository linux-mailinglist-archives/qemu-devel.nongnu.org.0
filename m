Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC95372A9C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:02:51 +0200 (CEST)
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lduhN-0002nT-Gu
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1ldudv-0001oc-Lk; Tue, 04 May 2021 08:59:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:52804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1ldudt-0000sT-1r; Tue, 04 May 2021 08:59:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E030613B4;
 Tue,  4 May 2021 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620133150;
 bh=VKrAeZZpludZjTm6WuzJcgg7371nyGiXlt3bsLCkX3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1RVOhA+xUnttg6X+/OXWdWei9lFiPRvoAUP4JZ66jwCl3Fwz8Y9JcIZ2dWfl4AXDh
 Mg7CS6WUOwTfkw4umLIPAtPqY5sJ9P6hfLWa3HEE2n4liAZAnteKFXFxaUW5xREyNd
 jljZ143srAqD73QuO6fQW2meQYvxR3Y6pcFbbX8Q=
Date: Tue, 4 May 2021 14:59:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJFFG1tSP0dUCxcX@kroah.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504142236.76994047@bahia.lan>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=gregkh@linuxfoundation.org; helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Daniel Vetter <daniel@ffwll.ch>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-api@vger.kernel.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> On Fri, 26 Mar 2021 07:13:09 +0100
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi all,
> > 
> > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > feature without any open source component - what would normally be
> > the normal open source userspace that we require for kernel drivers,
> > although in this particular case user space could of course be a
> > kernel driver in a VM.  It also happens to be a complete mess that
> > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > and also pulles in over 1000 lines of code always build into powerpc
> > kernels that have Power NV support enabled.  Because of all these
> > issues and the lack of breaking userspace when it is removed I think
> > the best idea is to simply kill.
> > 
> > Changes since v1:
> >  - document the removed subtypes as reserved
> >  - add the ACK from Greg
> > 
> > Diffstat:
> >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> >  b/arch/powerpc/include/asm/opal.h            |    3 
> >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> >  b/arch/powerpc/include/asm/pci.h             |    7 
> >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> >  b/drivers/vfio/pci/Kconfig                   |    6 
> >  b/drivers/vfio/pci/Makefile                  |    1 
> >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> >  b/include/uapi/linux/vfio.h                  |   38 -
> 
> 
> Hi Christoph,
> 
> FYI, these uapi changes break build of QEMU.

What uapi changes?

What exactly breaks?

Why does QEMU require kernel driver stuff?

thanks,

greg k-h

