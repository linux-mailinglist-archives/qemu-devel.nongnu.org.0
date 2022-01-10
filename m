Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE04895A3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:49:38 +0100 (CET)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rJ3-00085f-Rd
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:49:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1n6rHH-0006IU-Ut
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:47:48 -0500
Received: from mga05.intel.com ([192.55.52.43]:52742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1n6rH9-0007f6-JN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641808059; x=1673344059;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OB2fGUky+S94RDguZQrzCZuWbNUbrEYV/qO4kx5liis=;
 b=D32ILNaZTKvZ0nwrCXWMkZLjqZq65B5O18CLQC6QetNmJ7fahu3Q3j1R
 H58Uu8W+OgKYQhEjhn2gwM70FapUlk6i7SNv8lEjNTOrM0TcTjh83PIQ9
 cYS0uS0qM6fDOT3FozfGs6DMBUsQovxUzAWQhmdBTLZlca6d7Ek0bDy9k
 y368rk5RN05fccBqhtyXEpCm18mdXaAmTxDq7k+M8xqIIx8bvadq/gZWL
 tX+Jylum8gUDQ9AhiOK2d20pihs+P05lj9litUr0xge3qS7sWwB+zgY8N
 fDK/D2TU930yjoJ4usaN15xkvzC2xYATuUwbAv9+piN5sz1D8RJBN7+K9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="329534377"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="329534377"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 01:47:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="514618033"
Received: from zengguan-mobl.ccr.corp.intel.com (HELO [10.238.0.214])
 ([10.238.0.214])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 01:47:15 -0800
Message-ID: <6976bcbe-ba64-3c33-a445-fe29ace41ff3@intel.com>
Date: Mon, 10 Jan 2022 17:47:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, "Zhong, Yang"
 <yang.zhong@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-7-yang.zhong@intel.com>
 <BN9PR11MB527600E4DD1EA7BE7638A0518C509@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Zeng Guang <guang.zeng@intel.com>
In-Reply-To: <BN9PR11MB527600E4DD1EA7BE7638A0518C509@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=guang.zeng@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Christopherson, ,
 Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/2022 4:40 PM, Tian, Kevin wrote:
>> From: Zhong, Yang <yang.zhong@intel.com>
>> Sent: Friday, January 7, 2022 5:32 PM
>>
>> From: Jing Liu <jing2.liu@intel.com>
>>
>> Extended feature has large state while current
>> kvm_xsave only allows 4KB. Use new XSAVE ioctls
>> if the xstate size is large than kvm_xsave.
> shouldn't we always use the new xsave ioctls as long as
> CAP_XSAVE2 is available?


CAP_XSAVE2 may return legacy xsave size or 0 working with old kvm 
version in which it's not available.
QEMU just use the new xsave ioctls only when the return value of 
CAP_XSAVE2 is larger than legacy xsave size.

>> Signed-off-by: Jing Liu <jing2.liu@intel.com>
>> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
>> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>> ---
>>   linux-headers/asm-x86/kvm.h | 14 ++++++++++++++
>>   linux-headers/linux/kvm.h   |  2 ++
>>   target/i386/cpu.h           |  5 +++++
>>   target/i386/kvm/kvm.c       | 16 ++++++++++++++--
>>   target/i386/xsave_helper.c  | 35 +++++++++++++++++++++++++++++++++++
>>   5 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
>> index 5a776a08f7..32f2a921e8 100644
>> --- a/linux-headers/asm-x86/kvm.h
>> +++ b/linux-headers/asm-x86/kvm.h
>> @@ -376,6 +376,20 @@ struct kvm_debugregs {
>>   /* for KVM_CAP_XSAVE */
>>   struct kvm_xsave {
>>   	__u32 region[1024];
>> +	/*
>> +	 * KVM_GET_XSAVE2 and KVM_SET_XSAVE write and read as many
>> bytes
>> +	 * as are returned by KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
>> +	 * respectively, when invoked on the vm file descriptor.
>> +	 *
>> +	 * The size value returned by
>> KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
>> +	 * will always be at least 4096. Currently, it is only greater
>> +	 * than 4096 if a dynamic feature has been enabled with
>> +	 * ``arch_prctl()``, but this may change in the future.
>> +	 *
>> +	 * The offsets of the state save areas in struct kvm_xsave follow
>> +	 * the contents of CPUID leaf 0xD on the host.
>> +	 */
>> +	__u32 extra[0];
>>   };
>>
>>   #define KVM_MAX_XCRS	16
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index 02c5e7b7bb..97d5b6d81d 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>>   #define KVM_CAP_BINARY_STATS_FD 203
>>   #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>>   #define KVM_CAP_ARM_MTE 205
>> +#define KVM_CAP_XSAVE2  207
>>
>>   #ifdef KVM_CAP_IRQ_ROUTING
>>
>> @@ -1550,6 +1551,7 @@ struct kvm_s390_ucas_mapping {
>>   /* Available with KVM_CAP_XSAVE */
>>   #define KVM_GET_XSAVE		  _IOR(KVMIO,  0xa4, struct
>> kvm_xsave)
>>   #define KVM_SET_XSAVE		  _IOW(KVMIO,  0xa5, struct
>> kvm_xsave)
>> +#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct
>> kvm_xsave)
>>   /* Available with KVM_CAP_XCRS */
>>   #define KVM_GET_XCRS		  _IOR(KVMIO,  0xa6, struct kvm_xcrs)
>>   #define KVM_SET_XCRS		  _IOW(KVMIO,  0xa7, struct kvm_xcrs)
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 245e8b5a1a..6153c4ab1a 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -1519,6 +1519,11 @@ typedef struct CPUX86State {
>>       YMMReg zmmh_regs[CPU_NB_REGS];
>>       ZMMReg hi16_zmm_regs[CPU_NB_REGS];
>>
>> +#ifdef TARGET_X86_64
>> +    uint8_t xtilecfg[64];
>> +    uint8_t xtiledata[8192];
>> +#endif
>> +
>>       /* sysenter registers */
>>       uint32_t sysenter_cs;
>>       target_ulong sysenter_esp;
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 3fb3ddbe2b..97520e9dff 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1983,7 +1983,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>       }
>>
>>       if (has_xsave) {
>> -        env->xsave_buf_len = sizeof(struct kvm_xsave);
>> +        uint32_t size = kvm_vm_check_extension(cs->kvm_state,
>> KVM_CAP_XSAVE2);
>> +        if (!size) {
>> +            size = sizeof(struct kvm_xsave);
>> +        }
>> +
>> +        env->xsave_buf_len = QEMU_ALIGN_UP(size, 4096);
>>           env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
>>           memset(env->xsave_buf, 0, env->xsave_buf_len);
>>
>> @@ -2580,6 +2585,7 @@ static int kvm_put_xsave(X86CPU *cpu)
>>       if (!has_xsave) {
>>           return kvm_put_fpu(cpu);
>>       }
>> +
>>       x86_cpu_xsave_all_areas(cpu, xsave, env->xsave_buf_len);
>>
>>       return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_XSAVE, xsave);
>> @@ -3247,10 +3253,16 @@ static int kvm_get_xsave(X86CPU *cpu)
>>           return kvm_get_fpu(cpu);
>>       }
>>
>> -    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
>> +    if (env->xsave_buf_len <= sizeof(struct kvm_xsave)) {
>> +        ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
>> +    } else {
>> +        ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE2, xsave);
>> +    }
>> +
>>       if (ret < 0) {
>>           return ret;
>>       }
>> +
>>       x86_cpu_xrstor_all_areas(cpu, xsave, env->xsave_buf_len);
>>
>>       return 0;
>> diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
>> index ac61a96344..090424e820 100644
>> --- a/target/i386/xsave_helper.c
>> +++ b/target/i386/xsave_helper.c
>> @@ -5,6 +5,7 @@
>>   #include "qemu/osdep.h"
>>
>>   #include "cpu.h"
>> +#include <asm/kvm.h>
>>
>>   void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
>>   {
>> @@ -126,6 +127,23 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void
>> *buf, uint32_t buflen)
>>
>>           memcpy(pkru, &env->pkru, sizeof(env->pkru));
>>       }
>> +
>> +    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
>> +    if (e->size && e->offset) {
>> +        XSaveXTILE_CFG *tilecfg = buf + e->offset;
>> +
>> +        memcpy(tilecfg, &env->xtilecfg, sizeof(env->xtilecfg));
>> +    }
>> +
>> +    if (buflen > sizeof(struct kvm_xsave)) {
>> +        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
>> +
>> +        if (e->size && e->offset) {
>> +            XSaveXTILE_DATA *tiledata = buf + e->offset;
>> +
>> +            memcpy(tiledata, &env->xtiledata, sizeof(env->xtiledata));
>> +        }
>> +    }
>>   #endif
>>   }
>>
>> @@ -247,5 +265,22 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const
>> void *buf, uint32_t buflen)
>>           pkru = buf + e->offset;
>>           memcpy(&env->pkru, pkru, sizeof(env->pkru));
>>       }
>> +
>> +    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
>> +    if (e->size && e->offset) {
>> +        const XSaveXTILE_CFG *tilecfg = buf + e->offset;
>> +
>> +        memcpy(&env->xtilecfg, tilecfg, sizeof(env->xtilecfg));
>> +    }
>> +
>> +    if (buflen > sizeof(struct kvm_xsave)) {
>> +        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
>> +
>> +        if (e->size && e->offset) {
>> +            const XSaveXTILE_DATA *tiledata = buf + e->offset;
>> +
>> +            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
>> +        }
>> +    }
>>   #endif
>>   }

