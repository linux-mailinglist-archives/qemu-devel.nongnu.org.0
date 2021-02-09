Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51506314CAC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:16:18 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Q49-0006gj-5j
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9Q2i-00068K-I3
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:14:48 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:39962 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9Q2f-0005bc-Fh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:14:48 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 49FEE4127A;
 Tue,  9 Feb 2021 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1612865682;
 x=1614680083; bh=q4ZrxU62cnlCnrc/QsqKjiP07C7Xc70G5xxr2lWZoZI=; b=
 HlzGnt/rEYUlqYa27btpllLY28IPLD/7GmbLxcnZIc9qIssN61w6D8QebVXCgOJ5
 JCdsLYQPMu+UeAEfAryAwopATzF/fS6dZOkBaJeBu1AzGeGVQzGwI5JB0KMgUJ3W
 5tKwhRTs81lUAYXN3TzXJpJjfYNK/k/K5SVsXnor14s=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmRTws_yFqr6; Tue,  9 Feb 2021 13:14:42 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9BDEB411D9;
 Tue,  9 Feb 2021 13:14:41 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 13:14:41 +0300
Date: Tue, 9 Feb 2021 13:14:40 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH] hvf: Fetch cr4 before evaluating CPUID(1)
Message-ID: <YCJgkHDFbWOeJxOf@SPB-NB-133.local>
References: <20210123004129.6364-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210123004129.6364-1-agraf@csgraf.de>
X-Originating-IP: [172.17.128.60]
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Asad Ali <asad@osaro.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 23, 2021 at 01:41:29AM +0100, Alexander Graf wrote:
> The CPUID function 1 has a bit called OSXSAVE which tells user space the
> status of the CR4.OSXSAVE bit. Our generic CPUID function injects that bit
> based on the status of CR4.
> 
> With Hypervisor.framework, we do not synchronize full CPU state often enough
> for this function to see the CR4 update before guest user space asks for it.
> 
> To be on the save side, let's just always synchronize it when we receive a
> CPUID(1) request. That way we can set the bit with real confidence.
> 
> Reported-by: Asad Ali <asad@osaro.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/i386/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 08b4adecd9..f660b829ac 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -426,6 +426,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>              uint32_t rcx = (uint32_t)rreg(cpu->hvf->fd, HV_X86_RCX);
>              uint32_t rdx = (uint32_t)rreg(cpu->hvf->fd, HV_X86_RDX);
>  
> +            if (rax == 1) {
> +                /* CPUID1.ecx.OSXSAVE needs to know CR4 */
> +                env->cr[4] = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR4);
> +            }
>              cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
>  
>              wreg(cpu->hvf->fd, HV_X86_RAX, rax);
> -- 
> 2.24.3 (Apple Git-128)
> 

The fix is based off hvf-arm patch series and doesn't build on
master branch because of "cpu->hvf->fd" has to be "cpu->hvf_fd".
I've corrected the issue and resolved conflicts with another patch in
hvf-queue. So, it's been queued.

Thanks,
Roman

