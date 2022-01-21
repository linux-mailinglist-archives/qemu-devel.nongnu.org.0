Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7B495CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:29:16 +0100 (CET)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqEN-0003ZX-79
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:29:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoN5-0008Md-TN
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:30:12 -0500
Received: from mga09.intel.com ([134.134.136.24]:13810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nAoN1-0001QW-Ud
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 02:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750204; x=1674286204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+f+qRx8fx+QH5zxLFRUdC3tmuRIqHG9zmlo0a3QixKo=;
 b=G5e0e2MKTDF/Jaiv3xoTQE4yBLiAMzLdQh2KpRiPPgIlTQEPZJcIjGnZ
 AEQhghw6wkYAS4yk5Bk8ziX2nMJjHXZWC54pbo9H1u97cydaC9ZDCMMRW
 AEBbKox2ldhBreh06Cel0kDd1UrpXFLng1hSCLHu99uEuk3i/KhtSTPEf
 cBjgSvjhVkGXlGzy7sis+AgJb85b8QG9QuuEZuD/xGjmPojTOorXWa5rU
 3rA4ViZ6+afhw+1GpdrykoKI+N/AFp6AVr+E+FcVxpzTe5lh+iDrX0N1h
 nod2bwvC/dOaSeQ3bkgpYKAEQBZsRij37snb1YVxzNgzj7VwVDgsHN6Vl w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245374299"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245374299"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:30:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="478150352"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Jan 2022 23:29:57 -0800
Date: Fri, 21 Jan 2022 15:14:38 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 1/7] x86: Fix the 64-byte boundary enumeration for
 extended state
Message-ID: <20220121071438.GA29921@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-2-yang.zhong@intel.com>
 <BN9PR11MB5276BFF130081C9ED21F89238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220111022218.GA10706@yangzhon-Virtual>
 <3aaa1a42-e3b0-2d55-78fd-368c925af4af@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aaa1a42-e3b0-2d55-78fd-368c925af4af@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, "Tian, Kevin" <kevin.tian@intel.com>, "Christopherson,
 , Sean" <seanjc@google.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Wei W" <wei.w.wang@intel.com>, "Zeng, Guang" <guang.zeng@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 01:37:20PM +0100, Paolo Bonzini wrote:
> On 1/11/22 03:22, Yang Zhong wrote:
> >   Thanks Kevin, I will update this in next version.
> 
> Also:
> 
>     The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
>     indicate whether the extended state component locates
>     on the next 64-byte boundary following the preceding state
>     component when the compacted format of an XSAVE area is
>     used.
> 
>     Right now, they are all zero because no supported component
>     needed the bit to be set, but the upcoming AMX feature will
>     use it.  Fix the subleaves value according to KVM's supported
>     cpuid.
>
      Thanks Paolo, I will update this in new version.

      Yang
      
> Paolo

