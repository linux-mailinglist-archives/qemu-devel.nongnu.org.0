Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2D489FD8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:06:45 +0100 (CET)
Received: from localhost ([::1]:56822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n700C-0001v5-JF
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:06:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zux-00045y-DE; Mon, 10 Jan 2022 14:01:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zuu-0001nh-NP; Mon, 10 Jan 2022 14:01:18 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AHbFZS011723; 
 Mon, 10 Jan 2022 19:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=D+QodqPXO6CJbzGJegPiAPJw3dmoPngam0MsIssq3Lw=;
 b=VMql7yd06taSLKPVBi9L2Yb1DBigu0um1zAIBA/+JvY7+ATLwTV988KEbb6T0JWk3O7Q
 gEU2LGKUYvFBbpPh2MqrRsIl1X1sOLVTJch3/dgu4MlY9u+nE49P+ulfqJrEdwTFTTa6
 Cj9JkT5yYB4n26DK/7Rz8ps2tiwk0KnzXB0X1MmjEKARpxLKxdipmg/SiqQyOyUkv7fg
 ngXR77hE0LHIHOQs4BIRlgQSKLHA/JhHlOiMTMOcygEch8v1BciaH406LLJ8gVGxZULM
 TFtULmKYpsHLzI92SWHGlwWcgxjVgF4h9Tf/JgqjMEosP8gtuffDEbJFcOkLKpiy+cd6 bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm2xst13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 19:00:58 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AIx5sY034270;
 Mon, 10 Jan 2022 19:00:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm2xst0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 19:00:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AIrhCG006222;
 Mon, 10 Jan 2022 19:00:57 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3df289v04m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 19:00:57 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AJ0t2X12714272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 19:00:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68F0FAC06E;
 Mon, 10 Jan 2022 19:00:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54953AC07B;
 Mon, 10 Jan 2022 19:00:54 +0000 (GMT)
Received: from localhost (unknown [9.211.79.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 10 Jan 2022 19:00:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 4/8] squash target/ppc: Introduce powerpc_excp_40x
In-Reply-To: <17495cce-79f1-1483-aab3-86ffcde7492e@eik.bme.hu>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-5-farosas@linux.ibm.com>
 <17495cce-79f1-1483-aab3-86ffcde7492e@eik.bme.hu>
Date: Mon, 10 Jan 2022 16:00:50 -0300
Message-ID: <875yqra00t.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fLnMSIq_-RMoxiaqshta-pSPJ2Rfu29D
X-Proofpoint-ORIG-GUID: AdmhHOGHF0of2t317RoI4UmaK3f6-4Ih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=739 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100130
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Mon, 10 Jan 2022, Fabiano Rosas wrote:
>> Introduce a new exception dispatcher for 40x CPUs.
>>
>> Differences from the generic powerpc_excp code:
>>
>> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
>> - No MSR_HV or MSR_LE;
>> - No power saving states;
>> - No Hypervisor Emulation Assistance;
>> - Not 64 bits;
>> - No System call vectored;
>> - No Interrupts Little Endian;
>> - No Alternate Interrupt Location.
>>
>> Exceptions used:
>>
>> POWERPC_EXCP_ALIGN
>> POWERPC_EXCP_APU
>> POWERPC_EXCP_CRITICAL
>> POWERPC_EXCP_DEBUG
>> POWERPC_EXCP_DSI
>> POWERPC_EXCP_DTLB
>> POWERPC_EXCP_EXTERNAL
>> POWERPC_EXCP_FIT
>> POWERPC_EXCP_FPU
>> POWERPC_EXCP_ISI
>> POWERPC_EXCP_ITLB
>> POWERPC_EXCP_MCHECK
>> POWERPC_EXCP_PIT
>> POWERPC_EXCP_PROGRAM
>> POWERPC_EXCP_SYSCALL
>> POWERPC_EXCP_WDT
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> target/ppc/excp_helper.c | 165 +++------------------------------------
>> 1 file changed, 13 insertions(+), 152 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 12ab5e1b34..1d997c4d6b 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -409,54 +409,18 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>                   excp, env->error_code);
>>
>>     /* new srr1 value excluding must-be-zero bits */
>> -    if (excp_model == POWERPC_EXCP_BOOKE) {
>> -        msr = env->msr;
>> -    } else {
>> -        msr = env->msr & ~0x783f0000ULL;
>> -    }
>> +    msr = env->msr & ~0x783f0000ULL;
>>
>>     /*
>> -     * new interrupt handler msr preserves existing HV and ME unless
>> -     * explicitly overriden
>> +     * new interrupt handler msr preserves existing ME unless
>> +     * explicitly overriden.
>>      */
>> -    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
>> +    new_msr = env->msr & (((target_ulong)1 << MSR_ME));
>>
>>     /* target registers */
>>     srr0 = SPR_SRR0;
>>     srr1 = SPR_SRR1;
>>
>> -    /*
>> -     * check for special resume at 0x100 from doze/nap/sleep/winkle on
>> -     * P7/P8/P9
>> -     */
>> -    if (env->resume_as_sreset) {
>> -        excp = powerpc_reset_wakeup(cs, env, excp, &msr);
>> -    }
>> -
>> -    /*
>> -     * Hypervisor emulation assistance interrupt only exists on server
>> -     * arch 2.05 server or later. We also don't want to generate it if
>> -     * we don't have HVB in msr_mask (PAPR mode).
>> -     */
>> -    if (excp == POWERPC_EXCP_HV_EMU
>> -#if defined(TARGET_PPC64)
>> -        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
>> -#endif /* defined(TARGET_PPC64) */
>> -
>> -    ) {
>> -        excp = POWERPC_EXCP_PROGRAM;
>> -    }
>> -
>> -#ifdef TARGET_PPC64
>> -    /*
>> -     * SPEU and VPU share the same IVOR but they exist in different
>> -     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
>> -     */
>> -    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
>> -        excp = POWERPC_EXCP_SPEU;
>> -    }
>> -#endif
>> -
>>     vector = env->excp_vectors[excp];
>>     if (vector == (target_ulong)-1ULL) {
>>         cpu_abort(cs, "Raised an exception without defined vector %d\n",
>> @@ -581,6 +545,11 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>          */
>>         env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
>>         break;
>> +    case POWERPC_EXCP_HV_EMU:
>> +        /*
>> +         * Hypervisor emulation assistance interrupt only exists on server
>> +         * arch 2.05 server or later.
>> +         */
>>     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
>>         switch (env->error_code & ~0xF) {
>>         case POWERPC_EXCP_FP:
>> @@ -645,22 +614,8 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>             new_msr |= (target_ulong)MSR_HVB;
>>         }
>>         break;
>> -    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
>> -        lev = env->error_code;
>> -        dump_syscall(env);
>> -        env->nip += 4;
>> -        new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
>> -        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>> -
>> -        vector += lev * 0x20;
>> -
>> -        env->lr = env->nip;
>> -        env->ctr = msr;
>> -        break;
>>     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
>>     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
>> -    case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
>> -        break;
>
> Removing the break here makes FPU and APU fall through to FIT. Is that 
> intentional?

No, that is a mistake indeed. Thanks.

