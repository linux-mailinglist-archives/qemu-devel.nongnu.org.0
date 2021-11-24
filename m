Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91B45C72B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:22:43 +0100 (CET)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptAX-0006lH-Pq
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mpt95-00057F-Cm; Wed, 24 Nov 2021 09:21:11 -0500
Received: from mga12.intel.com ([192.55.52.136]:30471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mpt90-0005DN-S0; Wed, 24 Nov 2021 09:21:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="215311944"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="215311944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:21:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="509889175"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.34.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:21:00 -0800
Date: Wed, 24 Nov 2021 15:20:54 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 13/15] hw/nvme: Add support for the Virtualization
 Management command
Message-ID: <20211124142041.GA25350@lgieryk-VirtualBox>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-14-lukasz.gieryk@linux.intel.com>
 <YZ3yf8RvlZREFF4B@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZ3yf8RvlZREFF4B@apples.localdomain>
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

On Wed, Nov 24, 2021 at 09:06:23AM +0100, Klaus Jensen wrote:
> On Nov 16 16:34, Łukasz Gieryk wrote:
> > With the new Virtualization Management command one can:
> >  - assign flexible resources (queues, interrupts) to primary and
> >    secondary controllers,
> >  - toggle the online/offline state of given controller.
> > 
> > Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > ---
> >  hw/nvme/ctrl.c       | 204 +++++++++++++++++++++++++++++++++++++++++++
> >  hw/nvme/nvme.h       |  16 ++++
> >  hw/nvme/trace-events |   3 +
> >  include/block/nvme.h |  17 ++++
> >  4 files changed, 240 insertions(+)
> > 
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index f589ffde59..9d0432a2e5 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> 
> [... snip]
> 
> > +static uint16_t nvme_assign_virt_res_to_sec(NvmeCtrl *n, NvmeRequest *req,
> > +                                            uint16_t cntlid, uint8_t rt, int nr)
> > +{
> > +    int limit = rt ? n->params.sriov_max_vi_per_vf :
> > +                     n->params.sriov_max_vq_per_vf;
> 
> If these parameters are left at the default, limit is 0 and the check
> below fails.
> 
> [... snip]
> 
> > +    if (nr > limit) {
> > +        return NVME_INVALID_NUM_RESOURCES | NVME_DNR;
> > +    }

Indeed, my bad.

Al the tests I have at hand set the parameters explicitly, so the
problem has slipped through. I’ve manually tested only the negative
scenarios, where Qemu refuses to start.


