Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAD49FCF5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:37:30 +0100 (CET)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTJa-0006Ei-2c
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:37:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nDSvC-0006Fa-Ps
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:12:19 -0500
Received: from mga03.intel.com ([134.134.136.65]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nDSv0-0003ah-5l
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643382726; x=1674918726;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Kyf/ZfbZNdt3mc646HoMF5bzMrgCZeBayd7t1r6+fcM=;
 b=l9A8mY2aSGZsq5HtPiA4GfPLELIqcnNJZF7ajFIw+XJ/EcGUxxR1jj5i
 +jnWOI+2VmIN/bPv2soaidHRvD0GlR89/HaYY8HboAyCSrrL3dorfWyDM
 oa2djKGGnLAZWrOFNcgCevMduhCLTUTLphUKTu7ApNgUfRhxCaldn4OJQ
 FP2X77IOQZAUKRF05asUrhi3r1TFztYxy+/EpTvoR4GGCMbUaQ2XUBw31
 N9kE/aN2IpIfYK+yc0ZJMN9A3VDZIzqlE7vMavIcDS+XgPmDx15jb6UOR
 VivqrgoADHaZ2NmsxbWglPr0eRBpkgY8XdxIents0a4sfc4+hi1MfZyFj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247083828"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="247083828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 07:09:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="480764754"
Received: from yangweij-mobl.ccr.corp.intel.com (HELO [10.249.171.151])
 ([10.249.171.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 07:09:41 -0800
Message-ID: <eac439e3-782f-ac05-c9ff-a45cea720d4c@intel.com>
Date: Fri, 28 Jan 2022 23:09:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/i386: Add kvm_get_one_msr helper
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, ehabkost@redhat.com,
 qemu-devel@nongnu.org
References: <20220127155845.95594-1-weijiang.yang@intel.com>
 <932291d0-954b-7092-b61d-83182413ba9d@redhat.com>
From: "Yang, Weijiang" <weijiang.yang@intel.com>
In-Reply-To: <932291d0-954b-7092-b61d-83182413ba9d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=weijiang.yang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 1/28/2022 6:55 PM, Paolo Bonzini wrote:
> On 1/27/22 16:58, Yang Weijiang wrote:
>> @@ -135,6 +135,7 @@ static struct kvm_msr_list *kvm_feature_msrs;
>>     #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
>>   static RateLimit bus_lock_ratelimit_ctrl;
>> +static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
>>     int kvm_has_pit_state2(void)
>>   {
>
> ...
>
>> @@ -2734,6 +2721,25 @@ static int kvm_put_one_msr(X86CPU *cpu, int 
>> index, uint64_t value)
>>       return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, cpu->kvm_msr_buf);
>>   }
>>   +static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value)
>> +{
>> +    int ret;
>> +    struct {
>> +        struct kvm_msrs info;
>> +        struct kvm_msr_entry entries[1];
>> +    } msr_data = {
>> +        .info.nmsrs = 1,
>> +        .entries[0].index = index,
>> +    };
>> +
>> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +    assert(ret == 1);
>> +    *value = msr_data.entries[0].data;
>> +    return ret;
>> +}
>>   void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
>>   {
>>       int ret;
>
> The patch is a good idea, but you can put the function before the 
> uses.  This way there will be no need for a forward declaration, either.

Thanks Paolo!

Is v2 version required for this?

>
> Thanks,
>
> Paolo

