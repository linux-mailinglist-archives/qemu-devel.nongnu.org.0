Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D346EA0B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:33:29 +0100 (CET)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKUB-0006k5-UH
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mvKSm-00062H-7j
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:32:00 -0500
Received: from mga12.intel.com ([192.55.52.136]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mvKSj-0005TV-6v
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639060317; x=1670596317;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2M49wV9agpeIXgunzDrncYD71zahzY9cEiKo8KeHXEw=;
 b=C2BFq2RjzOSR0X4HMCM3dEcP6VztR47zqBDksFuEePGjKeB/KJBoDe3b
 X6gEML1j2IZL1uuqMIbnFGbX4qJHT96j8cNWWn9ypOGO1m5fLWEL4yV0T
 OIpO23CZqhxI0S4Z2Ran7tPaHPmFuKhg8xiriQ093aMF39vd+suu/BN4N
 laKmLfzQQqGWIp84rLkVBSwJ2uUGYW5HhCdqyLCn3SKAfDKrgQ/0uh24n
 +v7ST417HVFLiNftdCU4ww0qHRdaCSeGzXJyuiCjoK0oKscTNadtsOt1n
 PMW/LrkmXeeylzSMDuJpCJkSXeNIR37/VbU0GviC1uOM6NTdNv4OCXQBd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218132733"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218132733"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 06:31:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503510703"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.29.184])
 ([10.255.29.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 06:31:39 -0800
Message-ID: <eac9c0b1-30c7-04e9-2c89-9047bebf2683@intel.com>
Date: Thu, 9 Dec 2021 22:31:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [RFC PATCH v2 32/44] tdx: add kvm_tdx_enabled() accessor for
 later use
Content-Language: en-US
To: Connor Kuehl <ckuehl@redhat.com>, isaku.yamahata@gmail.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <26d88e7618038c1fed501352a04144745abd12ae.1625704981.git.isaku.yamahata@intel.com>
 <43a81d27-56da-07e8-b3d7-9800b6ed8da1@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <43a81d27-56da-07e8-b3d7-9800b6ed8da1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-2.803,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/2021 1:53 AM, Connor Kuehl wrote:
> On 7/7/21 7:55 PM, isaku.yamahata@gmail.com wrote:
>> From: Isaku Yamahata <isaku.yamahata@intel.com>
>>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> ---
>>   include/sysemu/tdx.h  | 1 +
>>   target/i386/kvm/kvm.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
>> index 70eb01348f..f3eced10f9 100644
>> --- a/include/sysemu/tdx.h
>> +++ b/include/sysemu/tdx.h
>> @@ -6,6 +6,7 @@
>>   #include "hw/i386/pc.h"
>>   bool kvm_has_tdx(KVMState *s);
>> +bool kvm_tdx_enabled(void);
>>   int tdx_system_firmware_init(PCMachineState *pcms, MemoryRegion 
>> *rom_memory);
>>   #endif
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index af6b5f350e..76c3ea9fac 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -152,6 +152,11 @@ int kvm_set_vm_type(MachineState *ms, int kvm_type)
>>       return -ENOTSUP;
>>   }
>> +bool kvm_tdx_enabled(void)
>> +{
>> +    return vm_type == KVM_X86_TDX_VM;
>> +}
>> +
> 
> Is this the whole story? Does this guarantee that the VM QEMU is
> responsible to bring up is a successfully initialized TD?

No, it just means a TDX guest is requested.

>  From my reading of the series as it unfolded, this looks like the
> function proves that KVM can support TDs and that the user requested
> a TDX kvm-type, not that we have a fully-formed TD.

yes, you are right. We referenced what sev_eanbled() and sev_es_enabled().

If the name is misleading, does it looks better to name it is_tdx_vm()?

> Is it possible to associate this with a more verifiable metric that
> the TD has been or will be created successfully? I.e., once the VM
> has successfully called the TDX INIT ioctl or has finalized setup?
> 
> My question mainly comes from a later patch in the series, where the
> "query-tdx-capabilities" and "query-tdx" QMP commands are added.
> 
> Forgive me if I am misinterpreting the semantics of each of these
> commands:

what you understood is correct.

> "query-tdx-capabilities" sounds like it answers the question of
> "can it run a TD?"
> 
> and "query-tdx" sounds like it answers the question of "is it a TD?"
> 
> Is the assumption with "query-tdx" that anything that's gone wrong
> with developing a TD will have resulted in the QEMU process exiting
> and therefore if we get to a point where we can run "query-tdx" then
> we know the TD was successfully formed?
> 


