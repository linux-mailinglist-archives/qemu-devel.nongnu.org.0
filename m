Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D304323CA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:26:08 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVSh-00057k-Ri
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mcUxK-0001i5-6v; Mon, 18 Oct 2021 11:53:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:19310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mcUxH-0006yd-SG; Mon, 18 Oct 2021 11:53:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209071788"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="209071788"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 08:53:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="493634318"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.48.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 08:53:33 -0700
Date: Mon, 18 Oct 2021 17:53:26 +0200
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Message-ID: <20211018155326.GA20248@lgieryk-VirtualBox>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
 <c8563f17-b0d8-72f8-f9d8-3029c63e6994@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8563f17-b0d8-72f8-f9d8-3029c63e6994@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Oct 2021 12:22:16 -0400
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 12:06:22PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/7/21 18:24, Lukasz Maniak wrote:
> > From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > 
> > The Nvme device defines two properties: max_ioqpairs, msix_qsize. Having
> > them as constants is problematic for SR-IOV support.
> > 
> > The SR-IOV feature introduces virtual resources (queues, interrupts)
> > that can be assigned to PF and its dependent VFs. Each device, following
> > a reset, should work with the configured number of queues. A single
> > constant is no longer sufficient to hold the whole state.
> > 
> > This patch tries to solve the problem by introducing additional
> > variables in NvmeCtrl’s state. The variables for, e.g., managing queues
> > are therefore organized as:
> > 
> >  - n->params.max_ioqpairs – no changes, constant set by the user.
> > 
> >  - n->max_ioqpairs - (new) value derived from n->params.* in realize();
> >                      constant through device’s lifetime.
> > 
> >  - n->(mutable_state) – (not a part of this patch) user-configurable,
> >                         specifies number of queues available _after_
> >                         reset.
> > 
> >  - n->conf_ioqpairs - (new) used in all the places instead of the ‘old’
> >                       n->params.max_ioqpairs; initialized in realize()
> >                       and updated during reset() to reflect user’s
> >                       changes to the mutable state.
> > 
> > Since the number of available i/o queues and interrupts can change in
> > runtime, buffers for sq/cqs and the MSIX-related structures are
> > allocated big enough to handle the limits, to completely avoid the
> > complicated reallocation. A helper function (nvme_update_msixcap_ts)
> > updates the corresponding capability register, to signal configuration
> > changes.
> > 
> > Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > ---
> >  hw/nvme/ctrl.c | 62 +++++++++++++++++++++++++++++++++-----------------
> >  hw/nvme/nvme.h |  4 ++++
> >  2 files changed, 45 insertions(+), 21 deletions(-)
> 
> > @@ -6322,11 +6334,17 @@ static void nvme_init_state(NvmeCtrl *n)
> >      NvmeSecCtrlEntry *sctrl;
> >      int i;
> >  
> > +    n->max_ioqpairs = n->params.max_ioqpairs;
> > +    n->conf_ioqpairs = n->max_ioqpairs;
> > +
> > +    n->max_msix_qsize = n->params.msix_qsize;
> > +    n->conf_msix_qsize = n->max_msix_qsize;
> 
> From an developer perspective, the API becomes confusing.
> Most fields from NvmeParams are exposed via QMP, such max_ioqpairs.

Hi Philippe,

I’m not sure I understand your concern. The NvmeParams stays as it was,
so the interaction with QMP stays unchanged. Sure, if QMP allows
updating NvmeParams in runtime (I’m guessing, as I’m not really
accustomed with the feature), then the Nvme device will no longer
respond to those changes. But n->conf_ioqpairs is not meant to be
altered via QEMU’s interfaces, but rather though the NVME protocol, by
the guest OS kernel/user.

Could you explain how the changes are going to break (or make more
confusing) the interaction with QMP?

> I'm not sure we need 2 distinct fields. Maybe simply reorganize
> to not reset these values in the DeviceReset handler?

The idea was to calculate the max value once and use it in multiple
places later. The actual calculations are in the following 12/15 patch
(I’m also including the code below), so indeed, the intended use case
is not so obvious.

if (pci_is_vf(&n->parent_obj)) {
    n->max_ioqpairs = n->params.sriov_max_vq_per_vf - 1;
} else {
    n->max_ioqpairs = n->params.max_ioqpairs +
                      n->params.sriov_max_vfs * n->params.sriov_max_vq_per_vf;
}

But as I’m thinking more about the problem, then indeed, the max_*
fields may be not necessary. I could calculate max_msix_qsize in the
only place it’s used, and turn the above snippet for max_iopairs into a
function. The downside is the code for calculating maximums is no longer
grouped together.

> Also, with this series we should consider implementing the migration
> state (nvme_vmstate).

I wasn’t aware of this feature. I have to do the readings first.

> > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > index 9fbb0a70b5..65383e495c 100644
> > --- a/hw/nvme/nvme.h
> > +++ b/hw/nvme/nvme.h
> > @@ -420,6 +420,10 @@ typedef struct NvmeCtrl {
> >      uint64_t    starttime_ms;
> >      uint16_t    temperature;
> >      uint8_t     smart_critical_warning;
> > +    uint32_t    max_msix_qsize;                 /* Derived from params.msix.qsize */
> > +    uint32_t    conf_msix_qsize;                /* Configured limit */
> > +    uint32_t    max_ioqpairs;                   /* Derived from params.max_ioqpairs */
> > +    uint32_t    conf_ioqpairs;                  /* Configured limit */
> >  
> 

-- 
Regards,
Łukasz Gieryk


