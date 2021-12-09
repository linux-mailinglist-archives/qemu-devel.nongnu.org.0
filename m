Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EA46F1E1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:28:46 +0100 (CET)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNDo-0001vN-Re
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvNBm-00005q-07; Thu, 09 Dec 2021 12:26:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvNBj-0000Aj-Nw; Thu, 09 Dec 2021 12:26:37 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9H9jj0008199; 
 Thu, 9 Dec 2021 17:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=4eaj6lO4OvM/1Se43bbY3NNwVmo1qMl+2QdCNxPuIMs=;
 b=BAZq+4eYpvV+WruLgRlOQlvIM0PqQff8qPHnBFvCXlmRDjqxmTVujsy+tfeBnQCYvC0U
 waqILPudmWNFGpLfs7eTRvS+Ef8FaOxIyfsJZOQZmSZdHuDO/NM5rDVV2K/F/28uKF9E
 +hyFM5d2N1d+sccl5bOd1owNWRGJbnAU7n7glAzElrz75SiwGdLhFejFoq8nezrpuguq
 K/plcaAvCxJkuL38Q+W0hSksgIdr5GEnVIKpuh3e4BfBetaHWlRCxIt6fjdwMhtaQmFc
 X7ImPIUpbEKcl8TqC7ReUI7XFZWLoTH5ebUVo8+fc6QR1fWnDIhVk9W1robeMkJMOjAJ MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cunbr9bp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:26:23 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9HLN9i006949;
 Thu, 9 Dec 2021 17:26:23 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cunbr9bp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:26:23 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HE6Af007707;
 Thu, 9 Dec 2021 17:26:22 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3cqyybx3rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:26:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9HQLDe46727584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 17:26:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B3AF11206D;
 Thu,  9 Dec 2021 17:26:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4051D112065;
 Thu,  9 Dec 2021 17:26:20 +0000 (GMT)
Received: from localhost (unknown [9.163.12.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Dec 2021 17:26:19 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt
 with CONFIG_TCG
In-Reply-To: <a2cca719-7d28-65a1-97c4-c91d9a469cbf@kaod.org>
References: <20211208230650.2125095-1-farosas@linux.ibm.com>
 <c17bf4e0-2c5c-0748-0539-34b441c81644@kaod.org>
 <87o85p6cog.fsf@linux.ibm.com>
 <a2cca719-7d28-65a1-97c4-c91d9a469cbf@kaod.org>
Date: Thu, 09 Dec 2021 14:26:17 -0300
Message-ID: <87h7bh666e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _UJBKBiLK8Bgb2MYQZhdExz7B5_9pgqU
X-Proofpoint-ORIG-GUID: ZQKAReffvoN3MyG9AdsBMXjH9FbGF7jJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090089
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Richard,
>
> On 12/9/21 16:05, Fabiano Rosas wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> On 12/9/21 00:06, Fabiano Rosas wrote:
>>>> We cannot have TCG code in powerpc_excp because the function is called
>>>> from kvm-only code via ppc_cpu_do_interrupt:
>>>>
>>>>    ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>>>>    function =E2=80=98cpu_ldl_code=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>>>>
>>>> Fortunately, the Alignment interrupt is not among the ones dispatched
>>>> from kvm-only code, so we can keep it out of the disable-tcg build for
>>>> now.
>>>>
>>>> Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_excp=
")
>>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>>>
>>>> ---
>>>>
>>>> Perhaps we could make powerpc_excp TCG only and have a separate
>>>> function that only knows the two interrupts that we use with KVM
>>>> (Program, Machine check). But for now this fix will do, I think.
>>>> ---
>>>>    target/ppc/excp_helper.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>>> index 17607adbe4..dcf22440cc 100644
>>>> --- a/target/ppc/excp_helper.c
>>>> +++ b/target/ppc/excp_helper.c
>>>> @@ -453,6 +453,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, i=
nt excp_model, int excp)
>>>>            }
>>>>            break;
>>>>        }
>>>> +#ifdef CONFIG_TCG
>>>>        case POWERPC_EXCP_ALIGN:     /* Alignment exception            =
          */
>>>>            /*
>>>>             * Get rS/rD and rA from faulting opcode.
>>>> @@ -464,6 +465,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, i=
nt excp_model, int excp)
>>>>                env->spr[SPR_DSISR] |=3D (insn & 0x03FF0000) >> 16;
>>>>            }
>>>>            break;
>>>> +#endif
>>>>        case POWERPC_EXCP_PROGRAM:   /* Program exception              =
          */
>>>>            switch (env->error_code & ~0xF) {
>>>>            case POWERPC_EXCP_FP:
>>>>
>>>
>>> Shouldn't we move that code under ppc_cpu_do_unaligned_access ?
>>=20
>> Well, it came from there initially. We could revert 336e91f853 and that
>> would fix the issue as well.
>
> What would you prefer ?

Well none of this interfere with the work I'm doing, so it really makes
no difference. I guess reverting the patch is cleaner than having an
ifdef loose in the middle of the code. I'll send a v2 with the revert.

>
> Thanks,
>
> C.

