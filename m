Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C996A4308
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdj7-0008SA-PT; Mon, 27 Feb 2023 08:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWdj5-0008RA-8A
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:39:35 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWdj3-0001Nc-H3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677505173; x=1709041173;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kgw1IdayYT0BQOSv00Cxa9YCJVYWef08UdTPzJOoEZs=;
 b=mf2x4Sxxz38kgdssS3Loz4SViYazdaTx6T1Sk21/SczU7rG9/HEa0dCO
 kkxWPR24HEfXrljPcykDl/77JQFO6jCSZ4R0MYfM7S5HNmVYTBDYVTNxg
 akFqKIPwDix2xGg4P4famO+SuLJsW2nz0IyXy2pptUv5pYP3J+ZPX0UBJ
 tPxM20Gdi4OwgJ9B8DhXPjkmNwRkwS/LJogWJdZ7o8oEZsOc+JBFTlar5
 6n8/tJkFziyyO5fAWxsFk4rE4+TJOw9wLczn3kvztFYkSJsS9lb3Whj+G
 fU4IkEUxHtH9G25hK7CYzJfhdapkuVsZjxU2iDA9pvSJdaL7z0QnWUN7X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313529831"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="313529831"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:39:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706197233"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="706197233"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.190])
 ([10.255.28.190])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:39:29 -0800
Message-ID: <a9f521af-2c48-c2ea-b80b-db444fb81925@intel.com>
Date: Mon, 27 Feb 2023 21:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/4] target/i386: add FZRM, FSRS, FSRC
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
 <20230227101332.636203-3-pbonzini@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230227101332.636203-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/27/2023 6:13 PM, Paolo Bonzini wrote:
> These are three more markers for string operation optimizations.
> They can all be added to TCG, whose string operations are more or
> less as fast as they can be for short lengths.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   target/i386/cpu.c | 7 ++++---
>   target/i386/cpu.h | 7 +++++++
>   2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 34e2cead870e..26ec6e9da754 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -662,7 +662,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
>             /* CPUID_7_0_ECX_OSPKE is dynamic */ \
>             CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
>   #define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
> -#define TCG_7_1_EAX_FEATURES 0
> +#define TCG_7_1_EAX_FEATURES (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | \
> +          CPUID_7_1_EAX_FSRC)
>   #define TCG_APM_FEATURES 0
>   #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
>   #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
> @@ -872,8 +873,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>           .feat_names = {
>               NULL, NULL, NULL, NULL,
>               "avx-vnni", "avx512-bf16", NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> +            NULL, NULL, "fzrm", "fsrs",
> +            "fsrc", NULL, NULL, NULL,
>               NULL, NULL, NULL, NULL,
>               NULL, NULL, NULL, NULL,
>               NULL, NULL, NULL, NULL,
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d4bc19577a21..e0703feb5ed0 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -900,6 +900,13 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>   #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
>   /* AVX512 BFloat16 Instruction */
>   #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
> +/* Fast Zero REP MOVS */
> +#define CPUID_7_1_EAX_FZRM              (1U << 10)
> +/* Fast Short REP STOS */
> +#define CPUID_7_1_EAX_FSRS              (1U << 11)
> +/* Fast Short REP CMPS/SCAS */
> +#define CPUID_7_1_EAX_FSRC              (1U << 12)
> +
>   /* XFD Extend Feature Disabled */
>   #define CPUID_D_1_EAX_XFD               (1U << 4)
>   


