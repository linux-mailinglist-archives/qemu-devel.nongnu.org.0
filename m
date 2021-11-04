Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF4445699
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:51:35 +0100 (CET)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mif1Z-00074q-U8
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mif0K-0006CG-5a; Thu, 04 Nov 2021 11:50:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:46281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mif0G-0006ZS-A6; Thu, 04 Nov 2021 11:50:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="229190867"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="229190867"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 08:48:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="450252413"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.54.14])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 08:48:51 -0700
Date: Thu, 4 Nov 2021 16:48:43 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <20211104154843.GA4639@lgieryk-VirtualBox>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-13-lukasz.maniak@linux.intel.com>
 <YYJ7gy185o57adWJ@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYJ7gy185o57adWJ@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 01:07:31PM +0100, Klaus Jensen wrote:
> On Oct  7 18:24, Lukasz Maniak wrote:
> > From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > 
> > With two new properties (sriov_max_vi_per_vf, sriov_max_vq_per_vf) one
> > can configure the maximum number of virtual queues and interrupts
> > assignable to a single virtual device. The primary and secondary
> > controller capability structures are initialized accordingly.
> > 
> > Since the number of available queues (interrupts) now varies between
> > VF/PF, BAR size calculation is also adjusted.
> > 
> 
> While this patch allows configuring the VQFRSM and VIFRSM fields, it
> implicitly sets VQFRT and VIFRT (i.e. by setting them to the product of
> sriov_max_vi_pervf and max_vfs). Which is just setting it to an upper
> bound and this removes a testable case for host software (e.g.
> requesting more flexible resources than what is currently available).
> 
> This patch also requires that these parameters are set if sriov_max_vfs
> is. I think we can provide better defaults.
> 

Originally I considered more params, but ended up coding the simplest,
user-friendly solution, because I did not like the mess with so many
parameters, and the flexibility wasn't needed for my use cases. But I do
agree: others may need the flexibility. Case (FRT < max_vfs * FRSM) is
valid and resembles an actual device.

> How about,
> 
> 1. if only sriov_max_vfs is set, then all VFs get private resources
>    equal to max_ioqpairs. Like before this patch. This limits the number
>    of parameters required to get a basic setup going.
> 
> 2. if sriov_v{q,i}_private is set (I suggested this parameter in patch
>    10), the difference between that and max_ioqpairs become flexible
>    resources. Also, I'd be just fine with having sriov_v{q,i}_flexible
>    instead and just make the difference become private resources.
>    Potato/potato.
> 
>    a. in the absence of sriov_max_v{q,i}_per_vf, set them to the number
>       of calculated flexible resources.
> 
> This probably smells a bit like bikeshedding, but I think this gives
> more flexibility and better defaults, which helps with verifying host
> software.
> 
> If we can't agree on this now, I suggest we could go ahead and merge the
> base functionality (i.e. private resources only) and ruminate some more
> about these parameters.

The problem is that the spec allows VFs to support either only private,
or only flexible resources.

At this point I have to admit, that since my use cases for
QEMU/Nvme/SRIOV require flexible resources, I haven’t paid much
attention to the case with VFs having private resources. So this SR/IOV
implementation doesn’t even support such case (max_vX_per_vf != 0).

Let me summarize the possible config space, and how the current
parameters (could) map to these (interrupt-related ones omitted):

Flexible resources not supported (not implemented):
 - Private resources for PF     = max_ioqpairs
 - Private resources per VF     = ?
 - (error if flexible resources are configured)

With flexible resources:
 - VQPRT, private resources for PF      = max_ioqpairs
 - VQFRT, total flexible resources      = max_vq_per_vf * num_vfs
 - VQFRSM, maximum assignable per VF    = max_vq_per_vf
 - VQGRAN, granularity                  = #define constant
 - (error if private resources per VF are configured)

Since I don’t want to misunderstand your suggestion: could you provide a
similar map with your parameters, formulas, and explain how to determine
if flexible resources are active? I want to be sure we are on the
same page.

-- 
Regards,
Łukasz

