Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7550807C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 07:19:34 +0200 (CEST)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh2kX-0002HD-EQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 01:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nh2jW-0001cj-IP
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:18:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:28414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nh2jT-00081X-TY
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650431907; x=1681967907;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYHu6jSV65DWYe2rX7kzNF4s/nGwlHxJQvg2VFB2GMU=;
 b=bYSxv9hwgQJgPeagTNfxRs0H0YLVwLdC05uUYaoPcUjPYDN+0nG2GFjq
 duB1Dhh8zEaVOWPrA2h47GZseIZP2vAzZMthn090Jww96HQwH0RckvH3M
 oRIGPJ2Ena6jbLWdvgQZEdEPQShbVHQLbYRqWJiJdeyuy9o+6Ji7d9f4U
 EAf3yTYT+4kY18/B8lUj13RSYoq+UylT5A4Vg9akU6QgUcq4TtD6yPbc9
 JEWZXPhKaiAeBxm1o7w0ThK2lzg27IE2wl4cuGhRv64y/2nZv2UXd52rv
 lwtww9c0Dtu+qvx6+/SBt8HwOf4q5rnJfhH7KKuTc5zj/dxw40f0jPdVx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="251248870"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="251248870"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 22:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="555034869"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2022 22:18:21 -0700
Message-ID: <b516dc4f6be41259f9da5a064aca530706344a2c.camel@linux.intel.com>
Subject: Re: [RESEND][PATCH 0/2] acpi/nvdimm: support NVDIMM _LS{I,R,W} methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, qemu-devel@nongnu.org
Date: Wed, 20 Apr 2022 13:18:20 +0800
In-Reply-To: <20220412065753.3216538-1-robert.hu@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: jingqi.liu@intel.com, dan.j.williams@intel.com, robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping...

On Tue, 2022-04-12 at 14:57 +0800, Robert Hoo wrote:
> The original NVDIMM _DSM functions (index 4~6) for label operations
> have
> been deprecated by new ACPI methods _LS{I,R,W}[1][2].
> 
> Patch 1 implements the new _LS{I,R,W} methods, on top of old _DSM
> implementation.
> 
> Patch 2 fixes some typo of logical and/or with bitwise and/or, though
> functionally they haven't causing trouble.
> 
> [1] https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html, 6.5.10
> NVDIMM Label Methods
> [2] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf,
> 3.10 Deprecated Functions
> 
> ---
> Resend for previous failed delivery to "qemu-devel@nongnu.org" due to
> 550-'Message headers fail syntax check'. 
> 
> Robert Hoo (2):
>   acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM device
>   acpi/nvdimm: Fix aml_or() and aml_and() in if clause
> 
>  hw/acpi/nvdimm.c | 60 +++++++++++++++++++++++++++++++++++++++++++---
> --
>  1 file changed, 54 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 95a3fcc7487e5bef262e1f937ed8636986764c4e


