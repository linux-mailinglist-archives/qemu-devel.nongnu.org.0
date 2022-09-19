Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC25BC29B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 07:50:51 +0200 (CEST)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa9gA-0003KJ-6G
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 01:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oa9cM-0001s7-6o
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 01:46:54 -0400
Received: from mga06b.intel.com ([134.134.136.31]:14423 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oa9cI-0001tO-MP
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 01:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663566410; x=1695102410;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7maJ1vVkLhJGiLcHyUp6lU1WBSQ2gYn6yXCOSdXmYNE=;
 b=ABp1UZi+c7EvSXWgGfdL3Jz4agrOlpaeaA8Sup3pivg5cK7L1PCbyz+5
 0KcgqQOKTWfXCrRYzFaGRYjKzAxb6GU3+olZaZ5eQxcr2flYNwho9NZoj
 KOQiSbJK/7000pTX+QJsoqjdP8oHnrxfSz8olxtmFC67qVw2pfeYM7MAs
 Hxbz4G6F6ExXu+uq169AY8baVmopVXdsN6R9RBPKBlcPP2RbbCSLjFfBF
 pN/HpAUtArZps08JkKz0vW8alokNT7snDliokwjFXKSL4hg9qsITraPC4
 a0Mu2MVmgcIJHHHxIinBXirnmXzTnQzSsUWtotQz0kzqwj98GdNYr3ry6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361047689"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; d="scan'208";a="361047689"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2022 22:46:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; d="scan'208";a="651537756"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.0.135])
 ([10.238.0.135])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2022 22:46:40 -0700
Message-ID: <5beb9f1c-a419-94f7-a1b9-4aeb281baa41@intel.com>
Date: Mon, 19 Sep 2022 13:46:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/2] i386: Add notify VM exit support
To: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Xiaoyao Li <xiaoyao.li@intel.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220915092839.5518-1-chenyi.qiang@intel.com>
 <20220915092839.5518-3-chenyi.qiang@intel.com> <YyTxL7kstA20tB5a@xz-m1.local>
Content-Language: en-US
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <YyTxL7kstA20tB5a@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=chenyi.qiang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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



On 9/17/2022 5:57 AM, Peter Xu wrote:
> On Thu, Sep 15, 2022 at 05:28:39PM +0800, Chenyi Qiang wrote:
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
>> window when creating VMs. The format of the argument when enabling this
>> capability is as follows:
>>    Bit 63:32 - notify window specified in qemu command
>>    Bit 31:0  - some flags (e.g. KVM_X86_NOTIFY_VMEXIT_ENABLED is set to
>>                enable the feature.)
>>
>> Because there are some concerns, e.g. a notify VM exit may happen with
>> VM_CONTEXT_INVALID set in exit qualification (no cases are anticipated
>> that would set this bit), which means VM context is corrupted. To avoid
>> the false positive and a well-behaved guest gets killed, make this
>> feature disabled by default. Users can enable the feature by a new
>> machine property:
>>      qemu -machine notify_vmexit=on,notify_window=0 ...
>>
>> Note that notify_window is only valid when notify_vmexit is on. The valid
>> range of notify_window is non-negative. It is even safe to set it to zero
>> since there's an internal hardware threshold to be added to ensure no false
>> positive.
>>
>> A new KVM exit reason KVM_EXIT_NOTIFY is defined for notify VM exit. If
>> it happens with VM_INVALID_CONTEXT, hypervisor exits to user space to
>> inform the fatal case. Then user space can inject a SHUTDOWN event to
>> the target vcpu. This is implemented by injecting a sythesized triple
>> fault event.
>>
>> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
>> ---
>>   hw/i386/x86.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/i386/x86.h |  5 +++++
>>   qemu-options.hx       | 10 +++++++++-
>>   target/i386/kvm/kvm.c | 28 +++++++++++++++++++++++++++
>>   4 files changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 050eedc0c8..1eccbd3deb 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1379,6 +1379,37 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
>>       qapi_free_SgxEPCList(list);
>>   }
>>   
>> +static bool x86_machine_get_notify_vmexit(Object *obj, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +
>> +    return x86ms->notify_vmexit;
>> +}
>> +
>> +static void x86_machine_set_notify_vmexit(Object *obj, bool value, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +
>> +    x86ms->notify_vmexit = value;
>> +}
>> +
>> +static void x86_machine_get_notify_window(Object *obj, Visitor *v,
>> +                                const char *name, void *opaque, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +    uint32_t notify_window = x86ms->notify_window;
>> +
>> +    visit_type_uint32(v, name, &notify_window, errp);
>> +}
>> +
>> +static void x86_machine_set_notify_window(Object *obj, Visitor *v,
>> +                               const char *name, void *opaque, Error **errp)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(obj);
>> +
>> +    visit_type_uint32(v, name, &x86ms->notify_window, errp);
>> +}
>> +
>>   static void x86_machine_initfn(Object *obj)
>>   {
>>       X86MachineState *x86ms = X86_MACHINE(obj);
>> @@ -1392,6 +1423,8 @@ static void x86_machine_initfn(Object *obj)
>>       x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>>       x86ms->bus_lock_ratelimit = 0;
>>       x86ms->above_4g_mem_start = 4 * GiB;
>> +    x86ms->notify_vmexit = false;
>> +    x86ms->notify_window = 0;
>>   }
>>   
>>   static void x86_machine_class_init(ObjectClass *oc, void *data)
>> @@ -1461,6 +1494,18 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>>           NULL, NULL);
>>       object_class_property_set_description(oc, "sgx-epc",
>>           "SGX EPC device");
>> +
>> +    object_class_property_add(oc, X86_MACHINE_NOTIFY_WINDOW, "uint32_t",
>> +                              x86_machine_get_notify_window,
>> +                              x86_machine_set_notify_window, NULL, NULL);
>> +    object_class_property_set_description(oc, X86_MACHINE_NOTIFY_WINDOW,
>> +            "Set the notify window required by notify VM exit");
>> +
>> +    object_class_property_add_bool(oc, X86_MACHINE_NOTIFY_VMEXIT,
>> +                                   x86_machine_get_notify_vmexit,
>> +                                   x86_machine_set_notify_vmexit);
>> +    object_class_property_set_description(oc, X86_MACHINE_NOTIFY_VMEXIT,
>> +            "Enable notify VM exit");
>>   }
>>   
>>   static const TypeInfo x86_machine_info = {
>> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>> index 62fa5774f8..5707329fa7 100644
>> --- a/include/hw/i386/x86.h
>> +++ b/include/hw/i386/x86.h
>> @@ -85,6 +85,9 @@ struct X86MachineState {
>>        * which means no limitation on the guest's bus locks.
>>        */
>>       uint64_t bus_lock_ratelimit;
>> +
>> +    bool notify_vmexit;
>> +    uint32_t notify_window;
>>   };
>>   
>>   #define X86_MACHINE_SMM              "smm"
>> @@ -94,6 +97,8 @@ struct X86MachineState {
>>   #define X86_MACHINE_OEM_ID           "x-oem-id"
>>   #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
>>   #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
>> +#define X86_MACHINE_NOTIFY_VMEXIT     "notify-vmexit"
>> +#define X86_MACHINE_NOTIFY_WINDOW     "notify-window"
>>   
>>   #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
>>   OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 31c04f7eea..3cdeeac8f3 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -37,7 +37,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>       "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
>>       "                hmat=on|off controls ACPI HMAT support (default=off)\n"
>>       "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
>> -    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
>> +    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
>> +    "                notify_vmexit=on|off,notify_window=n controls notify VM exit support (default=off) and specifies the notify window size (default=0)\n",
>>       QEMU_ARCH_ALL)
>>   SRST
>>   ``-machine [type=]name[,prop=value[,...]]``
>> @@ -157,6 +158,13 @@ SRST
>>           ::
>>   
>>               -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
>> +
>> +    ``notify_vmexit=on|off,notify_window=n``
>> +        Enables or disables Notify VM exit support on x86 host and specify
>> +        the corresponding notify window to trigger the VM exit if enabled.
>> +        This feature can mitigate the CPU stuck issue due to event windows
>> +        don't open up for a specified of time (notify window).
>> +        The default is off.
>>   ERST
>>   
>>   DEF("M", HAS_ARG, QEMU_OPTION_M,
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 3838827134..ae7fb2c495 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -2597,6 +2597,20 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>               ratelimit_set_speed(&bus_lock_ratelimit_ctrl,
>>                                   x86ms->bus_lock_ratelimit, BUS_LOCK_SLICE_TIME);
>>           }
>> +
>> +        if (x86ms->notify_vmexit &&
>> +            kvm_check_extension(s, KVM_CAP_X86_NOTIFY_VMEXIT)) {
>> +            uint64_t notify_window_flags = ((uint64_t)x86ms->notify_window << 32) |
>> +                                           KVM_X86_NOTIFY_VMEXIT_ENABLED |
>> +                                           KVM_X86_NOTIFY_VMEXIT_USER;
> 
> It'll always request a user exit here as long as enabled, then...
> 
>> +            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_NOTIFY_VMEXIT, 0,
>> +                                    notify_window_flags);
>> +            if (ret < 0) {
>> +                error_report("kvm: Failed to enable notify vmexit cap: %s",
>> +                             strerror(-ret));
>> +                return ret;
>> +            }
>> +        }
>>       }
>>   
>>       return 0;
>> @@ -5141,6 +5155,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>       X86CPU *cpu = X86_CPU(cs);
>>       uint64_t code;
>>       int ret;
>> +    struct kvm_vcpu_events events = {};
>>   
>>       switch (run->exit_reason) {
>>       case KVM_EXIT_HLT:
>> @@ -5196,6 +5211,19 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>           /* already handled in kvm_arch_post_run */
>>           ret = 0;
>>           break;
>> +    case KVM_EXIT_NOTIFY:
>> +        ret = 0;
>> +        if (run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID) {
>> +            warn_report("KVM: invalid context due to notify vmexit");
>> +            if (has_triple_fault_event) {
>> +                events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
>> +                events.triple_fault.pending = true;
>> +                ret = kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events);
>> +            } else {
>> +                ret = -1;
>> +            }
>> +        }
> 
> ... should we do something even if the context is valid?  Or I'm a bit


Yes, make sense. A warning log is necessary if the context is valid.

> confused why KVM_X86_NOTIFY_VMEXIT_USER was set (IIUC we can just enable it
> without setting VMEXIT_USER then).
> 

VMEXIT_USR was set because KVM community prefers userspace can get 
notified and help to do some analysis or mitigation if notify window was 
exceeded.

> Not sure some warning would be also useful here, but I really don't know
> the whole context so I can't tell whether there can easily be false
> positives to pollute qemu log.
> 

The false positive case is not easy to happen unless some potential 
issues in silicon. But in case of it, to avoid polluting qemu log, how 
about:

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ae7fb2c495..8f97133cbf 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5213,6 +5213,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct 
kvm_run *run)
          break;
      case KVM_EXIT_NOTIFY:
          ret = 0;
+        warn_report_once("KVM: notify window was exceeded in guest");
          if (run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID) {
              warn_report("KVM: invalid context due to notify vmexit");
              if (has_triple_fault_event) {

>> +        break;
>>       default:
>>           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>>           ret = -1;
>> -- 
>> 2.17.1
>>
> 

