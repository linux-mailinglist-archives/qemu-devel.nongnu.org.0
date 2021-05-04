Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB91372BFB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:27:33 +0200 (CEST)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw1M-0003jo-UA
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel@ffwll.ch>) id 1ldvxk-0003E4-NV
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:23:48 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniel@ffwll.ch>) id 1ldvxi-0006Qw-9I
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:23:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so13441299ejc.10
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ensQSDTh3BO9iGPVrV6EYBnSBYEfz7lspMmgWRr6tEM=;
 b=A/agEr85m2gTABKwkX7MweJdDLUWMMy/uuv8cOATtF0IOSbqQGQWqB7WVO/2i6CTej
 A/xEN0wabqwjnysRyxUsM6987Nm7ZjOXb3ElY7BOmpcbi2Nz6d878YWmh7i2EiFYeKva
 NM7Q/fRoU0PTIKl2uxcCG8z+XO6JfxPjFQ6us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ensQSDTh3BO9iGPVrV6EYBnSBYEfz7lspMmgWRr6tEM=;
 b=puay4rQDwyb5Ktztf1B3yrEef9fonEx0pbOxCzSqtJ169HQV0MO90NKN2Y9MVgFEZr
 ao6c/yZ75fXYmenIPa8Of9ruJJv3WhKA7ssZ0rR1mWMFwtJ6KMGNP4ZiFRK6x836Z660
 fQwDFX6jk6QroniMvHE8Ssc93ngaWvH0aQVIzOHznpN4+3jVZycQC5byZD4JNJH3lFKS
 Xp0CCq8OfxDiM4J0nybEH1tuCJ/Mg9Cl19cLjJknJv62nQIN9dKgYAyXUk2X0C7/brD1
 9vJRhDIjE6s54rchrfHiyr8tn5Z8ycqYp78CRFXngLuNl8GYZ9zTciDUFCETyOkrgeXL
 ROqw==
X-Gm-Message-State: AOAM532B5nG1ag8gm//D2Kh7c9JEPL9LTOB/Z/hwj0qgdnm70kIepp+Q
 tRMmM4BU6Qz+smwuN/UoJfo8xA==
X-Google-Smtp-Source: ABdhPJzaM96uclt2Tpt863I3ZtqPW7KYS209iLyt378polAbgvCVI1aPL30//Pa3FZcXPaOgGHkVGA==
X-Received: by 2002:a17:906:194d:: with SMTP id
 b13mr22253337eje.83.1620138223252; 
 Tue, 04 May 2021 07:23:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm1462204ejc.121.2021.05.04.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 07:23:42 -0700 (PDT)
Date: Tue, 4 May 2021 16:23:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
Mail-Followup-To: Greg Kurz <groug@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504152034.18e41ec3@bahia.lan>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=daniel@ffwll.ch; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 03:20:34PM +0200, Greg Kurz wrote:
> On Tue, 4 May 2021 14:59:07 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> > > On Fri, 26 Mar 2021 07:13:09 +0100
> > > Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > > > feature without any open source component - what would normally be
> > > > the normal open source userspace that we require for kernel drivers,
> > > > although in this particular case user space could of course be a
> > > > kernel driver in a VM.  It also happens to be a complete mess that
> > > > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > > > and also pulles in over 1000 lines of code always build into powerpc
> > > > kernels that have Power NV support enabled.  Because of all these
> > > > issues and the lack of breaking userspace when it is removed I think
> > > > the best idea is to simply kill.
> > > > 
> > > > Changes since v1:
> > > >  - document the removed subtypes as reserved
> > > >  - add the ACK from Greg
> > > > 
> > > > Diffstat:
> > > >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> > > >  b/arch/powerpc/include/asm/opal.h            |    3 
> > > >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> > > >  b/arch/powerpc/include/asm/pci.h             |    7 
> > > >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> > > >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> > > >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> > > >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> > > >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> > > >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> > > >  b/drivers/vfio/pci/Kconfig                   |    6 
> > > >  b/drivers/vfio/pci/Makefile                  |    1 
> > > >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> > > >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> > > >  b/include/uapi/linux/vfio.h                  |   38 -
> > > 
> > > 
> > > Hi Christoph,
> > > 
> > > FYI, these uapi changes break build of QEMU.
> > 
> > What uapi changes?
> > 
> 
> All macros and structure definitions that are being removed
> from include/uapi/linux/vfio.h by patch 1.

Just my 2cents from drm (where we deprecate old gunk uapi quite often):
Imo it's best to keep the uapi headers as-is, but exchange the
documentation with a big "this is removed, never use again" warning:

- it occasionally serves as a good lesson for how to not do uapi (whatever
  the reasons really are in the specific case)

- it's good to know which uapi numbers (like parameter extensions or
  whatever they are in this case) are defacto reserved, because there are
  binaries (qemu in this) that have code acting on them out there.

The only exception where we completely nuke the structs and #defines is
when uapi has been only used by testcases. Which we know, since we defacto
limit our stable uapi guarantee to the canonical open&upstream userspace
drivers only (for at least the driver-specific stuff, the cross-driver
interfaces are hopeless).

Anyway feel free to ignore since this might be different than drivers/gpu.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

