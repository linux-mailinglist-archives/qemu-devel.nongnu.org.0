Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E242068B699
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 08:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwA9-0005yy-Hs; Mon, 06 Feb 2023 02:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1pOwA2-0005yF-Io
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 02:43:37 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1pOw9y-0007av-Ul
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 02:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675669410; x=1707205410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dCJfA4nIv+qjLcPLPnVOQfzYF3vYqVKp3I2U6GyMThc=;
 b=irX6McBbsXYDDphy36Mos49KkpefAmpbL0Vq6pXv3yu1eUQSBj73F6Zm
 fLKFfyc+ZMFx617gaAGzzKBlJFgc3JPg7pMhjC9lHOztGiSU06b5KL5Rp
 v/xJBlp0sb8P4FteWVCO03p0KlaY05nvXuHfgqWdo7hKh7SeCs+dgjxX6
 i1IA/HzLZ7IkCI6cVD5xKRZqwVLANYwB3YFa2dSONE6qSj/d6sDoBLjxs
 Ko+wd+MUzkQY/R3qjG46KoHty1yncpmuFlLHSGHVDuYkVcH9SBIrLytaS
 fZovSAJ45fwSt8hAhkx23naF7WzKpscqeif1/mlL6J9/oH4+bIkpKJpkm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308791922"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="308791922"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2023 23:43:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="775082321"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="775082321"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
 by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2023 23:43:20 -0800
Date: Mon, 6 Feb 2023 15:43:20 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Lei Wang <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, imammedo@redhat.com,
 dgilbert@redhat.com, berrange@redhat.com, xiaoyao.li@intel.com,
 yang.zhong@linux.intel.com
Subject: Re: [PATCH v3 4/6] i386: Mask and report unavailable multi-bit
 feature values
Message-ID: <20230206074320.bkeuh3eep7kauhg7@yy-desk-7060>
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-5-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106083826.5384-5-lei4.wang@intel.com>
User-Agent: NeoMutt/20171215
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=yuan.yao@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 06, 2023 at 12:38:24AM -0800, Lei Wang wrote:
> Some feature words, e.g., feature words in AMX-related CPUID leaf 0x1D and
> 0x1E are not bit-wise but multiple bits represents one value. Handle this
> situation when the values specified are not the same as which are reported
> by KVM. The handling includes:
>
>  - The responsibility of masking bits and giving warnings are delegated to
>    the feature enabler. A framework is also provided to enable this.
>  - To simplify the initialization, a default function is provided if the
>    the function is not specified.
>
> The reason why delegating this responsibility rather than just marking
> them as zeros when they are not same is because different multi-bit
> features may have different logic, which is case by case, for example:
>
>  1. CPUID.0x14_0x1:EBX[15:0]. Even though it's multi-bits field, it's a
>     bitmap and each bit represents a separate capability.
>
>  2. CPUID.0x14_0x1:EAX[2:0] represents the number of configurable Address
>     Ranges. 3 bits as a whole to represent a integer value. It means the
>     maximum capability of HW. If KVM reports M, then M to 0 is legal
>     value to configure (because KVM can emulate each value correctly).
>
>  3. CPUID.0x1D_0x1:EAX[31:16] represents palette 1 bytes_per_tile. 16 bits
>     as a whole represent an integer value. It's not like case 2 and SW
>     needs to configure the same value as reported. Because it's not
>     possible for SW to configure to a different value and KVM cannot
>     emulate it.
>
> So marking them blindly as zeros is incorrect, and delegating this
> responsibility can let each multi-bit feature have its own way to mask bits.
>
> Signed-off-by: Lei Wang <lei4.wang@intel.com>
> ---
>  target/i386/cpu-internal.h |  2 ++
>  target/i386/cpu.c          | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
> index 66b3d66cb4..83c7b53926 100644
> --- a/target/i386/cpu-internal.h
> +++ b/target/i386/cpu-internal.h
> @@ -30,6 +30,8 @@ typedef struct MultiBitFeatureInfo {
>      uint64_t mask;
>      unsigned high_bit_position;
>      unsigned low_bit_position;
> +    void (*mark_unavailable_multi_bit)(X86CPU *cpu, FeatureWord w, int index,
> +                                       const char *verbose_prefix);
>  } MultiBitFeatureInfo;
>
>  typedef struct FeatureWordInfo {
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 88aa780566..e638a31d34 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4377,6 +4377,28 @@ static bool x86_cpu_have_filtered_features(X86CPU *cpu)
>      return false;
>  }
>
> +static void mark_unavailable_multi_bit_default(X86CPU *cpu, FeatureWord w,
> +                                               int index,
> +                                               const char *verbose_prefix)
> +{
> +    FeatureWordInfo *f = &feature_word_info[w];
> +    g_autofree char *feat_word_str = feature_word_description(f);
> +    uint64_t host_feat = x86_cpu_get_supported_feature_word(w, false);
> +    MultiBitFeatureInfo mf = f->multi_bit_features[index];
> +
> +    if ((cpu->env.features[w] & mf.mask) &&

With this checking bits are all 0 but covered by mf.mask's range are skippped,
even if they're different from the host_feat, please check whether it's desried
behavior.

> +        ((cpu->env.features[w] ^ host_feat) & mf.mask)) {
> +        if (!cpu->force_features) {
> +            cpu->env.features[w] &= ~mf.mask;
> +        }
> +        cpu->filtered_features[w] |= mf.mask;
> +        if (verbose_prefix)
> +            warn_report("%s: %s.%s [%u:%u]", verbose_prefix, feat_word_str,
> +                        mf.feat_name, mf.high_bit_position,
> +                        mf.low_bit_position);
> +    }
> +}
> +
>  static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>                                        const char *verbose_prefix)
>  {
> @@ -6442,6 +6464,20 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>              x86_cpu_get_supported_feature_word(w, false);
>          uint64_t requested_features = env->features[w];
>          uint64_t unavailable_features = requested_features & ~host_feat;
> +        FeatureWordInfo f = feature_word_info[w];
> +        int i;
> +
> +        for (i = 0; i < f.num_multi_bit_features; i++) {
> +            MultiBitFeatureInfo mf = f.multi_bit_features[i];
> +            if (mf.mark_unavailable_multi_bit) {
> +                mf.mark_unavailable_multi_bit(cpu, w, i, prefix);
> +            } else {
> +                mark_unavailable_multi_bit_default(cpu, w, i, prefix);
> +            }
> +
> +            unavailable_features &= ~mf.mask;
> +        }
> +
>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>      }
>
> --
> 2.34.1
>
>

