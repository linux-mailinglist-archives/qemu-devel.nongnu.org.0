Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE26132770
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:19:47 +0100 (CET)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioolt-0001qZ-9m
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1ion6R-0004y6-2L
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:32:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1ion6P-0003Cf-1S
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:32:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2946)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ganeshgr@linux.ibm.com>)
 id 1ion6O-0003CX-TU
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:32:48 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007BVjNh196277
 for <qemu-devel@nongnu.org>; Tue, 7 Jan 2020 06:32:48 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xapd692gs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 06:32:46 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <ganeshgr@linux.ibm.com>;
 Tue, 7 Jan 2020 11:32:39 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Jan 2020 11:32:36 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 007BWZp055640212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 11:32:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB3B4A4057;
 Tue,  7 Jan 2020 11:32:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51572A4053;
 Tue,  7 Jan 2020 11:32:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 11:32:34 +0000 (GMT)
Subject: Re: [PATCH v18 3/7] target/ppc: Handle NMI guest exit
To: Greg Kurz <groug@kaod.org>
References: <20200102075111.25308-1-ganeshgr@linux.ibm.com>
 <20200102075111.25308-4-ganeshgr@linux.ibm.com>
 <20200106104533.28569d42@bahia.lan>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Tue, 7 Jan 2020 17:02:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20200106104533.28569d42@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20010711-0028-0000-0000-000003CEE38C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010711-0029-0000-0000-00002492F304
Message-Id: <fc6ddc17-93eb-62ea-7105-83bfbc794050@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070095
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aravinda Prasad <arawinda.p@gmail.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, paulus@ozlabs.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/20 3:15 PM, Greg Kurz wrote:
> On Thu,  2 Jan 2020 13:21:07 +0530
> Ganesh Goudar <ganeshgr@linux.ibm.com> wrote:
>
>> From: Aravinda Prasad <arawinda.p@gmail.com>
>>
>> Memory error such as bit flips that cannot be corrected
>> by hardware are passed on to the kernel for handling.
>> If the memory address in error belongs to guest then
>> the guest kernel is responsible for taking suitable action.
>> Patch [1] enhances KVM to exit guest with exit reason
>> set to KVM_EXIT_NMI in such cases. This patch handles
>> KVM_EXIT_NMI exit.
>>
>> [1] https://www.spinics.net/lists/kvm-ppc/msg12637.html
>>      (e20bbd3d and related commits)
>>
>> Signed-off-by: Aravinda Prasad <arawinda.p@gmail.com>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> ---
> Missing S-o-b.
will add, Thanks.
>
>>   hw/ppc/spapr.c          |  8 ++++++++
>>   hw/ppc/spapr_events.c   | 37 +++++++++++++++++++++++++++++++++++++
>>   include/hw/ppc/spapr.h  | 10 ++++++++++
>>   target/ppc/kvm.c        | 14 ++++++++++++++
>>   target/ppc/kvm_ppc.h    |  2 ++
>>   target/ppc/trace-events |  1 +
>>   6 files changed, 72 insertions(+)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index c91e64aad0..975d7da734 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1679,6 +1679,12 @@ static void spapr_machine_reset(MachineState *machine)
>>       first_ppc_cpu->env.gpr[5] = 0;
>>   
>>       spapr->cas_reboot = false;
>> +
>> +    spapr->mc_status = -1;
>> +    spapr->guest_machine_check_addr = -1;
>> +
>> +    /* Signal all vCPUs waiting on this condition */
>> +    qemu_cond_broadcast(&spapr->mc_delivery_cond);
>>   }
>>   
>>   static void spapr_create_nvram(SpaprMachineState *spapr)
>> @@ -2973,6 +2979,8 @@ static void spapr_machine_init(MachineState *machine)
>>   
>>           kvmppc_spapr_enable_inkernel_multitce();
>>       }
>> +
>> +    qemu_cond_init(&spapr->mc_delivery_cond);
>>   }
>>   
>>   static int spapr_kvm_type(MachineState *machine, const char *vm_type)
>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>> index e355e000d0..dfc0de840a 100644
>> --- a/hw/ppc/spapr_events.c
>> +++ b/hw/ppc/spapr_events.c
>> @@ -40,6 +40,7 @@
>>   #include "hw/ppc/spapr_drc.h"
>>   #include "qemu/help_option.h"
>>   #include "qemu/bcd.h"
>> +#include "qemu/main-loop.h"
>>   #include "hw/ppc/spapr_ovec.h"
>>   #include <libfdt.h>
>>   
>> @@ -622,6 +623,42 @@ void spapr_hotplug_req_remove_by_count_indexed(SpaprDrcType drc_type,
>>                               RTAS_LOG_V6_HP_ACTION_REMOVE, drc_type, &drc_id);
>>   }
>>   
>> +void spapr_mce_req_event(PowerPCCPU *cpu)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>> +    CPUState *cs = CPU(cpu);
>> +
>> +    if (spapr->guest_machine_check_addr == -1) {
>> +        /*
>> +         * This implies that we have hit a machine check either when the
>> +         * guest has not registered FWNMI (i.e., "ibm,nmi-register" not
>> +         * called) or between system reset and "ibm,nmi-register".
>> +         * Fall back to the old machine check behavior in such cases.
>> +         */
>> +        cs->exception_index = POWERPC_EXCP_MCHECK;
>> +        ppc_cpu_do_interrupt(cs);
>> +        return;
>> +    }
>> +
>> +    while (spapr->mc_status != -1) {
>> +        /*
>> +         * Check whether the same CPU got machine check error
>> +         * while still handling the mc error (i.e., before
>> +         * that CPU called "ibm,nmi-interlock")
>> +         */
>> +        if (spapr->mc_status == cpu->vcpu_id) {
>> +            qemu_system_guest_panicked(NULL);
>> +            return;
>> +        }
>> +        qemu_cond_wait_iothread(&spapr->mc_delivery_cond);
>> +        /* Meanwhile if the system is reset, then just return */
>> +        if (spapr->guest_machine_check_addr == -1) {
>> +            return;
>> +        }
>> +    }
>> +    spapr->mc_status = cpu->vcpu_id;
>> +}
>> +
>>   static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>                               uint32_t token, uint32_t nargs,
>>                               target_ulong args,
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 7bc5fc3a9e..909d3976f9 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -191,6 +191,15 @@ struct SpaprMachineState {
>>        * occurs during the unplug process. */
>>       QTAILQ_HEAD(, SpaprDimmState) pending_dimm_unplugs;
>>   
>> +    /* State related to "ibm,nmi-register" and "ibm,nmi-interlock" calls */
>> +    target_ulong guest_machine_check_addr;
>> +    /*
>> +     * mc_status is set to -1 if mc is not in progress, else is set to the CPU
>> +     * handling the mc.
>> +     */
>> +    int mc_status;
>> +    QemuCond mc_delivery_cond;
>> +
>>       /*< public >*/
>>       char *kvm_type;
>>       char *host_model;
>> @@ -804,6 +813,7 @@ void spapr_clear_pending_events(SpaprMachineState *spapr);
>>   int spapr_max_server_number(SpaprMachineState *spapr);
>>   void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>                         uint64_t pte0, uint64_t pte1);
>> +void spapr_mce_req_event(PowerPCCPU *cpu);
>>   
>>   /* DRC callbacks. */
>>   void spapr_core_release(DeviceState *dev);
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 518de7e4b7..2aebb44e2f 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -1708,6 +1708,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>           ret = 0;
>>           break;
>>   
>> +    case KVM_EXIT_NMI:
>> +        trace_kvm_handle_nmi_exception();
>> +        ret = kvm_handle_nmi(cpu, run);
>> +        break;
>> +
>>       default:
>>           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>>           ret = -1;
>> @@ -2803,6 +2808,15 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>>       return data & 0xffff;
>>   }
>>   
>> +int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run)
>> +{
>> +    cpu_synchronize_state(CPU(cpu));
>> +
>> +    spapr_mce_req_event(cpu);
>> +
>> +    return 0;
>> +}
>> +
>>   int kvmppc_enable_hwrng(void)
>>   {
>>       if (!kvm_enabled() || !kvm_check_extension(kvm_state, KVM_CAP_PPC_HWRNG)) {
>> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
>> index eedb15d48e..bd2a0edf43 100644
>> --- a/target/ppc/kvm_ppc.h
>> +++ b/target/ppc/kvm_ppc.h
>> @@ -83,6 +83,8 @@ void kvm_check_mmu(PowerPCCPU *cpu, Error **errp);
>>   void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu, unsigned int online);
>>   void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
>>   
>> +int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
>> +
>>   #else
>>   
>>   static inline uint32_t kvmppc_get_tbfreq(void)
>> diff --git a/target/ppc/trace-events b/target/ppc/trace-events
>> index 3dc6740706..6d15aa90b4 100644
>> --- a/target/ppc/trace-events
>> +++ b/target/ppc/trace-events
>> @@ -28,3 +28,4 @@ kvm_handle_papr_hcall(void) "handle PAPR hypercall"
>>   kvm_handle_epr(void) "handle epr"
>>   kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
>>   kvm_handle_debug_exception(void) "handle debug exception"
>> +kvm_handle_nmi_exception(void) "handle NMI exception"


