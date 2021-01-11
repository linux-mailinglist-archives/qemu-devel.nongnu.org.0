Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573E2F0BD7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:39:53 +0100 (CET)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyozg-0004Be-3S
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyoyF-0003kM-Kj
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:38:23 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:47408 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyoyD-0000ha-NP
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:38:23 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5CE77412EB;
 Mon, 11 Jan 2021 04:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610339897;
 x=1612154298; bh=Ju6gvDqQdoTI0whHAw1Vk3vAfNjvtLpPZSSRJjhXehA=; b=
 kZzd54mGu27oltlndPm9sL8aIQ63kt3orAFuuoGcynsIn8RqM9owBdJuOp0jAHeB
 sRuecYA6dQ2CRvyI9QCp0iCYdrWM/7+pu1Q40qYtmF+xazfgz6zZREAZjr8PSfnL
 Hi1UmF8KvjY2N8IUwAWOusoRvvM3cXYy2w6xVecexac=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FzIrDZ_-A-S; Mon, 11 Jan 2021 07:38:17 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B41C34127E;
 Mon, 11 Jan 2021 07:38:17 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 11
 Jan 2021 07:38:17 +0300
Date: Mon, 11 Jan 2021 07:38:43 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Hill Ma <maahiuzeon@gmail.com>
Subject: Re: [PATCH v2] hvf: guard xgetbv call.
Message-ID: <X/vWU7/pPpXZfVOC@SPB-NB-133.local>
References: <X/ts5kQD31VLIn0n@Hills-Mac-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <X/ts5kQD31VLIn0n@Hills-Mac-Pro.local>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 10, 2021 at 01:08:54PM -0800, Hill Ma wrote:
> This prevents illegal instruction on cpus do not support xgetbv.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
> Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
> ---
>  v2: xgetbv() modified based on feedback.
> 
>  target/i386/hvf/x86_cpuid.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index a6842912f5..edaa1b7da2 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -27,15 +27,22 @@
>  #include "vmx.h"
>  #include "sysemu/hvf.h"
>  
> -static uint64_t xgetbv(uint32_t xcr)
> +static bool xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
>  {
> -    uint32_t eax, edx;
> +    uint32_t xcrl, xcrh;
>  
> -    __asm__ volatile ("xgetbv"
> -                      : "=a" (eax), "=d" (edx)
> -                      : "c" (xcr));
> +    if (cpuid_ecx & CPUID_EXT_OSXSAVE) {
> +        /*
> +         * The xgetbv instruction is not available to older versions of
> +         * the assembler, so we encode the instruction manually.
> +         */
> +        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
>  
> -    return (((uint64_t)edx) << 32) | eax;
> +        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
> +        return true;
> +    }
> +
> +    return false;
>  }
>  
>  uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
> @@ -100,11 +107,14 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>          break;
>      case 0xD:
>          if (idx == 0) {
> -            uint64_t host_xcr0 = xgetbv(0);
> -            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK | XSTATE_SSE_MASK |
> +            uint64_t supp_xcr0 = XSTATE_FP_MASK | XSTATE_SSE_MASK |
>                                    XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
>                                    XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
> -                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK);
> +                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK;
> +            uint64_t host_xcr0;
> +            if (xgetbv(ecx, 0, &host_xcr0)) {
> +                supp_xcr0 &= host_xcr0;

Hi Hill,

I'm not sure if eax should be modified with mask because the mask has no
value per se. I.e. eax &= supp_xcr0 from below should be placed inside
the if. It'd express clearly that eax is not modified unless xgetbv is
supported.

Thanks,
Roman

> +            }
>              eax &= supp_xcr0;
>          } else if (idx == 1) {
>              hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
> -- 
> 2.20.1 (Apple Git-117)
> 

