Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7D5ED275
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 03:08:52 +0200 (CEST)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odLZC-0001A3-Tc
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 21:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odLWj-0006fc-QT
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 21:06:18 -0400
Received: from mga07.intel.com ([134.134.136.100]:51515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odLWg-0002Os-TP
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 21:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664327174; x=1695863174;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JCh9LK4k+nOzfu32B9UOCi7FRk87mpGfi/GAGo9EwdY=;
 b=Z/ca7h4gkTTpfZt6/AvTTI7JkvBERr5Me/8rMfdRjvKhfKf784EbYAXG
 ve7RBlG0vLkjx+fpL/bXekdU2KtGDVkumiQT3vKZAhkbWCniNQvj4XAfn
 wfepEBtuFFfyXQGfdQ70ciXSgBPsY/Ft/vtVbY8Y5VDWEhZTg2UiW0FlN
 PXvlV7PySh1oIYMsFXDFA6q0peI7xI1PDB7yvAZpSf51Cy0JWKwiqr2c/
 6H4/3wBCZmaLasVBZVPM9vlmRbYJtBM6M86ZrtFbI9/rMeHQrnQmnf7Ls
 DH2zJuRuQsNjsenryFxYeRFDqdicB+iSE/tko7UIRcoBKb30p+fhw33fy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365517646"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="365517646"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 18:06:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950499845"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="950499845"
Received: from zhaoq1-mobl.ccr.corp.intel.com (HELO [10.255.29.135])
 ([10.255.29.135])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 18:06:06 -0700
Message-ID: <01bc053e-2809-c585-ef75-3b9acdd09974@intel.com>
Date: Wed, 28 Sep 2022 09:06:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH v7 1/2] i386: kvm: extend kvm_{get, put}_vcpu_events to
 support pending triple fault
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220923073333.23381-1-chenyi.qiang@intel.com>
 <20220923073333.23381-2-chenyi.qiang@intel.com>
 <c773b5aa-19b0-20de-5818-67360307abd9@redhat.com>
Content-Language: en-US
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <c773b5aa-19b0-20de-5818-67360307abd9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chenyi.qiang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/27/2022 9:14 PM, Paolo Bonzini wrote:
> On 9/23/22 09:33, Chenyi Qiang wrote:
>> For the direct triple faults, i.e. hardware detected and KVM morphed
>> to VM-Exit, KVM will never lose them. But for triple faults sythesized
>> by KVM, e.g. the RSM path, if KVM exits to userspace before the request
>> is serviced, userspace could migrate the VM and lose the triple fault.
>>
>> A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
>> the event.triple_fault_pending field contains a valid state if the
>> KVM_CAP_X86_TRIPLE_FAULT_EVENT capability is enabled.
> 
> Note that you are not transmitting the field on migration.  You need
> this on top:
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index b97d182e28..d4124973ce 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1739,7 +1739,7 @@ typedef struct CPUArchState {
>       uint8_t has_error_code;
>       uint8_t exception_has_payload;
>       uint64_t exception_payload;
> -    bool triple_fault_pending;
> +    uint8_t triple_fault_pending;
>       uint32_t ins_len;
>       uint32_t sipi_vector;
>       bool tsc_valid;
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index cecd476e98..310b125235 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -1562,6 +1562,25 @@ static const VMStateDescription vmstate_arch_lbr = {
>       }
>   };
> 
> +static bool triple_fault_needed(void *opaque)
> +{
> +    X86CPU *cpu = opaque;
> +    CPUX86State *env = &cpu->env;
> +
> +    return env->triple_fault_pending;
> +}
> +
> +static const VMStateDescription vmstate_triple_fault = {
> +    .name = "cpu/triple_fault",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = triple_fault_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(env.triple_fault_pending, X86CPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   const VMStateDescription vmstate_x86_cpu = {
>       .name = "cpu",
>       .version_id = 12,
> @@ -1706,6 +1725,7 @@ const VMStateDescription vmstate_x86_cpu = {
>           &vmstate_amx_xtile,
>   #endif
>           &vmstate_arch_lbr,
> +        &vmstate_triple_fault,
>           NULL
>       }
>   };

Thanks Paolo for your review!

I'll add this in next version.

> 

