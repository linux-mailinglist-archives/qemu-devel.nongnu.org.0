Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23E45D9B8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:05:01 +0100 (CET)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqDUq-0007Jq-Ge
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mqDT8-0005ig-Bx; Thu, 25 Nov 2021 07:03:15 -0500
Received: from mga07.intel.com ([134.134.136.100]:59242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mqDSs-0000Sv-Ml; Thu, 25 Nov 2021 07:03:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="298909858"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="298909858"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 04:02:44 -0800
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="498063692"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.249.32.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 04:02:40 -0800
Date: Thu, 25 Nov 2021 13:02:33 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <20211125120233.GA27945@lgieryk-VirtualBox>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-13-lukasz.gieryk@linux.intel.com>
 <YZ3yD+GDf3SQSE+l@apples.localdomain>
 <20211124142630.GB25350@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124142630.GB25350@lgieryk-VirtualBox>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:26:30PM +0100, Łukasz Gieryk wrote:
> On Wed, Nov 24, 2021 at 09:04:31AM +0100, Klaus Jensen wrote:
> > On Nov 16 16:34, Łukasz Gieryk wrote:
> > > With four new properties:
> > >  - sriov_v{i,q}_flexible,
> > >  - sriov_max_v{i,q}_per_vf,
> > > one can configure the number of available flexible resources, as well as
> > > the limits. The primary and secondary controller capability structures
> > > are initialized accordingly.
> > > 
> > > Since the number of available queues (interrupts) now varies between
> > > VF/PF, BAR size calculation is also adjusted.
> > > 
> > > Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > > ---
> > >  hw/nvme/ctrl.c       | 138 ++++++++++++++++++++++++++++++++++++++++---
> > >  hw/nvme/nvme.h       |   4 ++
> > >  include/block/nvme.h |   5 ++
> > >  3 files changed, 140 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > index f8f5dfe204..f589ffde59 100644
> > > --- a/hw/nvme/ctrl.c
> > > +++ b/hw/nvme/ctrl.c
> > > @@ -6358,13 +6444,40 @@ static void nvme_init_state(NvmeCtrl *n)
> > >      n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> > >      n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
> > >  
> > > -    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
> > > -    for (i = 0; i < n->params.sriov_max_vfs; i++) {
> > > +    list->numcntl = cpu_to_le16(max_vfs);
> > > +    for (i = 0; i < max_vfs; i++) {
> > >          sctrl = &list->sec[i];
> > >          sctrl->pcid = cpu_to_le16(n->cntlid);
> > >      }
> > >  
> > >      cap->cntlid = cpu_to_le16(n->cntlid);
> > > +    cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
> > > +
> > > +    if (pci_is_vf(&n->parent_obj)) {
> > > +        cap->vqprt = cpu_to_le16(1 + n->conf_ioqpairs);
> > > +    } else {
> > > +        cap->vqprt = cpu_to_le16(1 + n->params.max_ioqpairs -
> > > +                                 n->params.sriov_vq_flexible);
> > > +        cap->vqfrt = cpu_to_le32(n->params.sriov_vq_flexible);
> > > +        cap->vqrfap = cap->vqfrt;
> > > +        cap->vqgran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
> > > +        cap->vqfrsm = n->params.sriov_max_vq_per_vf ?
> > > +                        cpu_to_le16(n->params.sriov_max_vq_per_vf) :
> > > +                        cap->vqprt;
> > 
> > That this defaults to VQPRT doesn't seem right. It should default to
> > VQFRT. Does not make sense to report a maximum number of assignable
> > flexible resources that are bigger than the number of flexible resources
> > available.
> 
> I’ve explained in on of v1 threads why I think using the current default
> is better than VQPRT.
> 
> What you’ve noticed is indeed an inconvenience, but it’s – at least in
> my opinion – part of the design. What matters is the current number of
> unassigned flexible resources. It may be lower than VQFRSM due to
> multiple reasons:
>  1) resources are bound to PF, 
>  2) resources are bound to other VFs,
>  3) resources simply don’t exist (not baked in silicone: VQFRT < VQFRSM).
> 
> If 1) and 2) are allowed to happen, and the user must be aware of that,
> then why 3) shouldn’t?
> 

I’ve done some more thinking, and now I’m not happy with my version, nor
the suggested VQPRT.

How about using this formula instead?:

v{q,i}frsm = sriov_max_v{I,q}_per_vf ? sriov_max_v{I,q}_per_vf :
             floor(sriov_v{i,q}_flexible / sriov_max_vfs)

v{q,i}frsm would end up with values similar/proportional to those
reported by and actual SR-IOV-capable device available on the market.


