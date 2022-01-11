Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF848A852
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:23:12 +0100 (CET)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7BUt-0007Ci-19
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7BBK-0003jq-8z
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:03:06 -0500
Received: from mga05.intel.com ([192.55.52.43]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7BAu-0006ff-7b
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641884552; x=1673420552;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=89sCwzEm7TdzKMEznyZ18YnPDpShF8KnoGlniTYNcvo=;
 b=nyBHu8DgQTuacjWdoR9NDzzPuv3M80I1fQEk9VVaA/Q4QT1PiGx4vMnr
 bz8pqJh7NcXW42ux7ErT+oPTG4e/g+In1cWG/ASELVEsbOBvELtfASQOv
 J1z+wjgGpCT8JrGT/IZRYQF2ynehaNWDSTxS02yOhGrMmd01yT848wK0r
 9kv8Y4QhK4ovCQaKzearkbUqWvHGc1yL2XTmVAGf6DppOH9WTR9b9h8NO
 fb6uhe1faffew7JcgjfLpK2RSMFrMiBQW/ggGpU52Ed3fgeYN7fw+YyJ5
 ubx1w5k51OMhiK1UCpU/aXdQs2pIHpRFXPWxFBEwH7UhwGrm6B4q/LgsO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="329760868"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="329760868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 23:02:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="762432657"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Jan 2022 23:02:03 -0800
Date: Tue, 11 Jan 2022 14:46:51 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 3/7] x86: Grant AMX permission for guest
Message-ID: <20220111064651.GB10991@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-4-yang.zhong@intel.com>
 <BN9PR11MB5276050198EED261C480B6B28C509@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276050198EED261C480B6B28C509@BN9PR11MB5276.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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

On Mon, Jan 10, 2022 at 04:36:13PM +0800, Tian, Kevin wrote:
> > From: Zhong, Yang <yang.zhong@intel.com>
> > Sent: Friday, January 7, 2022 5:32 PM
> >
> > Kernel mechanism for dynamically enabled XSAVE features
> 
> there is no definition of "dynamically-enabled XSAVE features).
> 

  Thanks!


> > asks userspace VMM requesting guest permission if it wants
> > to expose the features. Only with the permission, kernel
> > can try to enable the features when detecting the intention
> > from guest in runtime.
> >
> > Qemu should request the permission for guest only once
> > before the first vCPU is created. KVM checks the guest
> > permission when Qemu advertises the features, and the
> > advertising operation fails w/o permission.
> 
> what about below?
> 
> "Kernel allocates 4K xstate buffer by default. For XSAVE features
> which require large state component (e.g. AMX), Linux kernel
> dynamically expands the xstate buffer only after the process has
> acquired the necessary permissions. Those are called dynamically-
> enabled XSAVE features (or dynamic xfeatures).
> 
> There are separate permissions for native tasks and guests.
> 
> Qemu should request the guest permissions for dynamic xfeatures
> which will be exposed to the guest. This only needs to be done
> once before the first vcpu is created."


  This is clearer. Will update this in new version, thanks!


> 
> >
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> > ---
> >  target/i386/cpu.h |  7 +++++++
> >  hw/i386/x86.c     | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 768a8218be..79023fe723 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -549,6 +549,13 @@ typedef enum X86Seg {
> >  #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
> >  #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
> >  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
> > +#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
> > +#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
> > +#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
> > +                                         | XSTATE_XTILE_DATA_MASK)
> > +
> > +#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> > +#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> >
> >  /* CPUID feature words */
> >  typedef enum FeatureWord {
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index b84840a1bb..0a204c375e 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -41,6 +41,8 @@
> >  #include "sysemu/cpu-timers.h"
> >  #include "trace.h"
> >
> > +#include <sys/syscall.h>
> > +
> >  #include "hw/i386/x86.h"
> >  #include "target/i386/cpu.h"
> >  #include "hw/i386/topology.h"
> > @@ -117,6 +119,30 @@ out:
> >      object_unref(cpu);
> >  }
> >
> > +static void x86_xsave_req_perm(void)
> > +{
> > +    unsigned long bitmask;
> > +
> > +    long rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> > +                      XSTATE_XTILE_DATA_BIT);
> 
> Should we do it based on the cpuid for the first vcpu?


  This permission is requested before vcpu init, so put it in
  x86_cpus_init(). If the host kernel does not include AMX changes, or
  the latest kernel(include AMX) install on previous generation x86
  platform, this syscall() will directly return. I ever put this
  permission request in the vcpu create function, but it's hard
  to find a good location to handle this. As for cpuid, you mean
  I need check host cpuid info? to check if this host cpu can support
  AMX? thanks!

  Yang   
   
> 
> > +    if (rc) {
> > +        /*
> > +         * The older kernel version(<5.15) can't support
> > +         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> > +         */
> > +        return;
> > +    }
> > +
> > +    rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> > +    if (rc) {
> > +        error_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
> > +    } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
> > +        error_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
> > +                     "and bitmask=0x%lx", bitmask);
> > +        exit(EXIT_FAILURE);
> > +    }
> > +}
> > +
> >  void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
> >  {
> >      int i;
> > @@ -124,6 +150,8 @@ void x86_cpus_init(X86MachineState *x86ms, int
> > default_cpu_version)
> >      MachineState *ms = MACHINE(x86ms);
> >      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> >
> > +    /* Request AMX pemission for guest */
> > +    x86_xsave_req_perm();
> >      x86_cpu_set_default_version(default_cpu_version);
> >
> >      /*

