Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2DC4E539D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:54:14 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1RF-0001MS-SC
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:54:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nX1PT-0008Sp-2t
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:52:23 -0400
Received: from mga04.intel.com ([192.55.52.120]:15249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nX1PP-0008ID-SA
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648043539; x=1679579539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IXWFC5UpiNQ+I/nuFzHkEo7lQWG6dr5Dw6bybWq/ZjA=;
 b=jXmp18FE+SVbHJVPjzT1Fc/NqvWfOExAXdWTUYNWP7MJ6PPdlY8cA2y/
 PTPY56SJ2/nrpOrHg1IaxOlJv10U+BcqpKGx+hLhr9joIsYT1/rUtqjuP
 hH+P9xR4El/qpsXMyDEvNh3OYG1bJZ0/+Xn9VZd56A5bl7szlhLXXEn4P
 G9Q0kei8+GRujbV3zAUuTzIOIAhQNaLLwoeajNiPqnl2KHaRyMdyKZ0oX
 KUaJvPOE1EKLAWscC2CgH6W9eMjjForeZ9ckQd1VaBU67aD5DJW+uP31i
 wL1EOEueX2L3T6PjaLTLAosDuILTarCIdT3YYFBhYaavJKXWDiKEdXaGP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="256935792"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="256935792"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 06:52:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="560909612"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 23 Mar 2022 06:52:12 -0700
Date: Wed, 23 Mar 2022 21:36:14 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: x86: workaround invalid CPUID[0xD,9] info on some
 AMD processors
Message-ID: <20220323133614.GA506@yangzhon-Virtual>
References: <20220323114315.22594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323114315.22594-1-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 12:43:15PM +0100, Paolo Bonzini wrote:
> Some AMD processors expose the PKRU extended save state even if they do not have
> the related PKU feature in CPUID.  Worse, when they do they report a size of
> 64, whereas the expected size of the PKRU extended save state is 8, therefore
> the esa->size == eax assertion does not hold.
> 
> The state is already ignored by KVM_GET_SUPPORTED_CPUID because it
> was not enabled in the host XCR0.  However, QEMU kvm_cpu_xsave_init()
> runs before QEMU invokes arch_prctl() to enable dynamically-enabled
> save states such as XTILEDATA, and KVM_GET_SUPPORTED_CPUID hides save
> states that have yet to be enabled.  Therefore, kvm_cpu_xsave_init()
> needs to consult the host CPUID instead of KVM_GET_SUPPORTED_CPUID,
> and dies with an assertion failure.
> 
> When setting up the ExtSaveArea array to match the host, ignore features that
> KVM does not report as supported.  This will cause QEMU to skip the incorrect
> CPUID leaf instead of tripping the assertion.
> 
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Analyzed-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c         |  4 ++--
>  target/i386/cpu.h         |  2 ++
>  target/i386/kvm/kvm-cpu.c | 19 ++++++++++++-------
>  3 files changed, 16 insertions(+), 9 deletions(-)

   Verified this patch on AMD EPYC 7402P, no crash issue now. thanks!

   Yang

