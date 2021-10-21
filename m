Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8CD436341
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:43:15 +0200 (CEST)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYLi-0004TF-F3
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mdYJD-0002Bq-Vv; Thu, 21 Oct 2021 09:40:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:58569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mdYJ1-0003LZ-CH; Thu, 21 Oct 2021 09:40:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="289875801"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="289875801"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 06:40:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="495153393"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.49.253])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 06:40:21 -0700
Date: Thu, 21 Oct 2021 15:40:12 +0200
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Message-ID: <20211021134012.GA30845@lgieryk-VirtualBox>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
 <YXBonn0gwolecWnp@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXBonn0gwolecWnp@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 09:06:06PM +0200, Klaus Jensen wrote:
> On Oct  7 18:24, Lukasz Maniak wrote:
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
> 
> Instead of this, how about adding new parameters, say, sriov_vi_private
> and sriov_vq_private. Then, max_ioqpairs and msix_qsize are still the
> "physical" limits and the new parameters just reserve some for the
> primary controller, the rest being available for flexsible resources.

Compare your configuration:

    max_ioqpairs     = 26
    sriov_max_vfs    = 4
    sriov_vq_private = 10

with mine:

    max_ioqpairs        = 10
    sriov_max_vfs       = 4
    sriov_max_vq_per_vf = 4

In your version, if I wanted to change max_vfs but keep the same number
of flexible resources per VF, then I would have to do some math and
update max_ioparis. And then I also would have to adjust the other
interrupt-related parameter, as it's also affected. In my opinion
it's quite inconvenient.
 
Now, even if I changed the semantic of params, I would still need most
of this patch. (Let’s keep the discussion regarding if max_* fields are
necessary in the other thread).

Without virtualization, the maximum number of queues is constant. User
(i.e., nvme kernel driver) can only query this value (e.g., 10) and
needs to follow this limit.

With virtualization, the flexible resources kick in. Let's continue with
the sample numbers defined earlier (10 private + 16 flexible resources).

1) The device boots, all 16 flexible queues are assigned to the primary
   controller.
2) Nvme kernel driver queries for the limit (10+16=26) and can create/use
   up to this many queues. 
3) User via the virtualization management command unbinds some (let's
   say 2) of the flexible queues from the primary controller and assigns
   them to a secondary controller.
4) After reset, the Physical Function Device reports different limit
   (24), and when the Virtual Device shows up, it will report 1 (adminQ
   consumed the other resource). 

So I need additional variable in the state to store the intermediate
limit (24 or 1), as none of the existing params has the correct value,
and all the places that validate limits must work on the value.


