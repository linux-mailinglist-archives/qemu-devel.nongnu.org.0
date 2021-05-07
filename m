Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9737601F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 08:12:13 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1letia-0007zr-SK
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 02:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1letho-0007b7-8b
 for qemu-devel@nongnu.org; Fri, 07 May 2021 02:11:20 -0400
Received: from mga09.intel.com ([134.134.136.24]:30594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lethl-00023w-Dw
 for qemu-devel@nongnu.org; Fri, 07 May 2021 02:11:19 -0400
IronPort-SDR: iBgm0auqQHteSpB/fGsvIZfpmsNZvvQHkdvtUnoN94dvXrOl9JSl14Mlh4IlBBr9ktghLFPjUJ
 F7D9F0EKbbZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198743011"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; d="scan'208";a="198743011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 23:11:10 -0700
IronPort-SDR: h0ymBZXlH173lkj3+6XhGCRSrZdugIvz9HTKZQsVP6dYdnleDfbJm2AhXv7DDb03tcsK4L2qci
 1w/Qh6Seg8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; d="scan'208";a="434767472"
Received: from michael-optiplex-9020.sh.intel.com (HELO localhost)
 ([10.239.159.172])
 by orsmga008.jf.intel.com with ESMTP; 06 May 2021 23:11:08 -0700
Date: Fri, 7 May 2021 14:25:11 +0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v7 2/6] target/i386: Enable XSS feature enumeration for
 CPUID
Message-ID: <20210507062511.GA5990@michael-OptiPlex-9020>
References: <20210226022058.24562-1-weijiang.yang@intel.com>
 <20210226022058.24562-3-weijiang.yang@intel.com>
 <20210506221647.zaq4or66rqspxssb@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506221647.zaq4or66rqspxssb@habkost.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=weijiang.yang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, sean.j.christopherson@intel.com,
 Yang Weijiang <weijiang.yang@intel.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 06, 2021 at 06:16:47PM -0400, Eduardo Habkost wrote:
> On Fri, Feb 26, 2021 at 10:20:54AM +0800, Yang Weijiang wrote:
> > Currently, CPUID.(EAX=0DH,ECX=01H) doesn't enumerate features in
> > XSS properly, add the support here. XCR0 bits indicate user-mode XSAVE
> > components, and XSS bits indicate supervisor-mode XSAVE components.
> > 
> > Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> > ---
> >  target/i386/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++-----
> >  target/i386/cpu.h | 12 ++++++++++++
> >  2 files changed, 55 insertions(+), 5 deletions(-)
> >
 
[...]

> > @@ -1478,6 +1496,9 @@ static uint32_t xsave_area_size(uint64_t mask)
> >      for (i = 0; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
> >          const ExtSaveArea *esa = &x86_ext_save_areas[i];
> >          if ((mask >> i) & 1) {
> > +            if (i >= 2 && !esa->offset) {
> 
> Maybe a few comments at the definition of ExtSaveArea to explain
> that offset can now be zero (and what it means when it's zero)
> would be helpful.  I took a while to understand why this is safe.
>
Thanks Eduardo!

Sure, I'll add some comments in next version.
 
> Would it be valid to say "ExtSaveArea.offset has a valid offset
> only if the component is in CPUID_XSTATE_XCR0_MASK"?  If so,
> can't this check be simply replaced with:
>   if ((1 << i) & CPUID_XSTATE_XCR0_MASK)
> ?
> 
> Or maybe this function should just contain a:
>   assert(!(mask & CPUID_XSTATE_XCR0_MASK));
> at the beginning?
> 

Maybe I need to modifiy the function a bit to accommodate compacted format
size calculation for CPUID(0xD,1).EBX.
> 
> > +                continue;
> > +            }
> >              ret = MAX(ret, esa->offset + esa->size);
> >          }
> >      }
> > @@ -1489,12 +1510,18 @@ static inline bool accel_uses_host_cpuid(void)
> >      return kvm_enabled() || hvf_enabled();
> >  }

[...]

> >  
> > @@ -5716,7 +5743,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >          }
> >  
> >          if (count == 0) {
> > -            *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
> > +            *ecx = xsave_area_size(x86_cpu_xsave_xcr0_components(cpu));
> >              *eax = env->features[FEAT_XSAVE_XCR0_LO];
> >              *edx = env->features[FEAT_XSAVE_XCR0_HI];
> >              /*
> > @@ -5728,11 +5755,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >              *ebx = kvm_enabled() ? *ecx : xsave_area_size(env->xcr0);
> >          } else if (count == 1) {
> >              *eax = env->features[FEAT_XSAVE];
> > +            *ecx = env->features[FEAT_XSAVE_XSS_LO];
> > +            *edx = env->features[FEAT_XSAVE_XSS_HI];
> 
> What about EBX?  It is documented as "The size in bytes of the
> XSAVE area containing all states enabled by XCRO | IA32_XSS".
> 
> The Intel SDM is not clear, but I assume this would be
> necessarily the size of the area in compacted format?

Yes, I'll add ebx assignment.
> 
> 
> >          } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
> > -            if ((x86_cpu_xsave_components(cpu) >> count) & 1) {
> > -                const ExtSaveArea *esa = &x86_ext_save_areas[count];
> > +            const ExtSaveArea *esa = &x86_ext_save_areas[count];
> > +            if ((x86_cpu_xsave_xcr0_components(cpu) >> count) & 1) {
> >                  *eax = esa->size;
> >                  *ebx = esa->offset;
> > +            } else if ((x86_cpu_xsave_xss_components(cpu) >> count) & 1) {
> > +                *eax = esa->size;
> > +                *ebx = 0;
> > +                *ecx = 1;
> >              }
> >          }
> >          break;
> > @@ -6059,6 +6092,9 @@ static void x86_cpu_reset(DeviceState *dev)
> >      }
> >      for (i = 2; i < ARRAY_SIZE(x86_ext_save_areas); i++) {
> >          const ExtSaveArea *esa = &x86_ext_save_areas[i];
> > +        if (!esa->offset) {
> > +            continue;
> 
> Most of the comments at the xsave_area_size() hunk would apply
> here.  I miss some clarity on what esa->offset==0 really means.
> 
> Would it be valid to replace this with a check for
>   ((1 << i) & CPUID_XSTATE_XCR0_MASK)
> ?

Sure, I'll use this check to make things clearer, thanks for the comments!

> 
> > +        }
> >          if (env->features[esa->feature] & esa->bits) {
> >              xcr0 |= 1ull << i;
> >          }

[...]
  
> > +/* CPUID feature bits available in XCR0 */
> > +#define CPUID_XSTATE_XCR0_MASK  (XSTATE_FP_MASK | XSTATE_SSE_MASK | \
> > +                                 XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK | \
> > +                                 XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK | \
> > +                                 XSTATE_ZMM_Hi256_MASK | \
> > +                                 XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK)
> > +
> > +/* CPUID feature bits available in XSS */
> > +#define CPUID_XSTATE_XSS_MASK    0
> 
> Do you expect this to be used outside target/i386/cpu.c?  If not,
> maybe it could be moved close to the x86_ext_save_areas[]
> definition, as any updates to x86_ext_save_areas will require an
> update to these macros.
> 
> > +
> >  /* CPUID feature words */
> >  typedef enum FeatureWord {
> >      FEAT_1_EDX,         /* CPUID[1].EDX */
> > @@ -541,6 +551,8 @@ typedef enum FeatureWord {
> >      FEAT_VMX_EPT_VPID_CAPS,
> >      FEAT_VMX_BASIC,
> >      FEAT_VMX_VMFUNC,
> > +    FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
> > +    FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
> >      FEATURE_WORDS,
> >  } FeatureWord;
> >  
> > -- 
> > 2.26.2
> > 
> > 
> 
> -- 
> Eduardo

