Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98816E408B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:18:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJ7D-0005yY-VQ; Mon, 17 Apr 2023 03:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJ7B-0005wI-Hy; Mon, 17 Apr 2023 03:17:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJ79-0005O4-Qe; Mon, 17 Apr 2023 03:17:29 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H5ctlu011722; Mon, 17 Apr 2023 07:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yuHTv9MS82xfD9o3LAPTt1V4To+CL4TOz+Z2Ph9OMMA=;
 b=baBBKf9ANl9UvpORiRisv+9zQPNIw5PW5/YgU9eqhRUDrB9Dum3y95pmCfZWc6h+fy06
 DkXwhTfEVBdOqz3hK3BcJPz+19tgt88nQojRR32OOY3OZjM1rGSo9tjS3Dpb/Gdz4mib
 z7xfZeH7FIBdmJ3CndcBEHJKHup847xGUoq2Ac8YwtXx2zu+Zo7m5jGo1LgOSUqsdSPf
 qkoIIIQMw1kviqdc+iY8MREQxdGzfrtgE44gtl1/gP/rNJbZM4r4Dnmg2vtNzHbKRbY6
 VD0s7qPwmKaPUFlm3LV+06xMwnvusWTsvAoXCPNYIe4Cf1TFgrfSjYAZke/YlAfSprUc rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0e6aaycx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:17:25 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H6lpoA037505;
 Mon, 17 Apr 2023 07:17:25 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0e6aayck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:17:25 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H5CUsj003689;
 Mon, 17 Apr 2023 07:17:24 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pykj7m476-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:17:24 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H7HMQA10617426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 07:17:23 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFE0C58063;
 Mon, 17 Apr 2023 07:17:22 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E18D58053;
 Mon, 17 Apr 2023 07:17:21 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Apr 2023 07:17:20 +0000 (GMT)
Message-ID: <d543ff07-7cba-5475-35f6-653f3570b1ea@linux.ibm.com>
Date: Mon, 17 Apr 2023 12:47:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] ppc: spapr: cleanup spapr_exit_nested() with helper
 routines.
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-5-harshpb@linux.ibm.com> <87pm86isk4.fsf@suse.de>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87pm86isk4.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zt8LRZyP_GDdQmDuFiUOHlRswFaMe9p4
X-Proofpoint-GUID: nIr1uJTHv3vsgY0o0OlMLVMSP1wJ7H2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304170063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/14/23 17:28, Fabiano Rosas wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
> 
>> Currently, in spapr_exit_nested(), it does a lot of register state
>> restoring from ptregs/hvstate after mapping each of those before
>> restoring the L1 host state. This patch breaks down those set of ops
>> to respective helper routines for better code readability/maintenance.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> ---
>>   hw/ppc/spapr_hcall.c | 132 +++++++++++++++++++++++++------------------
>>   1 file changed, 78 insertions(+), 54 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index a77b4c9076..ed3a21471d 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1701,36 +1701,23 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>       return env->gpr[3];
>>   }
>>   
>> -void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>> +static void restore_hvstate_from_env(struct kvmppc_hv_guest_state *hvstate,
>> +                                     CPUPPCState *env, int excp)
>>   {
>> -    CPUState *cs = CPU(cpu);
>> -    CPUPPCState *env = &cpu->env;
>> -    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>> -    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
>> -    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
>> -    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
>> -    struct kvmppc_hv_guest_state *hvstate;
>> -    struct kvmppc_pt_regs *regs;
>> -    hwaddr len;
>> -
>> -    assert(spapr_cpu->in_nested);
>> -
>> -    cpu_ppc_hdecr_exit(env);
>> -
>> -    len = sizeof(*hvstate);
>> -    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>> -                                MEMTXATTRS_UNSPECIFIED);
>> -    if (len != sizeof(*hvstate)) {
>> -        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
>> -        r3_return = H_PARAMETER;
>> -        goto out_restore_l1;
>> -    }
>> -
>> -    hvstate->cfar = env->cfar;
>> -    hvstate->lpcr = env->spr[SPR_LPCR];
>> -    hvstate->pcr = env->spr[SPR_PCR];
>> -    hvstate->dpdes = env->spr[SPR_DPDES];
>> -    hvstate->hfscr = env->spr[SPR_HFSCR];
>> +    hvstate->cfar    = env->cfar;
>> +    hvstate->lpcr    = env->spr[SPR_LPCR];
>> +    hvstate->pcr     = env->spr[SPR_PCR];
>> +    hvstate->dpdes   = env->spr[SPR_DPDES];
>> +    hvstate->hfscr   = env->spr[SPR_HFSCR];
>> +    /* HEIR should be implemented for HV mode and saved here. */
>> +    hvstate->srr0    = env->spr[SPR_SRR0];
>> +    hvstate->srr1    = env->spr[SPR_SRR1];
>> +    hvstate->sprg[0] = env->spr[SPR_SPRG0];
>> +    hvstate->sprg[1] = env->spr[SPR_SPRG1];
>> +    hvstate->sprg[2] = env->spr[SPR_SPRG2];
>> +    hvstate->sprg[3] = env->spr[SPR_SPRG3];
>> +    hvstate->pidr    = env->spr[SPR_BOOKS_PID];
>> +    hvstate->ppr     = env->spr[SPR_PPR];
> 
> Just leave these lines as they were. Let's avoid spending time
> discussing code style. Also, the patch became harder to review by having
> these unrelated changes interspersed.
> 
Ok, will keep the spacing as-is inside helper routine 
restore_hvstate_from_env() as well.

