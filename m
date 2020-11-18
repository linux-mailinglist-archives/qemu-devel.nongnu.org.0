Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553752B82AC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:10:37 +0100 (CET)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQya-0005mo-DW
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQwe-0004Nx-7H
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:08:36 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:33822 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQwc-0000US-4l
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:08:35 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 035704131B;
 Wed, 18 Nov 2020 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605719309;
 x=1607533710; bh=89at1W45qSv5+hxcF87rQeFONnq1CAVYjbXZxpPlsjQ=; b=
 j22O2RTB5XgJPznPhxEoUHOayemTCEaYDv/R8sWnglGMQcTWe1foXoDVWga8f0b0
 SEG8qcUOWuM9AvUm8DIRYz97Unm0ZLwZhfmIB7K8eNX2dJiNPRVkvJmfagyWD1ih
 l4Cfqgz5aD8lZy9LdGhQpe+GzawBe5VHJkgyXV7/o/8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfsdtfIUv5XZ; Wed, 18 Nov 2020 20:08:29 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8BF6D4127A;
 Wed, 18 Nov 2020 20:08:29 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Nov 2020 20:08:29 +0300
Date: Wed, 18 Nov 2020 20:08:28 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] hvf: Gate RDTSCP on CPU_BASED2_RDTSCP, not just
 CPU_BASED_TSC_OFFSET
Message-ID: <20201118170828.GF81070@SPB-NB-133.local>
References: <20201116200319.28138-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201116200319.28138-1-jrtc27@jrtc27.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 11:09:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 08:03:19PM +0000, Jessica Clarke wrote:
> Buglink: https://bugs.launchpad.net/qemu/+bug/1894836
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  target/i386/hvf/x86_cpuid.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index 16762b6eb4..fc1f87ec57 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -122,6 +122,10 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>                  CPUID_PAT | CPUID_PSE36 | CPUID_EXT2_MMXEXT | CPUID_MMX |
>                  CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
>                  CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
> +        hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
> +        if (!(cap & CPU_BASED2_RDTSCP)) {
> +            edx &= ~CPUID_EXT2_RDTSCP;
> +        }
>          hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
>          if (!(cap & CPU_BASED_TSC_OFFSET)) {
>              edx &= ~CPUID_EXT2_RDTSCP;
> -- 
> 2.28.0
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

