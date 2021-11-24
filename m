Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434C45C750
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:28:21 +0100 (CET)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptG0-00044v-Jp
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mptEO-0003DM-N2; Wed, 24 Nov 2021 09:26:40 -0500
Received: from mga12.intel.com ([192.55.52.136]:30976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mptEM-0005yO-Rx; Wed, 24 Nov 2021 09:26:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="215312963"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="215312963"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:26:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="509890940"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.34.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:26:33 -0800
Date: Wed, 24 Nov 2021 15:26:30 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <20211124142630.GB25350@lgieryk-VirtualBox>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-13-lukasz.gieryk@linux.intel.com>
 <YZ3yD+GDf3SQSE+l@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZ3yD+GDf3SQSE+l@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 24, 2021 at 09:04:31AM +0100, Klaus Jensen wrote:
> On Nov 16 16:34, Łukasz Gieryk wrote:
> > With four new properties:
> >  - sriov_v{i,q}_flexible,
> >  - sriov_max_v{i,q}_per_vf,
> > one can configure the number of available flexible resources, as well as
> > the limits. The primary and secondary controller capability structures
> > are initialized accordingly.
> > 
> > Since the number of available queues (interrupts) now varies between
> > VF/PF, BAR size calculation is also adjusted.
> > 
> > Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > ---
> >  hw/nvme/ctrl.c       | 138 ++++++++++++++++++++++++++++++++++++++++---
> >  hw/nvme/nvme.h       |   4 ++
> >  include/block/nvme.h |   5 ++
> >  3 files changed, 140 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index f8f5dfe204..f589ffde59 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -6358,13 +6444,40 @@ static void nvme_init_state(NvmeCtrl *n)
> >      n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> >      n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
> >  
> > -    list->numcntl = cpu_to_le16(n->params.sriov_max_vfs);
> > -    for (i = 0; i < n->params.sriov_max_vfs; i++) {
> > +    list->numcntl = cpu_to_le16(max_vfs);
> > +    for (i = 0; i < max_vfs; i++) {
> >          sctrl = &list->sec[i];
> >          sctrl->pcid = cpu_to_le16(n->cntlid);
> >      }
> >  
> >      cap->cntlid = cpu_to_le16(n->cntlid);
> > +    cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
> > +
> > +    if (pci_is_vf(&n->parent_obj)) {
> > +        cap->vqprt = cpu_to_le16(1 + n->conf_ioqpairs);
> > +    } else {
> > +        cap->vqprt = cpu_to_le16(1 + n->params.max_ioqpairs -
> > +                                 n->params.sriov_vq_flexible);
> > +        cap->vqfrt = cpu_to_le32(n->params.sriov_vq_flexible);
> > +        cap->vqrfap = cap->vqfrt;
> > +        cap->vqgran = cpu_to_le16(NVME_VF_RES_GRANULARITY);
> > +        cap->vqfrsm = n->params.sriov_max_vq_per_vf ?
> > +                        cpu_to_le16(n->params.sriov_max_vq_per_vf) :
> > +                        cap->vqprt;
> 
> That this defaults to VQPRT doesn't seem right. It should default to
> VQFRT. Does not make sense to report a maximum number of assignable
> flexible resources that are bigger than the number of flexible resources
> available.

I’ve explained in on of v1 threads why I think using the current default
is better than VQPRT.

What you’ve noticed is indeed an inconvenience, but it’s – at least in
my opinion – part of the design. What matters is the current number of
unassigned flexible resources. It may be lower than VQFRSM due to
multiple reasons:
 1) resources are bound to PF, 
 2) resources are bound to other VFs,
 3) resources simply don’t exist (not baked in silicone: VQFRT < VQFRSM).

If 1) and 2) are allowed to happen, and the user must be aware of that,
then why 3) shouldn’t?


