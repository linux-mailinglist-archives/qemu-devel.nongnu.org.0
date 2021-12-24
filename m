Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7C47EE85
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:18:01 +0100 (CET)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iaH-00014y-1I
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n0iXA-0006EO-AV; Fri, 24 Dec 2021 06:14:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n0iX8-0005xF-LZ; Fri, 24 Dec 2021 06:14:48 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BOBCNhM001880; 
 Fri, 24 Dec 2021 11:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=N+T76bWHAKF1jayuDG4JTQIZ8gvE+X/lstcvu87sHx8=;
 b=qSq6OoTm9yhZLSTNsTWdDU2jInCCDo80fOQvM+iRA9lRUsUspPITrmSKvllU+/Yz7Iwq
 uPVjjezf6QHMOpmzKKXYAFC5tFhlR3wfaOW3ojvp1b4wvuFvMQ/P+sPclLe83iP6U3YJ
 pVYtkWI4c8xCXAysUZ8NP8s9icqv2MehQcMoaqVHj9sRQMTQ1WtDAm5X7Y5/CHiH0fCU
 ANaGYcEQCWEz6RpFDhC57e4ecIghRaXoL7orphFJ2NZU7z2sTbgzUbZgJryOeJE5CVkx
 Nbh5ftc9b/q900MPq9GjEXjO7Jy0IPuoe2ezdQ2Q6WOrqmCyXQ1Dgjo8eTI8xzw1vGiM rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d5d4dr0r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 11:14:33 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BOBEW55005910;
 Fri, 24 Dec 2021 11:14:32 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d5d4dr0r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 11:14:32 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BOBCe0O025280;
 Fri, 24 Dec 2021 11:14:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3d179c17av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Dec 2021 11:14:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BOBEVMR8978734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Dec 2021 11:14:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0381278063;
 Fri, 24 Dec 2021 11:14:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51AD478069;
 Fri, 24 Dec 2021 11:14:30 +0000 (GMT)
Received: from localhost (unknown [9.211.134.40])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Dec 2021 11:14:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [RFC v2 02/12] target/ppc: powerpc_excp: Set vector earlier
In-Reply-To: <302f14b9-adcb-26c2-74a9-5c74eb74a751@linaro.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-3-farosas@linux.ibm.com>
 <302f14b9-adcb-26c2-74a9-5c74eb74a751@linaro.org>
Date: Fri, 24 Dec 2021 08:14:27 -0300
Message-ID: <875yres19o.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -o55gxFlyw-w0mZt5Yq6Srf2WneCwM8C
X-Proofpoint-ORIG-GUID: 3UcLlPViBiEYslneWe5tj7Yp8Ryt1LBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=948 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112240054
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/20/21 10:18 AM, Fabiano Rosas wrote:
>> None of the interrupt setup code touches 'vector', so we can move it
>> earlier in the function. This will allow us to later move the System
>> Call Vectored setup that is on the top level into the
>> POWERPC_EXCP_SYSCALL_VECTORED code block.
>> 
>> This patch also moves the verification for when 'excp' does not have
>> an address associated with it. We now bail a little earlier when that
>> is the case. This should not cause any visible effects.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   target/ppc/excp_helper.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>> 
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 8b9c6bc5a8..14fd0213a0 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -352,6 +352,14 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>       }
>>   #endif
>>   
>> +    vector = env->excp_vectors[excp];
>> +    if (vector == (target_ulong)-1ULL) {
>> +        cpu_abort(cs, "Raised an exception without defined vector %d\n",
>> +                  excp);
>> +    }
>> +
>> +    vector |= env->excp_prefix;
>> +
>>       switch (excp) {
>>       case POWERPC_EXCP_NONE:
>>           /* Should never happen */
>
> You've moved the cpu_abort above the excp check above the early return for NONE (which 
> possibly shouldn't exist) and above the excp default

Right, I think I had this patch initially after patch 7 which moves the
NONE check ealier in the function. I'll reorganize.

>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>
> I would certainly expect invalid excp to not have a defined vector
> either.

One thing we always had that this series makes more explicit is the
distinction between what interrupts QEMU knows about and what vectors a
processor uses. I have played around with using the same data structure
to hold both, which would perhaps match the expectation more closely,
but nothing came out of it. I think there's still space after this
series for further improvement in that regard.

> I'll also note that the excp_vectors[] index is no longer bounds checked by the switch.

Ack.

