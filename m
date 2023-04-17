Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAF6E4055
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:03:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poIsl-0002rb-2Y; Mon, 17 Apr 2023 03:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poIsV-0002g2-Nr; Mon, 17 Apr 2023 03:02:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poIsS-0001bF-1B; Mon, 17 Apr 2023 03:02:19 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H61d3m032472; Mon, 17 Apr 2023 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/lVqwzreO9+IqtLXUpBE+82U8YqAAhgyOJxvT76PDbY=;
 b=iLa6s9+W63sTpyPgV31S5OQgdQnDYhzpEvv9ZDHuWjMPt2c9WuSVTIjnkUzWta9tuQQE
 UyS/r/rSQdMMlDhk5D7Z9wDCieRv8VWyAxjDmzKCaMSG7dIpYzmxqNLVxTFjYmK34nmu
 KE+vOCtXiUjNFpbyF03tJ2T6cJ+We7wfCigxnbchZz6vKU3HLaLWjpsUPKC1KZvoT/1r
 d8L2CEDjox9JBiIk83ZrGmqoBw1285wNwctLG81ZXpwGBoOtc/OVuSagAEQsM6Sk0ssH
 g2E8+hmllEMboIJh33v++RLJVXIXExZ++1T+WmdBs2U4J3ZI+zQ8/9s7srBo+GlYglHp wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0f3m1487-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:02:13 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H6s5lg017265;
 Mon, 17 Apr 2023 07:02:13 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0f3m147s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:02:13 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H5He04013975;
 Mon, 17 Apr 2023 07:02:12 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pykj6v0pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:02:12 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H72AKn66060628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 07:02:11 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D345458059;
 Mon, 17 Apr 2023 07:02:10 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B09558043;
 Mon, 17 Apr 2023 07:02:09 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Apr 2023 07:02:09 +0000 (GMT)
Message-ID: <5739c35f-f6ca-ab31-da03-84710df4d4ac@linux.ibm.com>
Date: Mon, 17 Apr 2023 12:32:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-3-harshpb@linux.ibm.com> <87v8hyist8.fsf@suse.de>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87v8hyist8.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eMpRpWJOlbVboXQ0f8Rc0ROFLUY-ECKQ
X-Proofpoint-GUID: -LiuNKY1xLe-OVUoG86vD4EGHgDoiq6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_03,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/14/23 17:23, Fabiano Rosas wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
> 
>> h_enter_nested() currently does a lot of register specific operations
>> which should be abstracted logically to simplify the code for better
>> readability. This patch breaks down relevant blocks into respective
>> helper routines to make use of them for better readability/maintenance.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> ---
>>   hw/ppc/spapr_hcall.c | 99 +++++++++++++++++++++++++++-----------------
>>   1 file changed, 60 insertions(+), 39 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 124cee5e53..a13e5256ab 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1544,6 +1544,62 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
>>       return H_FUNCTION;
>>   }
>>   
>> +static void restore_hdec_from_hvstate(CPUPPCState *dst,
>> +                                      struct kvmppc_hv_guest_state *hv_state,
>> +                                      target_ulong now)
>> +{
>> +    target_ulong hdec;
> 
> add a blank line here

ok
> 
>> +    assert(hv_state);
>> +    hdec = hv_state->hdec_expiry - now;
>> +    cpu_ppc_hdecr_init(dst);
>> +    cpu_ppc_store_hdecr(dst, hdec);
>> +}
>> +
>> +static void restore_lpcr_from_hvstate(PowerPCCPU *cpu,
>> +                                      struct kvmppc_hv_guest_state *hv_state)
>> +{
>> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>> +    CPUPPCState *dst = &cpu->env;
>> +    target_ulong lpcr, lpcr_mask;
> 
> here as well

ok
> 
>> +    assert(hv_state);
>> +    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
>> +    lpcr = (dst->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state->lpcr & lpcr_mask);
>> +    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
>> +    lpcr &= ~LPCR_LPES0;
>> +    dst->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
>> +}
>> +
>> +static void restore_env_from_ptregs_hvstate(CPUPPCState *env,
> 
> Take a look at how the kernel does it. It might be better to have ptregs
> and hv regs separate. Also probably better to have some terms specific
> to the domain (l2 state, l1 state, etc).
> 

ok, will separate them out and include l2/l1 wherever applicable.

>> +                                            struct kvmppc_pt_regs *regs,
>> +                                            struct kvmppc_hv_guest_state *hv_state)
>> +{
>> +    assert(env);
>> +    assert(regs);
>> +    assert(hv_state);
>> +    assert(sizeof(env->gpr) == sizeof(regs->gpr));
>> +    memcpy(env->gpr, regs->gpr, sizeof(env->gpr));
>> +    env->nip = regs->nip;
>> +    env->msr = regs->msr;
>> +    env->lr = regs->link;
>> +    env->ctr = regs->ctr;
>> +    cpu_write_xer(env, regs->xer);
>> +    ppc_store_cr(env, regs->ccr);
>> +    /* hv_state->amor is not used in api v1 */
> 
> That's not really an API thing. More of an oversight.
> 
yeh, that comment was retained from existing source, will remove.

>> +    env->spr[SPR_HFSCR] = hv_state->hfscr;
>> +    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
>> +    env->cfar = hv_state->cfar;
>> +    env->spr[SPR_PCR]      = hv_state->pcr;
>> +    env->spr[SPR_DPDES]     = hv_state->dpdes;
>> +    env->spr[SPR_SRR0]      = hv_state->srr0;
>> +    env->spr[SPR_SRR1]      = hv_state->srr1;
>> +    env->spr[SPR_SPRG0]     = hv_state->sprg[0];
>> +    env->spr[SPR_SPRG1]     = hv_state->sprg[1];
>> +    env->spr[SPR_SPRG2]     = hv_state->sprg[2];
>> +    env->spr[SPR_SPRG3]     = hv_state->sprg[3];
>> +    env->spr[SPR_BOOKS_PID] = hv_state->pidr;
>> +    env->spr[SPR_PPR]       = hv_state->ppr;
> 
> I would advise against the extra spacing inside functions.
> 
sure, will keep the spacing as-is inside functions.

Thanks
Harsh

