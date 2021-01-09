Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEEA2EFE17
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 06:49:13 +0100 (CET)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky77g-00039M-Lf
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 00:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1ky76c-0002k5-34
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 00:48:07 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35458 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1ky76Y-0004KO-Jq
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 00:48:05 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A70FB41243;
 Sat,  9 Jan 2021 05:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610171279;
 x=1611985680; bh=7HEB4QCbWTzhKwXIEI+tMmd0zrWMIH9Pm7PlAO1S37A=; b=
 TJXCH95z/z48C5wuoACVI1gnnEs66sy8E5h8qyXlSEHe3fwo3hDSvnkIL4oOXMfQ
 BfWt6KD83pFn6q7pRDuxPkfy9MDQhuYvySN6Df+18NSYG4xvfXFsoyQJ7A6sWMzo
 7BQ4xGm/N+E+CZjfssSm99TN8I1Y3ISLnS04VBHueLM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgXjjWWz8GOs; Sat,  9 Jan 2021 08:47:59 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1DE9141203;
 Sat,  9 Jan 2021 08:47:59 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 9 Jan
 2021 08:47:58 +0300
Date: Sat, 9 Jan 2021 08:48:19 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Hill Ma <maahiuzeon@gmail.com>
Subject: Re: [PATCH] hvf: guard xgetbv call.
Message-ID: <X/lDozXFWfR4AZAU@SPB-NB-133.local>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
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
Cc: qemu-devel@nongnu.org, dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 06:13:47PM -0800, Hill Ma wrote:
> This prevents illegal instruction on cpus do not support xgetbv.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
> Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
> ---
>  target/i386/hvf/x86_cpuid.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Hi Hill,

I'm sorry for delay with the review.

> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index a6842912f5..b4b7111fc3 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -100,11 +100,16 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
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


> +            if ((ecx & CPUID_EXT_AVX) &&
> +                (ecx & CPUID_EXT_XSAVE) &&
> +                (ecx & CPUID_EXT_OSXSAVE)) {

It's sufficient to check only CPUID_EXT_OSXSAVE to ensure xgetbv
presence (per SDM Vol. 1 13-5):

  Software operating with CPL > 0 may need to determine whether the
  XSAVE feature set and certain XSAVE-enabled features have been
  enabled. If CPL > 0, execution of the MOV from CR4 instruction causes
  a general-protection fault (#GP). The following alternative mechanisms
  allow software to discover the enabling of the XSAVE feature set
  regardless of CPL:

  * The value of CR4.OSXSAVE is returned in CPUID.1:ECX.OSXSAVE[bit 27].
    If software determines that CPUID.1:ECX.OSXSAVE = 1, the processor
    supports the XSAVE feature set and the feature set has been enabled in
    CR4.

  * Executing the XGETBV instruction with ECX = 0 returns the value of
    XCR0 in EDX:EAX. XGETBV can be executed if CR4.OSXSAVE = 1 (if
    CPUID.1:ECX.OSXSAVE = 1), regardless of CPL.

> +                uint64_t host_xcr0 = xgetbv(0);
> +                supp_xcr0 &= host_xcr0;
> +            }
>              eax &= supp_xcr0;

I think instead of the patch you can do:
-          if (idx == 0) {
+          if (idx == 0 && (ecx & CPUID_EXT_OSXSAVE)) {

That'd keep host values returned from CPUID on platforms that don't
support XSAVE.

Thanks,
Roman

>          } else if (idx == 1) {
>              hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
> -- 
> 2.20.1 (Apple Git-117)
> 

