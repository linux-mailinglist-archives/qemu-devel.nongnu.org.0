Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A16C4B5A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyEk-0002pN-7X; Wed, 22 Mar 2023 09:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1peyEg-0002om-Px
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:10:39 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1peyEe-0006Uq-NL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679490636; x=1711026636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uZleXHdLGbgCxfbOAKZSDV25zwANhstBLXCbB5iGVQM=;
 b=YThfT9pZM0c0Iigzg46GHI0cH2xgzVjlN+zHRoN3reIGW9DuIuFMU75a
 KvL7oPBU+goFlhyJDzRgIhOx5lAbtEtMQJxj7mPS1uz4DL0VmSrK2flSu
 CZtNSxugRVCI2LNweHiLg0MPqf7TIygiPLuyFfQm6VBflVuTknhJNmiIk
 LWtwP4OjZFDI9Y7VXeXA6h5JipYQNfawkzRtISU3xZtxcnyCfN4tNZC8D
 ZqqVnrxlZhD316kS0oTK2OydXKdlNHkeWRE61Cvnq38TXx4F4/rZz0dkt
 FAHVqx94rSYFsOJS2ES+DwiONS7/xDPur77BpoyDP3HJXCfgFF17wvzF/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327586423"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="327586423"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684303574"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="684303574"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:10:25 -0700
Date: Wed, 22 Mar 2023 09:10:20 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Yang Zhong <yang.zhong@linux.intel.com>
Subject: Re: About the instance_finalize callback in VFIO PCI
Message-ID: <ZBr+PNMHHVZ/mEs/@yangzhon>
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
 <ZBr0dr7xPjZrn3e5@yangzhon>
 <62b9e8b3-a619-573d-c641-d80a12c3ab59@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62b9e8b3-a619-573d-c641-d80a12c3ab59@kaod.org>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=yang.zhong@linux.intel.com; helo=mga02.intel.com
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

On Wed, Mar 22, 2023 at 01:56:13PM +0100, Cédric Le Goater wrote:
> On 3/22/23 13:28, Yang Zhong wrote:
> > On Tue, Mar 21, 2023 at 06:30:14PM +0100, Cédric Le Goater wrote:
> > > On 3/20/23 10:31, Yang Zhong wrote:
> > > > Hello Alex and Paolo,
> > > > 
> > > > There is one instance_finalize callback definition in hw/vfio/pci.c, but
> > > > i find this callback(vfio_instance_finalize()) never be called during the
> > > > VM shutdown with close VM or "init 0" command in guest.
> > > > 
> > > > The Qemu related command:
> > > >      ......
> > > >      -device vfio-pci,host=d9:00.0
> > > >      ......
> > > 
> > > well, the finalize op is correctly called for hot unplugged devices, using
> > > device_add.
> > > 
> >     Thanks Cédric, i can use device_del command in the monitor to
> >     trigger this instance_finalize callback function in the VFIO PCI.
> >     thanks!
> 
> yes. I think that in the shutdown case, QEMU simply relies on exit() to
> do the cleanup. On the kernel side, unmaps, fds being closed trigger any
> allocated resources.
> 
> Out of curiosity, what were you trying to achieve in the finalize op ?
> 
 
 We are doing one new feature, which need this callback to do some
 cleanup work with VFIO/iommufd kernel module. thanks!

 Yang


> Thanks,
> 
> C.

