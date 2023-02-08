Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5468F14F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlpL-0000Wl-6Z; Wed, 08 Feb 2023 09:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pPlpI-0000WX-Ez
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:53:36 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pPlpF-0005a2-Pu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675868013; x=1707404013;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L5AWU7glwKuBpvRARKmZlmfznpjdLw50JVGXjcp2As0=;
 b=IvhapitOrF4wY0jHUk8D8Yt4rg8CmFWd/kYxf6l+yl3DWHebI/jTdwaM
 ZYKxtd+v0FNORoivNlNxgwC/VwZinBCd+Vw8EhoEj/VjJY1gaIQd95fP8
 1tTeh8+Xk5FCQ1fsQIWTibaEOJ3Chmc7wxhCDxcD/9S/odV3nCB08sPSC
 q5J70qPez3xGPaLDbLPY72tFvCnr4Gr4JZrzgDBzjmimcyab1ktbhEPuk
 XFVguihaL1K14LH6J0gzneh8AckRmVLN8LB+qzW3b4KU7lNQOlGqHvfHi
 ChoOlP77WBSj84oqEy3JifPbkArxwoNcYg3+kOzsaonMGDODtVCQuQYGc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="357210333"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="357210333"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:53:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617233041"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="617233041"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.252])
 ([10.249.169.252])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:53:24 -0800
Message-ID: <8c66c0b1-45df-0d07-3cd2-f10b98fb4362@intel.com>
Date: Wed, 8 Feb 2023 22:53:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/6] Support for new CPU model SapphireRapids
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, Lei Wang <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 berrange@redhat.com, yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230202120533.37972585@imammedo.users.ipa.redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230202120533.37972585@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=xiaoyao.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/2/2023 7:05 PM, Igor Mammedov wrote:
> On Fri,  6 Jan 2023 00:38:20 -0800
> Lei Wang <lei4.wang@intel.com> wrote:
> 
>> This series aims to add a new CPU model SapphireRapids, and tries to
>> address the problem stated in
>> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
>> so that named CPU model can define its own AMX values, and QEMU won't
>> pass the wrong AMX values to KVM in future platforms if they have
>> different values supported.
>>
>> The original patch is
>> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.
> 
> MultiBitFeatureInfo looks like an interesting
> idea but among fixing whatever issues this has atm,
> you'd probably need to introduce a new  qdev_bitfield property
> infrastructure so that such features could be treated like any
> other qdev properties.
> Also when MultiBitFeatureInfo is added, one should convert all
> other usecases where it's applicable (not only for new code)
> so that we would end up with consolidated approach instead of
> zoo mess.
> 
> I'm not sure all MultiBitFeatureInfo complexity is necessary
> just for adding a new CPU model, I'd rather use ad hoc approach
> that we were using before for non boolean features.

We have to introduce MultiBitFeatureInfo for SPR cpu model if AMX is 
supposed to be included with SPR cpu model. In fact, MultiBitFeatureInfo 
should have been introduced when adding AMX virtualization support in 
QEMU. I.e., current AMX virtualization design is problematic just like 
Intel-PT virtualization.

Ideally, this series can be split as two: 1) Fix AMX virtualization (by 
introducing MultiBitFeatureInfo), 2) define SPR cpu model.

> 
> And then try to develop MultiBitFeatureInfo & co as a separate
> series to demonstrate how much it will improve current
> cpu models definitions.
> 
> PS:
>   'make check-acceptance' are broken with this
> 
>> ---
>>
>> Changelog:
>>
>> v3:
>>   - Rebase on the latest QEMU (d1852caab131ea898134fdcea8c14bc2ee75fbe9).
>>   - v2: https://lore.kernel.org/qemu-devel/20221102085256.81139-1-lei4.wang@intel.com/
>>
>> v2:
>>   - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
>>     unsupported.
>>   - Remove unnecessary function definition and make code cleaner.
>>   - Fix some typos.
>>   - v1: https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t
>>
>>
>> Lei Wang (6):
>>    i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
>>    i386: Remove unused parameter "uint32_t bit" in
>>      feature_word_description()
>>    i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
>>      features
>>    i386: Mask and report unavailable multi-bit feature values
>>    i386: Initialize AMX CPUID leaves with corresponding env->features[]
>>      leaves
>>    i386: Add new CPU model SapphireRapids
>>
>>   target/i386/cpu-internal.h |  11 ++
>>   target/i386/cpu.c          | 311 +++++++++++++++++++++++++++++++++++--
>>   target/i386/cpu.h          |  16 ++
>>   3 files changed, 322 insertions(+), 16 deletions(-)
>>
>>
>> base-commit: d1852caab131ea898134fdcea8c14bc2ee75fbe9
> 


