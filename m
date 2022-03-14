Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B84D8F57
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 23:11:52 +0100 (CET)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTsur-0005Zx-Si
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 18:11:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nTstg-00042D-59; Mon, 14 Mar 2022 18:10:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nTstX-0004lv-Sp; Mon, 14 Mar 2022 18:10:33 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ELhi38018125; 
 Mon, 14 Mar 2022 22:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=g4cUT5KORuo3wqndUr10UNDIlxHVwqylnwuYcooV+08=;
 b=AL/36fn8YIytT+Ccjeq2v1BkUQAYs8peSqxuVqE+j3NCF/3lhYqFj9CZd31LZ0QTuKzS
 zOi0RaK6y6mNV5Zr0kAJ/ruRjMDWvci1Xm08ZPNyFs1XSnVM1wsR7/0ES1HiCSN5lRmL
 R0PmhTasA3CfcNabsQAr0WHiwdrUOsDbwNqRwEK8sngpSirRmJQD8XFYNBO4GYR3JydF
 7vi8i1uP3iPXXF+A9PmOjpVALfGOh941LIJb7ylS5Ur+ZtyRmcMNwy//Df+nnOqQ9oEz
 9+7RoKbgta58rGZaBVG6vpRJOsH1tguDWyS1cvjFvnvuHqkcHcj/23rlWBnpsaYc7tYb jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etdvg8c51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:10:17 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ELqkUk018583;
 Mon, 14 Mar 2022 22:10:17 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etdvg8c4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:10:17 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EM7BDH029522;
 Mon, 14 Mar 2022 22:10:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3erk59gwyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:10:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EMAEPF6816710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:10:14 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 949CBAE068;
 Mon, 14 Mar 2022 22:10:14 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 872C3AE064;
 Mon, 14 Mar 2022 22:10:13 +0000 (GMT)
Received: from localhost (unknown [9.211.82.138])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Mar 2022 22:10:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
In-Reply-To: <YixlR+rLNZCsAA50@yekko>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
 <YixlR+rLNZCsAA50@yekko>
Date: Mon, 14 Mar 2022 19:10:10 -0300
Message-ID: <87ee346v99.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2yNuuuaBhYiB-pq4EjsJjbf4MNEyqMIO
X-Proofpoint-GUID: Lp2GM_HtfxSlH3-OCDwshPxpuP8mveLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140126
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Tue, Mar 08, 2022 at 10:23:59PM -0300, Fabiano Rosas wrote:
>> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
>> property of the /chosen node. Byte number 26 specifies Radix Table
>> Expansions, currently only GTSE (Guest Translation Shootdown
>> Enable). This feature determines whether the tlbie instruction (and
>> others) are HV privileged.
>> 
>> Up until now, we always reported GTSE=1 to guests. Even after the
>> support for GTSE=0 was added. As part of that support, a kernel
>> command line radix_hcall_invalidate=on was introduced that overrides
>> the GTSE value received via CAS. So a guest can run with GTSE=0 and
>> use the H_RPT_INVALIDATE hcall instead of tlbie.
>> 
>> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
>> when running nested KVM guests because KVM does not allow a nested
>> hypervisor to set GTSE support for its nested guests. So a nested
>> guest always uses the same value for LPCR_GTSE as its HV. Since the
>> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=1, we run
>> into a crash when:
>> 
>> L1 LPCR_GTSE=0
>> L2 LPCR_GTSE=0
>> L2 CAS GTSE=1
>> 
>> The nested guest will run 'tlbie' and crash because the HW looks at
>> LPCR_GTSE, which is clear.
>> 
>> Having GTSE disabled in the L1 and enabled in the L2 is not an option
>> because the whole purpose of GTSE is to disallow access to tlbie and
>> we cannot allow L1 to spawn L2s that can access features that L1
>> itself cannot.
>> 
>> We also cannot have the guest check the LPCR bit, because LPCR is
>> HV-privileged.
>> 
>> So this patch goes through the most intuitive route which is to have
>> QEMU ask KVM about GTSE support and advertise the correct value to the
>> guest. A new KVM_CAP_PPC_GTSE capability is being added.
>> 
>> TCG continues to always enable GTSE.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  hw/ppc/spapr.c       | 38 +++++++++++++++++++++++++++++++-------
>>  target/ppc/kvm.c     |  8 ++++++++
>>  target/ppc/kvm_ppc.h |  6 ++++++
>>  3 files changed, 45 insertions(+), 7 deletions(-)
>> 
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 4cc204f90d..3e95a1831f 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -971,7 +971,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>>          23, 0x00, /* XICS / XIVE mode */
>>          24, 0x00, /* Hash/Radix, filled in below. */
>>          25, 0x00, /* Hash options: Segment Tables == no, GTSE == no. */
>> -        26, 0x40, /* Radix options: GTSE == yes. */
>> +        26, 0x00, /* Radix options, filled in below. */
>>      };
>>  
>>      if (spapr->irq->xics && spapr->irq->xive) {
>> @@ -1000,10 +1000,16 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
>>          } else {
>>              val[3] = 0x00; /* Hash */
>>          }
>> +
>> +        if (kvmppc_has_cap_gtse()) {
>> +            val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
>> +        }
>>      } else {
>>          /* V3 MMU supports both hash and radix in tcg (with dynamic switching) */
>>          val[3] = 0xC0;
>> +        val[7] = 0x40 /* OV5_MMU_RADIX_GTSE */;
>>      }
>> +
>>      _FDT(fdt_setprop(fdt, chosen, "ibm,arch-vec-5-platform-support",
>>                       val, sizeof(val)));
>>  }
>> @@ -2824,14 +2830,32 @@ static void spapr_machine_init(MachineState *machine)
>>      /* Init numa_assoc_array */
>>      spapr_numa_associativity_init(spapr, machine);
>>  
>> -    if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>> -        ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>> +    if (ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
>>                                spapr->max_compat_pvr)) {
>> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
>> -        /* KVM and TCG always allow GTSE with radix... */
>> -        spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
>> +
>> +        /* TCG always supports Radix w/ GTSE */
>> +        if (!kvm_enabled()) {
>> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_300);
>> +            spapr_ovec_set(spapr->ov5, OV5_MMU_RADIX_GTSE);
>
> Yeah, this is no good.  It's never ok to change guest visible
> behaviour depending on host properties (in this case whether it's KVM
> or not).  It messes up the invariants we need for migration, which
> require that the guest visible state depend only on the user
> configuration.
>
> The usual way to handle this is with a new capability, you can then
> change the default with the next machine version.

This particular problem is tricky. TCG cannot disable GTSE because it
does not support H_RPT_INVALIDATE. And older kernels that don't know
about the feature require GTSE.

KVM can afford to disable GTSE because we have a compatibility mechanism
(although a bit crooked): We can invert the logic for the KVM_CAP so
that the presence of KVM_CAP_PPC_GTSE_DISABLE would mean QEMU is allowed
to disable GTSE. Then:
  - older KVM + new QEMU would keep GTSE enabled;

  - older L1 guests are not affected because the host would report
    GTSE=1 with the KVM capability. By the time we decide to disable
    GTSE for L1 guests hopefully all older kernels will be out of use;

  - older nested guests:
    - if L1 runs with GTSE=1, are not affected;

    - if L1 disabled GTSE via kernel cmdline, are already broken (this
      bug). But they would go from crashing to being aborted* by QEMU
      (the guest asks for HPT in the lack of GTSE; nested KVM is radix
      only);

      * there are other broken cases which are fixed completely.

To satisfy TCG we could keep a spapr capability as ON and usually the
guest would pass cap-gtse=off when running with KVM. However this
doesn't work because this crash happens precisely because the nested
guest doesn't know that it needs to use cap-rpt-invalidate=on. Another
cap wouldn't help.

So I think the only way to have a spapr capability for this is if TCG
always defaults to ON and KVM always defaults to OFF. But then we would
be changing guest visible behaviour depending on host properties.


