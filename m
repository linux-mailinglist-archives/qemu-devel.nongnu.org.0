Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FA56B27E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 08:04:40 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9h6U-0003Rv-Rl
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 02:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o9h4g-0002km-K7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 02:02:46 -0400
Received: from mga17.intel.com ([192.55.52.151]:21890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1o9h4e-0005sw-5t
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 02:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657260164; x=1688796164;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f4J2eVou6cKWBKhORg7hWmubaWHRaoQ4S25YOdBgGfg=;
 b=GeTCutAkzyhju0uOWD9dcLdplKO105MitoCiWVX9xAZHVMQfMZvV5/OI
 fdQjULPFQMYRKE48Th0lpbmlfIsBRDR65fSgzMcLJYzsMM0NuP3FesXTd
 1UwsOcPb3kgvuUW6ld8WgpOjhyTcX4J21j6C36bMur7pK8LC0gRa7z2Jr
 y2Gvxm0Dj6yf3+q5FUMlyTCYL+GGhqAWJ4gW6J56BjNaWyuJfWHV6iQD3
 JxENi1+1r8yxPPCWX6yB6jjjPOAvkPowVhKGkPJurCPleVjC4IKVrYeUb
 6pr5ejSZTJostN/bqH6AauvpqZGQ0ooOkc/t6/SuKwH8h0RJG88k6ueKE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264613015"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="264613015"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 23:02:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="651436394"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.131])
 ([10.249.175.131])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 23:02:36 -0700
Message-ID: <e9129a16-c568-7cb2-1a4a-b28d8f79ea4f@intel.com>
Date: Fri, 8 Jul 2022 14:02:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] target/i386: Restore TSX features with taa-no
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, ehabkost@redhat.com, xiangfeix.ma@intel.com
References: <20220708054203.194978-1-zhenzhong.duan@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220708054203.194978-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/2022 1:42 PM, Zhenzhong Duan wrote:
> In L1 kernel side, taa-no is cleared because RTM is disabled
> which will lead to below warning when starting L2 qemu:
> 
> "warning: host doesn't support requested feature: MSR(10AH).taa-no [bit 8]"
> 
> If host isn't susceptible to TSX Async Abort (TAA) vulnerabilities,
> exposing TSX to L2 may help performance too.

If L1 doesn't see RTM, how can it expose it to L2?

> Fixes: d965dc35592d ("target/i386: Add ARCH_CAPABILITIES related bits into Icelake-Server CPU model")
> Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   target/i386/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6a57ef13af86..bda2569c73cc 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3423,6 +3423,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>               {
>                   .version = 3,
>                   .props = (PropValue[]) {
> +                    /* Restore TSX features removed by -v2 above */
> +                    { "hle", "on" },
> +                    { "rtm", "on" },
>                       { "arch-capabilities", "on" },
>                       { "rdctl-no", "on" },
>                       { "ibrs-all", "on" },


