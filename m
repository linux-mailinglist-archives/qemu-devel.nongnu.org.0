Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22216F4116
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:21:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn7o-0007E3-TU; Tue, 02 May 2023 06:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptn7m-0007Dl-Um; Tue, 02 May 2023 06:20:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptn7k-0001LX-JJ; Tue, 02 May 2023 06:20:46 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342AEI7x029933; Tue, 2 May 2023 10:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1jTdgEJHeLdOcVaPYD8Cqkkdc2D2jDbB4I0VRWspgpI=;
 b=HnRsuCz3oJ63rlLLG7iN4IjDzW8cxM1pub6+9hbs4dbFVd6txSqO6Z1HGyxaWSfzQSE/
 KH0AB01/R3a3GmcguXaHYIdOU+gh/UabuDGDfg/9azFENpqIm9tEP0ymZVmiJMOQwGLi
 zuf6MJUE4/VFwTm46VV2WChsTZTw9qlJCxy4tS4bKsgZMTA8LooQkjd40tT2IBjKYGol
 ZIAgPFa/k1PnCsmzCetqINh98sdxRM23qzZRCpSbEQQ7SyaCVr9V48aCywmOYl0EZ4BA
 e2cMvm0l+uO0BdhFzP2ZlJ7OAed0IxKb4QSKw+r1LPLl4uIVclZXmUI71cq/WAETTZ2F pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb08v0qmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 10:20:39 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342A6sHA028471;
 Tue, 2 May 2023 10:20:39 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb08v0qm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 10:20:39 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34268tcr004378;
 Tue, 2 May 2023 10:20:37 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv86v5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 10:20:37 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 342AKare26280580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 May 2023 10:20:36 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76AE658052;
 Tue,  2 May 2023 10:20:36 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09D025805D;
 Tue,  2 May 2023 10:20:34 +0000 (GMT)
Received: from [9.43.49.207] (unknown [9.43.49.207])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  2 May 2023 10:20:33 +0000 (GMT)
Message-ID: <535d3973-908e-c505-7169-0b2d0a3b77c3@linux.ibm.com>
Date: Tue, 2 May 2023 15:50:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, danielhb413@gmail.com,
 Michael Neuling <mikey@neuling.org>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-3-harshpb@linux.ibm.com>
 <CSBIRIKYBL78.3GGM8KZ1ERZUC@wheely>
 <a00bf0ea-94ce-e20b-f199-4ec3c776f458@linux.ibm.com>
 <CSBL4SMP6M1W.SF2HQGVUNSBA@wheely>
 <93e4ab27-d635-1e74-f20b-31a23cf4807e@linux.ibm.com>
 <CSBNNS9GD25G.221SGT7O9KJTI@wheely>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSBNNS9GD25G.221SGT7O9KJTI@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aFdm_8EZLS6ySKzLxAErmXBukCFKtvao
X-Proofpoint-GUID: Uz6fH9AcOF9R9XD7x7YWXISgglOWk07z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_05,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=923 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020087
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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



On 5/2/23 14:09, Nicholas Piggin wrote:
> On Tue May 2, 2023 at 5:36 PM AEST, Harsh Prateek Bora wrote:
>>
>>
>> On 5/2/23 12:11, Nicholas Piggin wrote:
>>> On Tue May 2, 2023 at 4:13 PM AEST, Harsh Prateek Bora wrote:
>>>> On 5/2/23 10:19, Nicholas Piggin wrote:
>>>>> On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
>>>>>> @@ -1607,49 +1680,15 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>>>>>             return H_P2;
>>>>>>         }
>>>>>>     
>>>>>> -    len = sizeof(env->gpr);
>>>>>> -    assert(len == sizeof(regs->gpr));
>>>>>> -    memcpy(env->gpr, regs->gpr, len);
>>>>>> -
>>>>>> -    env->lr = regs->link;
>>>>>> -    env->ctr = regs->ctr;
>>>>>> -    cpu_write_xer(env, regs->xer);
>>>>>> -    ppc_store_cr(env, regs->ccr);
>>>>>> -
>>>>>> -    env->msr = regs->msr;
>>>>>> -    env->nip = regs->nip;
>>>>>> +    /* restore L2 env from hv_state and ptregs */
>>>>>> +    restore_l2_env(cpu, &hv_state, regs, now);
>>>>>>     
>>>>>>         address_space_unmap(CPU(cpu)->as, regs, len, len, false);
>>>>>
>>>>> I don't agree this improves readability. It also does more with the
>>>>> guest address space mapped, which may not be a big deal is strictly
>>>>> not an improvement.
>>>>>
>>>>> The comment needn't just repeat what the function says, and it does
>>>>> not actually restore the l2 environment. It sets some registers to
>>>>> L2 values, but it also leaves other state.
>>>>>
>>>>> I would like to see this in a larger series if it's going somewhere,
>>>>> but at the moment I'd rather leave it as is.
>>>>>
>>>> While I agree the routine could be named restore_l2_hvstate_ptregs() as
>>>> more appropriate, I think it still makes sense to have the body of
>>>> enter/exit routines with as minimum LOC as possible, with the help of
>>>> minimum helper routines possible.
>>>
>>> I don't think that's a good goal. The entirity of entering and exiting
>>> from a nested guest is 279 lines including comments and no more than
>>> one level of control flow. It's tricky code and has worts, but not
>>> because the number of lines.
>>>
>> Yes, It's a tricky code, and this patch was an attempt to simplify the
>> tricky-ness by giving names to set of related ops with helper routines.
> 
> The H_ENTER_NESTED hcall says "here are a bunch of registers, set the
> environment to that and switch to the L2 guest.
> 
> So having a long list of registers may be a bit tedious but it's at the
> same level of abstraction as the call itself. Nothing really wrong with
> it. And you have to put that somewhere.
> 
> It can help to read tricky logic by factoring out something, but in this
> case the entire hcall just about is switching state, so
> 
>     switch_some_state();
>     ... switch other state ...
> 
> Isn't *necessarily* an improvement over
> 
>     ... switch some state...
>     ... switch other state...
> 
> There is no complicated logic around enter/exit, so there's really no
> additional clarity you get by being able to abstract some of it. The
> difficult part is how switching that state is entirely what causes the
> hcall interrupt to return to the L2 guest.
> 
I think the cleanup may look more appropriate when we have the new 
incoming changes in the same set of enter/exit routines, to ensure it 
doesn't look bloated then.

>>>> Giving semantics to the set of
>>>> operations related to ptregs/hvstate register load/store is the first
>>>> step towards it.
>>>
>>> Those structures are entirely the domain of the hcall API though, so
>>> if anything belongs in the handler functions it is the handling of
>>> those IMO.
>>>
>> Absolutely, ideally we would want to contain everything inside the
>> handler, but if a logical name could be given to a set of related ops
>> (ptregs/hvstate specific), that certainly helps the reader to look into
>> bigger picture at first and then get into specific details as needed.
> 
> But those related ops don't necesarily make sense to pull out like this,
> because they are tied to the API. So depending on what the bigger series
> is, it might not make sense. If you are to add another hcall API for
> nested HV, then I would say it's probably wrong. What you want to
> abstract is the switching between L1 and L2, not moving register values
> in and out of the hcall structs.
> 
There will be a set of new hcalls (to provide more capabilities) and it 
does reuse most of the existing logic/code in enter/exit path as well. 
As suggested, focus of cleanup shall remain on abstracting the switching 
between L1/L2 for common routines. We can discuss more later when we 
have the newer API changes ready for upstream.

>>>> As you have guessed, this is certainly a precursor to another API
>>>> version that we have been working on (still a WIP), and helps isolating
>>>> the code flows for backward compatibiility. Having such changes early
>>>> upstream helps stablising changes which are not a really a API/design
>>>> change.
>>>
>>> Right. Some more abstracting could certainly make sense here, I just
>>> think at this point we need to see the bigger picture.
>>
>> I think I am fine holding the cleanup for enter/exit nested for now
>> until we bring the next set of API changes upstream, as that will
>> provide a better context to the value these changes would bring along.
>>
>> Meanwhile, I shall address your comments on 1/4 and post a v3.
>> Thanks for all your review inputs.
> 
> Sounds good.

Thanks
Harsh
> 
> Thanks,
> Nick

