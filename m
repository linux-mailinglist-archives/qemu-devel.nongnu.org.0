Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918D68F102
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:40:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlbj-0003Q9-2r; Wed, 08 Feb 2023 09:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pPlbb-0003MY-MR
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:39:28 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pPlbX-0007k3-RR
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675867163; x=1707403163;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jiFrQDKOqmQTDrb7R/nPaPNlvwLLNaxoVOkZR2bIi9Y=;
 b=H+dq7z9+iFz+tUljoyvImlR10xDDFgAdV1ZK4hRk9QjwzdZ04+UgGjeE
 x81Vi4sFnEudjEJIM/9ZjkkFi/a2k4ig4PDgQRz/69GyoJvUj+NUHAMG1
 0RuRwbEdn4wf4MVIygqEKfm+rt3dUIQhK/TSGR2+hk+wKsfZIB6+33ryY
 kwp00BS7Due6cAA5C2mrlxfP/bFjJgHBtclC7LpNF5xhrH/lTqZ1u3Y7U
 Xn6rBvMf9i8ZBR+A6pG5ZpjOAY3qpoxnStyYtXOEzEQPaDcYzSbnhxG9E
 /nI0ro11gI4CONn7F8gRMkVguAWVtMgWp5duw+Qd1NwvMezqUkf5RKst8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="327508056"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="327508056"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:39:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756076633"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="756076633"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.252])
 ([10.249.169.252])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:39:18 -0800
Message-ID: <37f7ea7f-6021-2c96-850e-63cb3622716c@intel.com>
Date: Wed, 8 Feb 2023 22:39:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/6] i386: Introduce new struct "MultiBitFeatureInfo"
 for multi-bit features
Content-Language: en-US
To: Lei Wang <lei4.wang@intel.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com, yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-4-lei4.wang@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230106083826.5384-4-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-1.146,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/6/2023 4:38 PM, Lei Wang wrote:
> Some features use multiple CPUID bits to form a value to be used, e.g.,
> CPUID(0x1E,0):EBX[23:08] is regarded as the tmul_maxn value for AMX.
> Introduce a new struct "MultiBitFeatureInfo" to hold the information for
> those features and create a corresponding member in struct FeatureWordInfo,
> so that the infomation can be assigned for each item in feature_word_info
> array and used in the future.
> 
> Signed-off-by: Lei Wang <lei4.wang@intel.com>
> ---
>   target/i386/cpu-internal.h |  9 +++++++
>   target/i386/cpu.c          | 54 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)
> 
> diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
> index 9baac5c0b4..66b3d66cb4 100644
> --- a/target/i386/cpu-internal.h
> +++ b/target/i386/cpu-internal.h
> @@ -25,6 +25,13 @@ typedef enum FeatureWordType {
>      MSR_FEATURE_WORD,
>   } FeatureWordType;
>   
> +typedef struct MultiBitFeatureInfo {
> +    const char *feat_name;
> +    uint64_t mask;
> +    unsigned high_bit_position;
> +    unsigned low_bit_position;
> +} MultiBitFeatureInfo;
> +
>   typedef struct FeatureWordInfo {
>       FeatureWordType type;
>       /* feature flags names are taken from "Intel Processor Identification and
> @@ -51,6 +58,8 @@ typedef struct FeatureWordInfo {
>       uint64_t migratable_flags; /* Feature flags known to be migratable */
>       /* Features that shouldn't be auto-enabled by "-cpu host" */
>       uint64_t no_autoenable_flags;
> +    unsigned num_multi_bit_features;
> +    MultiBitFeatureInfo *multi_bit_features;
>   } FeatureWordInfo;
>   
>   extern FeatureWordInfo feature_word_info[];
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 883098bc5a..88aa780566 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1011,6 +1011,21 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>           },
>           .migratable_flags = CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK |
>               CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK,
> +        .num_multi_bit_features = 2,
> +        .multi_bit_features = (MultiBitFeatureInfo[]){
> +            {
> +                .feat_name = "total_tile_bytes",
> +                .mask = CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK,
> +                .high_bit_position = 15,
> +                .low_bit_position = 0,
> +            },
> +            {
> +                .feat_name = "bytes_per_tile",
> +                .mask = CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK,
> +                .high_bit_position = 31,
> +                .low_bit_position = 16,
> +            },
> +        },

without Patch 4, we have no idea how MultiBitFeatureInfo will be used.

you can

1) introduce the whole MultiBitFeatureInfo infrastructure in this patch 
by merging Patch 4.

2) define real user of MultiBitFeatureInfo such as AMX in a seperate patch.

>       },
>       [FEAT_1D_1_EBX] = {
>           .type = CPUID_FEATURE_WORD,
> @@ -1021,6 +1036,21 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>           },
>           .migratable_flags = CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK |
>               CPUID_AMX_PALETTE_1_MAX_NAMES_MASK,
> +        .num_multi_bit_features = 2,
> +        .multi_bit_features = (MultiBitFeatureInfo[]){
> +            {
> +                .feat_name = "bytes_per_row",
> +                .mask = CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK,
> +                .high_bit_position = 15,
> +                .low_bit_position = 0,
> +            },
> +            {
> +                .feat_name = "max_names",
> +                .mask = CPUID_AMX_PALETTE_1_MAX_NAMES_MASK,
> +                .high_bit_position = 31,
> +                .low_bit_position = 16,
> +            },
> +        },
>       },
>       [FEAT_1D_1_ECX] = {
>           .type = CPUID_FEATURE_WORD,
> @@ -1030,6 +1060,15 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>               .reg = R_ECX,
>           },
>           .migratable_flags = CPUID_AMX_PALETTE_1_MAX_ROWS_MASK,
> +        .num_multi_bit_features = 1,
> +        .multi_bit_features = (MultiBitFeatureInfo[]){
> +            {
> +                .feat_name = "max_rows",
> +                .mask = CPUID_AMX_PALETTE_1_MAX_ROWS_MASK,
> +                .high_bit_position = 15,
> +                .low_bit_position = 0,
> +            },
> +        },
>       },
>       [FEAT_1E_0_EBX] = {
>           .type = CPUID_FEATURE_WORD,
> @@ -1040,6 +1079,21 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>           },
>           .migratable_flags = CPUID_AMX_TMUL_MAX_K_MASK |
>               CPUID_AMX_TMUL_MAX_N_MASK,
> +        .num_multi_bit_features = 2,
> +        .multi_bit_features = (MultiBitFeatureInfo[]){
> +            {
> +                .feat_name = "tmul_maxk",
> +                .mask = CPUID_AMX_TMUL_MAX_K_MASK,
> +                .high_bit_position = 7,
> +                .low_bit_position = 0,
> +            },
> +            {
> +                .feat_name = "tmul_maxn",
> +                .mask = CPUID_AMX_TMUL_MAX_N_MASK,
> +                .high_bit_position = 23,
> +                .low_bit_position = 8,
> +            },
> +        },
>       },
>       /*Below are MSR exposed features*/
>       [FEAT_ARCH_CAPABILITIES] = {


