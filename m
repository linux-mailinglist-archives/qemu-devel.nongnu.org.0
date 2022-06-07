Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0C53FEBD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:27:17 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYIl-0001iU-Te
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nyX36-0001Hp-U6; Tue, 07 Jun 2022 07:07:03 -0400
Received: from mga07.intel.com ([134.134.136.100]:54793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.gieryk@linux.intel.com>)
 id 1nyX34-0006kh-E5; Tue, 07 Jun 2022 07:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654600018; x=1686136018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ukc6CmRbesOsqX3v7NTWZ9wj95UUIuOYmHENgMtFwPE=;
 b=loKohuBchstb91D8ytpFzNjgPGW8CB5Jg6yiLtI4/5Dq407CRUkehsqN
 3oHOFxirNddxEO1zMXO9uAdX8besVMDZhqed/KlXFmos6jr265R+q1R9R
 /XBWdoVGIqHquf32aeA3fk8jkeqC1xxsT5Xr4qaBFdWyH1F2B9HzA8H7l
 r3oEqHxuRHNtQbCNe/OdeTco7M/UzCyKtub9s12wnT9LfQoBWDsN80nKc
 NujYYljgwVQVVLwEL4Ve3K96VrgcEpRQg/B2jVVAZMrvRfyl5cyBYVvhf
 Ui+LoFnni2zx4K6SveysRAU5pWUDYLIlrfokYjbeas/6j/0GUp0nhZOVk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="340427061"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="340427061"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 04:06:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="826309766"
Received: from lgieryk-mobl1.ger.corp.intel.com (HELO lgieryk-VirtualBox)
 ([10.213.15.192])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 04:06:51 -0700
Date: Tue, 7 Jun 2022 13:06:45 +0200
From: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2] hw/nvme: clean up CC register write logic
Message-ID: <20220607110645.GA28312@lgieryk-VirtualBox>
References: <20220525073524.2227333-1-its@irrelevant.dk>
 <YpdpjLHhJDpTn7kP@kzawora-mobl.ger.corp.intel.com>
 <YppuEyXp/iL06z/C@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YppuEyXp/iL06z/C@apples>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=lukasz.gieryk@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 03, 2022 at 10:24:51PM +0200, Klaus Jensen wrote:
> On Jun  1 15:28, Lukasz Maniak wrote:
> > On Wed, May 25, 2022 at 09:35:24AM +0200, Klaus Jensen wrote:
> > > 
> > > +        stl_le_p(&n->bar.intms, 0);
> > > +        stl_le_p(&n->bar.intmc, 0);
> > > +        stl_le_p(&n->bar.cc, 0);
> > 
> > Looks fine, though it seems the NVMe spec says the above registers
> > should be cleared during each reset for VF as well.
> > 
> 
> Aren't the values of all other registers than CSTS just undefined? (NVMe
> v2.0b, Section 8.26.3)

My 2 cents –

When VF is online:
- Both Controller Reset (CR) and PCIe Function Level Reset (FLR) can be
  issued to given VF
- Both resets shall return all (except specific) Nvme registers of given
  VF to their reset values (3.7.2)

When VF is offline:
- CR cannot be issued (only CSTS is defined, writes to CC are dropped),
  so doesn’t need an explicit IF
- FLR is allowed as it’s a part of the procedure to bring VF online
  (mentioned in 8.26.3)
- At least FLR shall reset the registers for VF

So I agree with the other Lukasz's suggestion. I would also clear
intms/intmc/cc for both: VF and PF reset paths, regardless of the actual
reset type.


