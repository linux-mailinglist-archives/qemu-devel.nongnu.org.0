Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3EC575907
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 03:15:31 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC9vV-000825-Mp
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 21:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oC9uL-0006ei-DE
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 21:14:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:34844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oC9uI-000808-B7
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 21:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657847654; x=1689383654;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FauaFQ6SOABa4ptPcRmdKeT5KMQO2//mgiKgDMU4Wcc=;
 b=HOJZeNImZv8Am9Z9/RyTsMcTRT6POvxD+iWoAhmMA5TpAN2RaUTnoYiq
 Gr5TlJNLJ+LbqMh9Qkh1DEUOsWSVmKCbrKJ3PDD4VZFuhs0jedurW1KhY
 zytigtmfYi8cjUsHJXRlro41O07X16jPceXCefVecyB+5NR8+CCTV4acv
 h6Y/QE7eQ5mjHJ3IrsoN5ZTpfh875HKUw/O5tTRXw95VEbYU+o+9O8LK5
 ydRUqD//mGJ5t3sVbRD5nGMnAbKuo3O4NnZ7ZfEx01c8KiEf/4793WDzH
 aV0AN09y9IyXlNyzCG/xvd8WI66872rBggZy3vDqeW/Vj+/wB8UHVe9hM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="265462285"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="265462285"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 18:14:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="546481340"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.192])
 ([10.249.170.192])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 18:13:59 -0700
Message-ID: <e73117fa-2d90-fe26-a879-f4e77f7b1ea1@intel.com>
Date: Fri, 15 Jul 2022 09:13:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/i386: Restore TSX features with taa-no
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, xiangfeix.ma@intel.com, seanjc@google.com
References: <20220714053631.417152-1-zhenzhong.duan@intel.com>
 <e7ec3a99-2c2c-81b7-9f02-80958dce5fbe@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <e7ec3a99-2c2c-81b7-9f02-80958dce5fbe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 7/14/2022 3:59 PM, Paolo Bonzini wrote:
> On 7/14/22 07:36, Zhenzhong Duan wrote:
>> On ICX-2S2 host, when run L2 guest with both L1/L2 using 
>> Icelake-Server-v3
>> or above, we got below warning:
>>
>> "warning: host doesn't support requested feature: MSR(10AH).taa-no 
>> [bit 8]"
>>
>> This is because L1 KVM doesn't expose taa-no to L2 if RTM is disabled,
>> then starting L2 qemu triggers the warning.
>>
>> Fix it by restoring TSX features in Icelake-Server-v3, which may also 
>> help
>> guest performance if host isn't susceptible to TSX Async Abort (TAA)
>> vulnerabilities.
>>
>> Fixes: d965dc35592d ("target/i386: Add ARCH_CAPABILITIES related bits 
>> into Icelake-Server CPU model")
>> Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> ---
>> v2: Rewrite commit message
> 
> Why wouldn't the fix be (in an Icelake-Server-v4 model) to remove taa-no?

Production Icelake silicon should have the taa-no set, that's the reason 
taa-no was added in v3 model.

When taa-no presents, it's safe to bring TSX features back.

I'm wondering if we need a new version (v7) for this change.

> Paolo
> 
>>   target/i386/cpu.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 14f681e998cc..25ef972a3eed 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -3423,6 +3423,9 @@ static const X86CPUDefinition builtin_x86_defs[] 
>> = {
>>               {
>>                   .version = 3,
>>                   .props = (PropValue[]) {
>> +                    /* Restore TSX features removed by -v2 above */
>> +                    { "hle", "on" },
>> +                    { "rtm", "on" },
>>                       { "arch-capabilities", "on" },
>>                       { "rdctl-no", "on" },
>>                       { "ibrs-all", "on" },
> 


