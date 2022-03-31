Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463C4EDA44
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:11:02 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZuZp-0000AI-M6
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:11:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nZuXk-00072L-O3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:08:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:57277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nZuXi-0002tr-KM
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648732130; x=1680268130;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQ0FF+MoMFr4n7JCjOO3JrnZpU2D6Sg7N5BMD2NJib8=;
 b=C+Ooz06GaywaV4zqXpnbuqb/am1vcLnNhBElfoAdKdpNFZpl5JRm4+iu
 z1t97rWzvzDKOfrK73a8qXvCyZHCXpTLhIc5Jip7AwEf3pi6KqJ1tVgJB
 MET3KP6ZZZlMoO+MMgV15x9YIqMYQ6Tl6SZwZprG3GTSnEXmvJNLhXYVE
 itsmHKorgJQDQDJfRPFPUEbitlBg4n5KhYtIwPhIqqNXeLAcXBpKDPGaN
 e7qAGhGfQ3NzjO2M1/LZa3x6PW4WpQzxBU2u07gpzuafXMm60aMSd5Zuf
 mPLk+7xciZK+D2VFSauDDDhZPimC5Luw2SumCKHoj3y5BpJi70g8YmcDj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284750989"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="284750989"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="503740869"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2022 06:03:23 -0700
Message-ID: <36975b9742f11461bd8fa21de387dbb921576b61.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] Init vNVDIMM LSA if applicable
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Thu, 31 Mar 2022 21:03:22 +0800
In-Reply-To: <20220331140325.5fc23fd8@redhat.com>
References: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
 <20220331140325.5fc23fd8@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=robert.hu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-03-31 at 14:03 +0200, Igor Mammedov wrote:
> On Tue, 29 Mar 2022 15:07:41 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > QEMU option "-device nvdimm,...,label-size=" designates a vNVDIMM
> > with
> > Label Storage Area (LSA), where stores the namespace labels and
> > conforms to
> > some format and rules defined by NVDIMM label protocol[1].
> > 
> > Recent guest Kernel, will by validating LSA to determine if the
> > NVDIMM is
> > label-capable. So without initialization, guest Kernel will judge
> > it
> > label-less, though it actually support label.
> > 
> > This patch set, is to init vNVDIMM's LSA, so that guest Kernel can
> > correctly identify and use it.
> > 
> > [1]:
> > https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf,
> > Section 13.19.
> 
> perhaps there is a typo here,
> In above spec, chapter 13 is "ACPI SYSTEM MANAGEMENT BUS INTERFACE
> SPECIFICATION"
> and there is only 13.1-13.3 there.

Right, thanks Igor.
It should be UEFI spec, section 13.19 "NVDIMM Label Protocol"
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_9_2021_03_18.pdf
> 
> > 
> > Robert Hoo (2):
> >   NVDIMM: rename NVDIMM::label_size to NVDIMM::lsa_size
> >   NVDIMM: Init vNVDIMM's LSA index block if it hasn't been
> > 
> >  docs/nvdimm.txt         |   4 +-
> >  hw/acpi/nvdimm.c        |  14 +-
> >  hw/mem/nvdimm.c         | 381
> > ++++++++++++++++++++++++++++++++++++++--
> >  include/hw/mem/nvdimm.h | 108 +++++++++++-
> >  4 files changed, 485 insertions(+), 22 deletions(-)
> > 
> > 
> > base-commit: 27fc9f365d6f60ff86c2e2be57289bb47a2be882
> 
> 


