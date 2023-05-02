Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997156F3E74
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 09:39:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptka0-0000Kb-DQ; Tue, 02 May 2023 03:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptkZv-0000KH-Ae; Tue, 02 May 2023 03:37:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ptkZt-0008Ci-89; Tue, 02 May 2023 03:37:39 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3427a1aq019603; Tue, 2 May 2023 07:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rfDaEj4359DZFTNuwneR2RW9xyr+c+TvExL1aWEcDU4=;
 b=UMAnvTed68w8V6ruNCtmW57RdWTSKQ+YzWX98cEdb6W6ioY6a7w/E5TVoRGSu01tXxxQ
 o1hQKjU6HvN3dzsHmdaIfRqUpr8o5l3EVJ2+ha/+kS3FoEPp9gKoCjIsqg4+7Dih7AYX
 nK95hzn0ML6CZUou6706vXSf/wDOCxI9mlV5Z1FwiJUs643uvt7f2DIIoJaqH2DrSIbX
 4OA6ZoUqiKe2GaD5XfNP3qvAk8naJ0uZsoS2vhFH6Mk88B+gk0RJV4nxme7U83iRbu4F
 RhugmqjO4PRXrnsTIX2XvjEn2Te4DwxsgPYK4s537Hsi7lvUEkksETkLkSoQD+NikrVX 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qawsk9764-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 07:37:28 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3427ZtJX019350;
 Tue, 2 May 2023 07:36:58 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qawsk96c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 07:36:58 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34275PFH008631;
 Tue, 2 May 2023 07:36:36 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3q8tv81tm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 07:36:36 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3427aZjg18612530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 May 2023 07:36:35 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C79D5805D;
 Tue,  2 May 2023 07:36:35 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0199358067;
 Tue,  2 May 2023 07:36:31 +0000 (GMT)
Received: from [9.43.49.207] (unknown [9.43.49.207])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  2 May 2023 07:36:30 +0000 (GMT)
Message-ID: <93e4ab27-d635-1e74-f20b-31a23cf4807e@linux.ibm.com>
Date: Tue, 2 May 2023 13:06:29 +0530
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
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSBL4SMP6M1W.SF2HQGVUNSBA@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pskVYqVRQebuk-eLzB9oovuFViDIcoFD
X-Proofpoint-GUID: FpdIEc7xnDf0wU1_RnKLMXAo_Um6lz5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=753 impostorscore=0 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020066
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



On 5/2/23 12:11, Nicholas Piggin wrote:
> On Tue May 2, 2023 at 4:13 PM AEST, Harsh Prateek Bora wrote:
>> On 5/2/23 10:19, Nicholas Piggin wrote:
>>> On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
>>>> @@ -1607,49 +1680,15 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>>>            return H_P2;
>>>>        }
>>>>    
>>>> -    len = sizeof(env->gpr);
>>>> -    assert(len == sizeof(regs->gpr));
>>>> -    memcpy(env->gpr, regs->gpr, len);
>>>> -
>>>> -    env->lr = regs->link;
>>>> -    env->ctr = regs->ctr;
>>>> -    cpu_write_xer(env, regs->xer);
>>>> -    ppc_store_cr(env, regs->ccr);
>>>> -
>>>> -    env->msr = regs->msr;
>>>> -    env->nip = regs->nip;
>>>> +    /* restore L2 env from hv_state and ptregs */
>>>> +    restore_l2_env(cpu, &hv_state, regs, now);
>>>>    
>>>>        address_space_unmap(CPU(cpu)->as, regs, len, len, false);
>>>
>>> I don't agree this improves readability. It also does more with the
>>> guest address space mapped, which may not be a big deal is strictly
>>> not an improvement.
>>>
>>> The comment needn't just repeat what the function says, and it does
>>> not actually restore the l2 environment. It sets some registers to
>>> L2 values, but it also leaves other state.
>>>
>>> I would like to see this in a larger series if it's going somewhere,
>>> but at the moment I'd rather leave it as is.
>>>
>> While I agree the routine could be named restore_l2_hvstate_ptregs() as
>> more appropriate, I think it still makes sense to have the body of
>> enter/exit routines with as minimum LOC as possible, with the help of
>> minimum helper routines possible.
> 
> I don't think that's a good goal. The entirity of entering and exiting
> from a nested guest is 279 lines including comments and no more than
> one level of control flow. It's tricky code and has worts, but not
> because the number of lines.
> 
Yes, It's a tricky code, and this patch was an attempt to simplify the 
tricky-ness by giving names to set of related ops with helper routines.

>> Giving semantics to the set of
>> operations related to ptregs/hvstate register load/store is the first
>> step towards it.
> 
> Those structures are entirely the domain of the hcall API though, so
> if anything belongs in the handler functions it is the handling of
> those IMO.
> 
Absolutely, ideally we would want to contain everything inside the 
handler, but if a logical name could be given to a set of related ops 
(ptregs/hvstate specific), that certainly helps the reader to look into 
bigger picture at first and then get into specific details as needed.

>> As you have guessed, this is certainly a precursor to another API
>> version that we have been working on (still a WIP), and helps isolating
>> the code flows for backward compatibiility. Having such changes early
>> upstream helps stablising changes which are not a really a API/design
>> change.
> 
> Right. Some more abstracting could certainly make sense here, I just
> think at this point we need to see the bigger picture.

I think I am fine holding the cleanup for enter/exit nested for now 
until we bring the next set of API changes upstream, as that will 
provide a better context to the value these changes would bring along.

Meanwhile, I shall address your comments on 1/4 and post a v3.
Thanks for all your review inputs.

regards,
Harsh
> 
> Thanks,
> Nick
> 

