Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301C40D325
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 08:23:42 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQko9-0005P1-6B
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 02:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQknN-0004jU-Vo
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 02:22:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:17027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQknK-00039s-2j
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 02:22:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220613127"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="220613127"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 23:22:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="545390846"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 15 Sep 2021 23:22:39 -0700
Date: Thu, 16 Sep 2021 14:08:41 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 10/33] i386: Add get/set/migrate support for
 SGX_LEPUBKEYHASH MSRs
Message-ID: <20210916060841.GB31727@yangzhon-Virtual>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-11-yang.zhong@intel.com>
 <7f81ee2f-1876-3f84-8415-51031e1fd887@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f81ee2f-1876-3f84-8415-51031e1fd887@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 qemu-devel@nongnu.org, jarkko@kernel.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 08:38:59AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/19/21 1:21 PM, Yang Zhong wrote:
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> > 
> > On real hardware, on systems that supports SGX Launch Control, those
> > MSRs are initialized to digest of Intel's signing key; on systems that
> > don't support SGX Launch Control, those MSRs are not available but
> > hardware always uses digest of Intel's signing key in EINIT.
> > 
> > KVM advertises SGX LC via CPUID if and only if the MSRs are writable.
> > Unconditionally initialize those MSRs to digest of Intel's signing key
> > when CPU is realized and reset to reflect the fact. This avoids
> > potential bug in case kvm_arch_put_registers() is called before
> > kvm_arch_get_registers() is called, in which case guest's virtual
> > SGX_LEPUBKEYHASH MSRs will be set to 0, although KVM initializes those
> > to digest of Intel's signing key by default, since KVM allows those MSRs
> > to be updated by Qemu to support live migration.
> > 
> > Save/restore the SGX Launch Enclave Public Key Hash MSRs if SGX Launch
> > Control (LC) is exposed to the guest. Likewise, migrate the MSRs if they
> > are writable by the guest.
> > 
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> > Signed-off-by: Kai Huang <kai.huang@intel.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  target/i386/cpu.c     | 17 ++++++++++++++++-
> >  target/i386/cpu.h     |  1 +
> >  target/i386/kvm/kvm.c | 22 ++++++++++++++++++++++
> >  target/i386/machine.c | 20 ++++++++++++++++++++
> >  4 files changed, 59 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 840f825431..cea4307930 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5673,6 +5673,16 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >      }
> >  }
> >  
> > +#ifndef CONFIG_USER_ONLY
> > +static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
> > +{
> > +    env->msr_ia32_sgxlepubkeyhash[0] = 0xa6053e051270b7acULL;
> > +    env->msr_ia32_sgxlepubkeyhash[1] = 0x6cfbe8ba8b3b413dULL;
> > +    env->msr_ia32_sgxlepubkeyhash[2] = 0xc4916d99f2b3735dULL;
> > +    env->msr_ia32_sgxlepubkeyhash[3] = 0xd4f8c05909f9bb3bULL;
> > +}
> > +#endif
> 
> Maybe easier to move the #ifdef'ry inside the function.
>

  Thanks for comments, since this function is pure void function, we can move this #ifdef
  into function.
 
> Where these values come from btw?

  Those MSR values are intel default values, which were defined in Skylake platform.

  Yang

> 
> > @@ -6186,6 +6198,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> >             & CPUID_EXT2_AMD_ALIASES);
> >      }
> >  
> > +#ifndef CONFIG_USER_ONLY
> > +    x86_cpu_set_sgxlepubkeyhash(env);
> > +#endif
> > +

