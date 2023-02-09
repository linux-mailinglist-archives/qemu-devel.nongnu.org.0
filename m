Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C868FC5F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 02:06:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPvN5-0003rC-FQ; Wed, 08 Feb 2023 20:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pPvN2-0003r1-UI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 20:05:05 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pPvMz-0007AZ-Qf
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 20:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675904701; x=1707440701;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GeP1Aufwo7qJMpEa0mVtkMpUhX4JF81df5fbLzuDnrw=;
 b=FWrkL7Ih3oZJWgAgF/XLpHV9uZXcjMnD6265jJRZIfHLSctRQl2YKsPZ
 gCmbW0slNaNEA/XynjpkZUJIgg3soi/dTPiyEzQ8aZjSpdgJEiXVfK0Uf
 IPZnOhZcs3h2ZdWhXJEQppcDuObPmw7pY4CbMrvRVM1PfeijYkCgE5YVj
 4CEFwLsiM8sAEqm9ZZ405wrawkrRbnZWuhUgCKCswstKMLSIs/pTlWDuB
 b0+HcKxKM6bKHS1QCrTrBUMW1VrFOBA87snX7Hx6Uk0J2/JMVIxbNwhyK
 lZT27N5NgZj1FFl7X13ZakltsO+3kQfy+/SIJ1zgqw958bB+2GcdR3ayz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394568824"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="394568824"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 17:04:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="736114845"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="736114845"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.95])
 ([10.238.212.95])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 17:04:54 -0800
Message-ID: <d99625d9-af63-72d6-2cb9-8f2a1819b825@intel.com>
Date: Thu, 9 Feb 2023 09:04:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/6] i386: Mask and report unavailable multi-bit
 feature values
To: Yuan Yao <yuan.yao@linux.intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, imammedo@redhat.com,
 dgilbert@redhat.com, berrange@redhat.com, xiaoyao.li@intel.com,
 yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-5-lei4.wang@intel.com>
 <20230206074320.bkeuh3eep7kauhg7@yy-desk-7060>
From: "Wang, Lei" <lei4.wang@intel.com>
Content-Language: en-US
In-Reply-To: <20230206074320.bkeuh3eep7kauhg7@yy-desk-7060>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei4.wang@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 2/6/2023 3:43 PM, Yuan Yao wrote:
> On Fri, Jan 06, 2023 at 12:38:24AM -0800, Lei Wang wrote:
>> Some feature words, e.g., feature words in AMX-related CPUID leaf 0x1D and
>> 0x1E are not bit-wise but multiple bits represents one value. Handle this
>> situation when the values specified are not the same as which are reported
>> by KVM. The handling includes:
>>
>>  - The responsibility of masking bits and giving warnings are delegated to
>>    the feature enabler. A framework is also provided to enable this.
>>  - To simplify the initialization, a default function is provided if the
>>    the function is not specified.
>>
>> The reason why delegating this responsibility rather than just marking
>> them as zeros when they are not same is because different multi-bit
>> features may have different logic, which is case by case, for example:
>>
>>  1. CPUID.0x14_0x1:EBX[15:0]. Even though it's multi-bits field, it's a
>>     bitmap and each bit represents a separate capability.
>>
>>  2. CPUID.0x14_0x1:EAX[2:0] represents the number of configurable Address
>>     Ranges. 3 bits as a whole to represent a integer value. It means the
>>     maximum capability of HW. If KVM reports M, then M to 0 is legal
>>     value to configure (because KVM can emulate each value correctly).
>>
>>  3. CPUID.0x1D_0x1:EAX[31:16] represents palette 1 bytes_per_tile. 16 bits
>>     as a whole represent an integer value. It's not like case 2 and SW
>>     needs to configure the same value as reported. Because it's not
>>     possible for SW to configure to a different value and KVM cannot
>>     emulate it.
>>
>> So marking them blindly as zeros is incorrect, and delegating this
>> responsibility can let each multi-bit feature have its own way to mask bits.
>>
>> Signed-off-by: Lei Wang <lei4.wang@intel.com>
>> ---
>>  target/i386/cpu-internal.h |  2 ++
>>  target/i386/cpu.c          | 36 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 38 insertions(+)
>>
>> diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
>> index 66b3d66cb4..83c7b53926 100644
>> --- a/target/i386/cpu-internal.h
>> +++ b/target/i386/cpu-internal.h
>> @@ -30,6 +30,8 @@ typedef struct MultiBitFeatureInfo {
>>      uint64_t mask;
>>      unsigned high_bit_position;
>>      unsigned low_bit_position;
>> +    void (*mark_unavailable_multi_bit)(X86CPU *cpu, FeatureWord w, int index,
>> +                                       const char *verbose_prefix);
>>  } MultiBitFeatureInfo;
>>
>>  typedef struct FeatureWordInfo {
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 88aa780566..e638a31d34 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4377,6 +4377,28 @@ static bool x86_cpu_have_filtered_features(X86CPU *cpu)
>>      return false;
>>  }
>>
>> +static void mark_unavailable_multi_bit_default(X86CPU *cpu, FeatureWord w,
>> +                                               int index,
>> +                                               const char *verbose_prefix)
>> +{
>> +    FeatureWordInfo *f = &feature_word_info[w];
>> +    g_autofree char *feat_word_str = feature_word_description(f);
>> +    uint64_t host_feat = x86_cpu_get_supported_feature_word(w, false);
>> +    MultiBitFeatureInfo mf = f->multi_bit_features[index];
>> +
>> +    if ((cpu->env.features[w] & mf.mask) &&
> 
> With this checking bits are all 0 but covered by mf.mask's range are skippped,
> even if they're different from the host_feat, please check whether it's desried
> behavior.

This is the intended design because there are quite a number of multi-bit CPUIDs
should support passing all 0 to them.

>> +        ((cpu->env.features[w] ^ host_feat) & mf.mask)) {
>> +        if (!cpu->force_features) {
>> +            cpu->env.features[w] &= ~mf.mask;
>> +        }
>> +        cpu->filtered_features[w] |= mf.mask;
>> +        if (verbose_prefix)
>> +            warn_report("%s: %s.%s [%u:%u]", verbose_prefix, feat_word_str,
>> +                        mf.feat_name, mf.high_bit_position,
>> +                        mf.low_bit_position);
>> +    }
>> +}
>> +
>>  static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>>                                        const char *verbose_prefix)
>>  {
>> @@ -6442,6 +6464,20 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>>              x86_cpu_get_supported_feature_word(w, false);
>>          uint64_t requested_features = env->features[w];
>>          uint64_t unavailable_features = requested_features & ~host_feat;
>> +        FeatureWordInfo f = feature_word_info[w];
>> +        int i;
>> +
>> +        for (i = 0; i < f.num_multi_bit_features; i++) {
>> +            MultiBitFeatureInfo mf = f.multi_bit_features[i];
>> +            if (mf.mark_unavailable_multi_bit) {
>> +                mf.mark_unavailable_multi_bit(cpu, w, i, prefix);
>> +            } else {
>> +                mark_unavailable_multi_bit_default(cpu, w, i, prefix);
>> +            }
>> +
>> +            unavailable_features &= ~mf.mask;
>> +        }
>> +
>>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>>      }
>>
>> --
>> 2.34.1
>>
>>

