Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AA946F3CC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 20:17:44 +0100 (CET)
Received: from localhost ([::1]:59068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvOvH-0005zy-43
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 14:17:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvOt6-00057n-5Q; Thu, 09 Dec 2021 14:15:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvOt2-0003lZ-Rd; Thu, 09 Dec 2021 14:15:27 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9IjCMI018492; 
 Thu, 9 Dec 2021 19:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dRCPheyk4CSD8/bMhIDjU8AnJDpo/zK8R8QCz0IevT8=;
 b=tcXzneYqo7h8TOxqVWv5njufjfcWfMqvYbWUdObli7J36lbNAFOlbVRS6Jwy/R2YIdvp
 BCFiQSHA3KqYh2VjnEm1nwtLZw9wzw8Rt2sy13mXMwHbCEG32R9xe8hmVrwgMNr22U4p
 bfWwvmxvVBfsR5ozI8BPCwrnP4V26Me3N8qGx2sxtOAM9kkE/r7F9SBh5U32/eQS+Zne
 9+yclsp+nv9tNK7O5Q+KKNfhGjN0Pf/loDSC5YjaYxFGoYifIqn85wrbT4gk9Wql8YuZ
 uKS8X5+vkmY05ZQ1WlntotOVj5/ttle+z4AZTMrmAs6ydNgYHdFk1/h7jBW+xiDy8DhH TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuq3xgt8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 19:15:10 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9IjIcV019042;
 Thu, 9 Dec 2021 19:15:09 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuq3xgt82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 19:15:09 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9J4542014964;
 Thu, 9 Dec 2021 19:15:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3cqyyc02ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 19:15:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9JF7Dm18809164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 19:15:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 298CA78074;
 Thu,  9 Dec 2021 19:15:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9874E78091;
 Thu,  9 Dec 2021 19:15:06 +0000 (GMT)
Received: from localhost (unknown [9.163.12.190])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Dec 2021 19:15:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt
 with CONFIG_TCG
In-Reply-To: <87h7bh666e.fsf@linux.ibm.com>
References: <20211208230650.2125095-1-farosas@linux.ibm.com>
 <c17bf4e0-2c5c-0748-0539-34b441c81644@kaod.org>
 <87o85p6cog.fsf@linux.ibm.com>
 <a2cca719-7d28-65a1-97c4-c91d9a469cbf@kaod.org>
 <87h7bh666e.fsf@linux.ibm.com>
Date: Thu, 09 Dec 2021 16:15:04 -0300
Message-ID: <87czm56153.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3rLZUqFZ3wTiFLzt_WEHUMxlXvQK14Z0
X-Proofpoint-GUID: 8eIKwEpg4v_NWF4fzNAHUOZ_PG1ixLiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_08,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090100
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>
>> Richard,
>>
>> On 12/9/21 16:05, Fabiano Rosas wrote:
>>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>>=20
>>>> On 12/9/21 00:06, Fabiano Rosas wrote:
>>>>> We cannot have TCG code in powerpc_excp because the function is called
>>>>> from kvm-only code via ppc_cpu_do_interrupt:
>>>>>
>>>>>    ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>>>>>    function =E2=80=98cpu_ldl_code=E2=80=99 [-Werror=3Dimplicit-functi=
on-declaration]
>>>>>
>>>>> Fortunately, the Alignment interrupt is not among the ones dispatched
>>>>> from kvm-only code, so we can keep it out of the disable-tcg build for
>>>>> now.
>>>>>
>>>>> Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_exc=
p")
>>>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Perhaps we could make powerpc_excp TCG only and have a separate
>>>>> function that only knows the two interrupts that we use with KVM
>>>>> (Program, Machine check). But for now this fix will do, I think.
>>>>> ---
>>>>>    target/ppc/excp_helper.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>>>> index 17607adbe4..dcf22440cc 100644
>>>>> --- a/target/ppc/excp_helper.c
>>>>> +++ b/target/ppc/excp_helper.c
>>>>> @@ -453,6 +453,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, =
int excp_model, int excp)
>>>>>            }
>>>>>            break;
>>>>>        }
>>>>> +#ifdef CONFIG_TCG
>>>>>        case POWERPC_EXCP_ALIGN:     /* Alignment exception           =
           */
>>>>>            /*
>>>>>             * Get rS/rD and rA from faulting opcode.
>>>>> @@ -464,6 +465,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, =
int excp_model, int excp)
>>>>>                env->spr[SPR_DSISR] |=3D (insn & 0x03FF0000) >> 16;
>>>>>            }
>>>>>            break;
>>>>> +#endif
>>>>>        case POWERPC_EXCP_PROGRAM:   /* Program exception             =
           */
>>>>>            switch (env->error_code & ~0xF) {
>>>>>            case POWERPC_EXCP_FP:
>>>>>
>>>>
>>>> Shouldn't we move that code under ppc_cpu_do_unaligned_access ?
>>>=20
>>> Well, it came from there initially. We could revert 336e91f853 and that
>>> would fix the issue as well.
>>
>> What would you prefer ?
>
> Well none of this interfere with the work I'm doing, so it really makes
> no difference. I guess reverting the patch is cleaner than having an
> ifdef loose in the middle of the code. I'll send a v2 with the revert.
>

Ah I missed that you were talking to Richard! That first line got kind of
hidden.

I already sent a v2, but as I said, I have no preference either
way. Let's hear from Richard.

Sorry for the confusion =3D)

>>
>> Thanks,
>>
>> C.

