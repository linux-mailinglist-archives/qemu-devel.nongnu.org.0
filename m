Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4A6C5F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:59:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDyL-0003JI-8Y; Thu, 23 Mar 2023 01:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pfDyH-0003Ie-IF
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:58:45 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pfDyF-0000cJ-8p
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679551123; x=1711087123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gVDWnoq9C00WHIQf1lA7D7OdtVysR2l0PpdLY8wcH4I=;
 b=X953QQjXqTsFJUWRYV52OnNXxT6OpdKRIJMBX/aVe17C5K0TG49TzWJi
 qPa38Dd8/72QWgZyGx8ouQ62ddJc+lkNv7vnlnYAUMJCUuk1yagRlEZ1L
 hLCxbK4nW0k/iOsjPDoFClSY41V3xxe0VYVC4XN1ZxNeDkBeqRlieUgTl
 sf/f9y3bQJb4jWR04ZoGcVBaTaaRzQsAOLNCN1bo7EU6exd1p7xAobEoW
 LetHYu0m7qY39OFVYLCv/IT/Aa9r1B8jvA+JeeYiLj2BUINuhO/ttPuGa
 XGpxwZZlmAQpSYb2BdjNyVoVW6bJBSAXtQ1nbLeeyCY4+Vd2cRWXXwfmA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367141916"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="367141916"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675570513"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="675570513"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:58:39 -0700
Date: Thu, 23 Mar 2023 01:58:28 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 yang.zhong@linux.intel.com
Subject: Re: About the instance_finalize callback in VFIO PCI
Message-ID: <ZBvqhBxywdncu8X2@yangzhon>
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
 <ZBr0dr7xPjZrn3e5@yangzhon>
 <62b9e8b3-a619-573d-c641-d80a12c3ab59@kaod.org>
 <ZBr+PNMHHVZ/mEs/@yangzhon>
 <20230322122227.01a51193.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322122227.01a51193.alex.williamson@redhat.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=yang.zhong@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, Mar 22, 2023 at 12:22:27PM -0600, Alex Williamson wrote:
> On Wed, 22 Mar 2023 09:10:20 -0400
> Yang Zhong <yang.zhong@linux.intel.com> wrote:
> 
> > On Wed, Mar 22, 2023 at 01:56:13PM +0100, Cédric Le Goater wrote:
> > > On 3/22/23 13:28, Yang Zhong wrote:  
> > > > On Tue, Mar 21, 2023 at 06:30:14PM +0100, Cédric Le Goater wrote:  
> > > > > On 3/20/23 10:31, Yang Zhong wrote:  
> > > > > > Hello Alex and Paolo,
> > > > > > 
> > > > > > There is one instance_finalize callback definition in hw/vfio/pci.c, but
> > > > > > i find this callback(vfio_instance_finalize()) never be called during the
> > > > > > VM shutdown with close VM or "init 0" command in guest.
> > > > > > 
> > > > > > The Qemu related command:
> > > > > >      ......
> > > > > >      -device vfio-pci,host=d9:00.0
> > > > > >      ......  
> > > > > 
> > > > > well, the finalize op is correctly called for hot unplugged devices, using
> > > > > device_add.
> > > > >   
> > > >     Thanks Cédric, i can use device_del command in the monitor to
> > > >     trigger this instance_finalize callback function in the VFIO PCI.
> > > >     thanks!  
> > > 
> > > yes. I think that in the shutdown case, QEMU simply relies on exit() to
> > > do the cleanup. On the kernel side, unmaps, fds being closed trigger any
> > > allocated resources.
> > > 
> > > Out of curiosity, what were you trying to achieve in the finalize op ?
> > >   
> >  
> >  We are doing one new feature, which need this callback to do some
> >  cleanup work with VFIO/iommufd kernel module. thanks!
> 
> This sounds dangerously like relying on userspace for cleanup.  Kernel
> drivers need to be able to perform all cleanup themselves when file
> descriptors are closed.  They must expect that userspace can be killed
> at any point in time w/o an opportunity to do cleanup work.  Thanks,
> 

  Thanks Alex, yes, we have moved these cleanup to kernel driver side.
  I was just curious about what scenario this instance_finalize callback 
  is used in VFIO PCI, now it is clear, thanks a lot!

  Regards,
  Yang


> Alex
> 

