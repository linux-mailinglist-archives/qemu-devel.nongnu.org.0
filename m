Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF34C3F07
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 08:29:53 +0100 (CET)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNV32-0007nM-C6
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 02:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nNUzk-00075T-7O
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 02:26:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:41024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nNUzg-0000RE-U6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 02:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645773984; x=1677309984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QHsa4uaejrutjYvmvTfpBlym5OoUXHxaaWb7xEyH0gM=;
 b=HjMD+RZrRSBFFPp2u3EyY9tHVR209vqJkKhh5qXZ+mr9MdH+LvFG36aC
 93UReS5FcgCCRWrM90IOWbQBjAbJxhwvlwlpUmO5Os/bbODyViYoRc9Ja
 MazOrKvCC575WLtjOEg4EbssOGS3PP0PgPx0vlWh1R5yqqQymT/at+D1p
 icwus0mgHh6Aq14EmSfXviyJrATzP83A+9Yz+J/A4xuLe8GdGUc/XkPqs
 gICn2ahTic76MFLl6nCDE53TFwk98kFt6l4uBC3AeMFCvKRcjresOfJX5
 RUwcWsIneMuloMq8pcOPCnr/n/ui5PvbT05vmhWK1UXgkOddk/rz5tAj8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="239843243"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="239843243"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 23:26:09 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="628762414"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 24 Feb 2022 23:26:07 -0800
Date: Fri, 25 Feb 2022 15:10:25 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v2 4/8] x86: Add XFD faulting bit for state components
Message-ID: <20220225071025.GA24485@yangzhon-Virtual>
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-5-yang.zhong@intel.com>
 <cun1qzwpe6e.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cun1qzwpe6e.fsf@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yang.zhong@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 pbonzini@redhat.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 01:00:41PM +0000, David Edmondson wrote:
> On Wednesday, 2022-02-16 at 22:04:30 -08, Yang Zhong wrote:
> 
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
> 
> Small comment below...
> 
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> 
> > ---
> >  target/i386/cpu.h | 2 ++
> >  target/i386/cpu.c | 3 ++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index d4ad0f56bd..f7fc2e97a6 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -558,8 +558,10 @@ typedef enum X86Seg {
> >  #define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> >
> >  #define ESA_FEATURE_ALIGN64_BIT         1
> > +#define ESA_FEATURE_XFD_BIT             2
> >
> >  #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
> > +#define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
> >
> >  /* CPUID feature words */
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 377d993438..5a7ee8c7e1 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -5497,7 +5497,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >                  const ExtSaveArea *esa = &x86_ext_save_areas[count];
> >                  *eax = esa->size;
> >                  *ebx = esa->offset;
> > -                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
> > +                *ecx = (esa->ecx & ESA_FEATURE_ALIGN64_MASK) |
> > +                       (esa->ecx & ESA_FEATURE_XFD_MASK);
> 
> Is:
> 
>                 *ecx = esa->ecx &
>                        (ESA_FEATURE_ALIGN64_MASK | ESA_FEATURE_XFD_MASK);
> 
> not more usual?


  Thanks David, I will update this in next version.

  Yang

> 
> >              }
> >          }
> >          break;
> 
> dme.
> -- 
> All of us, we're going out tonight. We're gonna walk all over your cars.

