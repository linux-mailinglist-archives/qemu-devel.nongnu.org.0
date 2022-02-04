Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204124A9C4D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:53:27 +0100 (CET)
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0tp-0004DF-BT
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG0nl-00078z-56; Fri, 04 Feb 2022 10:47:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49678
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG0nj-00085s-4p; Fri, 04 Feb 2022 10:47:08 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214ETqeW016005; 
 Fri, 4 Feb 2022 15:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KrqYSVCUEYw+2W0eVmv1WLuEh8ViUrrkncCBTLXeRKM=;
 b=pQKqujjNRfD3HME3cWXsFLPJOuGHMvLHghG9dLDTQDhqTz90YbxIdTkawxWVxkbJwsJn
 SZnCdStyii2fGYX+Ih/ihzHiBYhMZ58KuefSw451frj0JK5kL9GsAZqR3ZdgoSjBqDar
 45HTKyFJLhifi1LQUc2DBgQgNsnIGAeVP5UZ9Xw8xeU99wnbTlpGXmSOEmj+CsqvhTer
 8larZUn5SXN8iwNeUsdUaKvZTO9yROayVNbc+bY6ky2kuMBP4q+QzeUNYWcFmDo8ZxaC
 mON8LtrtqKRl1R3OzclNWroKyNrStVZvxUIQKN/cF2hpPZuxUXFU6qNzUAJTqE61YC8e JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0rt5fcq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:46:46 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214FiqGD018811;
 Fri, 4 Feb 2022 15:46:45 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0rt5fcpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:46:45 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214FgvRS019169;
 Fri, 4 Feb 2022 15:46:45 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3e0r0rrqka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:46:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214Fkhb941353630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 15:46:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 844A8AC05F;
 Fri,  4 Feb 2022 15:46:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60E2EAC066;
 Fri,  4 Feb 2022 15:46:42 +0000 (GMT)
Received: from localhost (unknown [9.211.79.16])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Feb 2022 15:46:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 10/11] target/ppc: 6xx: Software TLB exceptions cleanup
In-Reply-To: <4bb49bac-12a7-b3ae-e719-e257366d15d5@eik.bme.hu>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
 <20220203200957.1434641-11-farosas@linux.ibm.com>
 <4bb49bac-12a7-b3ae-e719-e257366d15d5@eik.bme.hu>
Date: Fri, 04 Feb 2022 12:46:39 -0300
Message-ID: <87tude8wio.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IV_qFF1phFhEQJmT0iJag9eIDIjSf_0K
X-Proofpoint-ORIG-GUID: v2u69UkIihqkXcRC78_UsT8Rt0rkmEfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 spamscore=0 bulkscore=0 mlxlogscore=922 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 3 Feb 2022, Fabiano Rosas wrote:
>> This code applies only to the 6xx CPUs, so we can remove the switch
>> statement.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> target/ppc/excp_helper.c | 31 +++++++++++--------------------
>> 1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 538905c4dd..80168355bd 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -553,7 +553,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>> {
>>     CPUState *cs = CPU(cpu);
>>     CPUPPCState *env = &cpu->env;
>> -    int excp_model = env->excp_model;
>>     target_ulong msr, new_msr, vector;
>>     int srr0, srr1;
>>
>> @@ -695,26 +694,18 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>>     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
>>     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
>>     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
>> -        switch (excp_model) {
>> -        case POWERPC_EXCP_6xx:
>> -            /* Swap temporary saved registers with GPRs */
>> -            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
>> -                new_msr |= (target_ulong)1 << MSR_TGPR;
>> -                hreg_swap_gpr_tgpr(env);
>> -            }
>> -            /* fall through */
>> -        case POWERPC_EXCP_7x5:
>> -            ppc_excp_debug_sw_tlb(env, excp);
>> -
>> -            msr |= env->crf[0] << 28;
>> -            msr |= env->error_code; /* key, D/I, S/L bits */
>> -            /* Set way using a LRU mechanism */
>> -            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
>> -            break;
>> -        default:
>> -            cpu_abort(cs, "Invalid TLB miss exception\n");
>> -            break;
>> +        /* Swap temporary saved registers with GPRs */
>> +        if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
>> +            new_msr |= (target_ulong)1 << MSR_TGPR;
>> +            hreg_swap_gpr_tgpr(env);
>
> I get this one...
>
>>         }
>> +
>> +        ppc_excp_debug_sw_tlb(env, excp);
>> +
>> +        msr |= env->crf[0] << 28;
>> +        msr |= env->error_code; /* key, D/I, S/L bits */
>> +        /* Set way using a LRU mechanism */
>> +        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
>
> ...but not why this can be moved out from case or if. Is POWERPC_EXCP_7x5 
> the same as POWERPC_EXCP_6xx now?

There is a fallthrough in the original code after the first block. So
POWERPC_EXCP_6xx does the TGPR work and then falls through to the debug
print and SRR1 setting.

