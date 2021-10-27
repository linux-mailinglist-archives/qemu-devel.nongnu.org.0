Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8E43D02A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:56:08 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfn9k-0006CG-3x
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mfm8Y-0004EV-FH; Wed, 27 Oct 2021 12:50:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:3915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mfm8T-0007lO-DD; Wed, 27 Oct 2021 12:50:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230066551"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="230066551"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:50:40 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="447614639"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 09:50:38 -0700
Date: Wed, 27 Oct 2021 18:49:30 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20211027164930.GC3331@lmaniak-dev.igk.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <YXhG3L+brG0q6o/2@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXhG3L+brG0q6o/2@apples.localdomain>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 08:20:12PM +0200, Klaus Jensen wrote:
> On Oct  7 18:23, Lukasz Maniak wrote:
> > Hi,
> > 
> > This series of patches is an attempt to add support for the following
> > sections of NVMe specification revision 1.4:
> > 
> > 8.5 Virtualization Enhancements (Optional)
> >     8.5.1 VQ Resource Definition
> >     8.5.2 VI Resource Definition
> >     8.5.3 Secondary Controller States and Resource Configuration
> >     8.5.4 Single Root I/O Virtualization and Sharing (SR-IOV)
> > 
> > The NVMe controller's Single Root I/O Virtualization and Sharing
> > implementation is based on patches introducing SR-IOV support for PCI
> > Express proposed by Knut Omang:
> > https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05155.html
> > 
> > However, based on what I was able to find historically, Knut's patches
> > have not yet been pulled into QEMU due to no example of a working device
> > up to this point:
> > https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg02722.html
> > 
> > In terms of design, the Physical Function controller and the Virtual
> > Function controllers are almost independent, with few exceptions:
> > PF handles flexible resource allocation for all its children (VFs have
> > read-only access to this data), and reset (PF explicitly calls it on VFs).
> > Since the MMIO access is serialized, no extra precautions are required
> > to handle concurrent resets, as well as the secondary controller state
> > access doesn't need to be atomic.
> > 
> > A controller with full SR-IOV support must be capable of handling the
> > Namespace Management command. As there is a pending review with this
> > functionality, this patch list is not duplicating efforts.
> > Yet, NS management patches are not required to test the SR-IOV support.
> > 
> > We tested the patches on Ubuntu 20.04.3 LTS with kernel 5.4.0. We have
> > hit various issues with NVMe CLI (list and virt-mgmt commands) between
> > releases from version 1.09 to master, thus we chose this golden NVMe CLI
> > hash for testing: a50a0c1.
> > 
> > The implementation is not 100% finished and certainly not bug free,
> > since we are already aware of some issues e.g. interaction with
> > namespaces related to AER, or unexpected (?) kernel behavior in more
> > complex reset scenarios. However, our SR-IOV implementation is already
> > able to support typical SR-IOV use cases, so we believe the patches are
> > ready to share with the community.
> > 
> > Hope you find some time to review the work we did, and share your
> > thoughts.
> > 
> > Kind regards,
> > Lukasz
> 
> Hi Lukasz,
> 
> If possible, can you share a brief guide on testing this? I keep hitting
> an assert
> 
>   qemu-system-x86_64: ../hw/pci/pci.c:1215: pci_register_bar: Assertion `!pci_is_vf(pci_dev)' failed.
> 
> when I try to modify sriov_numvfs. This should be fixed anyway, but I
> might be doing something wrong in the first place.

Hi Klaus,

Let me share all the details about the steps I did to run 7 fully
functional VF controllers and failed to reproduce the assert.

I rebased v1 patches to eliminate any recent regression onto the current
master 931ce30859.

I configured build as follows:
./configure \
--target-list=x86_64-softmmu \
--enable-kvm

Then I launched QEMU using these options:
./qemu-system-x86_64 \
-m 4096 \
-smp 4 \
-drive file=qemu-os.qcow2 \
-nographic \
-enable-kvm \
-machine q35 \
-device pcie-root-port,slot=0,id=rp0 \
-device nvme-subsys,id=subsys0 \
-device nvme,serial=1234,id=nvme0,subsys=subsys0,bus=rp0,sriov_max_vfs=127,sriov_max_vq_per_vf=2,sriov_max_vi_per_vf=1

Next, I issued below commands as root to configure VFs:
nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
nvme reset /dev/nvme0
echo 1 > /sys/bus/pci/rescan

nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
nvme virt-mgmt /dev/nvme0 -c 2 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 2 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 2 -r 0 -a 9 -n 0
nvme virt-mgmt /dev/nvme0 -c 3 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 3 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 3 -r 0 -a 9 -n 0
nvme virt-mgmt /dev/nvme0 -c 4 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 4 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 4 -r 0 -a 9 -n 0
nvme virt-mgmt /dev/nvme0 -c 5 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 5 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 5 -r 0 -a 9 -n 0
nvme virt-mgmt /dev/nvme0 -c 6 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 6 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 6 -r 0 -a 9 -n 0
nvme virt-mgmt /dev/nvme0 -c 7 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 7 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 7 -r 0 -a 9 -n 0

echo 7 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs

If you use only up to patch 05 inclusive then this command should do all
the job:
echo 7 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs

The OS I used for the host and guest was Ubuntu 20.04.3 LTS.

Can you share more call stack for assert or the configuration you are
trying to run?

Thanks,
Lukasz

