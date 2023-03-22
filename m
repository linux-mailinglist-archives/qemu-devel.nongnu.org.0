Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E406C4AE1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:40:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexkp-0001Se-Qh; Wed, 22 Mar 2023 08:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pexkg-0001SV-QB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:39:38 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pexke-00046D-5L
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679488776; x=1711024776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vKdNDHwPxWpa2I/TYJOrrPIoAaa6BfZajHWzFCTxCMs=;
 b=NdeF8K82AMmznFXhSMv+0XJGHeUSIaET31AvDSpFLYW+rsbItXHh93sm
 BqHXZKanpzKKsgCdhvx4DnTZKZps99Z3pCO0dodN6HBEshSpMUQqX4b+Q
 3Cuy1UWIATLX1fNZBYcNi2+w/TcXGt/rDtA5mr7Tyyx0gWpzhKbr5p6R2
 lwnOEOH4Xll5YPVOFCqPkpt99Hi/xo+0fCxO5O6r9CR1LZiijEwIrh/f0
 XfYSzjHf6JkeC5ZOg2i0IvKpf1Nayl3Fxl1pImaVKEzy2v9Mqm4x3hYz9
 0l2JQ0a6sIx0aWSpCPLxfkoF6oaX5hzc/O6mdVFsnPVXBn78oEvW/WPQM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425487567"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="425487567"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792542956"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="792542956"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 05:39:32 -0700
Date: Wed, 22 Mar 2023 08:39:27 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: About the instance_finalize callback in VFIO PCI
Message-ID: <ZBr2/3sWfMD6qRQO@yangzhon>
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
 <CABgObfb8yFNX=HFiGiM8bUXoDccz+RRkfQE2168ioh3FdMygEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfb8yFNX=HFiGiM8bUXoDccz+RRkfQE2168ioh3FdMygEQ@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=yang.zhong@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 21, 2023 at 09:44:18PM +0100, Paolo Bonzini wrote:
> Il mar 21 mar 2023, 18:30 Cédric Le Goater <clg@kaod.org> ha scritto:
> 
> > I would have thought that user_creatable_cleanup would have taken care
> > of it. But it's not. This needs some digging.
> >
> 
> user_creatable_cleanup is only for -object, not for -device.
>

  Paolo, thanks for helping to clarify this issue.

  Maybe i am clear now, the vfio_instance_finalize() in the
  hw/vfio/pci.c is only for unhotplug vfio pci device from monitor to
  cleanup resource. For static "-device vfio-pci ....." command, the
  cleanup resource is responsibility of kernel exit system, not the qemu
  vfio. Once we close Qemu process, the kernel will call do_exit() to
  release these resource, so the vfio module in kernel will handle
  these cleanup work. thanks!

  Yang


> Paolo
> 
> 
> > C.
> >
> >
> > > By the way, i also debugged other instance_finalize callback functions,
> > > if my understanding is right, all instance_finalize callback should be
> > > called from object_unref(object) from qemu_cleanup(void) in
> > > ./softmmu/runstate.c. But there is no VFIO related object_unref() call in
> > > this cleanup function, So the instance_finalize callback in vfio pci
> > > should be useless? thanks!
> > >
> > > Regards,
> > > Yang
> > >
> > >
> >
> >

