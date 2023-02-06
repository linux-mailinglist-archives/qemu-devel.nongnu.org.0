Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568CA68B69B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 08:45:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwBt-0006wa-Us; Mon, 06 Feb 2023 02:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1pOwBr-0006nt-8t
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 02:45:27 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1pOwBp-0007u8-5o
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 02:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675669525; x=1707205525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=twTN2ngfAj+EnnouzgdeQ/7oTcxx8uxXez11jcVoi9Y=;
 b=N83bqQssy0A5JtIFb3zHkst3IaWiJXPyt8T0nD8T5T/XNvNUAn1MZmPQ
 +DLNaQ95U0kzRe7XbFutobRFs85t8dPmPMTsN8DLITDm0xfh90ISZX9mB
 Af7Yd1cjxOuUQltmY6e2OnuzEkgsktu0swFiG8V4MRFgdso7ewu1cZs5y
 iyETmetPN2nVznuJ0sxZqNnMEG+yrxE/yN+jviLfg5+G7t79KzpSfP2VI
 kc3SC+51yTZcclxplddidoF10ORrVbQyo6YbWk39JID1uMBrPcuifSpdq
 BzchuWy8JRnFI3MHW/TxAke/l4MpQAF5Dd8vTGaJ1rYeQFC2J2XV1kbOE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="356506181"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="356506181"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2023 23:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790355495"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="790355495"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2023 23:45:20 -0800
Date: Mon, 6 Feb 2023 15:45:19 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Lei Wang <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, imammedo@redhat.com,
 dgilbert@redhat.com, berrange@redhat.com, xiaoyao.li@intel.com,
 yang.zhong@linux.intel.com
Subject: Re: [PATCH v3 1/6] i386: Introduce FeatureWordInfo for AMX CPUID
 leaf 0x1D and 0x1E
Message-ID: <20230206074519.kohp6devu4t7prwf@yy-desk-7060>
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-2-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106083826.5384-2-lei4.wang@intel.com>
User-Agent: NeoMutt/20171215
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=yuan.yao@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 06, 2023 at 12:38:21AM -0800, Lei Wang wrote:
> CPUID leaf 0x1D and 0x1E enumerate tile and TMUL information for AMX.
>
> Introduce FeatureWord FEAT_1D_1_EAX, FEAT_1D_1_EBX, FEAT_1D_1_ECX and
> FEAT_1E_0_EBX. Thus these features of AMX can be expanded when
> "-cpu host/max" and can be configured in named CPU model.
>
> Signed-off-by: Lei Wang <lei4.wang@intel.com>

Reviewed-by: Yao Yuan <yuan.yao@intel.com>

> ---
>  target/i386/cpu.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++
>  target/i386/cpu.h | 12 +++++++++++
>  2 files changed, 67 insertions(+)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 3410e5e470..b6d1247e5e 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1002,6 +1002,45 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          },
>          .tcg_features = ~0U,
>      },
> +    [FEAT_1D_1_EAX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0x1D,
> +            .needs_ecx = true, .ecx = 1,
> +            .reg = R_EAX,
> +        },
> +        .migratable_flags = CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK |
> +            CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK,
> +    },
> +    [FEAT_1D_1_EBX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0x1D,
> +            .needs_ecx = true, .ecx = 1,
> +            .reg = R_EBX,
> +        },
> +        .migratable_flags = CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK |
> +            CPUID_AMX_PALETTE_1_MAX_NAMES_MASK,
> +    },
> +    [FEAT_1D_1_ECX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0x1D,
> +            .needs_ecx = true, .ecx = 1,
> +            .reg = R_ECX,
> +        },
> +        .migratable_flags = CPUID_AMX_PALETTE_1_MAX_ROWS_MASK,
> +    },
> +    [FEAT_1E_0_EBX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0x1E,
> +            .needs_ecx = true, .ecx = 0,
> +            .reg = R_EBX,
> +        },
> +        .migratable_flags = CPUID_AMX_TMUL_MAX_K_MASK |
> +            CPUID_AMX_TMUL_MAX_N_MASK,
> +    },
>      /*Below are MSR exposed features*/
>      [FEAT_ARCH_CAPABILITIES] = {
>          .type = MSR_FEATURE_WORD,
> @@ -1371,6 +1410,22 @@ static FeatureDep feature_dependencies[] = {
>          .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
>          .to = { FEAT_14_0_ECX,              ~0ull },
>      },
> +    {
> +        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
> +        .to = { FEAT_1D_1_EAX,              ~0ull },
> +    },
> +    {
> +        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
> +        .to = { FEAT_1D_1_EBX,              ~0ull },
> +    },
> +    {
> +        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
> +        .to = { FEAT_1D_1_ECX,              ~0ull },
> +    },
> +    {
> +        .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_AMX_TILE },
> +        .to = { FEAT_1E_0_EBX,              ~0ull },
> +    },
>      {
>          .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
>          .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d4bc19577a..3e3e0cfe59 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -585,6 +585,14 @@ typedef enum X86Seg {
>                                   XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK | \
>                                   XSTATE_XTILE_CFG_MASK | XSTATE_XTILE_DATA_MASK)
>
> +#define CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK 0xffffU
> +#define CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK   (0xffffU << 16)
> +#define CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK    0xffffU
> +#define CPUID_AMX_PALETTE_1_MAX_NAMES_MASK        (0xffffU << 16)
> +#define CPUID_AMX_PALETTE_1_MAX_ROWS_MASK         0xffffU
> +#define CPUID_AMX_TMUL_MAX_K_MASK                 0xffU
> +#define CPUID_AMX_TMUL_MAX_N_MASK                 (0xffffU << 8)
> +
>  /* CPUID feature words */
>  typedef enum FeatureWord {
>      FEAT_1_EDX,         /* CPUID[1].EDX */
> @@ -605,6 +613,10 @@ typedef enum FeatureWord {
>      FEAT_6_EAX,         /* CPUID[6].EAX */
>      FEAT_XSAVE_XCR0_LO, /* CPUID[EAX=0xd,ECX=0].EAX */
>      FEAT_XSAVE_XCR0_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
> +    FEAT_1D_1_EAX,      /* CPUID[EAX=0x1d,ECX=1].EAX */
> +    FEAT_1D_1_EBX,      /* CPUID[EAX=0x1d,ECX=1].EBX */
> +    FEAT_1D_1_ECX,      /* CPUID[EAX=0x1d,ECX=1].ECX */
> +    FEAT_1E_0_EBX,      /* CPUID[EAX=0x1e,ECX=0].EBX */
>      FEAT_ARCH_CAPABILITIES,
>      FEAT_CORE_CAPABILITY,
>      FEAT_PERF_CAPABILITIES,
> --
> 2.34.1
>
>

