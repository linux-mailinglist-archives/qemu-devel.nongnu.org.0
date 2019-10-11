Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B581D3A5C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 09:52:25 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIpip-0000vX-VF
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 03:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iIpgL-0007W5-PA
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iIpgK-0006Vd-7j
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:49:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:61216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iIpgK-0006Us-04
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:49:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 00:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="193458532"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.168])
 ([10.239.196.168])
 by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2019 00:49:44 -0700
Subject: Re: [PATCH RESEND v6 1/2] x86/cpu: Add support for
 UMONITOR/UMWAIT/TPAUSE
To: "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20191011074103.30393-1-tao3.xu@intel.com>
 <20191011074103.30393-2-tao3.xu@intel.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <1731d87f-f07a-916f-90a7-346b593d821e@intel.com>
Date: Fri, 11 Oct 2019 15:49:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011074103.30393-2-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2019 3:41 PM, Xu, Tao3 wrote:
[...]
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 11b9c854b5..a465c893b5 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -401,6 +401,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>           if (host_tsx_blacklisted()) {
>               ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>           }
> +    } else if (function == 7 && index == 0 && reg == R_ECX) {
> +        if (enable_cpu_pm) {
> +            ret |= CPUID_7_0_ECX_WAITPKG;
> +        } else {
> +            ret &= ~CPUID_7_0_ECX_WAITPKG;
> +        }

Hi Paolo,

I am sorry because I realize in KVM side, I keep cpuid mask WAITPKG as 0:

F(CLDEMOTE) | F(MOVDIRI) | F(MOVDIR64B) | 0 /*WAITPKG*/;

Therefore in QEMU side, we need to add CPUID_7_0_ECX_WAITPKG when 
enable_cpu_pm is on. Otherwise, QEMU can't get this CPUID.

Could you review this part again? Thank you very much!

Tao

