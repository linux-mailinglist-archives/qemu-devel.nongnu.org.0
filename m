Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A119B48A5DD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:51:26 +0100 (CET)
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n77Ft-0001ss-IF
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:51:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n772Z-0005LW-Q8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:37:40 -0500
Received: from mga17.intel.com ([192.55.52.151]:19369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n772W-0001qo-KV
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641868656; x=1673404656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eBGROLJx8EcFEYWz4FTwmtiAfHMr3cYmKWQfmj+uxYw=;
 b=DWNT74/bNy9LjeJ+I12DtxBWHV0UB02qKRY70/iV1qR6S1QQ3gKE+tku
 Sia4BO40QgLT5jB1U3RPAt/w+PGDF14nYwFAVsCsnrabtTEM+BCR+VVwq
 0NA6co9BFEI9pmHyvAsyp3EYGN1rdqMPAx5xEePKOTR/2oarGr6J2DCp/
 CSgF4n25NPBeyudnluQztek13D3X+3UDMb0OJCS/jCkgu2rli7rCso72X
 eJVYNq7Kx40xZi9JBSCF2gcy+bZ4OCcgDHmJX02XHx116s+KwJLA4dytF
 cECheV9mI9vg43TOZy30X6ZsRYjl/BaO5YnnxBQk/kWcKVrNNoYe7SDTd Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224080863"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="224080863"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 18:37:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="474354301"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Jan 2022 18:37:31 -0800
Date: Tue, 11 Jan 2022 10:22:18 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 1/7] x86: Fix the 64-byte boundary enumeration for
 extended state
Message-ID: <20220111022218.GA10706@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-2-yang.zhong@intel.com>
 <BN9PR11MB5276BFF130081C9ED21F89238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276BFF130081C9ED21F89238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, "Christopherson, , Sean" <seanjc@google.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Wei W" <wei.w.wang@intel.com>, "Zeng, Guang" <guang.zeng@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 04:20:41PM +0800, Tian, Kevin wrote:
> > From: Zhong, Yang <yang.zhong@intel.com>
> > Sent: Friday, January 7, 2022 5:31 PM
> >
> > From: Jing Liu <jing2.liu@intel.com>
> >
> > The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
> > are all zero, while spec actually introduces that bit 01
> > should indicate if the extended state component locates
> > on the next 64-byte boundary following the preceding state
> > component when the compacted format of an XSAVE area is
> > used.
> 
> Above would read clearer if you revise to:
> 
> "The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
> indicate whether the extended state component locates
> on the next 64-byte boundary following the preceding state
> component when the compacted format of an XSAVE area is
> used.
> 
> But ECX[1] is always cleared in current implementation."

  Thanks Kevin, I will update this in next version.

  Yang


