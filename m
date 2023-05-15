Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C170276D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:41:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTlW-0002v9-0H; Mon, 15 May 2023 04:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyTlT-0002uS-HB; Mon, 15 May 2023 04:41:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyTlN-0004Ax-Se; Mon, 15 May 2023 04:41:05 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F8dh9u016067; Mon, 15 May 2023 08:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LBc4ETvndVok6fTz64XsdCxEw/kATNfsj/W6yigU8E8=;
 b=CwMqX06hozxL/JSPw7iFacA2caqqDRycoiICHuJdOOVJrnxcST/KmipDg/VjQlLZzZm9
 rZi4DcBMDgXXoY0acQf/nPmskdoUFGF4wHxl7bP0zV5lWNh39YZMtRm6Lgeho27RZBk4
 2hTm+7MgVbziEe99H6MAe4b17mBuRhzINuwdgbtq8/Eu7FdCvOnGrumqwobykVd6ECbD
 JoFpcC6CHsHU9bZDQ5QfiZl4k7JqeITsa8yAiJKOV2o0+hUHsrrUhLQjUJ2sZ2eualD7
 a2ubaDbtN25aJGjZ0dNr+SumJrEOJ/E0BRdXpt42j6Cmvp7lr5Ar5nsQOVE3wBEFVRik yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkdy9nywx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 08:40:45 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34F8e4fP019055;
 Mon, 15 May 2023 08:40:25 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkdy9nxs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 08:40:21 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F76t0s007333;
 Mon, 15 May 2023 08:32:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3qj265mqnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 08:32:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34F8WLHJ56492390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 08:32:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A682558060;
 Mon, 15 May 2023 08:32:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB2758055;
 Mon, 15 May 2023 08:32:20 +0000 (GMT)
Received: from [9.43.90.211] (unknown [9.43.90.211])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 15 May 2023 08:32:19 +0000 (GMT)
Message-ID: <67fcac44-675b-67b3-ba7b-61730c356f50@linux.ibm.com>
Date: Mon, 15 May 2023 14:02:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] target/ppc: Implement HEIR SPR
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-6-npiggin@gmail.com>
 <ZFoXjN/PUyDhMDG1@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com>
 <CSMPI9KZ5TT5.GAWG3D1ZUQ3H@wheely>
Content-Language: en-US
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSMPI9KZ5TT5.GAWG3D1ZUQ3H@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s5yp-JZeBFj9pM8bjpiZUZ-J9wFVbIDH
X-Proofpoint-GUID: MLFUOG9JmD7uV2iJLhnMn4sa47_XP_Rf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=878 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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



On 5/15/23 13:56, Nicholas Piggin wrote:
> On Tue May 9, 2023 at 7:51 PM AEST, Harsh Prateek Bora wrote:
>> On Thu, Mar 23, 2023 at 12:22:37PM +1000, Nicholas Piggin wrote:
>>> The hypervisor emulation assistance interrupt modifies HEIR to
>>> contain the value of the instruction which caused the exception.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   target/ppc/cpu.h         |  1 +
>>>   target/ppc/cpu_init.c    | 23 +++++++++++++++++++++++
>>>   target/ppc/excp_helper.c | 12 +++++++++++-
>>>   3 files changed, 35 insertions(+), 1 deletion(-)
>>>
>>
>> <snip>
>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 2e0321ab69..d206903562 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -1614,13 +1614,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>>>       case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
>>>       case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
>>>       case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
>>> -    case POWERPC_EXCP_HV_EMU:
>>>       case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
>>>           srr0 = SPR_HSRR0;
>>>           srr1 = SPR_HSRR1;
>>>           new_msr |= (target_ulong)MSR_HVB;
>>>           new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>>>           break;
>>> +    case POWERPC_EXCP_HV_EMU:
>>> +        env->spr[SPR_HEIR] = insn;
>>> +        if (is_prefix_excp(env, insn)) {
>>> +            uint32_t insn2 = ppc_ldl_code(env, env->nip + 4);
>>> +            env->spr[SPR_HEIR] |= (uint64_t)insn2 << 32;
>>> +        }
>>> +        srr0 = SPR_HSRR0;
>>> +        srr1 = SPR_HSRR1;
>>> +        new_msr |= (target_ulong)MSR_HVB;
>>> +        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>>> +        break;
>>
>> Since there is a common code, this could be better written like:
>>      case POWERPC_EXCP_HV_EMU:
>>          env->spr[SPR_HEIR] = insn;
>>          if (is_prefix_excp(env, insn)) {
>>              uint32_t insn2 = ppc_ldl_code(env, env->nip + 4);
>>              env->spr[SPR_HEIR] |= (uint64_t)insn2 << 32;
>>          }
>> 	/* fall through below common code for EXCP_HVIRT */
>>      case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
>>          srr0 = SPR_HSRR0;
>>          srr1 = SPR_HSRR1;
>>          new_msr |= (target_ulong)MSR_HVB;
>>          new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>>          break;
> 
> That would be wrong for the other HSRR fallthroughs above it.
> 
Oh yeh, in that case, may be move it to top of the EXCP_HISI, it would 
need duplicating one line of assignment though (relatively better?).

regards,
Harsh

> Thanks,
> Nick
> 

