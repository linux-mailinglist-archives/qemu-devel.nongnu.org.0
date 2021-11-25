Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4845DC2C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:18:00 +0100 (CET)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFZX-0003eX-Cj
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mqFXX-0002AY-Fr; Thu, 25 Nov 2021 09:15:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:19917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mqFXV-00063M-CL; Thu, 25 Nov 2021 09:15:55 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235461715"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="235461715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 06:15:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="510320564"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.249.32.225])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 06:15:43 -0800
Date: Thu, 25 Nov 2021 15:15:34 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20211125141534.GA28269@lgieryk-VirtualBox>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <YZ3xurkIxozrTbqu@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZ3xurkIxozrTbqu@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 09:03:06AM +0100, Klaus Jensen wrote:
> Hi Lukasz,
> 
> I've been through this. I have a couple of review comments, but overall
> looks good for inclusion in nvme-next. Would be nice to get this in
> early in the cycle so it can mature there for 7.0.

We (I’m speaking on behalf of the other Lukasz) are really happy to
read that. We will do our best to make it happen.

> 
> I'd like that we mark this support experimental, so we can easily do
> some changes to how parameters work since I'm not sure we completely
> agree on that yet.
> 
> By the way, in the future, please add me and Keith as CCs on the entire
> series so we get CC'ed on replies to the cover-letter ;)
> 

> > List of known gaps and nice-to-haves:
> > 
> > 1) Interaction of secondary controllers with namespaces is not 100%
> > following the spec
> > 
> > The limitation: VF has to be visible on the PCI bus first, and only then
> > such VF can have a namespace attached.
> > 
> 
> Looking at the spec I'm not even sure what the expected behavior is
> supposed to be, can you elaborate? I rebased this on latest, and with
> Hannes changes, shared namespaces will be attached by default, which
> seems to be reasonable.

An example flow:

# Release flexible resources from PF (assuming it’s /dev/nvme0)
nvme virt-mgmt -c 0 -r 0 -n 0 -a 1 /dev/nvme0
nvme virt-mgmt -c 0 -r 1 -n 0 -a 1 /dev/nvme0
echo 1 > /sys/class/nvme/nvme0/reset_controller
# Bind sane minimums to VF1 (cntlid=1) and set it online
nvme virt-mgmt -c 1 -r 0 -n 5 -a 8 /dev/nvme0
nvme virt-mgmt -c 1 -r 1 -n 5 -a 8 /dev/nvme0
nvme virt-mgmt -c 1 -a 9 /dev/nvme0
# Enable 2 VFs
echo 2 > /sys/bus/pci/devices/<PF’s id>/sriov_numvfs
# PF, VF1 and VF2 are visible on PCI
lspci | grep Non-Volatile
# The NVMe driver is bound to PF and VF1 (the only online VF)
nvme list -v
# VFs shall eventually not support Ns Management/Attachment commands,
# and namespaces should be attached to VFs (i.e., their secondary
# controllers) through the PF.
# A namespace can be attached to VF1, VF2
nvme attach-ns /dev/nvme0 -c 1 -n X
nvme attach-ns /dev/nvme0 -c 2 -n X
# According to the spec this should also succeed, but today it won’t
nvme attach-ns /dev/nvme0 -c 3 -n X

VF3’s NvmeCtrl object is not yet allocated, so today there’s nothing
for nvme_subsys_ctrl() to return for cntlid=3, besides NULL (the
current behavior) or SUBSYS_SLOT_RSVD.

Relevant use cases:
 - admin can configure disabled VFs,
 - information about attached ns persists when VFs are disabled,
are not that critical, but of course it’s a discrepancy from what a
real device can handle.

In my opinion, to handle the cases correctly, information about attached
namespaces could be moved to subsystem. Could you share your thoughts
whether such approach would make sense?


