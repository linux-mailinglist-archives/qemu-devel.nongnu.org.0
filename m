Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED81D690043
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:17:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0E5-0007Og-Ve; Thu, 09 Feb 2023 01:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pQ0Do-0007No-0F
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:15:52 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pQ0Dl-0006B4-QE
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675923349; x=1707459349;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k7Ew0JGG3YIFR2ch2nYbF0c5gQLydijK08afxiTmfjs=;
 b=aBMYFKOtz/8CSwc4kIc7/Xype/OsV6R+Fh0Jv/66PXNFg6HcqrNDbCwJ
 k7S8NQPhUXEmwHP7BVvzadR1TlWYlONl/BAJEwuUwys61Tiw6nTxMY7kd
 hP8dtlSAnYXZ1YHfOvHzaIW9VsKa/crYLTq0omKOSH3QoGh5Slek1t/LL
 WvAntfzyaoJPvgNXlqz6ZCgyqp1LaoSzQfUfnH4AMSYBc3bidCGu2uFbK
 Hb6VmwKSZzMaPZx0dtSTifoUK9oHEV6Xrm/Eip3za2cClF/gxGgMwuNlj
 a7PvPxkOoYEsLQ9ABZ+tTXeVTS4hzlulACUY/fOb/Pa6H5DrUxOY5iVwq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="392414915"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="392414915"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 22:15:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660888274"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="660888274"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.95])
 ([10.238.212.95])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 22:15:44 -0800
Message-ID: <15cef658-e2b1-a264-1e63-1524335e64a9@intel.com>
Date: Thu, 9 Feb 2023 14:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/6] i386: Mask and report unavailable multi-bit
 feature values
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, Yuan Yao <yuan.yao@linux.intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, imammedo@redhat.com,
 dgilbert@redhat.com, berrange@redhat.com, yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-5-lei4.wang@intel.com>
 <20230206074320.bkeuh3eep7kauhg7@yy-desk-7060>
 <d99625d9-af63-72d6-2cb9-8f2a1819b825@intel.com>
 <9cffc221-979b-ac71-d2ff-76a6f4698641@intel.com>
 <6ae0be93-edc8-97d8-04a8-4db2fa3fd291@intel.com>
 <2aba083e-451e-56bd-304a-4738388329e9@intel.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <2aba083e-451e-56bd-304a-4738388329e9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
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

On 2/9/2023 1:59 PM, Xiaoyao Li wrote:
> On 2/9/2023 12:21 PM, Wang, Lei wrote:
>>>>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>>>>> index 88aa780566..e638a31d34 100644
>>>>>> --- a/target/i386/cpu.c
>>>>>> +++ b/target/i386/cpu.c
>>>>>> @@ -4377,6 +4377,28 @@ static bool x86_cpu_have_filtered_features(X86CPU
>>>>>> *cpu)
>>>>>>        return false;
>>>>>>    }
>>>>>>
>>>>>> +static void mark_unavailable_multi_bit_default(X86CPU *cpu, FeatureWord w,
>>>>>> +                                               int index,
>>>>>> +                                               const char *verbose_prefix)
>>>>>> +{
>>>>>> +    FeatureWordInfo *f = &feature_word_info[w];
>>>>>> +    g_autofree char *feat_word_str = feature_word_description(f);
>>>>>> +    uint64_t host_feat = x86_cpu_get_supported_feature_word(w, false);
>>>>>> +    MultiBitFeatureInfo mf = f->multi_bit_features[index];
>>>>>> +
>>>>>> +    if ((cpu->env.features[w] & mf.mask) &&
>>>>> With this checking bits are all 0 but covered by mf.mask's range are skippped,
>>>>> even if they're different from the host_feat, please check whether it's
>>>>> desried
>>>>> behavior.
>>>> This is the intended design because there are quite a number of multi-bit
>>>> CPUIDs
>>>> should support passing all 0 to them.
>>> you didn't answer the question. The question is why the handling can be skipped
>>> when the value of multi-bit feature is 0.
>> I think the default function should handle the most common case, which is,
>> passing all 0 multi-bits to KVM is valid and shouldn't be warned. E.g, when we
>> are using some earlier CPU models which doesn't support AMX, we shouldn't be
>> warned that all 0 values don't match the CPUID reported by KVM.
>>
> 
> passing value 0 to KVM is valid, is not the reason why the handling can be skipped.
> 
> The correct reason is that when value is 0, it means the multi-bit feature is
> not enabled/requested. It's always legal and doesn't need any handling. So it
> can be just skipped.

Currently, we can say yes, but I doubt if there will be a multi-bit field in the
future that only accepts the non-zero value specified.

