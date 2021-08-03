Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC403DE81A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:14:29 +0200 (CEST)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApZE-0004U0-SS
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mApVD-0004EG-Tx; Tue, 03 Aug 2021 04:10:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45766
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mApV7-0007YU-Rk; Tue, 03 Aug 2021 04:10:19 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17384YfX120737; Tue, 3 Aug 2021 04:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pI0otqsBzb/cekoRHqFuizEc864SxA65OpHa9L5bFs4=;
 b=oJrzBmY67r2hH1x0XvMd1O913hOPCt1Xg6Pjdbx3JngoevPy+MiHIm+U075sE917tFKo
 j5g+zQlB7EV0E3+PBL+gmHbkVFnKj5KdAABTTOOCdpy/k3fjke4Ypk4EfrZwmms4MpcO
 5yA1FUYHtf+LuXU5L465JkX8in1xFkHagcahTknufYgn9c9JbmUue8QYu+LJ8nuczYP6
 A3UkQ/6HyFUSO3JW9NbSYWKdJbF0IwJNA/kMhe/ngQlYX7h2aTxYi3J2C6xaBz0OEQzt
 8TymZ//8weQcA8N23ENbHWDqMIYy6nNbRflRkvLtr2ytI7WJhMZIyFv3gF0V1kT0Wboe 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5m02euud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 04:10:10 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17384ar0120945;
 Tue, 3 Aug 2021 04:10:10 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5m02euth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 04:10:10 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17382A8n028883;
 Tue, 3 Aug 2021 08:10:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3a4x58xmqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 08:10:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17387Agd51249450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 08:07:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B947AA4060;
 Tue,  3 Aug 2021 08:10:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 616A4A4064;
 Tue,  3 Aug 2021 08:10:02 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.75.95])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 08:10:02 +0000 (GMT)
Subject: Re: [PATCH v2 2/5] s390x: kvm: topology: interception of PTF
 instruction
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-3-git-send-email-pmorel@linux.ibm.com>
Message-ID: <ba4762a7-7258-7985-9b2d-70e23e649c2c@linux.ibm.com>
Date: Tue, 3 Aug 2021 10:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626975764-22131-3-git-send-email-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xS1i2UYaD0tMsbU2FNuBgnlPcW8hySrd
X-Proofpoint-GUID: xjTo7R3INpGTaSCJ_S_19FAqdA1NZmkW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030055
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/22/21 7:42 PM, Pierre Morel wrote:
> Interception of the PTF instruction depending on the new
> KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c         | 45 ++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-virtio-ccw.h |  7 +++++
>   target/s390x/kvm/kvm.c             | 21 ++++++++++++++
>   3 files changed, 73 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..500e856974 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -404,6 +404,49 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
>       s390_pv_prep_reset();
>   }
>   
> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
> +{
> +    S390CcwMachineState *ms = S390_CCW_MACHINE(qdev_get_machine());
> +    CPUS390XState *env = &cpu->env;
> +    uint64_t reg = env->regs[r1];
> +    uint8_t fc = reg & S390_TOPO_FC_MASK;
> +
> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
> +        s390_program_interrupt(env, PGM_OPERAND, ra);
> +        return 0;
> +    }
> +
> +    if (env->psw.mask & PSW_MASK_PSTATE) {
> +        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
> +        return 0;
> +    }
> +
> +    if (reg & ~S390_TOPO_FC_MASK) {
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +        return 0;
> +    }
> +
> +    switch (fc) {
> +    case 0:    /* Horizontal polarization is already set */
> +        env->regs[r1] = S390_PTF_REASON_DONE;
> +        return 2;
> +    case 1:    /* Vertical polarization is not supported */
> +        env->regs[r1] = S390_PTF_REASON_NONE;
> +        return 2;
> +    case 2:    /* Report if a topology change report is pending */
> +        if (ms->topology_change_report_pending) {
> +            ms->topology_change_report_pending = false;
> +            return 1;
> +        }
> +        return 0;
> +    default:
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +        break;
> +    }
> +
> +    return 0;
> +}
> +

Hi all,

it seems the part where the topology change is made pending on CPU 
creation disappeared from this patch...:

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e02b2a8299..a9eeb11d1f 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -302,12 +302,14 @@ static void s390_cpu_plug(HotplugHandler *hotplug_dev,
                          DeviceState *dev, Error **errp)
  {
      MachineState *ms = MACHINE(hotplug_dev);
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
      S390CPU *cpu = S390_CPU(dev);

      g_assert(!ms->possible_cpus->cpus[cpu->env.core_id].cpu);
      ms->possible_cpus->cpus[cpu->env.core_id].cpu = OBJECT(dev);

      s390_topology_new_cpu(cpu->env.core_id);
+    s390ms->topology_change_report_pending = true;

      if (dev->hotplugged) {
          raise_irq_cpu_hotplug();


I will add this on the next round.

Otherwise, the changes in the Linux side to implement interpretation do 
not affect the QEMU implementation.

so... a gentle ping?

Pierre


>   static void s390_machine_reset(MachineState *machine)
>   {
>       S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
> @@ -433,6 +476,8 @@ static void s390_machine_reset(MachineState *machine)
>           run_on_cpu(cs, s390_do_cpu_ipl, RUN_ON_CPU_NULL);
>           break;
>       case S390_RESET_MODIFIED_CLEAR:
> +        /* clear topology_change_report pending condition on subsystem reset */
> +        ms->topology_change_report_pending = false;
>           /*
>            * Susbsystem reset needs to be done before we unshare memory
>            * and lose access to VIRTIO structures in guest memory.
> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
> index 3331990e02..fbde357332 100644
> --- a/include/hw/s390x/s390-virtio-ccw.h
> +++ b/include/hw/s390x/s390-virtio-ccw.h
> @@ -27,9 +27,16 @@ struct S390CcwMachineState {
>       bool aes_key_wrap;
>       bool dea_key_wrap;
>       bool pv;
> +    bool topology_change_report_pending;
>       uint8_t loadparm[8];
>   };
>   
> +#define S390_PTF_REASON_NONE (0x00 << 8)
> +#define S390_PTF_REASON_DONE (0x01 << 8)
> +#define S390_PTF_REASON_BUSY (0x02 << 8)
> +#define S390_TOPO_FC_MASK 0xffUL
> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
> +
>   struct S390CcwMachineClass {
>       /*< private >*/
>       MachineClass parent_class;
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 5b1fdb55c4..9a0c13d4ac 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -97,6 +97,7 @@
>   
>   #define PRIV_B9_EQBS                    0x9c
>   #define PRIV_B9_CLP                     0xa0
> +#define PRIV_B9_PTF                     0xa2
>   #define PRIV_B9_PCISTG                  0xd0
>   #define PRIV_B9_PCILG                   0xd2
>   #define PRIV_B9_RPCIT                   0xd3
> @@ -1452,6 +1453,16 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
>       }
>   }
>   
> +static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
> +{
> +    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
> +    uint8_t ret;
> +
> +    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
> +    setcc(cpu, ret);
> +    return 0;
> +}
> +
>   static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
>   {
>       int r = 0;
> @@ -1469,6 +1480,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
>       case PRIV_B9_RPCIT:
>           r = kvm_rpcit_service_call(cpu, run);
>           break;
> +    case PRIV_B9_PTF:
> +        r = kvm_handle_ptf(cpu, run);
> +        break;
>       case PRIV_B9_EQBS:
>           /* just inject exception */
>           r = -1;
> @@ -2470,6 +2484,13 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
>           set_bit(S390_FEAT_DIAG_318, model->features);
>       }
>   
> +    /*
> +     * Configuration topology is partially handled in KVM
> +     */
> +    if (kvm_check_extension(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY)) {
> +        set_bit(S390_FEAT_CONFIGURATION_TOPOLOGY, model->features);
> +    }
> +
>       /* strip of features that are not part of the maximum model */
>       bitmap_and(model->features, model->features, model->def->full_feat,
>                  S390_FEAT_MAX);
> 

-- 
Pierre Morel
IBM Lab Boeblingen

