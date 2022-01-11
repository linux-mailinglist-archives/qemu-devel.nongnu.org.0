Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437748A773
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 06:52:22 +0100 (CET)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7A4y-0007mI-S5
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 00:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7A0k-00063n-41
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 00:48:03 -0500
Received: from mga17.intel.com ([192.55.52.151]:15980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7A0g-00051G-Oi
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 00:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641880074; x=1673416074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OKgNxYqqwYco7w5LGywNlLK7DIHzmDKppe3YFKxVauk=;
 b=dqjzc1PXNlN1/qItzNUw3tTcr65v6I3+lncOSQc53D8nPVlHSPI65kyt
 t1vqRPKb+dZu1JazEUluH7CVRZQi2KIAWw0wucOoMRLVV2lWxi4lIqDdb
 /7TWAy0ah9TJclK9gtNqjUfMV+1fcscbvwaYR/1WKfvwry0zRHluIhpqj
 ZcDzPvdtjZ6U/suXX4mgkehMCjHA4FdQDcW29vXFRiKA5ksYH713c442R
 qGcVceuhKOfOIm8vMG8xJ1MSFHaVysRsETtNOTz6yOxV+wc50ZF+RG7wt
 +hT1pQ3AKul7dEi0D6UOkx8TTLfydUl1R/HSQXbipokr5nJ23eXH3NCdN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224102633"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="224102633"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 21:47:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="619708109"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Jan 2022 21:47:44 -0800
Date: Tue, 11 Jan 2022 13:32:32 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 4/7] x86: Add XFD faulting bit for state components
Message-ID: <20220111053232.GA10991@yangzhon-Virtual>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-5-yang.zhong@intel.com>
 <BN9PR11MB527604A587F7F84B9DF5F1238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527604A587F7F84B9DF5F1238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
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

On Mon, Jan 10, 2022 at 04:38:18PM +0800, Tian, Kevin wrote:
> > From: Zhong, Yang <yang.zhong@intel.com>
> > Sent: Friday, January 7, 2022 5:32 PM
> >
> > From: Jing Liu <jing2.liu@intel.com>
> >
> > Intel introduces XFD faulting mechanism for extended
> > XSAVE features to dynamically enable the features in
> > runtime. If CPUID (EAX=0Dh, ECX=n, n>1).ECX[2] is set
> > as 1, it indicates support for XFD faulting of this
> > state component.
> >
> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  target/i386/cpu.h         | 2 +-
> >  target/i386/cpu.c         | 2 +-
> >  target/i386/kvm/kvm-cpu.c | 1 +
> >  3 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 79023fe723..22f7ff40a6 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -1375,7 +1375,7 @@
> > QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_DATA) != 0x2000);
> >  typedef struct ExtSaveArea {
> >      uint32_t feature, bits;
> >      uint32_t offset, size;
> > -    uint32_t need_align;
> > +    uint32_t need_align, support_xfd;
> 
> why each flag be a 32-bit field?
>
  
  Using the uint32_t to define those flags for below ecx value 
  *ecx = (esa->need_align << 1) | (esa->support_xfd << 2);

 
> also it's more natural to have them in separate lines, though I'm not
> sure why existing fields are put this way (possibly due to short names?).
> 

  Yes, support_xfd flag will be in another line to define, thanks!

  Yang


> >  } ExtSaveArea;
> >
> >  #define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index dd2c919c33..1adc3f0f99 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5495,7 +5495,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t
> > index, uint32_t count,
> >                  const ExtSaveArea *esa = &x86_ext_save_areas[count];
> >                  *eax = esa->size;
> >                  *ebx = esa->offset;
> > -                *ecx = esa->need_align << 1;
> > +                *ecx = (esa->need_align << 1) | (esa->support_xfd << 2);
> >              }
> >          }
> >          break;
> > diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> > index 6c4c1c6f9d..3b3c203f11 100644
> > --- a/target/i386/kvm/kvm-cpu.c
> > +++ b/target/i386/kvm/kvm-cpu.c
> > @@ -108,6 +108,7 @@ static void kvm_cpu_xsave_init(void)
> >
> >              uint32_t ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
> >              esa->need_align = ecx & (1u << 1) ? 1 : 0;
> > +            esa->support_xfd = ecx & (1u << 2) ? 1 : 0;
> >          }
> >      }
> >  }

