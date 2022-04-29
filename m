Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34E514515
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:07:07 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMag-0006jA-Gf
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nkMWV-0005Ak-Iz
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:02:50 -0400
Received: from mga06b.intel.com ([134.134.136.31]:64502 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nkMWT-0001YS-Nr
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651222965; x=1682758965;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ucPkbD98njIstEJlUOpokEcv3Il/EwZSZNZVLb6Ima8=;
 b=UTf+nItJuZdbboeAeylov3fSyoTnQyXUJnznaZcmeBw5f69H1wNykxwy
 ZwhaAOBka/VNZTtIIrzktSMPbFm2h+pnDKueE29ZqYse9jXhyRENtJFgB
 EnpqcXMAZjtet62xm3mJx10LeJrdrOsaOjoQZ01Sye34O3NNmSxlwcUEY
 54gxiVzibSMRRlrv/iPueK5kQAvNDX/yvVpw3h4+NYf/ZNTjobrqg6R1a
 r7tFG6bREg4CwcCHoTr3KfAElisXfvm0vkz+CdDeayNE/CxCL6ovKdQnR
 lwLYYQXsRcjgyLy+FenjeeSWCrATHIenGzjHzAP1E7xJr5c9Utbx8Xilh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="327078314"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="327078314"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 02:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="706461641"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2022 02:02:41 -0700
Message-ID: <bb0872324385cd192cd292b0fc883f0f7964b385.camel@linux.intel.com>
Subject: Re: [RESEND][PATCH 0/2] acpi/nvdimm: support NVDIMM _LS{I,R,W} methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Fri, 29 Apr 2022 17:02:40 +0800
In-Reply-To: <20220427163912.621bd366@redhat.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220427163912.621bd366@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=robert.hu@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
 qemu-devel@nongnu.org, ani@anisinha.ca, robert.hu@intel.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-04-27 at 16:39 +0200, Igor Mammedov wrote:
> On Tue, 12 Apr 2022 14:57:51 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > The original NVDIMM _DSM functions (index 4~6) for label operations
> > have
> > been deprecated by new ACPI methods _LS{I,R,W}[1][2].
> > 
> > Patch 1 implements the new _LS{I,R,W} methods, on top of old _DSM
> > implementation.
> > 
> > Patch 2 fixes some typo of logical and/or with bitwise and/or,
> > though
> > functionally they haven't causing trouble.
> 
> generic requirement for ACPI patches,
> the should pass bios-tables-test (part of 'make check')
> 
> for that you need to update testcase expected data,
> see tests/qtest/bios-tables-test.c for the process
> also see 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg875304.html for
> example
> 

Got it. Thanks Igor.
> > 
> > [1] https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html,
> > 6.5.10 NVDIMM Label Methods
> > [2] 
> > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
> > 3.10 Deprecated Functions
> > 
> > ---
> > Resend for previous failed delivery to "qemu-devel@nongnu.org" due
> > to
> > 550-'Message headers fail syntax check'. 
> > 
> > Robert Hoo (2):
> >   acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM device
> >   acpi/nvdimm: Fix aml_or() and aml_and() in if clause
> > 
> >  hw/acpi/nvdimm.c | 60 +++++++++++++++++++++++++++++++++++++++++++-
> > ----
> >  1 file changed, 54 insertions(+), 6 deletions(-)
> > 
> > 
> > base-commit: 95a3fcc7487e5bef262e1f937ed8636986764c4e
> 
> 


