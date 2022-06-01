Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D540A53A5FA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:34:35 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOUc-00037d-QS
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nwOPB-0008Fk-EO; Wed, 01 Jun 2022 09:28:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:20058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nwOP8-0000c8-LU; Wed, 01 Jun 2022 09:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654090134; x=1685626134;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ny4MiIVrSgM/F05gn6czS5JRyzd5ncR/bjPsKUOX1Kc=;
 b=h5Zv5hF7ggSg1KHUHRG33O/5M1P+cIy4qdCVTZ1h/Tc6E2XoDhZMAyrL
 2mODxLcuvbyknEkkB9jzsaGTkVYbNxb6FHhjlfRuP/RPPFCnIR05VxEk4
 NAeaCxwai0HfBAtF5xnOqf0aiOhSXD0wsV5jfyCQh6GRoLGaenavOjrFI
 JmFIv734rYC3Jyac8eIjHf8qiDBRy7/gceAUfroFq3I6nAesKNdnuC5wH
 HIa5mvjdvVpdKc2uxKiceb++iTavj12ZZG0Tpx0omfL+vTFM4apMmwhAT
 4j1PoF7fnsyUL1wQq+aLHNc3epv+iuo35PYKX0m69w0ttb9/53VreF2+c w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="255458949"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="255458949"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 06:28:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="606263545"
Received: from apolons1-mobl1.ger.corp.intel.com (HELO
 kzawora-mobl.ger.corp.intel.com) ([10.213.28.75])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 06:28:48 -0700
Date: Wed, 1 Jun 2022 15:28:44 +0200
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, lukasz.gieryk@linux.intel.com
Subject: Re: [PATCH v2] hw/nvme: clean up CC register write logic
Message-ID: <YpdpjLHhJDpTn7kP@kzawora-mobl.ger.corp.intel.com>
References: <20220525073524.2227333-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073524.2227333-1-its@irrelevant.dk>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

On Wed, May 25, 2022 at 09:35:24AM +0200, Klaus Jensen wrote:
> 
> +        stl_le_p(&n->bar.intms, 0);
> +        stl_le_p(&n->bar.intmc, 0);
> +        stl_le_p(&n->bar.cc, 0);

Looks fine, though it seems the NVMe spec says the above registers
should be cleared during each reset for VF as well.

> -- 
> 2.36.1
> 

