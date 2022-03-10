Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC74D43F2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:54:45 +0100 (CET)
Received: from localhost ([::1]:50426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSFVL-0005HJ-Vg
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nSFUB-0004cm-3C
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:53:31 -0500
Received: from mga03.intel.com ([134.134.136.65]:17080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nSFU8-00006I-PQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646906008; x=1678442008;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vWvNGBndoP9u0NnLj5isCC5B+TWZCf6jGCisRxbK9a0=;
 b=hPLrhlOs8HLaHm7ttdTOMWLTxy/FAIBb7L74zQHBfdgsG26xgy05cgg+
 hB0jD12jmZvpz4VqKruiBrqP2NuHcTG7+reirUnB5K+LH5Z0kfR06BzCC
 Yk4HRS7BqaPR3fDLoW8Lgqn8sNTtVCCvtBWMuvdtFJVG5IBWkcnROrcsV
 xAMOxs6tAlzCyfpPRpt2zK1pNSyg/gaOe/9g1KO9O2nHCte01XIa+i0h5
 1NpDcPIl0LJNU58//BYAcmfvE0EKgtX4daqNQGAD5It5yyOtLJCG7m4Ea
 CnlIZLmKQsOyRZuC99p8ZUeY1HhFkdMaDShf9z/LNZJ2nEMu/F2dX2q5M g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255154317"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255154317"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 01:53:09 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="712299489"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.1.149])
 ([10.238.1.149])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 01:53:07 -0800
Message-ID: <43c55ff9-eab6-7dc5-c634-9817b5a523cd@intel.com>
Date: Thu, 10 Mar 2022 17:53:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] i386: Add notify VM exit support
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220310090205.10645-1-chenyi.qiang@intel.com>
 <20220310090205.10645-3-chenyi.qiang@intel.com> <YinCH/GbShwG1fRF@redhat.com>
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <YinCH/GbShwG1fRF@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=chenyi.qiang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Xiaoyao Li <xiaoyao.li@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/10/2022 5:17 PM, Daniel P. Berrangé wrote:
> On Thu, Mar 10, 2022 at 05:02:05PM +0800, Chenyi Qiang wrote:
>> There are cases that malicious virtual machine can cause CPU stuck (due
>> to event windows don't open up), e.g., infinite loop in microcode when
>> nested #AC (CVE-2015-5307). No event window means no event (NMI, SMI and
>> IRQ) can be delivered. It leads the CPU to be unavailable to host or
>> other VMs. Notify VM exit is introduced to mitigate such kind of
>> attacks, which will generate a VM exit if no event window occurs in VM
>> non-root mode for a specified amount of time (notify window).
>>
>> A new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT is exposed to user space
>> so that the user can query the capability and set the expected notify
>> window when creating VMs.
>>
>> If notify VM exit happens with VM_INVALID_CONTEXT, hypervisor should
>> exit to user space with the exit reason KVM_EXIT_NOTIFY to inform the
>> fatal case. Then user space can inject a SHUTDOWN event to the target
>> vcpu. This is implemented by defining a new bit in flags field of
>> kvm_vcpu_event in KVM_SET_VCPU_EVENTS ioctl.
>>
>> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
>> ---
>>   hw/i386/x86.c         | 24 ++++++++++++++++++
>>   include/hw/i386/x86.h |  3 +++
>>   target/i386/kvm/kvm.c | 58 ++++++++++++++++++++++++++++---------------
>>   3 files changed, 65 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index b84840a1bb..25e6c50b1e 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1309,6 +1309,23 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
>>       qapi_free_SgxEPCList(list);
>>   }
>>   
>> +static void x86_machine_get_notify_window(Object *obj, Visitor *v,
>> +                                const char *name, void *opaque, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +    int32_t notify_window = x86ms->notify_window;
>> +
>> +    visit_type_int32(v, name, &notify_window, errp);
>> +}
>> +
>> +static void x86_machine_set_notify_window(Object *obj, Visitor *v,
>> +                               const char *name, void *opaque, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +
>> +    visit_type_int32(v, name, &x86ms->notify_window, errp);
>> +}
>> +
>>   static void x86_machine_initfn(Object *obj)
>>   {
>>       X86MachineState *x86ms = X86_MACHINE(obj);
>> @@ -1319,6 +1336,7 @@ static void x86_machine_initfn(Object *obj)
>>       x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>>       x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>>       x86ms->bus_lock_ratelimit = 0;
>> +    x86ms->notify_window = -1;
>>   }
> 
> IIUC from the kernel patch, this negative value leaves the protection
> disabled, and thus the host remains vulnerable to the CVE. I would
> expect this ought to set a suitable default value to fix the flaw.
> 

Hum, I missed some explanation in commit message.
We had some discussion about the default behavior of this feature. There 
are some concerns. e.g.
There's a possibility, however small, that a notify VM exit happens
with VM_CONTEXT_INVALID set in exit qualification, which means VM
context is corrupted. To avoid the false positive and a well-behaved
guest gets killed, we decide to make this feature opt-in.

> Regards,
> Daniel

