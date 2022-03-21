Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C584E20FE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:11:35 +0100 (CET)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCCU-0003a3-3E
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:11:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWC3V-0006NK-PP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:02:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:18747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWC3T-0008N3-6d
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647846135; x=1679382135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0iRvrFKjuNuyC9lG4vhN/9p1QBkTE+Phuzunp0EN+tg=;
 b=KU2X8I1mDW5DCJS5CKiHkJzE4Ln71B9vVhfDx9sF0j8B9E9Ejcxn08nH
 Iaxdcf+QBYz6r1LjahK2Mqu30QLmzd3ETetSW99PooraiyFqlDaOqjkGq
 ZDbFVPi3IY+OQmHt0zcszPaEIOKc7xrbb6fzCJd1N0wYFh5h2+PXPTuwd
 x55A/3sCqmphJBFfwYIXKSP+lf6u9ktEZ0QFhM3Ww5F34aqf6Cu1QebIr
 B9tI4+Ryx+rOdvdLiXIBzrm5E0HRzwE8BfR5ddRKG6spAemBdyPgUyd/5
 w+JxFOalqnH2MGSL9JOYTvIvqeMjKxrp814QNsSlpIoas3bN4oX5dGaE3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257203955"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="257203955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 00:02:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559736846"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 00:02:06 -0700
Message-ID: <9de4a579-b1f7-294e-34b1-09849f6d79b3@intel.com>
Date: Mon, 21 Mar 2022 15:02:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 09/36] KVM: Introduce kvm_arch_pre_create_vcpu()
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-10-xiaoyao.li@intel.com>
 <20220318165627.GB4049379@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318165627.GB4049379@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/2022 12:56 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:58:46PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> Introduce kvm_arch_pre_create_vcpu(), to perform arch-dependent
>> work prior to create any vcpu. This is for i386 TDX because it needs
>> call TDX_INIT_VM before creating any vcpu.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   accel/kvm/kvm-all.c    | 7 +++++++
>>   include/sysemu/kvm.h   | 1 +
>>   target/arm/kvm64.c     | 5 +++++
>>   target/i386/kvm/kvm.c  | 5 +++++
>>   target/mips/kvm.c      | 5 +++++
>>   target/ppc/kvm.c       | 5 +++++
>>   target/s390x/kvm/kvm.c | 5 +++++
>>   7 files changed, 33 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 27864dfaeaaa..a4bb449737a6 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -465,6 +465,13 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>   
>>       trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>>   
>> +    ret = kvm_arch_pre_create_vcpu(cpu);
>> +    if (ret < 0) {
>> +        error_setg_errno(errp, -ret,
>> +                         "kvm_init_vcpu: kvm_arch_pre_create_vcpu() failed");
>> +        goto err;
>> +    }
>> +
>>       ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>>       if (ret < 0) {
>>           error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index a783c7886811..0e94031ab7c7 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -373,6 +373,7 @@ int kvm_arch_put_registers(CPUState *cpu, int level);
>>   
>>   int kvm_arch_init(MachineState *ms, KVMState *s);
>>   
>> +int kvm_arch_pre_create_vcpu(CPUState *cpu);
>>   int kvm_arch_init_vcpu(CPUState *cpu);
>>   int kvm_arch_destroy_vcpu(CPUState *cpu);
>>   
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index ccadfbbe72be..ae7336851c62 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -935,6 +935,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>       return kvm_arm_init_cpreg_list(cpu);
>>   }
>>   
>> +int kvm_arch_pre_create_vcpu(CPUState *cpu)
>> +{
>> +    return 0;
>> +}
>> +
> 
> Weak symbol can be used to avoid update all the arch.

OK. will use __attribute__ ((weak))

> Thanks,


