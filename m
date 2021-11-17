Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FDF45458D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:23:40 +0100 (CET)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnJ2R-0007ef-AC
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mnJ1f-0006iL-Fb; Wed, 17 Nov 2021 06:22:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:48956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1mnJ1d-0000fo-A4; Wed, 17 Nov 2021 06:22:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="232650354"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="232650354"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 03:22:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="506871036"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.252.45.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 03:22:39 -0800
Date: Wed, 17 Nov 2021 12:22:31 +0100
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 08/15] hw/nvme: Implement the Function Level Reset
Message-ID: <20211117112231.GA15417@lgieryk-VirtualBox>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <20211116153446.317143-9-lukasz.gieryk@linux.intel.com>
 <20211116212819.GA2987582@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116212819.GA2987582@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga04.intel.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 01:28:19PM -0800, Keith Busch wrote:
> On Tue, Nov 16, 2021 at 04:34:39PM +0100, Łukasz Gieryk wrote:
> >      if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
> > -        pcie_sriov_pf_disable_vfs(&n->parent_obj);
> > +        if (rst != NVME_RESET_CONTROLLER) {
> > +            pcie_sriov_pf_disable_vfs(&n->parent_obj);
> 
> Shouldn't this be 'if (rst == NVME_RESET_FUNCTION)'?

The NVMe Spec lists five possible reset types (triggers). According
to my understanding, only the Controller Reset doesn’t affect the VFs'
state, hence the '!='.


