Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3149EE4A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:54:03 +0100 (CET)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDeU-0002Ln-Rn
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:54:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDDdG-000183-Pf; Thu, 27 Jan 2022 17:52:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDDdD-00053s-NP; Thu, 27 Jan 2022 17:52:46 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RMGRf8010010; 
 Thu, 27 Jan 2022 22:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2cjL40uxaBXr4T1QlrGR6Xg+vWHvRoF8m+9oXyt1Hx8=;
 b=XnpMYEa4f9BUnttMq71Azy2M0vBld+9vJmt0pzu/nHbiMEH/ilm/1RxJwlAVrWBfSQxK
 /uvNhNythX757m9Pwo5HB1w6mQCFX9FBXU3MN47UnbiHS+SHNglBTr+dpok+OB3HSFa/
 83dl59VRFupRnjAOCN9bExQbe0sp7ayYvoGC/PVk+e2iuDvfa9fCQWZoe6u5pOM/UQ5+
 nZefbNXxQAV8VjS26lP4M9tN2VBU3Li+4ybhyzyAUrDMX/8aKOpelsqgJiLa4d2twj+e
 nCiVKp5dtsY0YT3ZE/+vTTqc0IvR1bVmcA2VlYE1jKL9lp2IcRNkvVHFOGr3s+eahpyZ /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv41w8kxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 22:52:35 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RMZGbY038845;
 Thu, 27 Jan 2022 22:52:34 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv41w8kwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 22:52:34 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RMnvpk011026;
 Thu, 27 Jan 2022 22:52:33 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3dr9jc691w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 22:52:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RMqWb116515476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 22:52:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1232ABE07C;
 Thu, 27 Jan 2022 22:52:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B626BE068;
 Thu, 27 Jan 2022 22:52:31 +0000 (GMT)
Received: from localhost (unknown [9.211.129.51])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Jan 2022 22:52:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 8/8] target/ppc: 74xx: Set SRRs directly in exception
 code
In-Reply-To: <f93bbb9-82d4-6437-ca29-6413fe4a7375@eik.bme.hu>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
 <20220127201116.1154733-9-farosas@linux.ibm.com>
 <f93bbb9-82d4-6437-ca29-6413fe4a7375@eik.bme.hu>
Date: Thu, 27 Jan 2022 19:52:28 -0300
Message-ID: <877dakrdub.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J6EZwFAqcdtb8D1ZZudDnKhgKSjs1MiB
X-Proofpoint-GUID: YK8l1WzObWlWxwZqp2XG7Y4kYEgWFJxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_05,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxlogscore=927 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 27 Jan 2022, Fabiano Rosas wrote:
>> The 74xx does not have alternate/hypervisor Save and Restore
>> Registers, so we can set SRR0 and SRR1 directly.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> target/ppc/excp_helper.c | 13 ++-----------
>> 1 file changed, 2 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index b7921c0956..4e6bb87b70 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -556,7 +556,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>>     CPUState *cs = CPU(cpu);
>>     CPUPPCState *env = &cpu->env;
>>     target_ulong msr, new_msr, vector;
>> -    int srr0, srr1;
>>
>>     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
>>         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>> @@ -575,10 +574,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>>      */
>>     new_msr = env->msr & ((target_ulong)1 << MSR_ME);
>>
>> -    /* target registers */
>> -    srr0 = SPR_SRR0;
>> -    srr1 = SPR_SRR1;
>> -
>>     /*
>>      * Hypervisor emulation assistance interrupt only exists on server
>>      * arch 2.05 server or later.
>> @@ -731,10 +726,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>>             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
>>                       "no HV support\n", excp);
>>         }
>
> If we have ho MSR_HVB why is this still here? Shouldn't it have been gone 
> in patch 2? Or is this still reachable?

It is still reachable. Any of the individual exceptions above could set
the wrong bit. I have been keeping this block for all CPUs because I
intend to extract this sanity check to an outer function after I move
all CPU families.

In the long run I think we should validate MSR against the whole
msr_mask instead of just checking this single bit. But I am not
confident that today all the bits that are set are also present in the
corresponding location in the msr_mask.

>> -        If (srr0 == SPR_HSRR0) {
>> -            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
>> -                      "no HV support\n", excp);
>> -        }
>>     }
>>
>>     /*
>> @@ -746,10 +737,10 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>>     }
>>
>>     /* Save PC */
>> -    env->spr[srr0] = env->nip;
>> +    env->spr[SPR_SRR0] = env->nip;
>>
>>     /* Save MSR */
>> -    env->spr[srr1] = msr;
>> +    env->spr[SPR_SRR1] = msr;
>>
>>     powerpc_set_excp_state(cpu, vector, new_msr);
>> }
>>

