Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC264B4F4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:17:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54CD-0002XH-HP; Tue, 13 Dec 2022 07:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p54Bv-0002MZ-KF
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:15:26 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p54Bs-0005Fn-Cu
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670933720; x=1702469720;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tsxThtPRlNwB3axmd7mnhr1gEw5wKcTXGj/7Ul85Ke0=;
 b=IKBTSOMiydTSbGv7yOyBlHk0V81mQLJPnvlG7MYwuizgFmWqzDEk1kQt
 0wwGVIXoaQHEH5MySH/VrrXMZK2sbppGb0ktE1TK+uw/mfz2DdDnySRA+
 IHUJ/txXX7Vt9ry6eZZpGbQV9GGqdmm4Wf83hk3svJ51lKNqQiNQc3Mh+
 mnH/hWp/dHSoUQTZ4OEvel0QNsHhTn3mEugDr2vaTrH+njdfRtqf93Dkl
 k9d3CGzG0ISDQZKnV5BEQpPCFownOSVc9bW6sgjpejjn+uRjH3Z3h/K8z
 Fjofmt1Kg6SsVqoKIZCBzzhYBdPfwCIm+2aG1yMfmUAaTCrtmzqc9b7Q2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="319261713"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="319261713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:15:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="642087091"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="642087091"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.31.20])
 ([10.255.31.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:15:12 -0800
Message-ID: <514d47b2-ec42-8e8f-6215-7c0df611c2d1@intel.com>
Date: Tue, 13 Dec 2022 20:15:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v3 6/8] target/i386/intel-pt: Enable host pass through of
 Intel PT
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20221208062513.2589476-1-xiaoyao.li@intel.com>
 <20221208062513.2589476-7-xiaoyao.li@intel.com>
 <79e68a2b-ba65-98bb-a175-68605303d2e5@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <79e68a2b-ba65-98bb-a175-68605303d2e5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
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

On 12/9/2022 2:55 PM, Chenyi Qiang wrote:
> 
> 
> On 12/8/2022 2:25 PM, Xiaoyao Li wrote:
>> commit e37a5c7fa459 ("i386: Add Intel Processor Trace feature support")
>> added the support of Intel PT by making CPUID[14] of PT as fixed feature
>> set (from ICX) for any CPU model on any host. This truly breaks the PT
>> exposure on Intel SPR platform because SPR has less supported bitmap of
>> CPUID(0x14,1):EBX[15:0] than ICX.
>>
>> To fix the problem, enable pass through of host's PT capabilities for
>> the cases "-cpu host/max" that it won't use default fixed PT feature set
>> of ICX but expand automatically based on get_supported_cpuid reported by
>> host. Meanwhile, it needs to ensure named CPU model still has the fixed
>> PT feature set to not break the live migration case of
>> "-cpu named_cpu_model,+intel-pt"
>>
>> Introduces env->use_default_intel_pt flag.
>>   - True means it's old CPU model that uses fixed PT feature set of ICX.
>>   - False means the named CPU model has its own PT feature set.
>>
>> Besides, to keep the same behavior for old CPU models that validate PT
>> feature set against default fixed PT feature set of ICX in addition to
>> validate from host's capabilities (via get_supported_cpuid) in
>> x86_cpu_filter_features().
>>
>> In the future, new named CPU model, e.g., Sapphire Rapids, can define
>> its own PT feature set by setting @has_specific_intel_pt_feature_set to
> 
> 
> It seems @has_specific_intel_pt_feature_set is not introduced in this
> series. Then don't need to mention the specific flag name here.

Thanks for catching it.

It's leftover of previous version. I'll update the commit log for next 
version.

>> true and defines it's own FEAT_14_0_EBX, FEAT_14_0_ECX, FEAT_14_1_EAX
>> and FEAT_14_1_EBX.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---


